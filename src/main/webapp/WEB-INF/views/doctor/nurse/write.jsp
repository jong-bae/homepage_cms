<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>간호사 등록</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
						<li class="breadcrumb-item">의료진관리</li>
						<li class="breadcrumb-item active">간호사</li>
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
					<form role="form" id="quickForm" method="post" action="write-proc.do" onsubmit="return validation();">
						<div class="card-body">
							<div class="form-group row">
								<label for="bCode" class="col-sm-2 col-form-label text-primary">병의원</label>
								<div class="col-sm-2">
									<select class="form-control select2" name="bCode" id="sel-bCode">
										<option value="">병의원 선택</option>
										<c:forEach items="${bcodeList }" var="bcode">
											<c:if test="${bcode.bCode != '10000'}">
												<option value='<c:out value="${bcode.bCode }"></c:out>'><c:out value="${bcode.bName }"></c:out></option>
											</c:if>
										</c:forEach>
									</select>
									
								</div>
							</div>
							<div class="form-group row">
								<label for="name" class="col-sm-2 col-form-label">이름</label>
								<div class="col-sm-2">
									<input type="text" name="name" class="form-control" id="name">
								</div>
							</div>
							<div class="form-group row">
								<label for="idno" class="col-sm-2 col-form-label">사번</label>
								<div class="col-sm-2">
									<input type="text" name="idno" class="form-control" id="idno">
								</div>
							</div>
							<!-- <div class="form-group row">
								<label for="didx" class="col-sm-2 col-form-label">담당원장</label>
								<div class="col-sm-3">
									<select class="form-control select2" name="didx" id="sel-doctor">
										<option value="0" >병의원을 선택하세요!</option>
									</select>
								</div>
							</div> -->
							<div class="form-group row">
								<label for="useYN" class="col-sm-2 col-form-label">상태</label>
								<div class="col-sm-10">
									<div class="row">
										<div class="col-sm-1">
											<div class="icheck-primary d-inline">
												<input type="radio" id="useY" name="useYN" value="Y">
												<label for="useY">사용</label>
											</div>
										</div>
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="radio" id="useN" name="useYN" value="N" checked>
												<label for="useN">미사용</label>
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
	$(function () {
		// custom input file type init();
		bsCustomFileInput.init();
		
		$('#sel-bCode').on('change', function() {
			var idx = $(this).val();
		//	loadDoctorList(idx);
		})
	});
	
	// 현재 홈페이지에서 해당 기능 미사용으로 비활성화
	function loadDoctorList(IDX) {
		$.jbAjaxPostJson('${pageContext.request.contextPath}/doctor/nurse/loadDoctorList.do', { 'idx' : IDX  },
			function(result) {
				if( result.length > 0) {
					$('#sel-doctor').children().remove();
					$.each(result, function(key, value) {
						$('#sel-doctor').append('<option value="' + value.idx + '">[' + value.bName + '] ' + value.name + '</option>');
					}); 
				} else {
					$('#sel-doctor').children().remove();
					$('#sel-doctor').append('<option value="0">병의원을 선택하세요!</option>');
				}
			},
			function(result) {
				// fail 
			}
		);
	}
	
	function validation() {
		if(!formValidation_empty('name')) return false;
		if(!formValidation_empty('idno')) return false;
	}
</script>