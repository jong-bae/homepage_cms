<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>의료진순서</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
						<li class="breadcrumb-item">의료진관리</li>
						<li class="breadcrumb-item active">의료진순서관리</li>
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
				<div class="col-4">
					<div class="card card-primary">
						<div class="card-header">
							<h3 class="card-title">병의원 구분</h3>
						</div>
						<div class="card-body">
							<ul class="list-group" id="depth1">
							<c:forEach items="${branchList }" var="branch">
								<li class="list-group-item" value='<c:out value="${branch.bCode }"></c:out>'>
									<c:out value="${branch.bName }"></c:out> 
								</li>
							</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-4">
					<div class="card card-secondary">
						<div class="card-header">
							<h3 class="card-title">센터 구분</h3>
						</div>
						<div class="card-body">
							<ul class="list-group" id="depth2">
							</ul>
						</div>
	
						<div class="card-footer">
							<button type="button" class="btn btn-outline-primary btn-sm"
								data-toggle="modal" data-target="#modal-center">등록</button>
							<button type="button" class="btn btn-outline-primary btn-sm"
								onClick="modifyItem('depth2', 'modal-center')">수정</button>
							<button type="button" class="btn btn-outline-danger btn-sm"
								onClick="removeItem('depth2', 'CENTER')">삭제</button>
							<button type="button" class="btn btn-outline-secondary btn-sm float-right"
								onClick="sortItem('depth2', 'CENTER')">순서변경</button>
						</div>
	
					</div>
				</div>
				<div class="col-4">
					<div class="card">
						<div class="card-header">
							<h3 class="card-title">의료진 구분</h3>
						</div>
						<div class="card-body">
							<ul class="list-group" id="depth3">
							</ul>
						</div>
						<div class="card-footer">
							<button type="button" class="btn btn-outline-primary btn-sm"
								data-toggle="modal" data-target="#modal-doctor">등록</button>
							<!-- <button type="button" class="btn btn-outline-primary btn-sm"
								onClick="modifyItem('depth3')">수정</button> -->
							<button type="button" class="btn btn-outline-danger btn-sm"
								onClick="removeItem('depth3', 'DOCTOR')">삭제</button>
							<button type="button" class="btn btn-outline-secondary btn-sm float-right"
								onClick="sortItem('depth3', 'DOCTOR')">순서변경</button>
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
	<!-- BranchCenter ModalPopup  -->
	<div class="modal fade" id="modal-center">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">센터구분 팝업</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="input-group input-group-m">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-pen"></i></span>
						</div>
						<input type="text" class="form-control" id="add-partName"> 
						<input type="hidden" id="partIdx"> 
					</div>
				</div>
				<div class="modal-footer justify-content-between">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="btn-addPart">추가</button>
					<button type="button" class="btn btn-primary" id="btn-updatePart" style="display:none;">수정</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
