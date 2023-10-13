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
					<h1>치료사례 통계 (월간)</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
						<li class="breadcrumb-item">통계관리</li>
						<li class="breadcrumb-item active">치료사례 통계 (월간)</li>
					</ol>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</section>

	<!-- Main content -->
	<section class="content'">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="card card-primary card-outline">
						<div class="card-header">
							<h3 class="card-title">월간 치료사례</h3>
						</div>
						<div class="card-body">
							<form class="form-horizontal">
								<div class="form-group row">
									 <div class="col-md-2">
										<div class="input-group">
					                   		<div class="input-group-prepend">
					                   			<span class="input-group-text">
					                       			<i class="far fa-calendar-alt"></i>
					                   			</span>
					                   		</div>
					                   		<input type="text" class="yearpicker form-control" name="year" placeholder="년도 선택" style="text-align:center;">
				                		</div>
									</div> 
								
									<div class="col-md-2">
										<button type="button" class="btn btn-sm btn-outline-info" id="btn-search">검색</button>
									</div>
								</div>
							</form>
							<table id="listTable" class="table table-bordered table-hover">
								<thead>
									<tr class="text-center">
										<th style="width: 180px;">병의원</th>
										<c:forEach var="i" begin="1" end="12">
											<th><c:out value="${i}월 "/></th>
										</c:forEach>
										<th style="border-left: 2px solid #8395a7;">합계</th>
									</tr>
								</thead>
								<tbody></tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

</div>
<script>
/* jshint esversion: 6 */
	$(function() {
		$(".yearpicker").yearpicker({
			year : new Date().getFullYear(),
			startYear: 2002,	//new Date().getFullYear() - 20,
			endYear: new Date().getFullYear() + 5,
	    });
		
		// 리스트 호출
		getMonthList($('.yearpicker').val());

		$('#btn-search').click(function() {
			getMonthList($('.yearpicker').val());
		});
		
	}); 
	
	//** 월간지표 로드
	function getMonthList(YEAR) {
		$.jbAjaxPostJson('${pageContext.request.contextPath}/etc/statistics/branchEffect/monthListAjax.do', { year : YEAR },
			function(result) {
				var elementString = '';
				
				if (result.length > 0) {
					$.each(result, function(key, value) {
						let rowSum = 0;
						elementString += '<tr class="text-center"><td class="align-middle" >'+ value.B_NAME + '</td>';
						
						for(var i=1; i<=12; i++) {
							rowSum += Number(value[i] ?? 0);
							elementString += '<td>'+ (value[i] ?? 0) +'</td>';
						}
						
						elementString += '<td style="border-left: 2px solid #8395a7;">'+ rowSum +'</td></tr>';
					});
					$('#listTable > tbody').html(elementString);
					
					//** 하단 게시판 카운트 로드
					getMonthExList(YEAR);
				}
			
			}, function(err) {
				console.log(err);
			});
	}
	
	/** 하단 카운트  로드  */
	function getMonthExList(YEAR) {
		$.jbAjaxPostJson('${pageContext.request.contextPath}/etc/statistics/branchEffect/monthExListAjax.do', { year : YEAR },
			function(result) {
				var elementString = '';
				
				if (result.length > 0) {
					$.each(result, function(key, value) {
						let rowSum = 0;
						elementString += '<tr class="text-center" style="background-color: #fcecaa;"><td class="align-middle" >'+ value.title + '</td>';
						
						for(var i=1; i<=12; i++) {
							rowSum += Number(value[i] ?? 0);
							elementString += '<td>'+ (value[i] ?? 0) +'</td>';
						}
						elementString += '<td style="border-left: 2px solid #8395a7;">'+ rowSum +'</td></tr>';
					});
					$('#listTable > tbody').append(elementString);
				}
			}, function(err) {
					console.log(err);
			});
	}
	
</script>