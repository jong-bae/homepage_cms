<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
/** Grid 5 배열 */
@media (min-width: 768px) {
	.sortable > .col-md-2 { flex: 20%; max-width: 20%;}
}
.card-body { height: 100px !important; }
</style>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>질의응답 순서관리</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
						<li class="breadcrumb-item">콘텐츠</li>
						<li class="breadcrumb-item">고객상담실</li>
						<li class="breadcrumb-item active">자주묻는질문 순서관리</li>
					</ol>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="form-group row">				
			<div class="col-sm-2">
				<select class="form-control select2" name="category">
					<option value="예약안내" selected>예약안내</option>
					<option value="진료안내">진료안내</option>
					<option value="투약안내">투약안내</option>
					<option value="주차안내">주차안내</option>
					<option value="편의시설">편의시설</option>
					<option value="서류발급">서류발급</option>
					<option value="입원생활">입원생활</option>
					<option value="수납관련">수납관련</option>
					<option value="보험관련">보험관련</option>
					<option value=" 치료"> 치료</option>
				</select>
			</div>
			<div class="col-md-2">
				<button type="button" class="btn btn-info" id="btn-search">검색</button>
			</div>
		</div>
	
		<div class="row sortable" id="listTable">
		</div>
		
		<div class="row">
			<div class="col-md-12">
				<div class="card card-default card-outline">
					<div class="card-body">
						<button type="button" class="btn btn-danger" id="btn-save">순서저장</button>
					</div>
				</div>
			</div>
		</div>
	</section>

</div>

<script>
	$(function() {
		
		list_load();
		
		$('.sortable').sortable({
			//swapThreshold: 1,
			//animation: 100	
			scrollSpeed: 40,
			scrollSensitivity: 10,
			opacity: 0.8
		});
		
		$('#btn-save').click(function() {
			let IDX_LEN = $('.idx').length;
			let IDX_ARR = new Array();
			
			for( let i=0; i<IDX_LEN; i++) {
				IDX_ARR.push(Number($('.idx').eq(i).val()));
			}
			
			$.jbAjaxPostJson('${pageContext.request.contextPath}/contents/faq/rank/saveList.do', { idxList : IDX_ARR, caregory : '예약안내' },
					function(result) {
						if(result.result) {
							alert(result.message);
						} else {
							alert(result.message);
						}
					}, function(err) {
						console.log(err);
				});
			
		});
		
		$('#btn-search').click(function() {
			list_load();
		});
		
	});	
	
	function list_load() {
		
	//리스트 초기화
	$('#listTable').children().remove();
		
	//카테고리 선택	
	let category_val = $("select[name=category] option:selected").val();	
	
	$.jbAjaxPostJson('${pageContext.request.contextPath}/contents/faq/rank/listrankAjax.do', { category : category_val },
			function(result) {
		
				let html_str = "";
		
				if (result.length > 0) {
					$.each(result, function(key, value) {
						let rowSum = 0;
						
						html_str += '<div class="col-md-2">';
						html_str += ' <div class="card card-outline card-default">';
						html_str += '  <div class="card-body">';
						html_str += '   <p class="card-text">'+value.subject+'</p>';
						html_str += '  </div>';
						html_str += '  <div class="card-footer">';
						html_str += '    <small class="text-muted">'+value.category+' '+value.idx+' :: '+value.orderDate+'</small>';
						html_str += '    <input type="hidden" class="idx" value="'+value.idx+'">';
						html_str += '  </div>';
						html_str += ' </div>';
						html_str += '</div>';						
					});
					
					$('#listTable').append(html_str);
					
				} 	
				
			}, function(err) {
				console.log(err);
		});
	
	}		
	
</script>