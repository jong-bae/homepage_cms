<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>간호사관리</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
						<li class="breadcrumb-item">간호사관리</li>
						<li class="breadcrumb-item active">간호사관리</li>
					</ol>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-12">`
				<div class="card card-default">
					<div class="card-header">
						<h3 class="card-title">리스트</h3>
						<button type="button" class="btn btn-sm btn-outline-primary float-right"
							onClick="location.href='write.do'">등록</button>
					</div>
					<div class="card-body">
						<table id="listTable" class="table table-bordered table-hover">
							<thead>
								<tr class="text-center">
									<th>고유번호</th>
									<th>이름(사번)</th>
									<th>병의원</th>
									<!-- <th>담당의료진</th> -->
									<th>사용유무</th>
									<th>등록일</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
					<div class="card-footer">
						<button type="button" class="btn btn-outline-primary float-right"
							onClick="location.href='write.do'">등록</button>
					</div>
					<!-- /.card -->
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
			{ 'data' : 'idx', 'defaultContent' : '', 'width' : '5%' 	},
			{ 'data' : function(data, type) {
						return data.name + "(" + data.idno + ")";
			}, 'width' : '15%' },
			{ 'data' : 'bName', 'defaultContent' : '', 'width' : '10%'},
			/* { 'data' : 'doctorName', 'defaultContent' : '', 'width' : '15%'}, */
			{ 'data' : 'useYN', 'defaultContent': '', 'width': '10%'
				,'render' : function(data, type, row, meta) {
					if(data ==  'Y') { 
						return "사용"; 
					} else {
						return "미사용"; 
					}
				}
			},
			{ 'data' : 'regDate', 'defaultContent' : '', 'width' : '10%'}
			],
			columnDefs : [ {
				'targets' : '_all',
				'className' : 'text-center'
			} ]
		});
		
		$('#listTable tbody').on('click', 'tr', function() {
			var data = list.row(this).data();
			location.href = "modify.do?idx=" + data.idx;
		}); 
	});
	
</script>