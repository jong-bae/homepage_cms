<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>의료진 등록</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
						<li class="breadcrumb-item">의료진관리</li>
						<li class="breadcrumb-item active">의료진</li>
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
					<form role="form" id="quickForm" method="post" action="write-proc.do" enctype="multipart/form-data" onsubmit="return validation();">
						<div class="card-body">
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group row">
										<label for="name" class="col-sm-4 col-form-label text-primary">이름(한글)</label>
										<div class="col-sm-4">
											<input type="text" name="name" class="form-control" id="name">
										</div>
									</div>
									<div class="form-group row">
										<label for="name_e" class="col-sm-4 col-form-label">이름(영문)</label>
										<div class="col-sm-4">
											<input type="text" name="name_e" class="form-control" id="name_e">
										</div>
									</div>
									<div class="form-group row">
										<label for="name_j" class="col-sm-4 col-form-label">이름(일어)</label>
										<div class="col-sm-4">
											<input type="text" name="name_j" class="form-control" id="name_j">
										</div>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group row">
										<label for="name_ru" class="col-sm-4 col-form-label">이름(노어)</label>
										<div class="col-sm-4">
											<input type="text" name="name_ru" class="form-control" id="name_ru">
										</div>
									</div>
									<div class="form-group row">
										<label for="name_mn" class="col-sm-4 col-form-label">이름(몽골)</label>
										<div class="col-sm-4">
											<input type="text" name="name_mn" class="form-control" id="name_mn">
										</div>
									</div>
									<div class="form-group row">
										<label for="name_ae" class="col-sm-4 col-form-label">이름(아랍)</label>
										<div class="col-sm-4">
											<input type="text" name="name_ae" class="form-control" id="name_ae">
										</div>
									</div>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group row">
										<label for="idno" class="col-sm-4 col-form-label text-primary">사번(칭찬합시다)</label>
										<div class="col-sm-4">
											<input type="text" name="idno" class="form-control" id="idno">
										</div>
									</div>
									<div class="form-group row">
										<label for="useYN" class="col-sm-4 col-form-label text-primary">사용유무</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="useYN">
												<option value="Y" selected="selected">사용함</option>
												<option value="N">사용안함</option>
											</select>
										</div>
									</div>
									<div class="form-group row">
										<label for="scheduleYN" class="col-sm-4 col-form-label text-primary">진료일정표 유무</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="scheduleYN">
												<option value="Y" selected="selected">사용함</option>
												<option value="N">사용안함</option>
											</select>
										</div>
									</div>
									<div class="form-group row">
										<label for="globalYN" class="col-sm-4 col-form-label">글로벌 노출여부</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="globalYN">
												<option value="Y" >노출</option>
												<option value="N" selected="selected">미노출</option>
											</select>
										</div>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group row">
										<label for="newidno" class="col-sm-4 col-form-label text-primary">사번(진료일정표)</label>
										<div class="col-sm-4">
											<input type="text" name="newidno" class="form-control" id="newidno">
										</div>
									</div>
									<div class="form-group row">
										<label for="detailYN" class="col-sm-4 col-form-label text-primary">상세페이지 유무</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="detailYN">
												<option value="Y" selected="selected">사용함</option>
												<option value="N">사용안함</option>
											</select>
										</div>
									</div>
									
									<div class="form-group row">
										<label for="reserveYN" class="col-sm-4 col-form-label text-primary">진료예약 유무</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="reserveYN">
												<option value="Y" selected="selected">사용함</option>
												<option value="N" >사용안함</option>
											</select>
										</div>
									</div>
								</div>
							</div>
							<hr>
							
							<div class="form-group row">
								<label for="partSubName" class="col-sm-2 col-form-label">센터구분</label>
								<div class="col-sm-4">
									<input type="text" name="partSubName" class="form-control" id="partSubName">
								</div>
							</div>
							<div class="form-group row">
								<label for="partSubName2" class="col-sm-2 col-form-label">약/경력</label>
								<div class="col-sm-10">
									<textarea class="form-control" rows="20" name="partSubName2" id="partSubName2" style="font-size: 0.8rem"></textarea>
								</div>
							</div>
							<div class="form-group row">
								<label for="clinicExp" class="col-sm-2 col-form-label">진료내용</label>
								<div class="col-sm-10">
									<textarea class="form-control" rows="3" name="clinicExp" id="clinicExp" style="font-size: 0.8rem"></textarea>
								</div>
							</div>
							<div class="form-group row">
								<label for="partSubName2" class="col-sm-2 col-form-label">논문</label>
								<div class="col-sm-10">
									<textarea class="form-control" rows="10" name="thesis" id="thesis" style="font-size: 0.8rem"></textarea>
								</div>
							</div>
							<hr>
							
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group row">
										<label for="imgFile" class="col-sm-4 col-form-label text-primary">리스트프로필 이미지</label>
										<div class="col-sm-6">
											<div class="custom-file">
												<input type="file" name="imgFile_File" class="custom-file-input" id="imgFile" accept="image/*">
												<label class="custom-file-label" for="imgFile">리스트프로필 이미지 업로드</label>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group row">
										<label for="imgFileXL" class="col-sm-4 col-form-label text-primary">상세프로필 이미지</label>
										<div class="col-sm-6">
											<div class="custom-file">
												<input type="file" name="imgFileXL_File" class="custom-file-input" id="imgFileXL" accept="image/*">
												<label class="custom-file-label" for="imgFileXL">상세프로필 이미지 업로드</label>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group row">
										<label for="bgFile" class="col-sm-4 col-form-label">PC배경 이미지<br>(1920*938)</label>
										<div class="col-sm-6">
											<div class="custom-file">
												<input type="file" name="bgFile_File" class="custom-file-input" id="bgFile" accept="image/*">
												<label class="custom-file-label" for="bgFile">상단 배너이미지 업로드</label>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group row">
										<label for="mbgFile" class="col-sm-4 col-form-label">M배경 이미지<br>(750*1270)</label>
										<div class="col-sm-6">
											<div class="custom-file">
												<input type="file" name="mbgFile_File" class="custom-file-input" id="mbgFile" accept="image/*">
												<label class="custom-file-label" for="mbgFile">상단 배너이미지 업로드</label>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="card-footer">
							<div class="btn-group float-left">
								<button type="submit" class="btn btn-outline-secondary">등록</button>
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
		// custom input file type init();
		bsCustomFileInput.init();
	});
	
	function validation() {
		if(!formValidation_empty('name')) return false;
	}
</script>