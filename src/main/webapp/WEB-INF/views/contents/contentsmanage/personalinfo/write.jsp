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
						<li class="breadcrumb-item active">개인정보처리방침 관리(등록)</li>
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
						<h3 class="card-title">개인정보처리방침 등록</h3>
					</div>
					<form role="form" id="writeForm" method="post" action="write-proc.do" onsubmit="validateForm();">
					<div class="card-body">
						<!-- form start -->
						<div class="form-group row">
							<label for="sel-bcode" class="col-sm-2 col-form-label">병의원</label>
							<div class="col-sm-2">
								<select class="form-control select2" id="sel-bcode" name="bCode">
									<option value="">병의원선택</option>
									<c:forEach items="${bcodeList }" var="bcode">
										<option value='<c:out value="${bcode.bCode }"></c:out>'><c:out value="${bcode.bName }"></c:out></option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label">제목</label>
							<div class="col-sm-10">
								<input type="text" name="title" class="form-control" id="title" placeholder="제목" required="required">
							</div>
						</div>
						<div class="form-group row">
							<label for="version" class="col-sm-2 col-form-label">버전</label>
							<div class="col-sm-10">
								<input type="text" name="version" class="form-control" id="version" placeholder="버전" required="required">
							</div>
						</div>
						
						<div class="form-group row">
							<label for="sel-status" class="col-sm-2 col-form-label">사용유무</label>
							<div class="col-sm-10">
								<div class="row">
									<div class="col-sm-1">
										<div class="icheck-primary d-inline">
											 <input  type="radio"  id="useY" value="Y" name="useYN" >
		                          			<label for="useY" >사용</label>
										</div>
									</div>
									<div class="col-sm-1">
										<div class="icheck-primary d-inline">
											<input  type="radio"  id="useN"  value="N" name="useYN" checked>
		                          			<label for="useN" >미사용</label>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="strContents" class="col-sm-2 col-form-label">내용</label>
							<div class="col-sm-10">
								<textarea name="strContents" id="strContents" rows="15" cols="163" class="form-control"></textarea>
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

//submit 하기전 유효성 검사 함수
function validateForm  (){
	
}

$(function() {

	//CK에디터 호출
	CKEDITOR.replace('strContents',{height:'380'});
	CKEDITOR.config.allowedContent = true;

});

</script>