</div>
<script>
	var DEPTH1_VALUE;
	var DEPTH2_VALUE;
	var OBJECT_JSON = new Object;
	
	$(function() {
		// List Sortable init;
		$('#depth2, #depth3').sortable();
		
		// Depth1 Click
		$('#depth1 > li').click( function() {
			$(this).toggleClass('active').siblings('li').removeClass('active');
			DEPTH1_VALUE = $(this).val()
			getPartList(DEPTH1_VALUE);
		});

		// Depth2 Click
		$(document).on('click',	'#depth2 > li', function(e) {
			$(this).toggleClass('active').siblings('li').removeClass('active');
			DEPTH2_VALUE = $(this).val();
			getDoctorList(DEPTH2_VALUE);			
		});

		// Depth3 Click
		$(document).on('click', '#depth3 > li', function(e) {
			$(this).toggleClass('active').siblings('li').removeClass('active');
		});
		
		// search List Click event
		$(document).on('click', '#search-list > a', function() {
			$(this).toggleClass('active').siblings('a').removeClass('active');
		});
		
		// part 등록
		$('#btn-addPart').click(function() {
			var partName = $('#add-partName').val();
			OBJECT_JSON.gubun1_idx = DEPTH1_VALUE;
			OBJECT_JSON.gubun2_name = partName;
			setPartData('setPartAjax.do', OBJECT_JSON, DEPTH1_VALUE);
		});
		
		// part 수정
		$('#btn-updatePart').click(function() {
			var partName = $('#add-partName').val();
			var idx = $('#partIdx').val();
			OBJECT_JSON.idx = idx;
			OBJECT_JSON.gubun2_name = partName;
			setPartData('modifyPartAjax.do', OBJECT_JSON, DEPTH1_VALUE);
		});
		
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
			
			OBJECT_JSON.didx = itemIdx;
			OBJECT_JSON.gubun2_idx = DEPTH2_VALUE;
			$.jbAjaxPostJson('${pageContext.request.contextPath}/doctor/sort/setDoctorAjax.do', OBJECT_JSON, 
					function(result) {
						if(result.result == true) {
							getDoctorList(DEPTH2_VALUE);
							$('#modal-doctor').modal('hide');
						}
					}, function(error) {
						// fail		
				});
		});
		
	});
	
	/** 센터 구분 로드  */
	function getPartList(VALUE) {
		$.jbAjaxPostJson('${pageContext.request.contextPath}/doctor/sort/getPartAjax.do', { idx : VALUE },
			function(result) {
				var elementString = '';
				if (result.length > 0) {
					$.each(result, function(key, value) { 
						elementString += '<li class="list-group-item" value="'+ value.idx +'">'
										+ value.gubun2_name	+ ' ( ' + value.idx + ' )</li>'
					});
					$('#depth2').html(elementString);
				} else {
					$('#depth2').html('');
				}
				$('#depth3').html('');
			}, function(result) {
						// fail 
		});
	}
	
	/** 의료진 구분 로드  */
	function getDoctorList(VALUE) {
		$.jbAjaxPostJson('${pageContext.request.contextPath}/doctor/sort/getDoctorAjax.do', { idx : VALUE },
			function(result) {
				var elementString = '';
				if (result.length > 0) {
					$.each(result, function(key,value) {
						elementString += '<li class="list-group-item" value="'+ value.idx +'">'
										+ value.name + ' ( '+ value.didx+ ' )</li>'
					});
					$('#depth3').html(elementString);
				} else {
					$('#depth3').html('');
				}
			}, function(result) {
				// fail 
		});
	}
	
	// 센터구분 등록/수정 
	function setPartData(URL, JSON, DEPTH1_VAL) {
		$.jbAjaxPostJson('${pageContext.request.contextPath}/doctor/sort/' + URL, JSON, 
			function(result) {
				if(result.result == true) {
					$('#modal-center').modal('hide');
					$('#add-partName').val('');
					$('#partIdx').val('');
					getPartList(DEPTH1_VALUE);
				}
			}, function(error) {
				// fail		
		});
	}
	
	/* 삭제 버튼 */
	function removeItem(elementID, FLAG_VAL) {
		var itemIdx = $('#' + elementID).find('.active').val();

		if (itemIdx === undefined) {
			toastr.error('삭제할 메뉴를 선택하세요!');
			return;
		}
		if (!confirm("삭제하시겠습니까?"))
			return;
		
		if(FLAG_VAL == "CENTER") {
			removePartData(itemIdx, DEPTH1_VALUE);
		} else {
			removeDoctorData(itemIdx, DEPTH2_VALUE);
		}
	}
	
	/* 수정 버튼 */
	function modifyItem(elementID, modalID) {
		var itemIdx = $('#' + elementID).find('.active').val();
		
		if (itemIdx === undefined) {
			toastr.error('수정할 메뉴를 선택하세요!');
			return;
		}
		
		$.jbAjaxPostJson('${pageContext.request.contextPath}/doctor/sort/getPartOne.do', { idx : itemIdx },
				function(result) {
					$('#add-partName').val(result.gubun2_name);
					$('#partIdx').val(itemIdx);
					$('#btn-addPart').hide();
					$('#btn-updatePart').show();
					$('#' + modalID).modal('show');
				}, function(result) {
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
		$.jbAjaxPostJson('${pageContext.request.contextPath}/doctor/sort/sortList.do', objArr,
			function(result) {
				if(result.result == true) {
					if(FLAG_VAL == "CENTER") {
						getPartList(DEPTH1_VALUE);
					} else {
						getDoctorList(DEPTH2_VALUE);
					}
					toastr.success('순서를 정렬하였습니다.');
				}
			}, function(result) {
					// fail 
		});
	}
	
	// 센터명 삭제
	function removePartData(IDX, DEPTH_VAL) {
		$.jbAjaxPostJson('${pageContext.request.contextPath}/doctor/sort/removePart.do', { idx : IDX }, 
				function(result) {
					if(result.result == true) {
						getPartList(DEPTH_VAL);
					}
				}, function(error) {
					// fail		
			});
	}
	
	// 의료진 삭제
	function removeDoctorData(IDX, DEPTH_VAL) {
		$.jbAjaxPostJson('${pageContext.request.contextPath}/doctor/sort/removeDoctor.do', { idx : IDX }, 
			function(result) {
				if(result.result == true) {
					getDoctorList(DEPTH_VAL);
				}
			}, function(error) {
					// fail		
			});
	}
</script>