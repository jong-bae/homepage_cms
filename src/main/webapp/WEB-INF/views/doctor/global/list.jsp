<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>글로벌의료진순서</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
						<li class="breadcrumb-item">글로벌의료진관리</li>
						<li class="breadcrumb-item active">글로벌순서관리</li>
					</ol>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="card card-primary card-outline">
						<div class="card-body">
							<button type="button" class="btn btn-outline-primary btn-sm"
								data-toggle="modal" data-target="#modal-doctor">글로벌 의료진 등록</button>
							<button type="button" class="btn btn-outline-danger btn-sm"
								onClick="removeItem('global-list')">글로벌 의료진 삭제</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-6">
					<div class="card">
						<div class="card-header">
							<h3 class="card-title">글로벌 원장 순서</h3>
						</div>
						<div class="card-body">
							<ul class="list-group global-list" id="left-list">
							</ul>
						</div>
						<div class="card-footer">
							<button type="button" class="btn btn-outline-secondary btn-sm float-right"
								onClick="sortItem('left-list', 'global')">순서변경</button>
						</div>
					</div>
				</div>
				<div class="col-6">
					<div class="card">
						<div class="card-header">
							<h3 class="card-title">노어, 몽골 원장 순서</h3>
						</div>
						<div class="card-body">
							<ul class="list-group global-list" id="right-list">
							</ul>
						</div>
						<div class="card-footer">
							<button type="button" class="btn btn-outline-secondary btn-sm float-right"
								onClick="sortItem('right-list', 'ru')">순서변경</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Doctor ModalPopup  -->
	<div class="modal fade" id="modal-doctor">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">의료진 팝업</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="input-group input-group-m">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-search"></i></span>
						</div>
						<input type="text" class="form-control" id="search-doctorName" placeholder="이름조회"> 
						<!-- <input type="hidden" id="popup-hidden">  -->
						<span class="input-group-append">
							<button type="button" class="btn btn-default btn-flat" id="btn-doctorSearch">조회</button>
						</span>
					</div>
					<div class="list-group" id="search-list"></div>
				</div>
				<div class="modal-footer justify-content-between">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="btn-addDoctor">추가</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
</div>
<script>
	$(function() {
		// 리스트 초기 로드
		getDoctorList('global');
		getDoctorList('ru');
		
		// List Sortable init;
		$('#left-list, #right-list').sortable();
		
		// 다른 두 리스트 공통으로 조작되게 설정
		$(document).on('click', '.global-list > li', function(e) {
			if($('.global-list > li').hasClass('active')) {
				$('.global-list > li').removeClass('active');
			}
			$(this).toggleClass('active').siblings('li').removeClass('active');
		});
		
		// search List Click event
		$(document).on('click', '#search-list > a', function() {
			$(this).toggleClass('active').siblings('a').removeClass('active');
		});
		
		// 의료진 조회 클릭이벤트
		$('#btn-doctorSearch').click(function() {
			var searchValue = $('#search-doctorName').val();
			if (searchValue.length > 0) {
				$.jbAjaxPostJson('${pageContext.request.contextPath}/doctor/sort/searchList.do', { searchVal : searchValue },
						function(result) {
							var elementString = '';
							if (result.length > 0) {
								$.each(result, function(key,value) {
									elementString += '<a href="javascript:;" class="list-group-item list-group-item-action" value="'+ value.didx +'">'
													+ '<div class="d-flex w-100 justify-content-between">'
													+ '<h5 class="mb-1">' + value.name + '</h5>'
								    				+ '<small>idx : ' + value.didx + '</small></div>'
							    					+ '<p class="mb-1">' + value.branchName + ' ('+ value.idno + ')</p></a>'
								});
								$('#search-list').html(elementString);
							} else {
								$('#search-list').html('');
							}
						}, function(result) {
							// fail 
					});
			} else {
				$('#search-list').html('');
			}
		});
		
		$('#btn-addDoctor').click(function() {
			var itemIdx = $('#search-list').find('.active').attr('value');
			
			if (itemIdx === undefined) {
				toastr.warning('등록할 의료진을 선택하세요!');
				return;
			}
			
			$.jbAjaxPostJson('${pageContext.request.contextPath}/doctor/global/addDoctor.do', { idx : itemIdx }, 
					function(result) {
						if(result.result == true) {
							getDoctorList('global');
							getDoctorList('ru');
							$('#modal-doctor').modal('hide');
						}
					}, function(error) {
						// fail		
				});
		});
		
	});
	
	/** 의료진 리스트 로드  */
	function getDoctorList(VALUE) {
		$.jbAjaxPostJson('${pageContext.request.contextPath}/doctor/global/listAjax.do', { flag : VALUE },
			function(result) {
				var elementString = '';
				if (result.length > 0) {
					$.each(result, function(key,value) {
						elementString += '<li class="list-group-item" value="'+ value.didx +'">'
										+ value.name + ' ( '+ value.idno+ ' )</li>'
					});
					
					if(VALUE == 'global') {
						$('#left-list').html(elementString);
					} else {
						$('#right-list').html(elementString);
					}
				} else {
					$('#left-list').html('');
					$('#right-list').html('');
				}
			}, function(result) {
				// fail 
		});
	}
	
	/* 삭제 버튼 */
	function removeItem(elementClass, FLAG_VAL) {
		var itemIdx = $('.' + elementClass).find('.active').val();

		if (itemIdx === undefined) {
			toastr.error('삭제할 의료진을 선택하세요!');
			return;
		}
		if (!confirm("삭제하시겠습니까?"))
			return;
		
		removeDoctorData(itemIdx);
	}
	
	// 의료진 삭제 함수
	function removeDoctorData(IDX) {
		$.jbAjaxPostJson('${pageContext.request.contextPath}/doctor/global/removeDoctor.do', { idx : IDX }, 
			function(result) {
				if(result.result == true) {
					getDoctorList('global');
					getDoctorList('ru');
				}
			}, function(error) {
					// fail		
			});
	}
	
	// 순서 정렬
	function sortItem(elementID, FLAG_VAL) {
		var objArr = new Object;
		var $list = $('#' + elementID + '> li')
		objArr.flag = FLAG_VAL;
		objArr.listData = new Array;
		$.each($list, function(key, value) {
			var paramObj = new Object;
			paramObj.orderValue = key + 1;
			paramObj.idx = $(value).val();
			objArr.listData.push(paramObj);
		});
		$.jbAjaxPostJson('${pageContext.request.contextPath}/doctor/global/sortList.do', objArr,
			function(result) {
				if(result.result == true) {
					if(FLAG_VAL == "global") {
						getDoctorList('global');
					} else {
						getDoctorList('ru');
					}
					toastr.success('순서를 정렬하였습니다.');
				}
			}, function(result) {
					// fail 
		});
	}
</script>