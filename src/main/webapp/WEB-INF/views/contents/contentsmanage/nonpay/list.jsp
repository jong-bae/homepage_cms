<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>비급여의료수가 관리</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
						<li class="breadcrumb-item">콘텐츠관리</li>
						<li class="breadcrumb-item active">비급여의료수가</li>
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
						<div class="card-body">
							<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modal-upload">비급여 엑셀파일 일괄등록</button>
							<button type="button" class="btn btn-outline-primary" onClick="location.href='write.do?status=K'">이력유지 단일등록</button>
							<button type="button" class="btn btn-outline-info" onClick="location.href='write.do?status=R'">이력갱신 단일등록</button>
						</div>
						<div class="card-body">
							<button type="button" class="btn btn-default" onclick="location.href='${pageContext.request.contextPath}/Upload/nonpay/비급여_샘플.xlsx'">비급여샘플(병의원)</button>
							<!-- <button type="button" class="btn btn-default">비급여샘플(업로드)</button> -->
							<button type="button" class="btn btn-default" id="btn-excelDown">엑셀다운로드</button>
						</div>
					</div>
					<div class="card card-secondary card-outline">
						<div class="card-header">
							<h3 class="card-title">리스트</h3>
						</div>
						<div class="card-body">
							<div class="form-group row">
								<div class="col-md-2">
									<select class="form-control select2" id="sel-bcode" name="bCode">
										<option value="0">병의원선택</option>
										<c:forEach items="${bcodeList }" var="bcode">
											<option value='<c:out value="${bcode.bCode }"></c:out>'><c:out value="${bcode.bName }"></c:out></option>
										</c:forEach>
									</select>
								</div>
								<div class="col-sm-2">
									<select class="form-control select2" name="historyDate" id="sel-history">
										<option value="N">수정일</option>
									</select>
								</div>
								<div class="col-md-2">
									<button type="button" class="btn btn-info" id="btn-search">검색</button>
								</div>
							</div>
							<table id="listTable" class="table table-bordered table-hover">
								<thead>
									<tr>
										<th rowspan="2" class="text-center">병의원</th>
										<th rowspan="2" class="text-center">대분류</th>
										<th rowspan="2" class="text-center">분류</th>
										<th colspan="2" class="text-center">항목</th>
										<th colspan="4" class="text-center">가격정보(원)</th>
										<th rowspan="2" class="text-center">최종수정일</th>
									</tr>
									<tr>
										<th class="text-center">명칭</th>
										<th class="text-center">코드</th>
										<th class="text-center">구분</th>
										<th class="text-center">비용</th>
										<th class="text-center">최저비용</th>
										<th class="text-center">최고비용</th>
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

	<!-- BranchCenter ModalPopup  -->
	<div class="modal fade" id="modal-upload">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
			<form id="modal-form" method="POST" enctype="multipart/form-data">
				<div class="overlay d-flex justify-content-center align-items-center" style="display:none!important;">
                	<i class="fas fa-2x fa-sync fa-spin"></i>
           		</div>
				<div class="modal-header">
					<h4 class="modal-title">비급여 일괄등록</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
					<select class="form-control select2" id="sel-modal-bcode" name="bCode">
						<option value="0">병의원선택</option>
						<c:forEach items="${bcodeList }" var="bcode">
							<option value='<c:out value="${bcode.bCode }"></c:out>'><c:out value="${bcode.bName }"></c:out></option>
						</c:forEach>
					</select>
					</div>
					<div class="form-group">
						<div class="input-group input-group-m">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
							</div>
							<input type="text" class="form-control" id="modal-historyDate" name="updateDate" placeholder="YYYYMMDD"> 
						</div>
					</div>
					<div class="form-group">
						<div class="custom-file">
							<input type="file" name="excelFile" class="custom-file-input" id="excelFile" 
								accept="application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet">
							<label class="custom-file-label" for="imgFile">비급여엑셀 업로드</label>
						</div>
					</div>
				</div>
				<div class="modal-footer justify-content-between">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="btn-upload">업로드</button>
				</div>
			</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
