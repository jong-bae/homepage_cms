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
						<li class="breadcrumb-item active"> TV보니 관리</li>
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
								<h3 class="card-title"> TV보니 목록</h3>
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
										<th align="left">썸네일</th>
										<th>영상시간</th>
										<th>카테고리1</th>
										<th>카테고리2</th>
										<th>제목</th>
										
										<th>등록일</th>
										<th>추천메인<br>(1개)</th>
										<th>추천여부<br>(12개)</th>
										<th>영상공개범위</th>
										<th>사용여부</th>														
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
		ajax : {
			'type' : 'POST',
			'url' : 'listAjax.do',
			'dataSrc' : ''
		},
		destroy: true,
		ordering : false,
		stateSave: true,
		stateDuration: -1,
		columns : [			
			{ 'data' : 'vid', 'defaultContent' : '', 'width': '10%', 
				render: function (data){
					return '<img src="https://img.youtube.com/vi/'+data+'/mqdefault.jpg" width="100"><br>('+data+')';
				}	
			},
			{ 'data' : 'vid_time', 'defaultContent' : '', 'width': '10%' },
			{ 'data' : 'category1', 'defaultContent' : '', 'width': '5%' },
			{ 'data' : 'category2', 'defaultContent' : '', 'width': '10%' },
			{ 'data' : 'title', 'defaultContent' : '', 'width': '15%' },
			{ 'data' : 'regdate', 'defaultContent' : '', 'width': '10%' },
			{ 'data' : 'mmain_yn', 'defaultContent' : '', 'width': '10%'},
			{ 'data' : 'main_yn', 'defaultContent' : '', 'width': '10%' },
			{ 'data' : 'public_yn', 'defaultContent' : '', 'width': '10%' },
			{ 'data' : 'real_yn', 'defaultContent' : '', 'width': '10%' }
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