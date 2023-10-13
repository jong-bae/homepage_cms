<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>메뉴</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
						<li class="breadcrumb-item">메뉴관리</li>
						<li class="breadcrumb-item active">메뉴</li>
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
							<h3 class="card-title">Depth1 - 상단</h3>
						</div>
						<div class="card-body">
							<ul class="list-group" id="depth1">
							<c:forEach items="${userSession.topMenuList }" var="depth1">
								<li class="list-group-item" value='<c:out value="${depth1.idx }"></c:out>'>
									<c:out value="${depth1.name }"></c:out> [ <c:out value="${depth1.useYN }"></c:out> ]
								</li>
							</c:forEach>
							</ul>
						</div>
	
						<div class="card-footer">
							<button type="button" class="btn btn-outline-primary btn-sm"
								onClick="location.href='write.do/1'">등록</button>
							<button type="button" class="btn btn-outline-primary btn-sm"
								onClick="modifyItem('depth1')">수정</button>
							<button type="button" class="btn btn-outline-danger btn-sm"
								onClick="removeItem('depth1')">삭제</button>
							<button type="button" class="btn btn-outline-secondary btn-sm float-right"
								onClick="javascript:;">순서변경</button>
						</div>
	
					</div>
				</div>
				<div class="col-4">
					<div class="card card-secondary">
						<div class="card-header">
							<h3 class="card-title">Depth2 - 사이드</h3>
						</div>
						<div class="card-body">
							<ul class="list-group" id="depth2">
							</ul>
						</div>
	
						<div class="card-footer">
							<button type="button" class="btn btn-outline-primary btn-sm"
								onClick="writeItem('depth1', 2)">등록</button>
							<button type="button" class="btn btn-outline-primary btn-sm"
								onClick="modifyItem('depth2')">수정</button>
							<button type="button" class="btn btn-outline-danger btn-sm"
								onClick="removeItem('depth2')">삭제</button>
							<button type="button" class="btn btn-outline-secondary btn-sm float-right"
								onClick="javascript:;">순서변경</button>
						</div>
	
					</div>
				</div>
				<div class="col-4">
					<div class="card">
						<div class="card-header">
							<h3 class="card-title">Depth3 - 사이드</h3>
						</div>
						<div class="card-body">
							<ul class="list-group" id="depth3">
							</ul>
						</div>
	
						<div class="card-footer">
							<button type="button" class="btn btn-outline-primary btn-sm"
								onClick="writeItem('depth2', 3)">등록</button>
							<button type="button" class="btn btn-outline-primary btn-sm"
								onClick="modifyItem('depth3')">수정</button>
							<button type="button" class="btn btn-outline-danger btn-sm"
								onClick="removeItem('depth3')">삭제</button>
							<button type="button" class="btn btn-outline-secondary btn-sm float-right"
								onClick="javascript:;">순서변경</button>
						</div>
	
					</div>
				</div>
			</div>
		</div>
	</section>
	<form id="removeForm" method="post">
		<input type="hidden" name="idx" id="idx">
	</form>
</div>
<script>
	$(function() {
		$('#depth1, #depth2, depth3').sortable();
		
		$('#depth1 > li').click(function() {
			$(this).toggleClass('active').siblings('li').removeClass('active');
			
			$.jbAjaxPostJson('${pageContext.request.contextPath}/master/menu/getChildMenuAjax.do', { idx : $(this).val()},
					function(result) {
						var elementString = '';
						if( result.length > 0) {
							$.each(result, function(key, value) {
								elementString += '<li class="list-group-item" value="'+ value.idx +'">'+ value.name +' [ '+ value.useYN +' ]</li>'
							});
							$('#depth2').html(elementString);
						} else {
							$('#depth2').html('');
						}
						$('#depth3').html('');
					},
					function(result) {
						// fail 
					}
			);
		});
		
		$(document).on('click', '#depth2 > li', function(e) {
			$(this).toggleClass('active').siblings('li').removeClass('active');
			
			$.jbAjaxPostJson('${pageContext.request.contextPath}/master/menu/getChildMenuAjax.do', { idx : $(this).val()},
					function(result) {
						var elementString = '';
						if( result.length > 0) {
							$.each(result, function(key, value) {
								elementString += '<li class="list-group-item" value="'+ value.idx +'">'+ value.name+' [ '+ value.useYN +' ]</li>'
							});
							$('#depth3').html(elementString);
						} else {
							$('#depth3').html('');
						}
					},
					function(result) {
						// fail 
					}
			);
		});
		
		$(document).on('click', '#depth3 > li', function(e) {
			$(this).toggleClass('active').siblings('li').removeClass('active');
		});
	});
	
	/* 삭제 함수 */
	function removeItem(elementID) {
		var itemIdx = $('#' + elementID).find('.active').val();
		
		if (itemIdx === undefined) {
			toastr.error('삭제할 메뉴를 선택하세요!');
			return;
		}
		if(!confirm("삭제하시겠습니까?")) return;
		$('#idx').val(itemIdx);
		$('#removeForm').attr('action', 'remove.do').submit();
	}
	
	/* 수정 함수 */
	function modifyItem(elementID) {
		var itemIdx = $('#' + elementID).find('.active').val();
		
		if (itemIdx === undefined) {
			toastr.error('수정할 메뉴를 선택하세요!');
			return;
		}
		
		location.href = "modify.do?idx=" + itemIdx;
	}
	
	/* 추가 함수 */
	function writeItem(elementParentID, depth) {
		var parentIdx = $('#' + elementParentID).find('.active').val();
		
		if (parentIdx === undefined) {
			toastr.info('추가할 상위 메뉴를 선택하세요!');
			return;
		}
		
		location.href = "write.do/" + depth + "?pidx=" + parentIdx;
	}
</script>