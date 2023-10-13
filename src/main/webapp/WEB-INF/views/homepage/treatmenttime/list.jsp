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
						<li class="breadcrumb-item">홈페이지 관리</li>
						<li class="breadcrumb-item active">진료시간 관리</li>
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
					<div class="card card-success  card-outline">
	              		<div class="card-header">
	           				<h3 class="card-title">특정날짜 예외처리 목록</h3>
	              		</div>
	              		<div class="card-body">
        		            <form class="form-horizontal">
								<div class="form-group row">
									<div class="col-md-2">
										<button type="button" class="btn btn-sm btn-info" onClick="getExceptionList('refresh',true)">새로고침</button>
									</div>
									<div class="col-md-10">
										<button type="button" class="btn btn-sm btn-outline-primary float-right"
											onClick="location.href='write_exception.do'">등록</button>
									</div>
								</div>
							</form>
              				<table id="exceptionListTable" class="table table-bordered table-hover" style="cursor:pointer" width="100%">
								<thead>
									<tr class="text-center">
										<th>번호</th>
										<th>날짜</th>
										<th>병의원</th>
										<th>내용</th>
									</tr>
								</thead>
								<tbody></tbody>
							</table>
	              		</div>
	            	</div>
				</div>
			</div>
		
			<div class="row">
				<div class="col-12">				
					<div class="card card-primary card-outline">
					<div class="card-header">
						<h3 class="card-title">병의원 별 진료시간 목록</h3>
					</div>
	              		<div class="card-body">
			                <form class="form-horizontal">
								<div class="form-group row">
									<div class="col-md-2">
										<button type="button" class="btn btn-sm btn-info" onClick="getBranchList('refresh',true)">새로고침</button>
									</div>
									<div class="col-md-10">
										<button type="button" class="btn btn-sm btn-outline-primary float-right"
											onClick="location.href='write_treatmenttime.do'">등록</button>
									</div>
								</div>
							</form>
	              			<table id="branchListTable" class="table table-bordered table-hover" style="cursor:pointer" width="100%">
								<thead>
									<tr class="text-center">
										<th>번호</th>
										<th>병의원</th>
										<th>월</th>
										<th>화</th>
										<th>수</th>
										<th>목</th>
										<th>금</th>
										<th>토</th>
										<th>일</th>
										<th>공휴일</th>
										<th>점심</th>
										<th>휴진일</th>
										<th>BCode</th>
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
	var getExceptionList = function(param, alertValue){
		
		$.ajax({
	        url:'/homepage/treatmenttime/listAjax_tab2.do',
	        type:'POST',
	        dataType: "json",
	        success:function(data){
	          makeExceptionListTable(data);
	          if(param == 'refresh'){
	        	  
	        	  if(alertValue){
	        		  alert("갱신되었습니다.");
	       		  }
	        	  
	          }
	        }
		});
		
	}
	
	
	//데이터 테이블 생성
	var makeExceptionListTable =  function (data){
		 
		var list = $('#exceptionListTable').DataTable({
		    destroy: true,
			stateSave: true,
			pageLength : 10,
			stateDuration: -1,
			columns : [
				{ 'data' : 'idx', 'defaultContent': '', 'width': '10%'	},
				{ 'data' : 'targetDate', 'defaultContent': '' , 'width': '10%'	},
				{ 'data' : 'bName', 'defaultContent': '', 'width': '40%'},
				{ 'data' : 'contents', 'defaultContent': '', 'width': '40%'}
			],
			columnDefs : [{
				'targets' : '_all', 'className' : 'text-center' 	
		 	}],
			data : data
		});
		
		$('#exceptionListTable tbody').on('click', 'tr', function() {
			var data = list.row(this).data();
			
			location.href = "modify_exception.do?idx=" + data.idx;
		});
		
	}
	
	

	//리스트 조회
	var getBranchList = function(param, alertValue){
		
		$.ajax({
            url:'/homepage/treatmenttime/listAjax_tab1.do',
            type:'POST',
            dataType: "json",
            success:function(data){
              //console.log(data); 
              makeBranchListTable(data);
              if(param == 'refresh'){
            	  
            	  if(alertValue){
            		  alert("갱신되었습니다.");
           		  }
            	  
              }
            }
		});
		
	}

	//데이터 테이블 생성
	var makeBranchListTable =  function (data){
		
		var list = $('#branchListTable').DataTable({
		    destroy: true,
			stateSave: true,
			pageLength : 50,
			order : [[ 12, "asc" ]],
			stateDuration: -1,
			columns : [
				{ 'data' : 'idx', 'defaultContent': ''},
				{ 'data' : 'bName', 'defaultContent': ''},
				{ 'data' : 'monStart', 'defaultContent': '',
					render: function (data, type, row, meta){
						
						return row.monStart+"~"+row.monEnd;
					}	
				},
				{ 'data' : 'tueStart', 'defaultContent': '',
					render: function (data, type, row, meta){
						
						return row.tueStart+"~"+row.tueEnd;
					}	
				},
				{ 'data' : 'wedStart', 'defaultContent': '',
					render: function (data, type, row, meta){
						
						return row.wedStart+"~"+row.wedEnd;
					}	
				},
				{ 'data' : 'thuStart', 'defaultContent': '',
					render: function (data, type, row, meta){
						
						return row.thuStart+"~"+row.thuEnd;
					}	
				},
				{ 'data' : 'friStart', 'defaultContent': '',
					render: function (data, type, row, meta){
						
						return row.friStart+"~"+row.friEnd;
					}	
				},
				{ 'data' : 'satStart', 'defaultContent': '',
					render: function (data, type, row, meta){
						
						return row.satStart+"~"+row.satEnd;
					}	
				},
				{ 'data' : 'sunStart', 'defaultContent': '',
					render: function (data, type, row, meta){
						if(data != null && data != ""){
							return row.sunStart+"~"+row.sunEnd;	
						}else{
							return "";
						}
					}	
				},
				{ 'data' : 'holidayStart', 'defaultContent': '',
					render: function (data, type, row, meta){
						
						return row.holidayStart+"~"+row.holidayEnd;
					}	
				},
				{ 'data' : 'lunchStart', 'defaultContent': '',
					render: function (data, type, row, meta){
						
						return row.lunchStart+"~"+row.lunchEnd;
					}	
				},
				{ 'data' : 'closedList', 'defaultContent': ''},
				{ 'data' : 'bCode', 'defaultContent': ''}
			],
			columnDefs : [{
				'targets' : '_all', 'className' : 'text-center' 	
		 	},
		 	 {
                "targets": [ 12 ],
                "visible": false,
                "searchable": false
            }],
			data : data
		});
		
		$('#branchListTable tbody').on('click', 'tr', function() {
			var data = list.row(this).data();
			
			location.href = "modify_treatmenttime.do?idx=" + data.idx;
		});
		
	}
	
	$(function() {
		getBranchList('refresh',false);
		getExceptionList('refresh',false);
	
	});
	
</script>