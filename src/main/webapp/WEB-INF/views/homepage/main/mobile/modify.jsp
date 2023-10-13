<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>모바일 상단 배너 수정</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
						<li class="breadcrumb-item">메인관리</li>
						<li class="breadcrumb-item active">M상단배너</li>
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
						<input type="hidden" name="idx" value="${data.idx }">
						<div class="card-body">
							<div class="form-group row">
								<label for="sel-status" class="col-sm-2 col-form-label">노출 환경</label>
								<div class="col-sm-10">
									<div class="row">
									
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="checkbox" class="chk-exposure" id="chk-exposure-PC" name="exposure" value="PC">
												<label for="chk-exposure-PC">PC</label>
											</div>
										</div>
										
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="checkbox" class="chk-exposure" id="chk-exposure-M" name="exposure" value="M">
												<label for="chk-exposure-M">모바일</label>
											</div>
										</div>
									</div>
								</div>
							</div>						
							<div class="form-group row">
								<label for="sel-bcode" class="col-sm-2 col-form-label">소속병의원</label>
								<div class="col-sm-10">
									<div class="row">
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="checkbox" id="chk-bCode" value="">
												<label for="chk-bCode">전체</label>
											</div>
										</div>
										<c:forEach items="${bcodeList }" var="bcode" varStatus="dataCnt">
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="checkbox" class="chk-bCode-list" id="chk-bCode-${dataCnt.count }" name="bCodeList" value='<c:out value="${bcode.bCode }"></c:out>'>
												<label for="chk-bCode-${dataCnt.count }"><c:out value="${bcode.bName }"></c:out></label>
											</div>
										</div>
										</c:forEach>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<label for="bannerImg" class="col-sm-2 col-form-label">이미지(PC)</label>
								<div class="col-sm-3">
									<img src='<c:out value="${data.bannerImg_origin_pc }"></c:out>' class="mb-2 mx-auto d-block" width="90%">
									<div class="custom-file">
										<input type="file" name="bannerImg_file_pc" class="custom-file-input" id="bannerImgPc">
										<label class="custom-file-label" for="bannerImgPc">상단 배너이미지 업로드</label>
									</div>
								</div>
								<div class="col-sm-3">
									<p><small><c:out value="${data.bannerImg_origin_pc }"></c:out></small> </p>
									<input type="hidden" name="bannerImg_origin_pc" value="<c:out value="${data.bannerImg_origin_pc }"></c:out>">
								</div>
							</div>
							<div class="form-group row">
								<label for="bannerImg" class="col-sm-2 col-form-label">이미지(M)</label>
								<div class="col-sm-3">
									<img src='<c:out value="${data.bannerImg_origin }"></c:out>' class="mb-2 mx-auto d-block" width="70%">
									<div class="custom-file">
										<input type="file" name="bannerImg_file" class="custom-file-input" id="bannerImg">
										<label class="custom-file-label" for="bannerImg">상단 배너이미지 업로드</label>
									</div> 
								</div>
								<div class="col-sm-3">
									<p><small><c:out value="${data.bannerImg_origin }"></c:out></small> </p>
									<input type="hidden" name="bannerImg_origin" value="<c:out value="${data.bannerImg_origin }"></c:out>">
								</div>
							</div>
							<div class="form-group row">
								<label for="titleTop" class="col-sm-2 col-form-label">TOP타이틀</label>
								<div class="col-sm-5">
									<input type="text" name="titleTop" class="form-control" id="titleTop" value="${data.titleTop }" placeholder="7자 내외로 입력하세요" >
								</div>
							</div>
							<div class="form-group row">
								<label for="titleMain" class="col-sm-2 col-form-label">MAIN타이틀</label>
								<div class="col-sm-5">
									<input type="text" name="titleMain" class="form-control" id="titleMain" value="${data.titleMain }" placeholder="13자 내외로 입력하세요">
								</div>
							</div>
							<div class="form-group row">
								<label for="description" class="col-sm-2 col-form-label">설명</label>
								<div class="col-sm-10">
									<input type="text" name="description" class="form-control" id="description" value="${data.description }" placeholder="배너 설명">
								</div>
							</div>
							<div class="form-group row">
								<label for="url" class="col-sm-2 col-form-label">URL</label>
								<div class="col-sm-6">
									<input type="text" name="url" class="form-control" id="url" value="${data.url }" placeholder="url 주소">
								</div>
								<div class="col-sm-2">
									<select class="form-control select2" name="url_Option" id="url_Option">
										<option selected="selected">_self</option>
										<option>_blank</option>
									</select>
									<script>
										$('#url_Option').val('${data.url_Option}');
									</script>
								</div>
								<!-- <div class="col-sm-2">
									<div class="icheck-primary d-inline">
										<input type="checkbox" id="urlYN" name="urlYN" value="Y">
										<label for="urlYN">링크없음</label>
									</div>
								</div> -->
							</div>
							<div class="form-group row">
								<label for="startDate" class="col-sm-2 col-form-label">기간</label>
								<div class="col-sm-2">
									<input type="text" name="startDate" class="form-control" id="startDate" value="${data.startDate }" placeholder="시작날짜" required="required">
								</div>
								<div class="col-sm-2">
									<input type="text" name="endDate" class="form-control" id="endDate" value="${data.endDate }" placeholder="종료날짜" >
								</div>
							</div>
							<div class="form-group row">
								<label for="order" class="col-sm-2 col-form-label">순서</label>
								<div class="col-sm-1">
									<input type="text" name="order" class="form-control" id="order" value="${data.order }">
								</div>	
							</div>
							<div class="form-group row">
								<label for="sel-status" class="col-sm-2 col-form-label">노출여부</label>
								<div class="col-sm-10">
									<div class="row">
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="radio" id="useY" name="useYN" value="Y" ${data.useYN == 'Y' ? 'checked' : '' }>
												<label for="useY">노출</label>
											</div>
										</div>
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="radio" id="useN" name="useYN" value="N" ${data.useYN == 'N' ? 'checked' : '' }>
												<label for="useN">미노출</label>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="card-footer">
							<div class="btn-group float-left">
								<button type="submit" class="btn btn-outline-info">수정</button>
								<button type="button" class="btn btn-outline-secondary"	onClick="location.href='list.do'">취소</button>
							</div>
							<div class="btn-group float-right">
								<button type="button" class="btn btn-outline-danger float-right" id="btn-delete">삭제</button>
							</div>
						</div>
					</form>
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
		
		// 전체 체크박스 선택/취소
		$('#chk-bCode').change(function() {
			$('.chk-bCode-list').prop('checked', $(this).prop('checked'));
		});
		
		// custom input file type init();
		bsCustomFileInput.init();
		
		$('#btn-delete').click(function() {
			if(!confirm("삭제하시겠습니까?")) return;
			$('#quickForm').attr('action', 'remove.do').submit();
		});
		
		// 병의원 체크박스 설정
		<c:forEach items="${data.branchList}" var="item">
			$("input[name=bCodeList][value=${item}]").prop("checked", true);
		</c:forEach>
		
		// 종료날짜는 선택 안할 수도 있으므로 공백 초기화
		<c:if test="${empty data.endDate}">
			$('#endDate').val("");
		</c:if>
				
		// 체크처리 데이터
		let exposure = '<c:out value="${data.exposure }"></c:out>';				
		// 체크처리 함수 자동체크( 체크처리데이터, 처리클래스 )
		ListChecked(exposure, "chk-exposure");
		
	});
</script>