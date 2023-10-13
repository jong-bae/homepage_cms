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
					<ol class="breadcrumb float-sm-left">
						<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
						<li class="breadcrumb-item active">비밀번호 변경</li>
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
						<h3 class="card-title">비밀번호 변경</h3>
					</div>
					<form role="form" id="writeForm" method="post" action="pwdChange-proc.do" onsubmit="return validateForm();">
					<div class="card-body">
						<!-- form start -->
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label">기존 비밀번호</label>
							<div class="col-sm-4">
								<input type="password" name="password_origin" class="form-control" id="password_origin" placeholder="기존 비밀번호" required="required">
							</div>
						</div>
						<div class="form-group row">
							<label for="url" class="col-sm-2 col-form-label">새 비밀번호</label>
							<div class="col-sm-4">
								<input type="password" name="password" class="form-control" id="password" placeholder="새 비밀번호" required="required">
								<span id="errTxt" class="invalid-feedback">6글자 이상</span>
							</div>
						</div>
						<div class="form-group row">
							<label for="regDate" class="col-sm-2 col-form-label">새 비밀번호 확인</label>
							<div class="col-sm-4">
								<input type="password" name="password_confirm" class="form-control" id="password_confirm" placeholder="새 비밀번호 확인" required="required">
							</div>
						</div>
					</div>
					<div class="card-footer">
						<div class="btn-group float-left">
							<button type="submit" class="btn btn-outline-primary">변경</button>
							<button type="button" class="btn btn-outline-secondary" onClick="location.href='index.do'">취소</button>
						</div>
					</div>
					
					</form>
				</div>
			</div>
		</div>
	</section>
</div>

<script>

//submit 하기전 유효성 검사 함수
function validateForm  (){
	// 비밀번호 입력길이 체크, 비밀번호 같게 입력했는지 체크
	var pwdn = $('#password').val();
	var pwdc = $('#password_confirm').val();
	
	if(pwdn !== pwdc) {
		alert("입력하신 비밀번호가 일치하지 않습니다. 확인해주세요!");
		$('#password_confirm').focus();
		
		return false;
	}
	
	if(pwdn.length < 6) {
		$('#password').addClass('is-invalid');
		$('#errTxt').css('display', 'initial');
		
		return false;
	}
}

$(function() {
	<c:if test="${data.result eq 'false'}">
		if(!${data.result}) {
			alert('${data.message}');
		}
	</c:if>
});

</script>