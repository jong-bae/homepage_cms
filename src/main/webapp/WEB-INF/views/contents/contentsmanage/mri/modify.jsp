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
						<li class="breadcrumb-item active">MRI 치료수기 관리 (수정)</li>
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
						<h3 class="card-title">MRI 치료수기 수정</h3>
					</div>
					<form role="form" id="modifyForm" method="post" action="modify-proc.do" enctype="multipart/form-data">
					<input type="hidden" name="idx" value='<c:out value="${data.idx }"></c:out>'>
					<input type="hidden" name="strFirstImg" value='<c:out value="${data.strFirstImg }"></c:out>'>
					<div class="card-body">
						<!-- form start -->
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label">제목</label>
							<div class="col-sm-10">
								<input type="text" name="strSubject" class="form-control" id="strSubject" placeholder="제목" required="required" value='<c:out value="${data.strSubject }"></c:out>' >
							</div>
						</div>
						
						<div class="form-group row">
							<label for="" class="col-sm-2 col-form-label">촬영일</label>
							<div class="col-sm-5">
					 	  		<div class="input-group">
		                    		<div class="input-group-prepend">
		                      			<span class="input-group-text">
		                        			<i class="far fa-calendar-alt"></i>
		                      			</span>
		                    		</div>
		                    		<input type="text" class="form-control" name="care_sdate" id="care_sdate" placeholder="시작날짜" required="required" style="text-align:center;">
           	                		<div class="input-group-prepend">
		                      			<span class="input-group-text">~</span>
		                    		</div>
	                    			<input type="text" class="form-control" name="care_edate" id="care_edate" placeholder="종료날짜" required="required" style="text-align:center;">
			                  	</div>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="sel-bcode" class="col-sm-2 col-form-label">병의원</label>
							<div class="col-sm-2">
								<select class="form-control select2" id="sel-bcode" name="cdBCODE">
									<option value="">병의원선택</option>
									<c:forEach items="${bcodeList }" var="bcode">
										<c:if test="${bcode.bCode != '10000'}">
											<option value='<c:out value="${bcode.bCode }"></c:out>'><c:out value="${bcode.bName }"></c:out></option>
										</c:if>
									</c:forEach>
								</select>
								<script>
										$('#sel-bcode').val('${data.cdBCODE}');
								</script>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label">질환명</label>
							<div class="col-sm-10">
								<input type="text" name="disease" class="form-control" id="disease"  required="required" value='<c:out value="${data.disease }"></c:out>' >
							</div>
						</div>
						
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label">담당의</label>
							<div class="col-sm-10">
								<input type="text" name="mriDoctorName" class="form-control" id="mriDoctorName"  required="required" value='<c:out value="${data.mriDoctorName }"></c:out>' >
							</div>
						</div>
						
						<!--   홈페이지  MRI에 노출되는 썸내일 이미지 -->
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label">업로드주소</label>
							<div class="col-sm-10">
								<input type="text" name="strMImage" class="form-control" id="strMImage" placeholder="홈페이지 MRI 이미지"   required="required" value='<c:out value="${data.strMImage }"></c:out>' >
							</div>
						</div>
						
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label"><strong style="color:red;">MRI 내용 입력시 필수내용</strong></label>
							<div class="col-sm-5">
								<strong>* 치료결과 입력 소스코드</strong><br/>
								&#60;div class="<strong style="color:red;">txt_rs</strong>"&#62;<br/>
								&#60;p&#62;&#60;strong&#62;[치료결과]&#60;/strong&#62;&#60;/p&#62;<br/>				
								&#60;p&#62;내용을입력해주세요&#60;/p&#62;<br/>				
								&#60;/div&#62;
								<br/><br/>
								<strong>* 담당의료진소견 입력 소스코드</strong><br/>
								&#60;div class="<strong style="color:red;">txt_dr</strong>"&#62;<br/>
								&#60;p&#62;&#60;strong&#62;[담당 의료진 소견]&#60;/strong&#62;&#60;/p&#62;<br/>				
								&#60;p&#62;내용을입력해주세요&#60;/p&#62;<br/>				
								&#60;/div&#62;<br/><br/>
							</div>
							<div class="col-sm-5">
								
							</div>
						</div>

						<div class="form-group row">
							<label for="strContent" class="col-sm-2 col-form-label">내용</label>
							<div class="col-sm-10">
								<textarea name="strContent" id="strContent" rows="15" cols="163" class="form-control"><c:out value="${data.strContent }"></c:out></textarea>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="bCertTxt02" class="col-sm-2 col-form-label">파일첨부</label>
							<div class="col-sm-3">
								<c:if test='${data.strFirstImg ne "/Upload/16/null"}'>
									<img src="/Upload/16/${data.strFirstImg }" height="200">
								</c:if>
								<p>기존 파일 : ${data.strFirstImg }</p>
								<div class="custom-file">
									<input type="file" name="strFirstImg_File" class="form-control custom-file-input" id="strFirstImg" placeholder="수정할파일">
									<label class="custom-file-label" for="strFirstImg">썸네일변경</label>
								</div>
							</div>
							<label class="col-sm-3 col-form-label">(홈페이지 의료진소개 썸네일)</label>
						</div>
						
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">상태</label>
							<div class="col-sm-10">
								<div class="row">
									<div class="col-sm-1">
										<div class="icheck-primary d-inline">
											<input class="custom-control-input" type="radio"  id="bitDelete0" value="0" name="bitDelete">
		                          			<label for="bitDelete0">노출</label>
										</div>
									</div>
									<div class="col-sm-1">
										<div class="icheck-primary d-inline">
											<input class="custom-control-input" type="radio"  id="bitDelete1"  value="1" name="bitDelete">
		                          			<label for="bitDelete1">미노출</label>
										</div>
									</div>
								</div>
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
		location.href = "remove.do?idx=" + "${data.idx}";
	}
	
}

function stripHtml(str) {
	var tmp;
	tmp = str.replace(/<[^<|>]*>/gi, "");
	tmp = tmp.replace(/\t/gi,"");
	tmp = tmp.replace(/\s\s/gi,"");
	tmp = tmp.replace(/&nbsp;/gi,"");
	tmp = tmp.replace(/\n/gi,"");
	tmp = tmp.replace(/\r\n/gi,"");
	return tmp;
}

//submit 하기전 유효성 검사 함수
function validateForm(){
	
	//요약컨텐츠 자동 입력
	try{
		document.writeForm.strPreContent.value = stripHtml(CKEDITOR.instances.strContent.getData());
	} catch (e) {
		
	}
}

$(function () {
	//$('#startDate').datepicker();
	bsCustomFileInput.init();
	
	$('input:radio[name="bitDelete"]:radio[value="${data.bitDelete}"]').prop('checked', true);
	
	$('#care_sdate, #care_edate, #dateRegdate').daterangepicker({
		locale : { format : 'YYYYMMDD'},
		singleDatePicker : true
	});
	
	$('#care_sdate').val("${data.care_sdate}");
	$('#care_edate').val("${data.care_edate}");
	

	CKEDITOR.replace('strContent',{height:'380'});
	CKEDITOR.config.allowedContent = true;
});

</script>