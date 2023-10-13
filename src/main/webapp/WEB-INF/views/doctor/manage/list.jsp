<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>의료진관리</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
						<li class="breadcrumb-item">의료진관리</li>
						<li class="breadcrumb-item active">의료진관리</li>
					</ol>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-12">
				<div class="card card-danger card-outline">
					<div class="card-body">
						<p class="card-text">
							※ 의료진 등록전에 이름 검색 후 없으면 등록!<br>
							※ 동일인 데이터 있으면 내용 수정!
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
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
									<th>의사고유번호</th>
									<th>사진</th>
									<th>이름</th>
									<th>사번</th>
									<th>사용유무</th>
									<th>경력/진료내용</th>
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
			{ 'data' : 'didx', 'defaultContent' : '', 'width' : '5%' 	},
			{ 'data' : 'imgFile', 'defaultContent' : '', 'width' : '10%',
				'render' : function(data, type, row, meta) {
					if (data != null) {
						return '<img src="'+ data + '" height="150px;">';
					}		
				}
			},
			{ 'data' : 'name', 'defaultContent' : '', 'width' : '10%'},
			{ 'data' : 'idno', 'defaultContent' : '', 'width' : '8%'},
			{ 'data' : function(data, type) {
					var dataYN = "";
					if (data.useYN == "Y") {
						dataYN = "사용";
					} else {
						dataYN = "<font color='red'>미사용</font>";
					}
					if(data.detailYN == "Y") {
						dataYN += "<br>상세페이지 사용";
					} else {
						dataYN += "<br><font color='red'>상세페이지 미사용</font>";
					}
					if(data.scheduleYN == "Y") {
						dataYN += "<br>진료일정표 사용";
					} else {
						dataYN += "<br><font color='red'>진료일정표 미사용</font>";
					}
					if(data.reserveYN == "Y") {
						dataYN += "<br>진료예약 사용";
					} else {
						dataYN += "<br><font color='red'>진료예약 미사용</font>";
					}
					return dataYN;
				}, 'width' : '15%'
			},
			{ 'data' : function(data, type) {
					return createInnerTable(data);
				}	
			}
			/* { 'data' : 'regDate', 'defaultContent' : '', 'width' : '10%'} */ 
			],
			columnDefs : [ {
				'targets' : '_all',
				'className' : 'text-center'
			} ]
		});
		
		$('#listTable tbody').on('click', 'tr', function() {
			var data = list.row(this).data();
			location.href = "modify.do?idx=" + data.didx;
		}); 
	});
	
	//-- 경력/진료내용 생성 함수
	function createInnerTable(DATA) {
		var innerHTML = '<table style="text-align: left;"><tr><td style="width: 65px; background-color: #f7f1e3">약/경력 : </td><td>'+ DATA.partSubName2 +
					'</td></tr><tr><td style="width: 65px; background-color: #f7f1e3">진료내용 : </td><td>'+ DATA.clinicExp +'</td></tr></table>'
		return innerHTML;
	}
	
</script>