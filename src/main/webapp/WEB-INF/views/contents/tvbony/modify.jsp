<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-left">
						<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
						<li class="breadcrumb-item"> TV관리</li>
						<li class="breadcrumb-item active"> TV보니 관리</li>
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
					<form role="form" id="modifyForm" method="post" action="modify-proc.do" onsubmit="validateForm();">
						<input type="hidden" name="idx" value='<c:out value="${data.idx }"></c:out>'>
						<div class="card-body">						
							
							<div class="form-group row">
								<label for="title" class="col-sm-2 col-form-label">유튜브ID값</label>
								<div class="col-sm-2">
									<input type="text" name="vid" class="form-control" id="vid" value='<c:out value="${data.vid }"></c:out>'>
									<br>
									<img id="vid_image" src='https://img.youtube.com/vi/<c:out value="${data.vid}"></c:out>/mqdefault.jpg' alt="확인영역"> ( 썸네일 미리보기 )
									<iframe id="movie_player" tagname="duration" width="350" height="180" src='https://www.youtube.com/embed/<c:out value="${data.vid}"></c:out>' frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
									( 동영상 미리보기 )	
								</div>
								<div class="col-sm-1">
									<button type="button" class="btn btn-info float-right" onclick="Change_VID();">미리보기</button>		
								</div>
							</div>
							
							<div class="form-group row">
								<label for="title" class="col-sm-2 col-form-label">영상시간</label>
								<div class="col-sm-2">
									<input type="text" name="vid_time" class="form-control" id="vid_time" value='<c:out value="${data.vid_time }"></c:out>'>
								</div>
							</div>

							<div class="form-group row">
								<label for="title" class="col-sm-2 col-form-label">대분류</label>
								<div class="col-sm-3">
									<select class="form-control select2" id="category1" name="category1">
										<option value="">-선택-</option>
										<c:forEach items="${tvcodeList}" var="tvcode">
											<option value='${tvcode.gubun}' <c:if test="${tvcode.gubun eq data.category1}">selected</c:if>>${tvcode.gubun}</option>
										</c:forEach>
									</select>
								</div>
							</div>

							<div class="form-group row">
								<label for="title" class="col-sm-2 col-form-label">소분류</label>
								<div class="col-sm-3">
									<select class="form-control select2" id="category2" name="category2">
										<option value="">-선택-</option>										
									</select>
								</div>
							</div>

							<div class="form-group row">
								<label for="title" class="col-sm-2 col-form-label">병의원 선택</label>
								<div class="col-sm-2">
									<select class="form-control select2" id="branch" name="branch">
										<option value="10000">병의원선택</option>
										<c:forEach items="${bcodeList}" var="bcode">
											<option value='${bcode.bCode }' <c:if test="${bcode.bCode eq data.branch}">selected</c:if>><c:out value="${bcode.bName }"></c:out></option>
										</c:forEach>
									</select>
								</div>
								<div class="col-sm-4">
									<span>★ 대분류 [치료영상]선택 시 환자 의료정보로 담당의가<br>이동했다고 하여서 타분원으로 이동이 불가 (병원소유자료)</span>
								</div>
							</div>

							<div class="form-group row">
								<label for="title" class="col-sm-2 col-form-label">제목</label>
								<div class="col-sm-10">
									<input type="text" name="title" class="form-control" id="title" value='<c:out value="${data.title }"></c:out>'>
								</div>
							</div>

							<div class="form-group row">
								<label for="title" class="col-sm-2 col-form-label">자막</label>
								<div class="col-sm-10">
									<textarea rows="10" cols="" name="description" id="description" class="form-control"><c:out value="${data.description }"></c:out></textarea>
								</div>
							</div>
							
							<div class="form-group row">
								<label for="title" class="col-sm-2 col-form-label">관심분야</label>
								<div class="col-sm-10">
									<div class="row">
										<c:forEach items="${iDepartList }" var="depart" varStatus="dataCnt">
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="checkbox" class="chkbox-depart-list" id="chkbox-depart-${dataCnt.count }" name="interest_depart" value='<c:out value="${depart.title }"></c:out>'>
												<label for="chkbox-depart-${dataCnt.count }"><c:out value="${depart.title }"></c:out></label>
											</div>
										</div>
										</c:forEach>
									</div>
									<script>
										<c:set var="departArr" value="${fn:split(data.interest_depart, ',')}"></c:set>
										<c:forEach var="data" items="${departArr}">
											$("input[name=interest_depart][value='${fn:trim(data)}']").prop("checked", true);
										</c:forEach>
									</script>
								</div>
							</div>

							<div class="form-group row">
								<label for="title" class="col-sm-2 col-form-label">관심질환</label>
								<div class="col-sm-10">
									<div class="row">
										<c:forEach items="${iDiseaseList }" var="disease" varStatus="dataCnt">
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="checkbox" class="chkbox-disease-list" id="chkbox-disease-${dataCnt.count }" name="interest_disease" value='<c:out value="${disease.title }"></c:out>'>
												<label for="chkbox-disease-${dataCnt.count }"><c:out value="${disease.title }"></c:out></label>
											</div>
										</div>
										</c:forEach>
									</div>
									<script>
										<c:set var="diseaseArr" value="${fn:split(data.interest_disease, ',')}"></c:set>
										<c:forEach var="data" items="${diseaseArr}">
											$("input[name=interest_disease][value='${fn:trim(data)}']").prop("checked", true);
										</c:forEach>
									</script>
								</div>
							</div>

							<div class="form-group row">
								<label for="title" class="col-sm-2 col-form-label">의료진명</label>
								<div class="col-sm-3">
									<select class="form-control select2" id="didx" name="didx">
										<option value="0">-선택-</option>	
										<c:forEach items="${doctorList}" var="doctor">
											<option value='${doctor.didx}' <c:if test="${doctor.didx eq data.didx}">selected</c:if> >${doctor.name} (${doctor.didx})</option>
										</c:forEach>									
									</select>
								</div>
							</div>

							<div class="form-group row">
								<label for="title" class="col-sm-2 col-form-label">사용여부</label>
								<div class="col-sm-10">
									<div class="row">
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="radio" id="real_y" name="real_yn" value="Y" <c:if test="${data.real_yn eq 'Y'}">checked</c:if> >
												<label for="real_y">사용</label>
											</div>
										</div>
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="radio" id="real_n" name="real_yn" value="N" <c:if test="${data.real_yn eq 'N'}">checked</c:if>>
												<label for="real_n">미사용</label>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="form-group row">
								<label for="title" class="col-sm-2 col-form-label">영상공개범위</label>
								<div class="col-sm-10">
									<div class="row">
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="radio" id="public_n" name="public_yn" value="N" <c:if test="${data.public_yn eq 'N'}">checked</c:if>>
												<label for="public_n">회원만</label>
											</div>
										</div>
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="radio" id="public_y" name="public_yn" value="Y" <c:if test="${data.public_yn eq 'Y'}">checked</c:if>>
												<label for="public_y">전체</label>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="form-group row">
								<label for="title" class="col-sm-2 col-form-label">추천 동영상 체크</label>
								<div class="col-sm-10">
									<div class="row">
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="radio" id="main_y" name="main_yn" value="Y" <c:if test="${data.main_yn eq 'Y'}">checked</c:if> >
												<label for="main_y">사용</label>
											</div>
										</div>
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="radio" id="main_n" name="main_yn" value="N" <c:if test="${data.main_yn eq 'N'}">checked</c:if>>
												<label for="main_n">미사용</label>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="form-group row">
								<label for="title" class="col-sm-2 col-form-label">메인 동영상 체크</label>
								<div class="col-sm-10">
									<div class="row">
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="radio" id="mmain_y" name="mmain_yn" value="Y" <c:if test="${data.mmain_yn eq 'Y'}">checked</c:if> >
												<label for="mmain_y">사용</label>
											</div>
										</div>
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="radio" id="mmain_n" name="mmain_yn" value="N" <c:if test="${data.mmain_yn eq 'N'}">checked</c:if>>
												<label for="mmain_n">미사용</label>
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

