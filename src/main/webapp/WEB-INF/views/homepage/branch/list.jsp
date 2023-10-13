<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>병의원</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
						<li class="breadcrumb-item">병의원관리</li>
						<li class="breadcrumb-item active">병의원</li>
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
										<th>코드</th>
										<th>병의원명</th>
										<th>등록일</th>
										<th>상태</th>
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
				{ 'data' : 'bCode', 'defaultContent' : '', 'width': '25%' },
				{ 'data' : 'bName', 'defaultContent': '', 'width': '25%'	},
				{ 'data' : 'regDate', 'defaultContent': '', 'width': '25%'},
				{ 'data' : 'bStatus', 'defaultContent': '', 'width': '25%'
					,'render' : function(data, type, row, meta) {
						if(data ==  "Y") { 
							return "정상"; 
						} else {
							return "중지"; 
						}
					}
				},
			],
			columnDefs : [
				{   'targets' : '_all', 'className' : 'text-center' 	}
			]
		});
		
		$('#listTable tbody').on('click', 'tr', function() {
			var data = list.row(this).data();
			location.href = "modify.do?idx=" + data.bCode;
		});
	});
</script>