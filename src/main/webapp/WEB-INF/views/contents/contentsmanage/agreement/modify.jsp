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
						<li class="breadcrumb-item">회원약관 관리</li>
						<li class="breadcrumb-item active">회원약관 수정</li>
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
						<h3 class="card-title">회원약관 수정</h3>
					</div>
					<form role="form" id="writeForm" method="post" action="modify-proc.do" onsubmit="validateForm();">
					<input type="hidden" name="pid" value='<c:out value="${data.pid }"></c:out>'>
					<div class="card-body">
						<!-- form start -->
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label">제목</label>
							<div class="col-sm-10">
								<input type="text" name="title" class="form-control" id="title" value='<c:out value="${data.title }"></c:out>' placeholder="제목" required="required">
							</div>
						</div>
						<div class="form-group row">
							<label for="version" class="col-sm-2 col-form-label">버전</label>
							<div class="col-sm-2">
								<input type="text" name="version" class="form-control" id="version" value='<c:out value="${data.version }"></c:out>' placeholder="버전" required="required">
							</div>
						</div>
						<div class="form-group row">
								<label for="sel-status" class="col-sm-2 col-form-label">사용유무</label>
								<div class="col-sm-10">
									<div class="row">
										<div class="col-sm-1">
											<div class="icheck-primary d-inline">
												<input type="radio" id="useY" name="useYN" value="Y" ${data.useYN == 'Y' ? 'checked' : '' }>
												<label for="useY">사용</label>
											</div>
										</div>
										<div class="col-sm-1">
											<div class="icheck-primary d-inline">
												<input type="radio" id="useN" name="useYN" value="N" ${data.useYN == 'N' ? 'checked' : '' }>
												<label for="useN">미사용</label>
											</div>
										</div>
									</div>
								</div>
							</div>
						
						<div class="form-group row">
							<label for="strContents" class="col-sm-2 col-form-label">내용</label>
							<div class="col-sm-10">
								<textarea name="strContents" id="strContents" rows="15" cols="163" class="form-control">${data.strContents }</textarea>
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
	//CK에디터 호출
	CKEDITOR.replace('strContents',{height:'380'});
	CKEDITOR.config.allowedContent = true;
	
	$('#btn-delete').click(function() {
		if(!confirm("삭제하시겠습니까?")) return;
		$('#writeForm').attr('action', 'remove.do').attr('onsubmit', '').submit();
	});
});

</script>