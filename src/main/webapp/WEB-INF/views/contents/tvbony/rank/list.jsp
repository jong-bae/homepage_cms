<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>추천메뉴 순서관리</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
						<li class="breadcrumb-item"> TV관리</li>
						<li class="breadcrumb-item active">추천메뉴 순서관리</li>
					</ol>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row sortable">
			<c:forEach var="data" items="${data }">
				<div class="col-md-2">
					<div class="card card-outline card-default">
						<img src="https://img.youtube.com/vi/${data.vid }/mqdefault.jpg" class="card-img-top" alt="${data.title }">
						<div class="card-body">
							<p class="card-text">${data.title }</p>
						</div>
						<div class="card-footer">
							<small class="text-muted">${data.idx } :: ${data.main_moddate }</small>
							<input type="hidden" class="idx" value="${data.idx }">
						</div>
					</div>
				</div>
			</c:forEach>
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
<style>
/** Grid 5 배열 */
@media (min-width: 768px) {
	.sortable > .col-md-2 { flex: 20%; max-width: 20%;}
}
</style>
<script>
	$(function() {
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
			
			for( var i = IDX_LEN-1; i>=0; i--) {
				IDX_ARR.push(Number($('.idx').eq(i).val()));
			}
			
			$.jbAjaxPostJson('${pageContext.request.contextPath}/contents/tvbony/rank/saveList.do', { idxList : IDX_ARR },
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
	});
</script>