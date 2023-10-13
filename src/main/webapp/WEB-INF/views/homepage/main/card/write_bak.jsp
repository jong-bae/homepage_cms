<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>메인카드콘텐츠 등록</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
						<li class="breadcrumb-item">메인관리</li>
						<li class="breadcrumb-item active">메인카드콘텐츠</li>
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
						<div class="card-tools">
			              <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i></button>
			              <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-remove"></i></button>
			            </div>
					</div>
					<!-- form start -->
						<div class="card-body">
					<form role="form" id="quickForm" method="post" action="write-proc.do" enctype="multipart/form-data">
							<div class="row">
								<div class="col-sm-12">
									<h4>[주제등록]</h4>
								</div>
							</div>
							<div class="form-group row">
								<label for="title" class="col-sm-2 col-form-label">타이틀</label>
								<div class="col-sm-5">
									<input type="text" name="title" class="form-control" id="title" placeholder="7자 내외로 입력하세요" >
								</div>
							</div>
							<div class="form-group row">
								<label for="startDate" class="col-sm-2 col-form-label">노출 기간</label>
								<div class="col-sm-2">
									<input type="text" name="startDate" class="form-control" id="startDate" placeholder="시작날짜" required="required">
								</div>
								<div class="col-sm-2">
									<input type="text" name="endDate" class="form-control" id="endDate" placeholder="종료날짜" >
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-12">
									<h4>[콘텐츠등록]</h4>
								</div>
							</div>
							<div class="form-group row">
								<label for="keyword1" class="col-sm-2 col-form-label">키워드 노출순서</label>
								<div class="col-sm-6">
									<div class="row">
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="radio" class="radio-keyOrder" id="radio-keyOrder-first" name="keywordOrder" value='1'>
												<label for="radio-keyOrder-first">첫번째</label>
											</div>
										</div>
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="radio" class="radio-keyOrder" id="radio-keyOrder-last" name="keywordOrder" value='2'>
												<label for="radio-keyOrder-last">마지막</label>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="callout callout-warning">
								<div class="form-group row">
									<label for="keyword1" class="col-sm-2 col-form-label">키워드1</label>
									<div class="col-sm-6">
										<input type="text" name="keyword1" class="form-control" id="keyword1" placeholder="5자 내외로 입력하세요">
									</div>
								</div>
								<div class="form-group row">
									<label for="keywordLink1" class="col-sm-2 col-form-label">링크1</label>
									<div class="col-sm-6">
										<input type="text" name="keywordLink1" class="form-control" id="keywordLink1" placeholder="">
									</div>
									<div class="col-sm-2">
										<select class="form-control select2" name="keywordLink1_opt">
											<option selected="selected">_self</option>
											<option>_blank</option>
										</select>
									</div>
								</div>
							</div>
							<div class="callout callout-warning">
								<div class="form-group row">
									<label for="keyword2" class="col-sm-2 col-form-label">키워드2</label>
									<div class="col-sm-6">
										<input type="text" name="keyword2" class="form-control" id="keyword2" placeholder="5자 내외로 입력하세요">
									</div>
								</div>
								<div class="form-group row">
									<label for="keywordLink2" class="col-sm-2 col-form-label">링크2</label>
									<div class="col-sm-6">
										<input type="text" name="keywordLink2" class="form-control" id="keywordLink2" placeholder="">
									</div>
									<div class="col-sm-2">
										<select class="form-control select2" name="keywordLink2_opt">
											<option selected="selected">_self</option>
											<option>_blank</option>
										</select>
									</div>
								</div>
							</div>
							<div class="callout callout-warning">
								<div class="form-group row">
									<label for="keyword3" class="col-sm-2 col-form-label">키워드3</label>
									<div class="col-sm-6">
										<input type="text" name="keyword3" class="form-control" id="keyword3" placeholder="5자 내외로 입력하세요">
									</div>
								</div>
								<div class="form-group row">
									<label for="keywordLink3" class="col-sm-2 col-form-label">링크3</label>
									<div class="col-sm-6">
										<input type="text" name="keywordLink3" class="form-control" id="keywordLink3" placeholder="">
									</div>
									<div class="col-sm-2">
										<select class="form-control select2" name="keywordLink3_opt">
											<option selected="selected">_self</option>
											<option>_blank</option>
										</select>
									</div>
								</div>
							</div>
							
							<hr>
							
							<div class="callout callout-success">
								<div class="form-group row">
									<label for="contentTitle1" class="col-sm-2 col-form-label">sub타이틀</label>
									<div class="col-sm-8">
										<input type="text" name="contentTitle1" class="form-control" id="contentTitle1" placeholder="13자 내외로 입력하세요">
									</div>
								</div>
								<div class="form-group row">
									<label for="contentLink1" class="col-sm-2 col-form-label">URL</label>
									<div class="col-sm-6">
										<input type="text" name="contentLink1" class="form-control" id="contentLink1" placeholder="url 주소">
									</div>
									<div class="col-sm-2">
										<select class="form-control select2" name="contentLink1_opt">
											<option selected="selected">_self</option>
											<option>_blank</option>
										</select>
									</div>
								</div>
								<div class="form-group row">
									<label for="contentImg1" class="col-sm-2 col-form-label">이미지</label>
									<div class="col-sm-3">
										<div class="custom-file">
											<input type="file" name="contentImg1_file" class="custom-file-input" id="contentImg1">
											<label class="custom-file-label" for="contentImg1">카드영역 이미지 업로드</label>
										</div>
									</div>
								</div>
								<div class="form-group row">
									<label for="contentOrder1" class="col-sm-2 col-form-label">노출 순서</label>
									<div class="col-sm-1">
										<input type="text" name="contentOrder1" class="form-control" id="contentOrder1" placeholder="순서">
									</div>
								</div>
							</div>
							<div class="callout callout-success">
								<div class="form-group row">
									<label for="contentTitle2" class="col-sm-2 col-form-label">sub타이틀</label>
									<div class="col-sm-8">
										<input type="text" name="contentTitle2" class="form-control" id="contentTitle2" placeholder="13자 내외로 입력하세요">
									</div>
								</div>
								<div class="form-group row">
									<label for="contentLink2" class="col-sm-2 col-form-label">URL</label>
									<div class="col-sm-6">
										<input type="text" name="contentLink2" class="form-control" id="contentLink2" placeholder="url 주소">
									</div>
									<div class="col-sm-2">
										<select class="form-control select2" name="contentLink2_opt">
											<option selected="selected">_self</option>
											<option>_blank</option>
										</select>
									</div>
								</div>
								<div class="form-group row">
									<label for="contentImg2" class="col-sm-2 col-form-label">이미지</label>
									<div class="col-sm-3">
										<div class="custom-file">
											<input type="file" name="contentImg2_file" class="custom-file-input" id="contentImg2">
											<label class="custom-file-label" for="contentImg2">카드영역 이미지 업로드</label>
										</div>
									</div>
								</div>
								<div class="form-group row">
									<label for="contentOrder2" class="col-sm-2 col-form-label">노출 순서</label>
									<div class="col-sm-1">
										<input type="text" name="contentOrder2" class="form-control" id="contentOrder2" placeholder="순서">
									</div>
								</div>
							</div>
							<div class="callout callout-success">
								<div class="form-group row">
									<label for="contentTitle3" class="col-sm-2 col-form-label">sub타이틀</label>
									<div class="col-sm-8">
										<input type="text" name="contentTitle3" class="form-control" id="contentTitle3" placeholder="13자 내외로 입력하세요">
									</div>
								</div>
								<div class="form-group row">
									<label for="contentLink3" class="col-sm-2 col-form-label">URL</label>
									<div class="col-sm-6">
										<input type="text" name="contentLink3" class="form-control" id="contentLink3" placeholder="url 주소">
									</div>
									<div class="col-sm-2">
										<select class="form-control select2" name="contentLink3_opt">
											<option selected="selected">_self</option>
											<option>_blank</option>
										</select>
									</div>
								</div>
								<div class="form-group row">
									<label for="contentImg3" class="col-sm-2 col-form-label">이미지</label>
									<div class="col-sm-3">
										<div class="custom-file">
											<input type="file" name="contentImg3_file" class="custom-file-input" id="contentImg3">
											<label class="custom-file-label" for="contentImg3">카드영역 이미지 업로드</label>
										</div>
									</div>
								</div>
								<div class="form-group row">
									<label for="contentOrder3" class="col-sm-2 col-form-label">노출 순서</label>
									<div class="col-sm-1">
										<input type="text" name="contentOrder3" class="form-control" id="contentOrder3" placeholder="순서">
									</div>
								</div>
							</div>
							
							<!-- <div class="form-group row">
								<label for="sel-status" class="col-sm-2 col-form-label">노출여부</label>
								<div class="col-sm-10">
									<div class="row">
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="radio" id="useY" name="useYN" value="Y">
												<label for="useY">노출</label>
											</div>
										</div>
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="radio" id="useN" name="useYN" value="N">
												<label for="useN">미노출</label>
											</div>
										</div>
									</div>
								</div>
							</div> -->
					</form>
						</div>
						<div class="card-footer">
							<div class="btn-group float-left">
								<button type="submit" class="btn btn-outline-secondary">등록</button>
								<button type="button" class="btn btn-outline-secondary"	onClick="location.href='list.do'">취소</button>
							</div>
						</div>
				</div>
			</div>
		</div>
	</section>
</div>
<script>
	//CKEDITOR.replace('contents');
	
	$(function () {
		$('#startDate, #endDate').daterangepicker({
			locale : { format : 'YYYY-MM-DD'},
			singleDatePicker : true
		});
		
		// 종료날짜는 선택 안할 수도 있으므로 공백 초기화
		$('#endDate').val("");
		
		// 전체 체크박스 선택/취소
		$('#chk-bCode').change(function() {
			$('.chk-bCode-list').prop('checked', $(this).prop('checked'));
		});
		
		// custom input file type init();
		bsCustomFileInput.init();
	});
</script>