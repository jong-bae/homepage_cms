<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>홈페이지 팝업</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
						<li class="breadcrumb-item">팝업관리</li>
						<li class="breadcrumb-item active">홈페이지팝업</li>
					</ol>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</section>

	<!-- Main content -->
	<section class="content'">
		<div class="row">
			<div class="col-12">
				<div class="card card-primary card-outline ">
					<div class="card-header">
						<h3 class="card-title">팝업리스트 (PC/M)</h3>
						<!-- <ul class="nav nav-tabs" id="custom-tabs-three-tab" role="tablist">
							<li class="nav-item">
								<a class="nav-link active"
									id="tab-title-pc" data-toggle="pill"
									href="#tab-content-pc" role="tab"
									aria-controls="tab-content-pc" aria-selected="true">PC 팝업</a>
							</li>
							<li class="nav-item">
								<a class="nav-link"
									id="tab-title-mobile" data-toggle="pill"
									href="#tab-content-mobile" role="tab"
									aria-controls="tab-content-mobile" aria-selected="false">Mobile 팝업</a>
							</li>
						</ul> -->
					</div>
					<div class="card-body">
						<div class="tab-content" id="custom-tabs-three-tabContent">
							<!-- <div class="tab-pane fade show active" id="tab-content-pc"
								role="tabpanel" aria-labelledby="tab-title-pc">
								<table id="listTable" class="table table-bordered table-hover">
									<thead>
										<tr class="text-center">
											<th>병의원</th>
											<th>제목</th>
											<th>노출기간</th>
											<th>팝업종류</th>
											<th>상태</th>
										</tr>
									</thead>
									<tbody></tbody>
								</table>
							</div> -->
							<div class="tab-pane fade" id="tab-content-mobile" role="tabpanel"
								aria-labelledby="tab-title-mobile">
								<table id="listTable-mobile" class="table table-bordered table-hover">
									<thead>
										<tr class="text-center">
											<th>적용병의원 수</th>
											<th>제목</th>
											<th>노출기간</th>
											<th>상태</th>
											<th>노출여부</th>
											<th>등록일</th>
										</tr>
									</thead>
									<tbody></tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="card-footer">
						<button type="button" class="btn btn-outline-primary float-right" id="btn-register">등록</button>
					</div>
					<!-- /.card -->
				</div>
			</div>
		</div>
	</section>
</div>
<script>
	$(function() {
		var today = new Date();
		$('a[data-toggle="pill"]').on('show.bs.tab', function(e) {
			//list.clear();
			var id = $(e.target).attr('id');
			if (id == 'tab-title-pc') {
				//list.ajax.url('listAjax.do/pc').load();
				list_pc.ajax.reload();
			} else {
				//list.ajax.url('listAjax.do/mobile').load();
				list_m.ajax.reload();
			}
		});
		
		$('#btn-register').click(function() {
			var id = $('#custom-tabs-three-tab li a.active').attr('id');
			if (id == 'tab-title-pc') {
				location.href="write.do?kind=pc";
			} else {
				location.href="write.do?kind=m";
			}
		});
		
		/* var list_pc = $('#listTable').DataTable({
			destory : true,
			paging : true,
			lengthChange : true,
			searching : true,
			ordering : false,
			info : true,
			autoWidth : false,
			processing : true,
			stateSave : true,
			deferLoading : 100,
			ajax : {
				'type' : 'POST',
				'url' : 'listAjax.do/pc',
				'dataSrc' : ''
			},
			columns : [ {
				'data' : 'bName', 'defaultContent' : '', 'width' : '10%',
				'render' : function(data, type, row, meta) {
					if (data === null) {
						return '전체';
					} else {
						return data;
					}
				}
			}, 
			{ 'data' : 'title', 'defaultContent' : '', 'width' : '55%' 	},
			{ 'data' : function(data,type) {
					return data.startDate + " ~ " + data.endDate
				},  'width' : '15%'
			}, 
			{ 'data' : 'popCode', 'defaultContent' : '', 'width' : '10%',
				'render' : function(data, type, row, meta) {
					if(data == 'Y') {
						return "팝업";
					} else if (data == 'N') {
						return "레이어";
					} else {
						return "상단배너";
					}
				}
			}, 
			{ 'data' : 'useYN', 'defaultContent' : '', 'width' : '10%',
				'render' : function(data, type, row, meta) {
					if (data == "Y") {
						return "정상";
					} else {
						return "중지";
					}
				}
			}, ],
			columnDefs : [ {
				'targets' : '_all',
				'className' : 'text-center'
			} ]
		}); */
		
	 	var list_m = $('#listTable-mobile').DataTable({
			destory : true,
			paging : true,
			lengthChange : true,
			searching : true,
			ordering : false,
			info : true,
			autoWidth : false,
			ajax : {
				'type' : 'POST',
				'url' : 'listAjax.do/mobile',
				'dataSrc' : ''
			},
			columns : [ {
				'data' : 'branchCnt', 'defaultContent' : '', 'width' : '10%',
				'render' : function(data, type, row, meta) {
					return data + "곳";
				}
			}, 
			{ 'data' : 'title', 'defaultContent' : '', 'width' : '40%' 	},
			{ 'data' : function(data,type) {
					if (data.endDate == null) {
						return data.startDate + " ~ 종료일 없음"; 
					} else {
						return data.startDate + " ~ " + data.endDate;
					}
				},  'width' : '15%'
			}, 
			{ 'data' : function(data,type) {
					//console.log("endDate:" + new Date(data.endDate).getTime());
					var sdate = new Date(data.startDate).getTime();
					var edate = new Date(data.endDate).getTime();
					
					if(data.useYN == "Y") {
						if(today.getTime() < sdate) {
							return '대기';
						} else if(today.getTime() > sdate && edate == 0) {
							return '진행중';
						} else if (today.getTime() > edate) {
							return '종료';
						} else if (today.getTime() > sdate && today.getTime() < edate) {
							return '진행중';
						}
					} else {
						return '종료';
					}
				},  'width' : '15%'
			}, 
			{ 'data' : 'useYN', 'defaultContent' : '', 'width' : '10%',
				'render' : function(data, type, row, meta) {
					if (data == "Y") {
						return "노출";
					} else {
						return "미노출";
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
		
		$('#listTable-mobile tbody').on('click', 'tr', function() {
			var data = list_m.row(this).data();
			console.log(data);
			location.href = "modify.do?kind=m&idx=" + data.idx;
		}); 
	});
	
</script>