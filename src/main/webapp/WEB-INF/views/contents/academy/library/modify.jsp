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
						<li class="breadcrumb-item active">영문 의학칼럼 및 기사</li>
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
						<h3 class="card-title">영문 의학칼럼 및 기사 수정</h3>
					</div>
					<form role="form" id="writeForm" method="post" action="modify-proc.do" onsubmit="validateForm();" enctype="multipart/form-data">
					<input type="hidden" name="idx" value='<c:out value="${data.idx }"></c:out>'>
					<div class="card-body">
						<!-- form start -->
						<div class="form-group row">
							<label for="sel-status" class="col-sm-2 col-form-label">카테고리 구분</label>
							<div class="col-sm-2">
								<select class="form-control select2" id="gubun" name="gubun">
									<option value="">선택</option>
									<option value="1">Spotlight</option>
									<option value="2">Clinical Resources</option>
								</select>
								<script>
									$('#gubun').val('${data.gubun}');
								</script>
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
							<label for="" class="col-sm-2 col-form-label">썸네일 이미지(312x167)</label>
							<div class="col-sm-3">
								<img src='<c:out value="${data.img_Origin }"></c:out>' class="mb-2 mx-auto d-block" width="70%">
								<div class="custom-file">
									<input type="file" name="img_file" class="form-control custom-file-input" id="img_file" placeholder="썸네일">
									<label class="custom-file-label" for="img_file">파일업로드</label>
								</div>
								<input type="hidden" name="img_Origin" value="<c:out value="${data.img_Origin }"></c:out>">
							</div>
						</div>
						<div class="form-group row">
							<label for="useY" class="col-sm-2 col-form-label">사용유무</label>
							<div class="col-sm-10">
								<div class="row">
									<div class="col-sm-1">
										<div class="icheck-primary d-inline">
											<input type="radio" id="useY" name="useYN" value="Y" ${data.useYN == 'Y' ? 'checked' : '' }>
											<label for="useY">사용</label>
										</div>
									</div>
									<div class="col-sm-2">
										<div class="icheck-primary d-inline">
											<input type="radio" id="useN" name="useYN" value="N" ${data.useYN == 'N' ? 'checked' : '' }>
											<label for="useN">미사용</label>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group row">
							<label for="mainY" class="col-sm-2 col-form-label">메인노출유무</label>
							<div class="col-sm-10">
								<div class="row">
									<div class="col-sm-1">
										<div class="icheck-primary d-inline">
											<input type="radio" id="mainY" name="mainYN" value="Y" ${data.mainYN == 'Y' ? 'checked' : '' }>
											<label for="mainY">노출</label>
										</div>
									</div>
									<div class="col-sm-2">
										<div class="icheck-primary d-inline">
											<input type="radio" id="mainN" name="mainYN" value="N" ${data.mainYN == 'N' ? 'checked' : '' }>
											<label for="mainN">미노출</label>
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
	bsCustomFileInput.init();
	
	$('#btn-delete').click(function() {
		if(!confirm("삭제하시겠습니까?")) return;
		$('#writeForm').attr('action', 'remove.do').attr('onsubmit', '').submit();
	});
});

</script>