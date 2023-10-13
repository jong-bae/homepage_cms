<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>병의원 수정</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
						<li class="breadcrumb-item">병의원관리</li>
						<li class="breadcrumb-item active">병의원</li>
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
						<h3 class="card-title">수정</h3>
					</div>
					<!-- form start -->
					<form role="form" id="quickForm" method="post" action="modify-proc.do" enctype="multipart/form-data">
						<input type="hidden" name="bCode" value='<c:out value="${data.bCode }"></c:out>'>
						<div class="card-body">
							<div class="form-group row">
								<label for="bName" class="col-sm-2 col-form-label">병의원명</label>
								<div class="col-sm-2">
									<input type="text" name="bName" class="form-control" id="bName" value='<c:out value="${data.bName }"></c:out>' 
										placeholder="병의원명" required="required">
								</div>
							</div>
							<div class="form-group row">
								<label for="bFolder" class="col-sm-2 col-form-label">구분폴더명</label>
								<div class="col-sm-3">
									<input type="text" name="bFolder" class="form-control" id="bFolder" value='<c:out value="${data.bFolder }"></c:out>'
										placeholder="폴더명">
								</div>
							</div>
							<div class="form-group row">
								<label for="bHospital" class="col-sm-2 col-form-label">병의원구분</label>
								<div class="col-sm-2">
									<select class="form-control select2" name="bHospital" id="bHospital">
										<option value="한방병원" ${data.bHospital == '한방병원' ? 'selected' : '' }>한방병원</option>
										<option value="한의원" ${data.bHospital == '한의원' ? 'selected' : '' }>한의원</option>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label for="bAddr" class="col-sm-2 col-form-label">주소</label>
								<div class="col-sm-10">
									<input type="text" name="bAddr" class="form-control" id="bAddr" value='<c:out value="${data.bAddr }"></c:out>'
										placeholder="주소" required="required">
								</div>
							</div>
							<div class="form-group row">
								<label for="bDomain" class="col-sm-2 col-form-label">홈페이지 URL</label>
								<div class="col-sm-5">
									<input type="text" name="bDomain" class="form-control" id="bDomain" value='<c:out value="${data.bDomain }"></c:out>'
										placeholder="http://www.jaseng.co.kr">
								</div>
							</div>
							<div class="form-group row">
								<label for="kakaopf" class="col-sm-2 col-form-label">카카오플친 URL</label>
								<div class="col-sm-5">
									<input type="text" name="kakaopf" class="form-control" id="kakaopf" value='<c:out value="${data.kakaopf }"></c:out>'
										placeholder="https://pf.kakao.com">
								</div>
							</div>
							<%--<div class="form-group row">
								<label for="facebook" class="col-sm-2 col-form-label">페이스북 URL</label>
								<div class="col-sm-5">
									<input type="text" name="facebook" class="form-control" id="facebook" value='<c:out value="${data.facebook }"></c:out>'
										placeholder="http://www.facebook.com">
								</div>
							</div>--%>
							<div class="form-group row">
								<label for="blog" class="col-sm-2 col-form-label">블로그 URL</label>
								<div class="col-sm-5">
									<input type="text" name="blog" class="form-control" id="blog" value='<c:out value="${data.blog }"></c:out>'
										placeholder="http://blog.naver.com">
								</div>
							</div>
							<div class="form-group row">
								<label for="cafe" class="col-sm-2 col-form-label">카페 URL</label>
								<div class="col-sm-5">
									<input type="text" name="cafe" class="form-control" id="cafe" value='<c:out value="${data.cafe }"></c:out>'
										placeholder="http://cafe.naver.com">
								</div>
							</div>
							<div class="form-group row">
								<label for="npost" class="col-sm-2 col-form-label">포스트 URL</label>
								<div class="col-sm-5">
									<input type="text" name="npost" class="form-control" id="npost" value='<c:out value="${data.npost }"></c:out>'
										placeholder="http://post.naver.com">
								</div>
							</div>
							<%--<div class="form-group row">
								<label for="audioclip" class="col-sm-2 col-form-label">오디오클립 URL</label>
								<div class="col-sm-5">
									<input type="text" name="audioclip" class="form-control" id="audioclip" value='<c:out value="${data.audioclip }"></c:out>'
										placeholder="https://audioclip.naver.com/channels/">
								</div>
							</div>--%>
							<div class="form-group row">
								<label for="youtube" class="col-sm-2 col-form-label">유튜브 URL</label>
								<div class="col-sm-5">
									<input type="text" name="youtube" class="form-control" id="youtube" value='<c:out value="${data.youtube }"></c:out>'
										placeholder="http://www.youtube.com">
								</div>
							</div>
							<div class="form-group row">
								<label for="instagram" class="col-sm-2 col-form-label">인스타그램 URL</label>
								<div class="col-sm-5">
									<input type="text" name="instagram" class="form-control" id="instagram" value='<c:out value="${data.instagram }"></c:out>'
										placeholder="https://www.instagram.com/">
								</div>
							</div>
							<div class="form-group row">
								<label for="bCiImg" class="col-sm-2 col-form-label">CI 이미지</label>
								<div class="col-sm-3">
									<img src='<c:out value="${data.bCiImg_origin }"></c:out>' class="mb-2 mx-auto d-block" width="50%">
									<div class="custom-file">
										<input type="file" name="bCiImg_file" class="form-control custom-file-input" id="bCiImg" placeholder="email">
										<label class="custom-file-label" for="bCiImg">CI 파일업로드</label>
									</div>
								</div>
								<div class="col-sm-3">
									<p><small><c:out value="${data.bCiImg_origin }"></c:out></small> </p>
									<input type="hidden" name="bCiImg_origin" value="<c:out value="${data.bCiImg_origin }"></c:out>">
								</div>
							</div>
							<div class="form-group row">
								<label for="bCertTxt01" class="col-sm-2 col-form-label">오른쪽 인증이미지</label>
								<div class="col-sm-10">
									<div class="row">
										<div class="col-sm-4">
											<input type="text" name="bCertTxt01" class="form-control" id="bCertTxt01" value='<c:out value="${data.bCertTxt01 }"></c:out>'>
										</div>
										<div class="col-sm-4">
											<div class="custom-file">
												<input type="file" name="bCertImg01_file" class="form-control custom-file-input" id="bCertImg01" placeholder="email">
												<label class="custom-file-label" for="bCertImg01">파일업로드</label>
											</div>
										</div>
										<div class="col-sm-3">
											<p><small><c:out value="${data.bCertImg01_origin }"></c:out></small> </p>
											<input type="hidden" name="bCertImg01_origin" value="<c:out value="${data.bCertImg01_origin }"></c:out>">
										</div>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<label for="bCertTxt02" class="col-sm-2 col-form-label">왼쪽 인증이미지</label>
								<div class="col-sm-10">
									<div class="row">
										<div class="col-sm-4">
											<input type="text" name="bCertTxt02" class="form-control" id="bCertTxt02" value='<c:out value="${data.bCertTxt02 }"></c:out>'>
										</div>
										<div class="col-sm-4">
											<div class="custom-file">
												<input type="file" name="bCertImg02_file" class="form-control custom-file-input" id="bCertImg02" placeholder="email">
												<label class="custom-file-label" for="bCertImg02">파일업로드</label>
											</div>
										</div>
										<div class="col-sm-3">
											<p><small><c:out value="${data.bCertImg02_origin }"></c:out></small> </p>
											<input type="hidden" name="bCertImg02_origin" value="<c:out value="${data.bCertImg02_origin }"></c:out>">
										</div>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<label for="bStatus" class="col-sm-2 col-form-label">상태</label>
								<div class="col-sm-2">
									<select name="bStatus" class="form-control select2" id="bStatus">
										<option value="Y" ${data.bStatus == 'Y' ? 'selected' : '' }>정상</option>
										<option value="N" ${data.bStatus == 'N' ? 'selected' : '' }>중지</option>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label for="bSearchAddr" class="col-sm-2 col-form-label">가까운병의원주소</label>
								<div class="col-sm-10">
									<textarea class="form-control" rows="3" name="bSearchAddr" id="bSearchAddr"><c:out value="${data.bSearchAddr }"></c:out></textarea>
								</div>
							</div>
							<div class="form-group row">
								<label for="bFooterTxt1" class="col-sm-2 col-form-label">푸터텍스트1</label>
								<div class="col-sm-10">
									<input type="text" name="bFooterTxt1" class="form-control" id="bFooterTxt1" value='<c:out value="${data.bFooterTxt1 }"></c:out>'>
								</div>
							</div>
							<div class="form-group row">
								<label for="bFooterTxt2" class="col-sm-2 col-form-label">푸터텍스트2</label>
								<div class="col-sm-10">
									<textarea class="form-control" rows="2" name="bFooterTxt2" id="bFooterTxt2"><c:out value="${data.bFooterTxt2 }"></c:out> </textarea>
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
	$(function() {
		// custom input file type init();
		bsCustomFileInput.init();
	});
</script>