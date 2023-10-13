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
						<li class="breadcrumb-item">콘텐츠 관리</li>
						<li class="breadcrumb-item active"> 도서 관리(수정)</li>
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
						<h3 class="card-title"> 도서 수정</h3>
					</div>
					<form role="form" id="modifyForm" method="post" action="modify-proc.do" enctype="multipart/form-data">
					<input type="hidden" name="idx" value='<c:out value="${data.idx }"></c:out>'>
					<div class="card-body">
						<!-- form start -->
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label">제목</label>
							<div class="col-sm-10">
								<input type="text" name="strSubject" class="form-control" id="evtSubject" placeholder="제목" required="required" value='<c:out value="${data.strSubject }"></c:out>' >
							</div>
						</div>
						
						<div class="form-group row">
							<label for="bCertTxt02" class="col-sm-2 col-form-label">썸네일 이미지(200x200)</label>
							<div class="col-sm-3">
								<c:if test='${data.strFirstImgPath ne "/Upload/cMng/null"}'>
									<img src="/Upload/${data.strFirstImgPath }" height="200">
								</c:if>
								<p>기존 파일 : ${data.strFirstImg }</p>
								<div class="custom-file">
									<input type="file" name="imgUrl_file" class="form-control custom-file-input" id="imgUrl" placeholder="수정할파일">
									<label class="custom-file-label" for="imgUrl">썸네일변경</label>
								</div>
							</div>
						</div>

						<div class="form-group row">
							<label for="strContent" class="col-sm-2 col-form-label">내용</label>
							<div class="col-sm-10">
								<textarea name="strContent" id="strContent" rows="15" cols="163" class="form-control"><c:out value="${data.strContent }"></c:out></textarea>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="strContent" class="col-sm-2 col-form-label">요약본</label>
							<div class="col-sm-10">
								<textarea name="strPreContent" id="strPreContent" rows="3" cols="163" class="form-control"><c:out value="${data.strPreContent }"></c:out></textarea>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="bitSecret" class="col-sm-2 col-form-label">상태</label>
							<div class="col-sm-3">
								<select class="form-control" name="bitDelete" id="bitDelete">
									<option value="0" <c:if test='${data.bitDelete eq "0"}'> selected</c:if>>공개</option>
									<option value="1" <c:if test='${data.bitDelete eq "1"}'> selected</c:if>>미공개</option>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label">등록일</label>
							<div class="col-sm-10">
								<input type="text" name="dateRegdate" class="form-control" id="dateRegdate" value='<c:out value="${data.dateRegdate }"></c:out>' readonly>
							</div>
						</div>
					</div>
					<div class="card-footer">
						<div class="btn-group float-left">
							<button type="submit" class="btn btn-outline-info">수정</button>
							<button type="button" class="btn btn-outline-secondary" onClick="location.href='list.do'">취소</button>
						</div>
						<div class="btn-group float-right">
							<button type="button" class="btn btn-outline-danger" onClick="deleteFunc()">삭제</button>
						</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</section>
</div>

<script>

var deleteFunc = function (){
	
	var result = confirm("삭제하시겠습니까?");
	
	if(result){
		location.href = "remove.do?idx=" + "${data.idx}";
	}
	
}


$(function () {
	bsCustomFileInput.init();
	CKEDITOR.replace('strContent',{height:'380'});
	CKEDITOR.config.allowedContent = true;
});

</script>