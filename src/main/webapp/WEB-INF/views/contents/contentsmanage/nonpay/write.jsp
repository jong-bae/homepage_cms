<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>비급여의료수가 관리</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
						<li class="breadcrumb-item">콘텐츠관리</li>
						<li class="breadcrumb-item active">비급여의료수가</li>
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
						<h3 class="card-title">등록
							<c:if test="${status eq 'K'}"> - 이력유지</c:if>
							<c:if test="${status eq 'R'}"> - 이력갱신</c:if>
						</h3>
					</div>
					<!-- form start -->
					<form role="form" id="quickForm" method="post" action="write-proc.do">
						<input type="hidden" name="status" value='<c:out value="${status }"></c:out>'>
						<div class="card-body">
							<div class="form-group row">
								<label for="sel-bcode" class="col-sm-2 col-form-label">병의원</label>
								<div class="col-sm-2">
									<select class="form-control select2" id="sel-bcode" name="bCode">
										<option value="">병의원선택</option>
										<c:forEach items="${bcodeList }" var="bcode">
											<option value='<c:out value="${bcode.bCode }"></c:out>'><c:out value="${bcode.bName }"></c:out></option>
										</c:forEach>
									</select>
								</div>
								<c:if test="${status eq 'K'}">
									<div class="col-sm-2">
										<select class="form-control select2" name="uuid" id="sel-history">
											<option value="N">최종수정일</option>
										</select>
									</div>
								</c:if>
								<c:if test="${status eq 'R'}">
									<div class="col-sm-3">
										 <input type="text" name="updateDate" class="form-control" id="updateDate" placeholder="갱신일자 입력 : YYYYMMDD" >
									</div>
								</c:if>
							</div>
							<div class="form-group row">
								<label for="sel-code" class="col-sm-2 col-form-label">대분류</label>
								<div class="col-sm-3">
									<select class="form-control select2" name="codes" id="sel-code">
										<option value="">비급여 대분류</option>
										<c:forEach items="${codeList }" var="code">
											<option value='<c:out value="${code.code }"></c:out>'><c:out value="${code.exp }"></c:out></option>
										</c:forEach>
									</select>
								</div>
								<div class="col-sm-3">
									<select class="form-control select2" name="codes" id="sel-childCode">
										<option value="">비급여 상세분류</option>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label for="codeName" class="col-sm-2 col-form-label">분류</label>
								<div class="col-sm-5">
									<input type="text" name="codeName" class="form-control" id="codeName" >
								</div>
							</div>
							<div class="form-group row">
								<label for="itemName" class="col-sm-2 col-form-label">명칭</label>
								<div class="col-sm-5">
									<input type="text" name="itemName" class="form-control" id="itemName"  >
								</div>
							</div>
							<div class="form-group row">
								<label for="itemCode" class="col-sm-2 col-form-label">코드</label>
								<div class="col-sm-5">
									<input type="text" name="itemCode" class="form-control" id="itemCode" >
								</div>
							</div>
							<div class="form-group row">
								<label for="itemDivision" class="col-sm-2 col-form-label">구분</label>
								<div class="col-sm-5">
									<input type="text" name="itemDivision" class="form-control" id="itemDivision" >
								</div>
							</div>
							<div class="form-group row">
								<label for="cost" class="col-sm-2 col-form-label">비용</label>
								<div class="col-sm-3">
									<input type="text" name="cost" class="form-control" id="cost" >
								</div>
							</div>
							<div class="form-group row">
								<label for="minCost" class="col-sm-2 col-form-label">최소비용</label>
								<div class="col-sm-3">
									<input type="text" name="minCost" class="form-control" id="minCost" >
								</div>
							</div>
							<div class="form-group row">
								<label for="maxCost" class="col-sm-2 col-form-label">최대비용</label>
								<div class="col-sm-3">
									<input type="text" name="maxCost" class="form-control" id="maxCost" >
								</div>
							</div>
							<div class="form-group row">
								<label for="materialY" class="col-sm-2 col-form-label">치료재료대 포함여부</label>
								<div class="col-sm-10">
									<div class="row">
										<div class="col-sm-1">
											<div class="icheck-primary d-inline">
												<input type="radio" id="materialY" name="materialYN" value="Y">
												<label for="useY">사용</label>
											</div>
										</div>
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="radio" id="materialN" name="materialYN" value="N">
												<label for="useN">미사용</label>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<label for="drugY" class="col-sm-2 col-form-label">약제비 포함여부</label>
								<div class="col-sm-10">
									<div class="row">
										<div class="col-sm-1">
											<div class="icheck-primary d-inline">
												<input type="radio" id="drugY" name="drugYN" value="Y">
												<label for="useY">사용</label>
											</div>
										</div>
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="radio" id="drugN" name="drugYN" value="N">
												<label for="useN">미사용</label>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<label for="etc" class="col-sm-2 col-form-label">특이사항</label>
								<div class="col-sm-5">
									<textarea name="etc" id="etc" rows="5" cols="163" class="form-control"></textarea>
								</div>
							</div>
							<div class="form-group row">
								<label for="regDate" class="col-sm-2 col-form-label">최종수정일</label>
								<div class="col-sm-2">
									<input type="text" name="regDate" class="form-control" id="regDate" placeholder="YYYYMMDD">
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
	$(function() {
	});
	
	$('#sel-bcode').change(function() {
		var bcode = $(this).val();
		loadHistoryDate(bcode);
	});
	
	$('#sel-code').change(function() {
		var code = $(this).val();
		loadChildCode(code);
	});
	
	function loadChildCode(CODE) {
		$.jbAjaxPostJson('${pageContext.request.contextPath}/contents/contentsmanage/nonpay/loadChildCode.do', { 'code' : CODE  },
			function(result) {
				if( result.length > 0) {
					$('#sel-childCode').children().remove();
					$.each(result, function(key, value) {
						$('#sel-childCode').append('<option value="' + value.code + '">' + value.exp + '</option>');
					}); 
				} else {
					$('#sel-childCode').children().remove();
					$('#sel-childCode').append('<option value="">비급여 상세분류</option>');
				}
			},
			function(result) {
				// fail 
			}
		);
	}
	
	function loadHistoryDate(BCODE) {
		$.jbAjaxPostJson('${pageContext.request.contextPath}/contents/contentsmanage/nonpay/loadHistory.do', { 'bCode' : BCODE },
			function(result) {
				if( result.length > 0) {
					$('#sel-history').children().remove();
					$.each(result, function(key, value) {
						$('#sel-history').append('<option value="' + value.uuid + '">' + value.historyDate + '</option>');
					});
				} else {
					$('#sel-history').children().remove();
					$('#sel-history').append('<option value="N">최종수정일</option>');
				}
			},
			function(result) {
				// fail 
			}
		);
	}
</script>