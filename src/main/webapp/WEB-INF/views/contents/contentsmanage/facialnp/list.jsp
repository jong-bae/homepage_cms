<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->	
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>안면신경마비</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
						<li class="breadcrumb-item">콘텐츠 관리</li>
						<li class="breadcrumb-item active">안면신경마비 치료 관리</li>
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
							<h3 class="card-title">안면신경마비 목록</h3>
							<button type="button" class="btn btn-sm btn-outline-primary float-right"
							onClick="location.href='write.do'">등록</button>
						</div>
						<div class="card-body">
							<table id="listTable" class="table table-bordered table-hover" style="cursor:pointer" width="100%">
								<thead>
									<tr class="text-center">
										<th>이미지</th>
										<th>병의원</th>
										<th align="left">제목</th>
										<th>담당의</th>
										<th>조회수</th>
										<th>작성자</th>
										<th>작성일</th>
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
/*
	//리스트 조회
	var getList = function(param){
		
		$.ajax({
            url:'/contents/contentsmanage/mri/listAjax.do',
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
*/
	
	$(function() {
		var list = $('#listTable').DataTable({
			destory : true,
			paging : true,
			lengthChange : true,
			searching : true,
			ordering : false,
			info : true,
			autoWidth : false,
			stateSave : true,
			ajax : {
				'type' : 'POST',
				'url' : 'listAjax.do',
				'dataSrc' : ''
			},
			
			columns : [
				{ 'data' : 'strFirstImg', 'defaultContent': '', 'width': '20%'	,
					render: function (data, type, row, meta){
						//console.log(data);
						//return data;
						return '<img src="/Upload/112/'+data+'" height="150">';
						
					}	
				},
				{ 'data' : 'bName', 'defaultContent': '', 'width': '10%'	}, 
				{ 'data' : 'strSubject', 'defaultContent': '', 'width': '30%'	},
				{ 'data' : 'mriDoctorName', 'defaultContent': '', 'width': '10%'	},
				{ 'data' : 'intRead', 'defaultContent': '', 'width': '10%'	},
				{ 'data' : 'strName', 'defaultContent': '', 'width': '10%'	},
				{ 'data' : 'dateRegdate', 'defaultContent': '', 'width': '10%'	},
				{ 'data' : 'idx', 'defaultContent': '' ,  visible: false	}
			],
			columnDefs : [{
				targets: [0,1,2,3,4,5,6], // your case first column
				createdCell : function (td, cellData, rowData, row, col){
					$(td).attr("style", 'vertical-align: middle;text-align: center;');	
				}
		 	}]
		});
		
		$('#listTable tbody').on('click', 'tr', function() {
			var data = list.row(this).data();
			
			location.href = "modify.do?idx=" + data.idx;
		});
		
	});
	
</script>