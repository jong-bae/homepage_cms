<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->	
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-left">
						<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
						<li class="breadcrumb-item"> TV 관리</li>
						<li class="breadcrumb-item active">검색어 랭킹 순위</li>
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
					<div class="card card-success card-outline">
					<div class="card-header">
						<h3 class="card-title">검색어 랭킹 목록</h3>
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
										<button type="button" class="btn btn-info" onClick="getList('refresh')">검색</button>
									</div>
								</div>
							</form>
							
							<table id="listTable" class="table table-bordered table-hover" style="cursor:pointer" width="100%">
								<thead>
									<tr class="text-center">
										<th>검색어</th>
										<th>랭킹</th>
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

	//리스트 조회
	var getList = function(param){
		
		
		
		var sendData = {
			"startDate" : $("#startDate").val(),
			"endDate" : $("#endDate").val()
		}
		
		$.ajax({
            url:'/contents/tvbony/searchword/listAjax.do',
            type:'POST',
            dataType: "json",
            contentType : 'application/json',
            data: JSON.stringify(sendData),
            success:function(data){
           		console.log(data);
              	makeListTable(data);
              
              	if(param == 'refresh'){
            	  alert("갱신되었습니다.");
              	}
            }
		});
		
		
	}

	//데이터 테이블 생성
	var makeListTable =  function (data){

		var list = $('#listTable').DataTable({
		    destroy: true,
			order : [[ 1, "desc" ]],
			pageLength: 100,
			columns : [
				{ 'data' : 'keyword', 'defaultContent': '', 'width': '50%'	},
				{ 'data' : 'cnt', 'defaultContent' : '', 'width': '50%' }
			],
			columnDefs : [{
				targets: [0,1], // your case first column
				createdCell : function (td, cellData, rowData, row, col){
					$(td).attr("style", 'vertical-align: middle;text-align: center;');	
				}
		 	}],
			data : data
		});
		
	}
	
	function getFormatDate(date){
		
		var year = date.getFullYear();
		var month = (1+date.getMonth());
		month = month >10 ? month : '0'+month;
		var day = date.getDate();
		day = day >= 10 ? day : '0' + day;
		
		return year+'-'+month+'-'+day;
	}
	
	
	$(function() {
		
		
		$('#startDate, #endDate').daterangepicker({
			locale : { format : 'YYYY-MM-DD'},
			singleDatePicker : true
		});
		
		var startDateParam = '${startDate}';
		
		if(startDateParam == '-1'){
			let startDate = new Date();
			startDate.setMonth(startDate.getMonth()-1);
			$('#startDate').val(getFormatDate(startDate));
		}else{
			$('#startDate').val(${startDate});
			$('#endDate').val(${endDate});
		}
		
		
		//리스트 조회
		getList();
	});
	
</script>