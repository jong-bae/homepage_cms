<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>회원관리</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
						<li class="breadcrumb-item">회원</li>
						<li class="breadcrumb-item active">회원관리</li>
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
					<div class="card card-primary">
						<div class="card-header">
							<h3 class="card-title">리스트</h3>
							<button type="button" class="btn btn-default float-right" id="btn-excelDown">엑셀다운로드</button>
						</div>
						<div class="card-body">
							<table id="listTable" class="table table-bordered table-hover">
								<thead>
								<tr class="text-center">
									<th>ID</th>
									<th>이름</th>
									<th>PC/M</th>
									<th>가입방법</th>
									<th>가입지역</th>
									<th>가입일</th>
									<th>최근로그인</th>
									<th>메일링동의</th>
									<th>3자정보동의</th>
								</tr>
								</thead>
								<tbody></tbody>
							</table>
						</div>
						<!-- <div class="card-footer">
							<button type="button" class="btn btn-outline-primary float-right"
								onClick="location.href='write.do'">등록</button>
						</div> -->

					</div>
				</div>
			</div>
		</div>
	</section>

</div>
<script>

	//엑셀다운로드 배열필드
	let sheet_js = "";
	let results = "";

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
				'dataSrc': ''
			},
			columns : [
				{ 'data' : 'id', 'defaultContent': '', 'width': '15%'	},
				{ 'data' : 'name', 'defaultContent': '', 'width': '10%'	},
				{ 'data' : 'siteCode', 'defaultContent': '', 'width': '5%'
					,'render' : function(data, type, row, meta) {
						if(data ==  'CD_SITE_001') {
							return "PC";
						} else {
							return "M";
						}
					}
				},
				{ 'data' : 'joinFlag', 'defaultContent': '', 'width': '10%'	},
				{ 'data' : 'bName', 'defaultContent': '', 'width': '10%'	},
				{ 'data' : 'memberDate', 'defaultContent': '', 'width': '10%'	},
				{ 'data' : 'loginDate', 'defaultContent': '', 'width': '10%'	},
				{ 'data' : 'mailingYN', 'defaultContent': '', 'width': '10%'
					,'render' : function(data, type, row, meta) {
						if(data ==  'Y') {
							return "동의";
						} else {
							return "";
						}
					}
				},
				{ 'data' : 'agreeYN', 'defaultContent': '', 'width': '10%'
					,'render' : function(data, type, row, meta) {
						if(data ==  'Y') {
							return "동의";
						} else {
							return "";
						}
					}
				}
			],
			columnDefs : [
				{   'targets' : '_all', 'className' : 'text-center' 	}
			],
			'initComplete': function(settings, json) {

				//json 가공 엑셀다운로드 전용
				let results = json.map(function(item) {

					//PC M 구분처리
					let site_str = "";
					if( item.siteCode === "CD_SITE_001" ) site_str = "PC";
					if( item.siteCode === "CD_SITE_041" ) site_str = "M";

					return { 	'번호': item.idx, '아이디': item.id,
								'이름': item.name, 'PCㆍM구분': site_str,
								'가입방법': item.joinFlag, '가입지역': item.bName,
								'가입일': item.memberDate, '최근로그인': item.loginDate,
								'메일링동의': item.mailingYN, '제3자동의': item.agreeYN
					};

				});

				//json sheetjs 처리
				sheet_js = XLSX.utils.json_to_sheet(results);

			}
		});

		$('#listTable tbody').on('click', 'tr', function() {
			var data = list.row(this).data();
			//location.href = "modify.do?idx=" + data.idx;
		});
	});

	//엑셀 다운로드 sheetjs 참조
	$('#btn-excelDown').click(function() {

		let wb = XLSX.utils.book_new();
		XLSX.utils.book_append_sheet(wb, sheet_js, "Sheet1");

		//엑셀 파일생성
		XLSX.writeFile(wb, ('회원_다운로드.xlsx'));

	});

</script>