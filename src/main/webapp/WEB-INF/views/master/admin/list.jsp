<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>담당자</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
						<li class="breadcrumb-item">담당자관리</li>
						<li class="breadcrumb-item active">담당자</li>
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
							<button type="button" class="btn btn-sm btn-outline-primary float-right"
								onClick="location.href='write.do'">등록</button>
						</div>
						<div class="card-body">
							<table id="listTable" class="table table-bordered table-hover">
								<thead>
									<tr class="text-center">
										<th>소속</th>
										<th>이름(팀명)</th>
										<th>아이디</th>
										<th>부서</th>
										<th>권한</th>
										<th>상태</th>
										<th>등록일</th>
										<th>최종접속일</th>
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
	$(function() {
		var list = $('#listTable').DataTable({
			destory : true,
			paging : true,
			lengthChange : false,
			searching : true,
			ordering : false,
			info : true,
			autoWidth : false,
			ajax : {
				'type' : 'POST',
				'url' : 'listAjax.do',
				'dataSrc' : ''
			},
			columns : [
				{ 'data' : 'bName', 'defaultContent': '', 'width': '7%'	},
				{ 'data' : 'name', 'defaultContent' : '', 'width': '15%' },
				{ 'data' : 'id', 'defaultContent' : '', 'width': '10%' },
				{ 'data' : 'dept', 'defaultContent' : '', 'width': '20%' },
				{ 'data' : 'auth', 'defaultContent' : '', 'width': '10%' },
				{ 'data' : 'use_yn', 'defaultContent': '', 'width': '7%'
					,'render' : function(data, type, row, meta) {
						if(data ==  "Y") { 
							return "사용"; 
						} else {
							return "미사용"; 
						}
					}
				},
				{ 'data' : 'regDate', 'defaultContent': '', 'width': '15%'},
				{ 'data' : 'lastLoginDate', 'defaultContent': '', 'width': '15%'}
			],
			columnDefs : [
				{   'targets' : '_all', 'className' : 'text-center' 	}
			]
		});
		
		$('#listTable tbody').on('click', 'tr', function() {
			var data = list.row(this).data();
			location.href = "modify.do?idx=" + data.idx;
		});
	});
</script>