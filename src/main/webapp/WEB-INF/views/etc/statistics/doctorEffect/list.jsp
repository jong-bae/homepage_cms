<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>의료진 치료사례 통계</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
						<li class="breadcrumb-item">통계관리</li>
						<li class="breadcrumb-item active">의료진 치료사례 통계</li>
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
						<div class="card-header">
							<h3 class="card-title">리스트</h3>
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
										<th>병의원</th>
										<th>의료진명</th>
										<th>환자자필수기</th>
										<th>MRI</th>
										<th>칭찬합시다</th>
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

		$('#btn-search').click(function() {
			getList($('#startDate').val().replace(/-/g,''), $('#endDate').val().replace(/-/g,''));
		});
	}); 
	
	/** 데이터 테이블  로드  */
	function getList(STARTDATE, ENDDATE) {
		var effectSum = 0, mriSum = 0 , complimentSum = 0;
		
		$.jbAjaxPostJson('${pageContext.request.contextPath}/etc/statistics/doctorEffect/listAjax.do', { startDate : STARTDATE, endDate : ENDDATE },
			function(result) {
				console.log(111111111111);
				console.log(result);

				var elementString = '';
				if (result.length > 0) {
					$.each(result, function(key,value) {
						elementString += '<tr class="text-center"><td class="align-middle" >'+ value.bName + '</td>'
										+ '<td>'+ value.name + '</td>'
										+ '<td>'+ value.effectCnt + '</td>'
										+ '<td>'+ value.mriCnt + '</td>'
										+ '<td>'+ value.complimentCnt + '</td>'
										+ '</tr>';
						effectSum += value.effectCnt;
						mriSum += value.mriCnt;
						complimentSum += value.complimentCnt;
					});
					elementString += '<tr class="text-center bg-warning"><td colspan="2" >합계</td>'
									+ '<td>'+ effectSum + '</td>'
									+ '<td>'+ mriSum + '</td>'
									+ '<td>'+ complimentSum + '</td>'
									+ '</tr>';
					$('#listTable > tbody').html(elementString);
					mergeCell("listTable");
				} else {
					$('#listTable > tbody').html('');
				}
			}, function(result) {
				// fail 
		});
	}
	
	// cell merge 
	function mergeCell(tableId) { 
		// variable 정의 
		var first = true; 
		var prevRowspan1 = 1; 
		var prevCell1 = null; 
 
		// tr 모두 추출 
		var rows = $("#" + tableId + " > tbody").children(); 
 
		for (var i = 0; i < rows.length; i++ ) { 
 
			// first row 
			if (first) { 
				prevRow = rows[i]; 
				prevCell1 = $(prevRow).find("td").eq(0); // 병의원 구분
 
				first = false; 
				continue; 
			} 
 
			var row = rows[i]; // row 
			var tdList = $(row).find("td"); // row > td 리스트 
 
			var firstCell = $(tdList).eq(0); // 첫 번째 행 
			var firstCellText = $(firstCell).text(); // 첫 번째 행 text 추출 

			// 두 번째 row 부터 텍스트 비교 
			if (prevCell1.text() == firstCellText) { 
				prevRowspan1++; 
				$(prevCell1).attr("rowspan", prevRowspan1); 
				//console.log($(prevCell1));
				$(firstCell).remove(); 
			} 
			else { 
				prevRowspan1 = 1; 
				prevCell1 = firstCell; 
			} 
		} 
	}
</script>