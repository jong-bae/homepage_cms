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
					<form role="form" id="quickForm" method="post" action="modify-proc.do" enctype="multipart/form-data" onsubmit="return validation();">
						<input type="hidden" name="didx" id="didx" value="<c:out value="${data.didx }"></c:out>">
						<div class="card-body">
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group row">
										<label for="name" class="col-sm-4 col-form-label text-primary">이름(한글)</label>
										<div class="col-sm-4">
											<input type="text" name="name" class="form-control" id="name" value="<c:out value="${data.name }"></c:out>">
										</div>
									</div>
									<div class="form-group row">
										<label for="name_e" class="col-sm-4 col-form-label">이름(영문)</label>
										<div class="col-sm-4">
											<input type="text" name="name_e" class="form-control" id="name_e" value="<c:out value="${data.name_e }"></c:out>">
										</div>
									</div>
									<div class="form-group row">
										<label for="name_j" class="col-sm-4 col-form-label">이름(일어)</label>
										<div class="col-sm-4">
											<input type="text" name="name_j" class="form-control" id="name_j" value="<c:out value="${data.name_j }"></c:out>">
										</div>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group row">
										<label for="name_ru" class="col-sm-4 col-form-label">이름(노어)</label>
										<div class="col-sm-4">
											<input type="text" name="name_ru" class="form-control" id="name_ru" value="<c:out value="${data.name_ru }"></c:out>">
										</div>
									</div>
									<div class="form-group row">
										<label for="name_mn" class="col-sm-4 col-form-label">이름(몽골)</label>
										<div class="col-sm-4">
											<input type="text" name="name_mn" class="form-control" id="name_mn" value="<c:out value="${data.name_mn }"></c:out>">
										</div>
									</div>
									<div class="form-group row">
										<label for="name_ae" class="col-sm-4 col-form-label">이름(아랍)</label>
										<div class="col-sm-4">
											<input type="text" name="name_ae" class="form-control" id="name_ae" value="<c:out value="${data.name_ae }"></c:out>">
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
											<input type="text" name="idno" class="form-control" id="idno" value="<c:out value="${data.idno }"></c:out>">
										</div>
									</div>
									<div class="form-group row">
										<label for="useYN" class="col-sm-4 col-form-label text-primary">사용유무</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="useYN" id="useYN">
												<option value="Y" selected="selected">사용함</option>
												<option value="N">사용안함</option>
											</select>
										</div>
									</div>
									<div class="form-group row">
										<label for="scheduleYN" class="col-sm-4 col-form-label text-primary">진료일정표 유무</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="scheduleYN" id="scheduleYN">
												<option value="Y" selected="selected">사용함</option>
												<option value="N">사용안함</option>
											</select>
										</div>
									</div>
									<div class="form-group row">
										<label for="globalYN" class="col-sm-4 col-form-label">글로벌 노출여부</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="globalYN" id="globalYN">
												<option value="Y" selected="selected">노출</option>
												<option value="N">미노출</option>
											</select>
										</div>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group row">
										<label for="newidno" class="col-sm-4 col-form-label text-primary">사번(진료일정표)</label>
										<div class="col-sm-4">
											<input type="text" name="newidno" class="form-control" id="newidno" value="<c:out value="${data.newidno }"></c:out>">
										</div>
									</div>
									<div class="form-group row">
										<label for="detailYN" class="col-sm-4 col-form-label text-primary">상세페이지 유무</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="detailYN" id="detailYN">
												<option value="Y" selected="selected">사용함</option>
												<option value="N">사용안함</option>
											</select>
										</div>
									</div>
									<div class="form-group row">
										<label for="reserveYN" class="col-sm-4 col-form-label text-primary">진료예약 유무</label>
										<div class="col-sm-4">
											<select class="form-control select2" name="reserveYN" id="reserveYN">
												<option value="Y" selected="selected">사용함</option>
												<option value="N">사용안함</option>
											</select>
										</div>
									</div>

								</div>
							</div>
							<script>
								$('#useYN').val('${data.useYN }');
								$('#scheduleYN').val('${data.scheduleYN }');
								$('#detailYN').val('${data.detailYN }');
								$('#globalYN').val('${data.globalYN }');
								$('#reserveYN').val('${data.reserveYN }');
							</script>
							<hr>
							
							<div class="form-group row">
								<label for="partSubName" class="col-sm-2 col-form-label">센터구분</label>
								<div class="col-sm-4">
									<input type="text" name="partSubName" class="form-control" id="partSubName" value="<c:out value="${data.partSubName }"></c:out>">
								</div>
							</div>
							<div class="form-group row">
								<label for="partSubName2" class="col-sm-2 col-form-label">약/경력</label>
								<div class="col-sm-10">
									<textarea class="form-control" rows="20" name="partSubName2" id="partSubName2" style="font-size: 0.8rem"><c:out value="${data.partSubName2 }"></c:out></textarea>
								</div>
							</div>
							<div class="form-group row">
								<label for="clinicExp" class="col-sm-2 col-form-label">진료내용</label>
								<div class="col-sm-10">
									<textarea class="form-control" rows="3" name="clinicExp" id="clinicExp" style="font-size: 0.8rem"><c:out value="${data.clinicExp }"></c:out></textarea>
								</div>
							</div>
							<div class="form-group row">
								<label for="partSubName2" class="col-sm-2 col-form-label">논문</label>
								<div class="col-sm-10">
									<textarea class="form-control" rows="10" name="thesis" id="thesis" style="font-size: 0.8rem"><c:out value="${data.thesis }"></c:out></textarea>
								</div>
							</div>
							<hr>
							
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group row">
										<label for="imgFile" class="col-sm-4 col-form-label text-primary">리스트프로필 이미지</label>
										<div class="col-sm-6">
											<img src='<c:out value="${data.imgFile_origin }"></c:out>' class="mb-2 mx-auto d-block" width="85%">
											<div class="custom-file">
												<input type="file" name="imgFile_File" class="custom-file-input" id="imgFile" accept="image/*">
												<label class="custom-file-label" for="imgFile">리스트프로필 이미지 업로드</label>
											</div>
											<input type="hidden" name="imgFile_origin" value="<c:out value="${data.imgFile_origin }"></c:out>">
										</div>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group row">
										<label for="imgFileXL" class="col-sm-4 col-form-label text-primary">상세프로필 이미지</label>
										<div class="col-sm-6">
											<img src='<c:out value="${data.imgFileXL_origin }"></c:out>' class="mb-2" width="100%">
											<div class="custom-file">
												<input type="file" name="imgFileXL_File" class="custom-file-input" id="imgFileXL" accept="image/*">
												<label class="custom-file-label" for="imgFileXL">상세프로필 이미지 업로드</label>
											</div>
											<input type="hidden" name="imgFileXL_origin" value="<c:out value="${data.imgFileXL_origin }"></c:out>">
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group row">
										<label for="bgFile" class="col-sm-4 col-form-label">PC배경 이미지<br>(1920*938)</label>
										<div class="col-sm-6">
											<img src='<c:out value="${data.bgFile_origin }"></c:out>' class="mb-2" width="100%">
											<div class="custom-file">
												<input type="file" name="bgFile_File" class="custom-file-input" id="bgFile" accept="image/*">
												<label class="custom-file-label" for="bgFile">상단 배너이미지 업로드</label>
											</div>
											<input type="hidden" name="bgFile_origin" value="<c:out value="${data.bgFile_origin }"></c:out>">
										</div>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group row">
										<label for="mbgFile" class="col-sm-4 col-form-label">M배경 이미지<br>(750*1270)</label>
										<div class="col-sm-6">
											<img src='<c:out value="${data.mbgFile_origin }"></c:out>' class="mb-2 mx-auto d-block" width="50%">
											<div class="custom-file">
												<input type="file" name="mbgFile_File" class="custom-file-input" id="mbgFile" accept="image/*">
												<label class="custom-file-label" for="mbgFile">상단 배너이미지 업로드</label>
											</div>
											<input type="hidden" name="mbgFile_origin" value="<c:out value="${data.mbgFile_origin }"></c:out>">
										</div>
									</div>
								</div>
							</div>
							<hr>
							
							<div class="form-group row">
								<label for="startDate" class="col-sm-2 col-form-label">TA이미지교체</label>
								<div class="col-sm-2">
									<button type="button" class="btn btn-outline-danger" id="btn-taSwap">TA원장 이미지전환</button>
								</div>
								<div class="col-sm-2">
									<button type="button" class="btn btn-outline-primary" id="btn-resiSwap">수련의 이미지전환</button>
								</div>
							</div>
						</div>
						<div class="card-footer">
							<div class="btn-group float-left">
								<button type="submit" class="btn btn-outline-info">수정</button>
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
		
		// TA 원장으로 이미지 SWAP
		$('#btn-taSwap').click(function() {
			var param = $('#didx').val();
			$.jbAjaxPostJson('${pageContext.request.contextPath}/doctor/manage/taSwapAjax.do', { didx : param },
					function(result) {
						if(result.result == true) {
							toastr.success('TA원장 이미지로 변경하였습니다.<br>새로고침 해주세요.');
						} else {
							toastr.warning('올바르게 변경되지 않았습니다.<br>관리자에게 연락해주세요.');
						}
					},
					function(result) {
						toastr.error('오류가 발생하였습니다.<br>관리자에게 연락해주세요.');
					}
			);
		});
		
		// 수련의로 이미지 SWAP
		$('#btn-resiSwap').click(function() {
			var param = $('#didx').val();
			$.jbAjaxPostJson('${pageContext.request.contextPath}/doctor/manage/resiSwapAjax.do', { didx : param },
					function(result) {
						if(result.result == true) {
							toastr.success('수련의 이미지로 변경하였습니다.<br>새로고침 해주세요.');
						} else {
							toastr.warning('올바르게 변경되지 않았습니다.<br>관리자에게 연락해주세요.');
						}
					},
					function(result) {
						toastr.error('오류가 발생하였습니다.<br>관리자에게 연락해주세요.'); 
					}
			);
		});
	});
	
	function validation() {
		if(!formValidation_empty('name')) return false;
	}
</script>