</div>
<script>
	$(function() {
		// custom input file type init();
		bsCustomFileInput.init();
		
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
				'data' : function(d) {
						d.bCode = $('#sel-bcode').val();
						d.uuid = $('#sel-history').val();
				},
				'dataSrc' : ''
			},
			columns : [
				{ 'data' : 'bName', 'defaultContent' : '', 'width': '7%' },
				{ 'data' : 'code', 'defaultContent': '', 'width': '15%'	},
				{ 'data' : 'codeName', 'defaultContent': '', 'width': '15%'	},
				{ 'data' : 'itemName', 'defaultContent': '', 'width': '18%'	},
				{ 'data' : 'itemCode', 'defaultContent': '', 'width': '7%'	},
				{ 'data' : 'itemDivision', 'defaultContent': '', 'width': '15%'	},
				{ 'data' : 'cost', 'defaultContent': '', 'width': '5%'	},
				{ 'data' : 'minCost', 'defaultContent': '', 'width': '5%'	},
				{ 'data' : 'maxCost', 'defaultContent': '', 'width': '5%'	},
				{ 'data' : 'updateDate', 'defaultContent': '', 'width': '8%'}
			],
			columnDefs : [
				{   'targets' : '_all', 'className' : 'text-center' 	}
			]
		});
		
		$('#listTable tbody').on('click', 'tr', function() {
			var data = list.row(this).data();
			location.href = "modify.do?idx=" + data.idx;
		});
		
		$('#btn-search').click(function() {
			list.ajax.reload();
		});
	});
	
	$('#sel-bcode').change(function() {
		var bcode = $(this).val();
		loadHistoryDate(bcode);
	});
	
	$('#btn-excelDown').click(function() {
		console.log($('#sel-bcode').val());
		console.log($('#sel-history').val());
		var bcode = $('#sel-bcode').val();
		var history = $('#sel-history').val();
		if(bcode == 0) {
			alert("다운로드할 병의원을 선택하세요!");
			return;
		}
		if(history == 'N') {
			alert("다운로드할 최종수정일을 선탁하세요!");
			return;
		}
		
		location.href = "excelDown.do?bcode=" + bcode + "&date=" + history;
		
	});
	
	/* 비급여 일괄 업로드 버튼이벤트  */
	$('#btn-upload').click(function() {
		var modalForm = new FormData($('#modal-form')[0]);
		$('.overlay').show();
		
		$.jbAjaxFile('${pageContext.request.contextPath}/contents/contentsmanage/nonpay/excelUpload.do', modalForm,
			function(result) {
			if(result.result) {
					alert(result.message);
					$('#modal-upload').modal('hide');
					$('.overlay').attr('style', 'display: none!important;');
					$('#modal-historyDate').val('');
					$('#sel-modal-bcode option:first').attr('selected', 'selected');
					$('#excelFile').val('');
				}
			},
			function(result) {
				// fail 	
			},
			function() {
				// DataTable 리로드 했을때 데이터 NULL 떨어지는데 확인 및 보완
				//$('#listTable').DataTable().ajax.reload();
				location.reload();
			}
		);
	});
	
	function loadHistoryDate(BCODE) {
		$.jbAjaxPostJson('${pageContext.request.contextPath}/contents/contentsmanage/nonpay/loadHistory.do', { 'bCode' : BCODE },
			function(result) {
				if( result.length > 0) {
					$('#sel-history').children().remove();
					$.each(result, function(key, value) {
						$('#sel-history').append('<option value="' + value.uuid + '">' + value.historyDate + '</option>');
					});
				} else {
					$('#sel-history').children().remove();
					$('#sel-history').append('<option value="N">최종수정일</option>');
				}
			},
			function(result) {
				// fail 
			}
		);
	}
	
</script>