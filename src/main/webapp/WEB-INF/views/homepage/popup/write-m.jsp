<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>홈페이지M 팝업 등록</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
						<li class="breadcrumb-item">팝업관리</li>
						<li class="breadcrumb-item active">M팝업</li>
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
				<div class="card card-info">
					<div class="card-header">
						<h3 class="card-title">등록</h3>
					</div>
					<!-- form start -->
					<form role="form" id="quickForm" method="post" action="write-proc.do" enctype="multipart/form-data" onsubmit="return validation();">
						<%-- <input type="hidden" name="kind" value="${kind }"> --%>
						<div class="card-body">
							<div class="form-group row">
								<label for="sel-status" class="col-sm-2 col-form-label">노출 환경</label>
								<div class="col-sm-10">
									<div class="row">
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="checkbox" id="chk-exposure-pc" name="exposure" value="PC">
												<label for="chk-exposure-pc">PC</label>
											</div>
										</div>
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="checkbox" id="chk-exposure-m" name="exposure" value="M">
												<label for="chk-exposure-m">모바일</label>
											</div>
										</div>
									</div>
								</div>
							</div>
						
							<div class="form-group row">
								<label for="sel-bcode" class="col-sm-2 col-form-label">소속병의원</label>
								<div class="col-sm-10">
									<div class="row">
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="checkbox" id="chk-bCode" value="">
												<label for="chk-bCode">전체</label>
											</div>
										</div>
										<c:forEach items="${bcodeList }" var="bcode" varStatus="dataCnt">
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="checkbox" class="chk-bCode-list" id="chk-bCode-${dataCnt.count }" name="bCode" value='<c:out value="${bcode.bCode }"></c:out>'>
												<label for="chk-bCode-${dataCnt.count }"><c:out value="${bcode.bName }"></c:out></label>
											</div>
										</div>
										</c:forEach>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<label for="title" class="col-sm-2 col-form-label">제목</label>
								<div class="col-sm-5">
									<input type="text" name="title" class="form-control" id="title" placeholder="제목" >
								</div>
							</div>
							<div class="form-group row">
								<label for="description" class="col-sm-2 col-form-label">설명</label>
								<div class="col-sm-10">
									<input type="text" name="description" class="form-control" id="description" placeholder="설명글, alt, title">
								</div>
							</div>
							<div class="form-group row">
								<label for="url" class="col-sm-2 col-form-label">URL</label>
								<div class="col-sm-6">
									<input type="text" name="url" class="form-control" id="url" placeholder="url 주소">
								</div>
								<div class="col-sm-2">
									<select class="form-control select2" name="url_Option">
										<option selected="selected">_self</option>
										<option>_blank</option>
									</select>
								</div>
								<div class="col-sm-2">
									<div class="icheck-primary d-inline">
										<input type="checkbox" id="urlYN" name="urlYN" value="Y">
										<label for="urlYN">링크없음</label>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<label for="popupImg" class="col-sm-2 col-form-label">팝업 이미지</label>
								<div class="col-sm-3">
									<div class="custom-file">
										<input type="file" name="popupImg_file" class="custom-file-input" id="popupImg" accept="image/*">
										<label class="custom-file-label" for="popupImg">팝업이미지 업로드</label>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<label for="startDate" class="col-sm-2 col-form-label">기간</label>
								<div class="col-sm-2">
									<input type="text" name="startDate" class="form-control" id="startDate" placeholder="시작날짜">
								</div>
								<div class="col-sm-2">
									<input type="text" name="endDate" class="form-control" id="endDate" placeholder="종료날짜" >
								</div>
							</div>
							<div class="form-group row">
								<label for="order" class="col-sm-2 col-form-label">순서</label>
								<div class="col-sm-1">
									<input type="text" name="order" class="form-control" id="order" value="0" oninput="this.value = this.value.replace(/[^0-9.]/g,'').replace(/(\..*)\./g,'$1');">
								</div>	
							</div>
							<div class="form-group row">
								<label for="sel-status" class="col-sm-2 col-form-label">노출여부</label>
								<div class="col-sm-10">
									<div class="row">
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="radio" id="useY" name="useYN" value="Y">
												<label for="useY">노출</label>
											</div>
										</div>
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="radio" id="useN" name="useYN" value="N" checked>
												<label for="useN">미노출</label>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="card-footer">
							<div class="btn-group float-left">
								<button type="submit" class="btn btn-outline-primary">등록</button>
								<button type="button" class="btn btn-outline-secondary"	onClick="location.href='list.do'">취소</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
</div>
<script>
	//CKEDITOR.replace('contents');
	
	$(function () {
		$('#startDate, #endDate').daterangepicker({
			locale : { format : 'YYYY-MM-DD'},
			singleDatePicker : true
		});
		
		// 종료날짜는 선택 안할 수도 있으므로 공백 초기화
		$('#endDate').val("");
		
		// 전체 체크박스 선택/취소
		$('#chk-bCode').change(function() {
			$('.chk-bCode-list').prop('checked', $(this).prop('checked'));
		});
		
		// custom input file type init();
		bsCustomFileInput.init();
	});
	
	function validation() {
		if(!formValidation_check('chk-bCode-list')) return false;
		if(!formValidation_empty('title')) return false;
		if(!formValidation_empty('startDate')) return false;
	}
</script>