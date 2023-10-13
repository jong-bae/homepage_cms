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
						<li class="breadcrumb-item">진료안내 관리</li>
						<li class="breadcrumb-item active">진료안내</li>
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
						<h3 class="card-title">회원약관 등록</h3>
					</div>
					<form role="form" id="writeForm" method="post" action="write-proc.do" onsubmit="validateForm();">
					<div class="card-body">
						<!-- form start -->
						<div class="form-group row">
							<h3><p class="text-danger">신규병의원만 등록하세요! 기존병의원은 리스트에서 수정해주세요!!!</p></h3>
						</div>
						<div class="form-group row">
							<label for="sel-bcode" class="col-sm-2 col-form-label">병의원</label>
							<div class="col-sm-3">
								<select class="form-control select2" id="sel-bcode" name="bcode">
									<option value="">병의원선택</option>
									<c:forEach items="${bcodeList }" var="bcode">
										<option value='<c:out value="${bcode.bCode }"></c:out>'><c:out value="${bcode.bName }"></c:out></option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label for=timetable class="col-sm-2 col-form-label">PC진료안내</label>
							<div class="col-sm-8">
								<textarea name="timetable" id="timetable" rows="10" cols="163" class="form-control"></textarea>
							</div>
						</div>
						<div class="form-group row">
							<label for="timetable_M" class="col-sm-2 col-form-label">Moblie진료안내</label>
							<div class="col-sm-8">
								<textarea name="timetable_M" id="timetable_M" rows="10" cols="163" class="form-control"></textarea>
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
	CKEDITOR.replace('timetable',{height:'450'});
	CKEDITOR.replace('timetable_M',{height:'450'});
});

</script>