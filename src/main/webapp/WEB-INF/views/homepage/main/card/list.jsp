<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>홈페이지 메인 콘텐츠 모바일</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
						<li class="breadcrumb-item">메인관리</li>
						<li class="breadcrumb-item active">콘텐츠</li>
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
										<th>노출 위치</th>
										<th>타이틀</th>
										<th>노출기간</th>
										<th>상태</th>
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
		</div>
	</section>
</div>
<script>
	$(function() {
		var today = new Date(getToday());

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
			{ 'data' : function(data,type) {
					if (data.mobile_yn == "Y") {
						return "<span style='color:red'>M</span>";
					} else {
						return "<span style='color:blue'>PC</span>";
					}
				},  'width' : '10%'
			},
			{ 'data' : 'title', 'defaultContent' : '', 'width' : '30%' 	},
			{ 'data' : function(data,type) {
					if (data.endDate == null) {
						return data.startDate + " ~ 종료일 없음";
					} else {
						return data.startDate + " ~ " + data.endDate;
					}
				},  'width' : '15%'
			},
			{ 'data' : function(data,type) {
					var sdate = new Date(data.startDate).getTime();
					var edate = new Date(data.endDate).getTime();

					if(today.getTime() < sdate) {
						return '대기';
					} else if(today.getTime() > sdate && edate == 0) {
						return '진행중';
					} else if (today.getTime() > edate) {
						return '종료';
					} else if (today.getTime() >= sdate && today.getTime() <= edate) {
						return '진행중';
					}

				},  'width' : '15%'
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

	function getToday() {
		var date = new Date();
	    var year = date.getFullYear();
	    var month = ("0" + (1 + date.getMonth())).slice(-2);
	    var day = ("0" + date.getDate()).slice(-2);

	    return year + "-" + month + "-" + day;
	}

</script>