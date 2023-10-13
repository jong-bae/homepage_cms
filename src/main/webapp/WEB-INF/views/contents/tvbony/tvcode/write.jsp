<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>관심질환분야 관리</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
						<li class="breadcrumb-item"> TV관리</li>
						<li class="breadcrumb-item active">관심질환분야</li>
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
					<form role="form" id="quickForm" method="post" action="write-proc.do">
						<div class="card-body">
							<div class="form-group row">
								<label for="sel-bcode" class="col-sm-2 col-form-label">구분 선택</label>
								<div class="col-sm-10">
									<div class="row">
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="radio" class="radio-bCode-list" id="radio-bCode-01" name="gubun" value="치료영상">
												<label for="radio-bCode-01">치료영상</label>
											</div>
										</div>
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="radio" class="radio-bCode-list" id="radio-bCode-02" name="gubun" value=" 치료법">
												<label for="radio-bCode-02"> 치료법</label>
											</div>
										</div>
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="radio" class="radio-bCode-list" id="radio-bCode-03" name="gubun" value="닥터Q&A">
												<label for="radio-bCode-03">닥터Q&A</label>
											</div>
										</div>
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="radio" class="radio-bCode-list" id="radio-bCode-04" name="gubun" value=" 척추체조">
												<label for="radio-bCode-04"> 척추체조</label>
											</div>
										</div>
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="radio" class="radio-bCode-list" id="radio-bCode-05" name="gubun" value=" 건강정보">
												<label for="radio-bCode-05"> 건강정보</label>
											</div>
										</div>
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="radio" class="radio-bCode-list" id="radio-bCode-06" name="gubun" value=" 소식">
												<label for="radio-bCode-06"> 소식</label>
											</div>
										</div>
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="radio" class="radio-bCode-list" id="radio-bCode-07" name="gubun" value="관심질환">
												<label for="radio-bCode-07">관심질환</label>
											</div>
										</div>
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="radio" class="radio-bCode-list" id="radio-bCode-08" name="gubun" value="관심분야">
												<label for="radio-bCode-08">관심분야</label>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<label for="title" class="col-sm-2 col-form-label">타이틀</label>
								<div class="col-sm-4">
									<input type="text" name="title" class="form-control" id="title" placeholder="" >
								</div>
								<div class="col-sm-2">
									<button type="button" class="btn btn-warning" id="btn-Check">중복체크</button>
								</div>
							</div>
							<div class="form-group row">
							<label for="sel-status" class="col-sm-2 col-form-label">사용유무</label>
							<div class="col-sm-10">
								<div class="row">
									<div class="col-sm-1">
										<div class="icheck-primary d-inline">
											<input type="radio" id="useY" name="real_yn" value="Y">
											<label for="useY">노출</label>
										</div>
									</div>
									<div class="col-sm-2">
										<div class="icheck-primary d-inline">
											<input type="radio" id="useN" name="real_yn" value="N" checked>
											<label for="useN">미노출</label>
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
		$('#btn-Check').click(function() {
			let GUBUN = $('input:radio[name="gubun"]:checked').val();
			let TITLE = $('#title').val();
			
			$.jbAjaxPostJson('${pageContext.request.contextPath}/contents/tvbony/tvcode/dataCheck.do', { gubun : GUBUN, title : TITLE },
					function(result) {
						if(result.result) {
							alert("등록 가능합니다.");
						} else {
							alert(result.message);
						}
					}, function(err) {
						console.log(err);
				});
		});
	});
</script>