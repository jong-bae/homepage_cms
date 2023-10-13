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
						<li class="breadcrumb-item active"> 도서 관리(등록)</li>
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
						<h3 class="card-title"> 도서 등록</h3>
					</div>
					<form role="form" id="writeForm" method="post" action="write-proc.do" enctype="multipart/form-data">
					<!-- <input type="hidden" name="branchOpen" value=''> -->
					<div class="card-body">
						<!-- form start -->
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label">제목</label>
							<div class="col-sm-10">
								<input type="text" name="strSubject" class="form-control" id="strSubject" placeholder="제목" required="required">
							</div>
						</div>

						<div class="form-group row">
							<label for="bCertTxt02" class="col-sm-2 col-form-label">썸네일 이미지(200x200)</label>
							<div class="col-sm-3">
								<div class="custom-file">
									<input type="file" name="imgUrl_file" class="form-control custom-file-input" id="imgUrl" placeholder="썸네일">
									<label class="custom-file-label" for="imgUrl">파일업로드</label>
								</div>
							</div>
						</div>
						<div class="form-group row">
							<label for="strContent" class="col-sm-2 col-form-label">내용</label>
							<div class="col-sm-10">
								<textarea name="strContent" id="strContent" rows="15" cols="163" class="form-control"></textarea>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="strContent" class="col-sm-2 col-form-label">요약본</label>
							<div class="col-sm-10">
								<textarea name="strPreContent" id="strPreContent" rows="3" cols="163" class="form-control"></textarea>
							</div>
						</div>
						
						
						<div class="form-group row">
							<label for="bitSecret" class="col-sm-2 col-form-label">상태</label>
							<div class="col-sm-3">
								<select class="form-control" name="bitDelete" id="bitDelete">
									<option value="0">공개</option>
									<option value="1">미공개</option>
								</select>
							</div>
						</div>
						
						
					</div>
					<div class="card-footer">
						<div class="btn-group float-left">
							<button type="submit" class="btn btn-outline-primary">등록</button>
							<button type="button" class="btn btn-outline-secondary" onClick="location.href='list.do'">취소</button>
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
	bsCustomFileInput.init();
	CKEDITOR.replace('strContent',{height:'380'});
	CKEDITOR.config.allowedContent = true;
});

</script>