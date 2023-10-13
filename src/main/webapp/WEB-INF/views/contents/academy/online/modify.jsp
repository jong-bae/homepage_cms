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
						<li class="breadcrumb-item">메디컬아카데미</li>
						<li class="breadcrumb-item active">온라인 교육과정 수정</li>
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
						<h3 class="card-title">온라인 교육과정 수정</h3>
					</div>
					<form role="form" id="writeForm" method="post" action="modify-proc.do" onsubmit="validateForm();">
					<input type="hidden" name="idx" value='<c:out value="${data.idx }"></c:out>'>
					<div class="card-body">
						<!-- form start -->
						<div class="form-group row">
							<label for="sel-status" class="col-sm-2 col-form-label">카테고리 구분</label>
							<div class="col-sm-10">
								<div class="row">
									<div class="col-sm-1">
										<div class="icheck-primary d-inline">
											<input type="radio" id="gubun_cme" name="gubun" value="CME" ${data.gubun == 'CME' ? 'checked' : '' }>
											<label for="gubun_cme">CME</label>
										</div>
									</div>
									<div class="col-sm-1">
										<div class="icheck-primary d-inline">
											<input type="radio" id="gubun_ce" name="gubun" value="CE" ${data.gubun == 'CE' ? 'checked' : '' }>
											<label for="gubun_ce">CE</label>
										</div>
									</div>
									<div class="col-sm-1.5">
										<div class="icheck-primary d-inline">
											<input type="radio" id="gubun_non-cme" name="gubun" value="Non-CME" ${data.gubun == 'Non-CME' ? 'checked' : '' }>
											<label for="gubun_non-cme">Non-CME</label>
										</div>
									</div>
									<div class="col-sm-1">
										<div class="icheck-primary d-inline">
											<input type="radio" id="gubun_oer" name="gubun" value="OER" ${data.gubun == 'OER' ? 'checked' : '' }>
											<label for="gubun_oer">OER</label>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label">제목</label>
							<div class="col-sm-10">
								<input type="text" name="title" class="form-control" id="title" value='<c:out value="${data.title }"></c:out>' placeholder="제목" required="required">
							</div>
						</div>
						<div class="form-group row">
							<label for="url" class="col-sm-2 col-form-label">링크 URL</label>
							<div class="col-sm-10">
								<input type="text" name="url" class="form-control" id="url" value='<c:out value="${data.url }"></c:out>' placeholder="url" required="required">
							</div>
						</div>
						<div class="form-group row">
							<label for="sel-status" class="col-sm-2 col-form-label">사용유무</label>
							<div class="col-sm-10">
								<div class="row">
									<div class="col-sm-1">
										<div class="icheck-primary d-inline">
											<input type="radio" id="useY" name="useYN" value="Y" ${data.useYN == 'Y' ? 'checked' : '' }>
											<label for="useY">노출</label>
										</div>
									</div>
									<div class="col-sm-2">
										<div class="icheck-primary d-inline">
											<input type="radio" id="useN" name="useYN" value="N" ${data.useYN == 'N' ? 'checked' : '' }>
											<label for="useN">미노출</label>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group row">
							<label for="regDate" class="col-sm-2 col-form-label">등록일</label>
							<div class="col-sm-10">
								<input type="text" name="regDate" class="form-control" id="regDate" value='<c:out value="${data.regDate }"></c:out>' placeholder="YYYYMMDD" required="required">
							</div>
						</div>
					</div>
					<div class="card-footer">
						<div class="btn-group float-left">
							<button type="submit" class="btn btn-outline-info">수정</button>
							<button type="button" class="btn btn-outline-secondary" onClick="location.href='list.do'">취소</button>
						</div>
						<div class="btn-group float-right">
							<button type="button" class="btn btn-outline-danger" id="btn-delete">삭제</button>
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
	
}

$(function() {
	$('#btn-delete').click(function() {
		if(!confirm("삭제하시겠습니까?")) return;
		$('#writeForm').attr('action', 'remove.do').attr('onsubmit', '').submit();
	});

});

</script>