<script type="text/javascript">
	$(function() {
		let paramObj = new Object();
		paramObj.gubun = '${data.category1}';
		
		$.jbAjaxPostJson('${pageContext.request.contextPath}/contents/tvbony/listCategoryAjax.do', paramObj,
			function(result) {
				$.each(result, function(k, val) {
					if (val.title == '${data.category2}') {
						$('#category2').append("<option value='"+val.title+"' selected>"+val.title+"</option>");
					} else {
						$('#category2').append("<option value='"+val.title+"'>"+val.title+"</option>");
					}
				});				
			},
			function(result) {
				// fail
			}
		);
		
	});
	
	$("#category1").change(function(){	
		$('#category2 option').remove();
		
		let category1_val = $(this).val();
		let obj = new Object();
		obj.gubun = category1_val
		
		$.jbAjaxPostJson('${pageContext.request.contextPath}/contents/tvbony/listCategoryAjax.do', obj,
			function(result) {
				$.each(result, function(k, val) {
					$('#category2').append("<option value='"+val.title+"'>"+val.title+"</option>");
				});				
			},
			function(result) {
				// fail
			}
		);
	});
	
	var deleteFunc = function (){
		var result = confirm("삭제하시겠습니까?");
		
		if(result){
			location.href = "remove.do?idx=" + "${data.idx}";
		}
	}

	function Change_VID(){
		var vid_str = $("#vid").val();
		var movie_player = document.getElementById("movie_player");
	
		$("#vid_image").attr("src", "https://img.youtube.com/vi/"+vid_str+"/mqdefault.jpg");
		movie_player.src = "https://www.youtube.com/embed/" + vid_str;
	}

</script>