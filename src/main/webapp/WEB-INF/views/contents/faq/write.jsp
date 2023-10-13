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
						<li class="breadcrumb-item">콘텐츠</li>
						<li class="breadcrumb-item">고객상담실</li>
						<li class="breadcrumb-item active">자주묻는질문 등록</li>
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
						<h3 class="card-title">FAQ 등록</h3>
					</div>
					<form role="form" id="writeForm" method="post" action="write-proc.do" onsubmit="validateForm();">
					<div class="card-body">
						<!-- form start -->
						<div class="form-group row">
							<label for="sel-boardid" class="col-sm-2 col-form-label">분류</label>
							<div class="col-sm-2">
								<select class="form-control select2" id="sel-boardid" name="category">
									<option value="">분류선택</option>
									<option value="예약안내">예약안내</option>
									<option value="진료안내">진료안내</option>
									<option value="투약안내">투약안내</option>
									<option value="주차안내">주차안내</option>
									<option value="편의시설">편의시설</option>
									<option value="서류발급">서류발급</option>
									<option value="입원생활">입원생활</option>
									<option value="수납관련">수납관련</option>
									<option value="보험관련">보험관련</option>
									<option value=" 치료"> 치료</option>
									<!-- 미사용 <option value="243">운동재활치료실</option> -->
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label for="sel-bcode" class="col-sm-2 col-form-label">병의원</label>
							<div class="col-sm-2">
								<select class="form-control select2" id="sel-bcode" name="branchOpen">
									<option value="">병의원선택</option>
									<c:forEach items="${bcodeList }" var="bcode">
										<option value='<c:out value="${bcode.bCode }"></c:out>'><c:out value="${bcode.bName }"></c:out></option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label for="strSubject" class="col-sm-2 col-form-label">제목</label>
							<div class="col-sm-10">
								<input type="text" name="subject" class="form-control" id="subject" placeholder="제목" required="required">
							</div>
						</div>
						<div class="form-group row">
							<label for="sel-status" class="col-sm-2 col-form-label">사용유무</label>
							<div class="col-sm-10">
								<div class="row">
									<div class="col-sm-1">
										<div class="icheck-primary d-inline">
											<input type="radio" id=useY name="useYn" value="Y">
											<label for="useY">노출</label>
										</div>
									</div>
									<div class="col-sm-1">
										<div class="icheck-primary d-inline">
											<input type="radio" id="useN" name="useYn" value="N" checked>
											<label for="useN">미노출</label>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="strContent" class="col-sm-2 col-form-label">내용</label>
							<div class="col-sm-10">
								<textarea name="contents" id="contents" rows="15" cols="163" class="form-control"></textarea>
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
	CKEDITOR.replace('contents',{height:'380'});
	CKEDITOR.config.allowedContent = true;

});

</script>