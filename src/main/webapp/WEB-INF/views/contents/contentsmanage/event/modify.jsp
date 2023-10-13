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
						<li class="breadcrumb-item active">이벤트 관리(수정)</li>
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
						<h3 class="card-title">이벤트 수정</h3>
					</div>
					<form role="form" id="modifyForm" method="post" action="modify-proc.do" enctype="multipart/form-data">
					<input type="hidden" name="docID" value='<c:out value="${data.docID }"></c:out>'>
					<input type="hidden" name="evtImgUrl" value='<c:out value="${data.evtImgUrl }"></c:out>'>
					<div class="card-body">
						<!-- form start -->
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label">제목</label>
							<div class="col-sm-10">
								<input type="text" name="evtSubject" class="form-control" id="evtSubject" placeholder="제목" required="required" value='<c:out value="${data.evtSubject }"></c:out>' >
							</div>
						</div>
						<div class="form-group row">
							<label for="evtState" class="col-sm-2 col-form-label">구분</label>
							<div class="col-sm-3">
								<select class="form-control" name="evtState" id="evtState">
									<option value="1" <c:if test='${data.evtState eq "1"}'> selected</c:if>>진행중</option>
									<option value="2" <c:if test='${data.evtState eq "2"}'> selected</c:if>>종료</option>
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
									<option value="Y" <c:if test='${data.evtUseYN eq "Y"}'> selected</c:if>>정상</option>
									<option value="N" <c:if test='${data.evtUseYN eq "N"}'> selected</c:if>>중지</option>
								</select>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="bCertTxt02" class="col-sm-2 col-form-label">썸네일 이미지(200x200)</label>
							<div class="col-sm-3">
								<c:if test='${data.imgPath ne "/Upload/BOSUpfiles/EVENT_THUMB/null"}'>
									<img src="${data.imgPath }" height="200">
								</c:if>
								<p>기존 파일 : ${data.evtImgUrl }</p>
								<div class="custom-file">
									<input type="file" name="evtImgUrl_file" class="form-control custom-file-input" id="evtImgUrl" placeholder="수정할파일">
									<label class="custom-file-label" for="evtImgUrl">썸네일변경</label>
								</div>
							</div>
						</div>
						<div class="form-group row">
							<label for="evtState" class="col-sm-2 col-form-label">링크유형</label>
							<div class="col-sm-3">
								<select class="form-control" name="evtLinkType" id="evtLinkType">
									<option value="0" <c:if test='${data.evtLinkType eq "0"}'> selected</c:if>>링크사용안함</option>
									<option value="1" <c:if test='${data.evtLinkType eq "1"}'> selected</c:if>>링크_동일페이지</option>  
									<option value="2" <c:if test='${data.evtLinkType eq "2"}'> selected</c:if>>링크_새창</option>
									<option value="3" <c:if test='${data.evtLinkType eq "3"}'> selected</c:if>>링크_팝업</option>
								</select>
							</div>
							<div class="col-sm-7" >
								<div style="line-height:40px;" >
									(링크사용안함 선택시 : [이벤트내용]을 활용함)
								</div>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label">링크URL</label>
							<div class="col-sm-10">
								<input type="text" name="evtLinkUrl" class="form-control" id="evtLinkUrl" value='<c:out value="${data.evtLinkUrl }"></c:out>' >
							</div>
						</div>
						
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label">링크팝업옵션</label>
							<div class="col-sm-10">
								<input type="text" name="evtPopOpt" class="form-control" id="evtPopOpt"  value='<c:out value="${data.evtPopOpt }"></c:out>' >
								(ex: left=10,top=10,width=630,height=420,scrollbars=no,resizeable=no,location=no,toolbar=no,status=no,menubar=no,status=no)
							</div>
						</div>
						<div class="form-group row">
							<label for="strContent" class="col-sm-2 col-form-label">이벤트내용</label>
							<div class="col-sm-10">
								<textarea name="evtDesc" id="evtDesc" rows="15" cols="163" class="form-control"><c:out value="${data.evtDesc }"></c:out></textarea>
								(링크사용안할 경우 [이벤트내용]활용)
							</div>
						</div>
						
					</div>
					<div class="card-footer">
						<div class="btn-group float-left">
							<button type="submit" class="btn btn-outline-info">수정</button>
							<button type="button" class="btn btn-outline-secondary" onClick="location.href='list.do'">취소</button>
						</div>
						<div class="btn-group float-right">
							<button type="button" class="btn btn-outline-danger" onClick="deleteFunc()">삭제</button>
						</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</section>
</div>

<script>

var deleteFunc = function (){
	
	var result = confirm("삭제하시겠습니까?");
	
	if(result){
		location.href = "remove.do?docID=" + "${data.docID}";
	}
	
}


$(function () {
	//$('#startDate').datepicker();
	bsCustomFileInput.init();
	
	$('#evtStartDT, #evtEndDT').daterangepicker({
		locale : { format : 'YYYY-MM-DD'},
		singleDatePicker : true
	});
	
	$('#evtStartDT').val("${data.evtStartDT}");
	$('#evtEndDT').val("${data.evtEndDT}");
	
	CKEDITOR.replace('evtDesc',{height:'380'});
	CKEDITOR.config.allowedContent = true;
});

</script>