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
						<li class="breadcrumb-item">콘텐츠 관리</li>
						<li class="breadcrumb-item active">이벤트 관리</li>
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
								<h3 class="card-title">이벤트 목록</h3>
						</div>
						<div class="card-body">
							<form class="form-horizontal">
								<div class="form-group row">
									<div class="col-md-2">
										<button type="button" class="btn btn-info" onClick="getList('refresh')">새로고침</button>
									</div>
									<div class="col-md-10">
										<button type="button" class="btn btn-sm btn-outline-primary float-right"
											onClick="location.href='write.do'">등록</button>
									</div>
								</div>
							</form>
							
							<table id="listTable" class="table table-bordered table-hover" style="cursor:pointer" width="100%">
								<thead>
									<tr class="text-center">
										<th>번호</th>
										<th>이미지</th>
										<th align="left">이벤트명</th>
										<th>구분</th>
										<th>상태</th>
										<th>기간</th>
									</tr>
								</thead>
								<tbody></tbody>
							</table>
						</div>
						<div class="card-footer">
							<button type="button" class="btn btn-outline-primary float-right"
								onClick="location.href='write.do'">등록</button>
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
		
		$.ajax({
            url:'/contents/contentsmanage/event/listAjax.do',
            type:'POST',
            dataType: "json",
            success:function(data){
                  //console.log(data); 
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
			order : [[ 0, "desc" ]],
			stateSave: true,
			stateDuration: -1,
			columns : [
				{ 'data' : 'docID', 'defaultContent': '', 'width': '10%'	},
				{ 'data' : 'imgPath', 'defaultContent': '', 'width': '10%',
					render: function (data, type, row, meta){
						if(data == "/Upload/BOSUpfiles/EVENT_THUMB/null"){
							return ""
						}else{
							return '<img src="'+data+'" height="80">';
						}
					}	
				},
				{ 'data' : 'evtSubject', 'defaultContent' : '', 'width': '45%' },
				{ 'data' :  function(data, type) {
						if(data.evtState ==  "1") {
							if( new Date(getToday()).getTime() > new Date(data.evtEndDT.substr(0,4), data.evtEndDT.substr(4,2)-1, data.evtEndDT.substr(6,2)).getTime() ) {
								return "지난이벤트";	
							} else {
								return "<font color='#FF0000'>진행중</font>"; 
							}
						} else {
							return "지난이벤트"; 
						}
					}
				},
				{ 'data' : 'evtUseYN', 'defaultContent' : '', 'width': '10%'
					,'render' : function(data, type, row, meta) {
						if(data ==  "Y") { 
							return "정상"; 
						} else {
							return "<font color='#FF0000'>중지</font>"; 
						}
					}
				},
				{ 'data' : function (data, type){
						return data.evtStartDT + "~" + data.evtEndDT;
					}	
				
				}
			],
			columnDefs : [{
				targets: [0,1,2,3,4,5], // your case first column
				createdCell : function (td, cellData, rowData, row, col){
					$(td).attr("style", 'vertical-align: middle;text-align: center;');	
				}
		 	}],
			data : data
		});
		
		$('#listTable tbody').on('click', 'tr', function() {
			var data = list.row(this).data();
			location.href = "modify.do?docID=" + data.docID;
		});
		
	}
	
	function getToday() {
		var date = new Date();
	    var year = date.getFullYear();
	    var month = ("0" + (1 + date.getMonth())).slice(-2);
	    var day = ("0" + date.getDate()).slice(-2);

	    return year + "-" + month + "-" + day + " 00:00:00";
	}
	
	$(function() {
		
		//리스트 조회
		getList();
	});
	
</script>