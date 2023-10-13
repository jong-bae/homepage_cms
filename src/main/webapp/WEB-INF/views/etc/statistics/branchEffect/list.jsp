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
					<h1>치료사례 통계 (질환별)</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
						<li class="breadcrumb-item">통계관리</li>
						<li class="breadcrumb-item active">치료사례 통계 (질환별)</li>
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
							<h3 class="card-title">질환별 치료사례</h3>
						</div>
						<div class="card-body">
							<form class="form-horizontal">
								<div class="form-group row">
									 <div class="col-md-4">
										<div class="input-group">
					                   		<div class="input-group-prepend">
					                   			<span class="input-group-text">
					                       			<i class="far fa-calendar-alt"></i>
					                   			</span>
					                   		</div>
					                   		<input type="text" class="form-control" name="startDate" id="startDate" placeholder="시작날짜" required="required" style="text-align:center;">
			           	               		<div class="input-group-prepend">
					                   			<span class="input-group-text">~</span>
					                   		</div>
				                   			<input type="text" class="form-control" name="endDate" id="endDate" placeholder="종료날짜" required="required" style="text-align:center;">
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
										<th style="width: 180px;">질환명</th>
										<c:forEach items="${bcodeList }" var="branch">
											<th><c:out value="${branch.bName }"></c:out></th>
										</c:forEach>
										<th style="border-left: 2px solid #8395a7;">합계</th>
									</tr>
								</thead>
								<tbody></tbody>
							</table>
							<!-- <table id="exTable" class="table table-bordered table-hover" style="border-top-style: hidden; background-color: #fcecaa;">
								<thead></thead>
								<tbody></tbody>
							</table>-->
						</div>
	
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Main content -->
	<section class="content'">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="card card-danger card-outline">
						<div class="card-header">
							<h3 class="card-title">치료사례 누적 통계 : 2002 ~ 현재</h3>
						</div>
						<div class="card-body">
							<table id="totalTable" class="table table-bordered table-hover">
								<thead>
									<tr class="text-center">
										<th>질환명</th>
										<c:forEach items="${bcodeList }" var="branch">
											<th><c:out value="${branch.bName }"></c:out></th>
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
	$(function() {
		$('#startDate, #endDate').daterangepicker({
			locale : { format : 'YYYY-MM-DD'},
			singleDatePicker : true
		});
		
		$('#startDate').data('daterangepicker').setStartDate(moment().subtract(6, 'days'));
		$('#startDate').data('daterangepicker').setEndDate(moment().subtract(6, 'days'));
		
		// 리스트 호출
		getList(moment().subtract(6, 'days').format('YYYYMMDD'), moment().format('YYYYMMDD'));
		getTotalList();

		$('#btn-search').click(function() {
			getList($('#startDate').val().replace(/-/g,''), $('#endDate').val().replace(/-/g,''));
		});
		
	}); 
	
	/** 데이터 테이블  로드  */
	function getList(STARTDATE, ENDDATE) {
		let effectSum;
		
		$.jbAjaxPostJson('${pageContext.request.contextPath}/etc/statistics/branchEffect/listAjax.do', { startDate : STARTDATE, endDate : ENDDATE },
			function(result) {
				let elementString = '';

				if (result.length > 0) {
					$.each(result, function(key,value) {
						elementString += '<tr class="text-center"><td class="align-middle" >'+ value.title + '</td>'
						let rowSum = 0;
						
						$.each(value.data, function(k, v) {
							elementString += '<td>'+ v.effectCnt +'</td>';
							rowSum += v.effectCnt;
						});
						
						elementString += '<td style="border-left: 2px solid #8395a7;">'+ rowSum +'</td></tr>'
					});
					
					$('#listTable > tbody').html(elementString);
					
					let cols = $('#listTable > tbody tr:first td').length-1;
					let rows = $('#listTable > tbody tr').length;
					
					elementString = '<tr class="text-center" style="background-color:#ffcccc; border-top-style: outset;"><td class="align-middle">자필후기 합계</td>'
					//** 그려진 테이블 토대로 합계 생성
					for(let i=1; i<=cols; i++) {
						effectSum = 0;
						for(var j=0; j<rows; j++) {
							effectSum += Number($('#listTable > tbody tr:eq('+ j +') td:eq('+ i +')').text());
						}
						elementString += '<td>'+ effectSum +'</td>';
					}
					elementString += '</tr>';
					
					$('#listTable > tbody').append(elementString);
					
					//** 하단 게시판 카운트 로드
					getExList(STARTDATE, ENDDATE)
				} else {
					$('#listTable > tbody').html('');
				}
			}, function(result) {
				// fail 
		});
	}
	
	function getExList(STARTDATE, ENDDATE) {
		
		$.jbAjaxPostJson('${pageContext.request.contextPath}/etc/statistics/branchEffect/exListAjax.do', { startDate : STARTDATE, endDate : ENDDATE },
			function(result) {
				let tvObj = new Object;
				tvObj.sum = 0;
				tvObj.title = '치료영상';
				
				let mriObj = new Object;
				mriObj.sum = 0;
				mriObj.title = 'MRI 치료결과';
				
				let faceObj = new Object;
				faceObj.sum = 0;
				faceObj.title = '안면신경마비';
				
				let commentObj = new Object;
				commentObj.sum = 0;
				commentObj.title = '치료후기 댓글';
				
				let arrJson = new Array();
				var elementString = '';
				
				if (result.length > 0) {
					$.each(result, function(key,value) {
						tvObj[key] = value.tvCnt;
						tvObj.sum += value.tvCnt;

						mriObj[key] = value.mriCnt;
						mriObj.sum += value.mriCnt;
						
						faceObj[key] = value.faceCnt;
						faceObj.sum += value.faceCnt;
						
						commentObj[key] = value.commentCnt;
						commentObj.sum += value.commentCnt;
					});
					
					arrJson.push(commentObj);
					arrJson.push(tvObj);
					arrJson.push(mriObj);
					arrJson.push(faceObj);
					
					for(var i = 0; i < arrJson.length; i++) {
						elementString += '<tr class="text-center" style="background-color: #fcecaa;"><td class="align-middle" style="width: 180px;" >'+ arrJson[i].title +'</td>'
						for(var j=0; j<result.length; j++) {
							elementString += '<td>'+ arrJson[i][j] +'</td>';
						}
						elementString += '<td>'+ arrJson[i].sum +'</td>' + '</tr>';
					}

					$('#listTable > tbody').append(elementString);
				}
			}, function(err) {
				console.log(err);
		});
	}
	
	//** 누적통계 로드
	function getTotalList() {
		
		$.jbAjaxPostJson('${pageContext.request.contextPath}/etc/statistics/branchEffect/totalListAjax.do', {},
			function(result) {
				let tvObj = new Object;
				tvObj.sum = 0;
				tvObj.title = '치료영상';
				
				let mriObj = new Object;
				mriObj.sum = 0;
				mriObj.title = 'MRI 치료결과';
				
				let faceObj = new Object;
				faceObj.sum = 0;
				faceObj.title = '안면신경마비';
				
				let effectObj = new Object;
				effectObj.sum = 0;
				effectObj.title = '치료후기';
				
				let commentObj = new Object;
				commentObj.sum = 0;
				commentObj.title = '치료후기댓글';
				
				let colSumObj = new Object;
				colSumObj.sum = 0;
				colSumObj.title = '합계'
				
				let arrJson = new Array();
				
				var elementString = '';
				
				if (result.length > 0) {
					$.each(result, function(key,value) {
						tvObj[key] = value.tvCnt;
						tvObj.sum += value.tvCnt;
						// bCode를 key로 잡으면 순서 보정이 안됨
						//tvObj[value.bCode] = value.tvCnt;
						mriObj[key] = value.mriCnt;
						mriObj.sum += value.mriCnt;
						
						faceObj[key] = value.faceCnt;
						faceObj.sum += value.faceCnt;
						
						effectObj[key] = value.effectCnt;
						effectObj.sum += value.effectCnt;
						
						commentObj[key] = value.commentCnt;
						commentObj.sum += value.commentCnt;
						
						colSumObj[key] = value.colSum;
						colSumObj.sum += value.colSum;
					});
					
					arrJson.push(tvObj);
					arrJson.push(mriObj);
					arrJson.push(faceObj);
					arrJson.push(effectObj);
					arrJson.push(commentObj);
					arrJson.push(colSumObj);
					
					for(var i = 0; i < arrJson.length; i++) {
						if( i == 5 ) {
							elementString += '<tr class="text-center" style="background-color:#ffcccc; border-top-style: outset;"><td class="align-middle" style="width: 180px;" >'+ arrJson[i].title +'</td>'
						} else {
							elementString += '<tr class="text-center"><td class="align-middle" style="width: 180px;" >'+ arrJson[i].title +'</td>'
						}
						for(var j=0; j<result.length; j++) {
							elementString += '<td>'+ arrJson[i][j] +'</td>';
						}
						elementString += '<td style="border-left: 2px solid #8395a7;">'+ arrJson[i].sum +'</td>' + '</tr>';
					}

					$('#totalTable > tbody').html(elementString);
				}
			}, function(err) {
				console.log(err);
		});
	}
	
</script>