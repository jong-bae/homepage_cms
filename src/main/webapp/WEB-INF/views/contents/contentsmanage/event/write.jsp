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
						<li class="breadcrumb-item active">이벤트 관리(등록)</li>
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
						<h3 class="card-title">이벤트 등록</h3>
					</div>
					<form role="form" id="writeForm" method="post" action="write-proc.do" enctype="multipart/form-data">
					<!-- <input type="hidden" name="branchOpen" value=''> -->
					<div class="card-body">
						<!-- form start -->
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label">제목</label>
							<div class="col-sm-10">
								<input type="text" name="evtSubject" class="form-control" id="evtSubject" placeholder="제목" required="required">
							</div>
						</div>
						<div class="form-group row">
							<label for="evtState" class="col-sm-2 col-form-label">구분</label>
							<div class="col-sm-3">
								<select class="form-control" name="evtState" id="evtState">
									<option value="1">진행중</option>
									<option value="2">종료</option>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label for="evtDT" class="col-sm-2 col-form-label">기간</label>
							<div class="col-sm-5">
					 	  		<div class="input-group">
		                    		<div class="input-group-prepend">
		                      			<span class="input-group-text">
		                        			<i class="far fa-calendar-alt"></i>
		                      			</span>
		                    		</div>
		                    		<input type="text" class="form-control" name="evtStartDT" id="evtStartDT" placeholder="시작날짜" required="required" style="text-align:center;">
           	                		<div class="input-group-prepend">
		                      			<span class="input-group-text">~</span>
		                    		</div>
	                    			<input type="text" class="form-control" name="evtEndDT" id="evtEndDT" placeholder="종료날짜" required="required" style="text-align:center;">
			                  	</div>
							</div>
						</div>
						<div class="form-group row">
							<label for="evtState" class="col-sm-2 col-form-label">상태</label>
							<div class="col-sm-3">
								<select class="form-control" name="evtUseYN" id="evtUseYN">
									<option value="Y">정상</option>
									<option value="N">중지</option>
								</select>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="bCertTxt02" class="col-sm-2 col-form-label">썸네일 이미지(200x200)</label>
							<div class="col-sm-3">
								<div class="custom-file">
									<input type="file" name="evtImgUrl_file" class="form-control custom-file-input" id="evtImgUrl" placeholder="썸네일">
									<label class="custom-file-label" for="evtImgUrl">파일업로드</label>
								</div>
							</div>
						</div>
						<div class="form-group row">
							<label for="evtState" class="col-sm-2 col-form-label">링크유형</label>
							<div class="col-sm-3">
								<select class="form-control" name="evtLinkType" id="evtLinkType">
									<option value="0">링크사용안함</option>
									<option value="1">링크_동일페이지</option>
									<option value="2">링크_새창</option>
									<option value="3">링크_팝업</option>
								</select>
							</div>
							<div class="col-sm-7" >
								<div style="line-height:40px;" >
									(링크사용안함 선택시 : [이벤트내용]을 활용함.)
								</div>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label">링크URL</label>
							<div class="col-sm-10">
								<input type="text" name="evtLinkUrl" class="form-control" id="evtLinkUrl" >
							</div>
						</div>
						
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label">링크팝업옵션</label>
							<div class="col-sm-10">
								<input type="text" name="evtPopOpt" class="form-control" id="evtPopOpt" >
								(ex: left=10,top=10,width=630,height=420,scrollbars=no,resizeable=no,location=no,toolbar=no,status=no,menubar=no,status=no)
							</div>
						</div>
						<div class="form-group row">
							<label for="strContent" class="col-sm-2 col-form-label">이벤트내용</label>
							<div class="col-sm-10">
								<textarea name="evtDesc" id="evtDesc" rows="15" cols="163" class="form-control"></textarea>
								(링크사용안할 경우 [이벤트내용]활용.)
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
	//$('#startDate').datepicker();
	bsCustomFileInput.init();
	
	$('#evtStartDT, #evtEndDT').daterangepicker({
		locale : { format : 'YYYY-MM-DD'},
		singleDatePicker : true
	});
	
	$('#evtStartDT').val("");
	$('#evtEndDT').val("");
	
	CKEDITOR.replace('evtDesc',{height:'380'});
	CKEDITOR.config.allowedContent = true;
});

</script>