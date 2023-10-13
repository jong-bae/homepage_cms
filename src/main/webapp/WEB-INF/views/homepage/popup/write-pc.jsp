<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>홈페이지PC 팝업 등록</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
						<li class="breadcrumb-item">팝업관리</li>
						<li class="breadcrumb-item active">PC팝업</li>
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
					<form role="form" id="quickForm" method="post" action="write-proc.do">
						<input type="hidden" name="kind" value="${kind }">
						<div class="card-body">
							<div class="form-group row">
								<label for="sel-bcode" class="col-sm-2 col-form-label">소속병의원</label>
								<div class="col-sm-3">
									<select class="form-control select2" id="sel-bcode" name="bCode">
										<option value="">병의원선택</option>
										<c:forEach items="${bcodeList }" var="bcode">
											<option value='<c:out value="${bcode.bCode }"></c:out>'><c:out value="${bcode.bName }"></c:out></option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label for="title" class="col-sm-2 col-form-label">제목</label>
								<div class="col-sm-5">
									<input type="text" name="title" class="form-control" id="title" placeholder="제목" required="required">
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPassword3" class="col-sm-2 col-form-label">내용</label>
								<div class="col-sm-10">
									<textarea id="contents" rows="1" cols="20"></textarea>
								</div>
							</div>
							<div class="form-group row">
								<label for="startDate" class="col-sm-2 col-form-label">기간</label>
								<div class="col-sm-2">
									<input type="text" name="startDate" class="form-control" id="startDate" placeholder="시작날짜" required="required">
								</div>
								<div class="col-sm-2">
									<input type="text" name="endDate" class="form-control" id="endDate" placeholder="종료날짜" required="required">
								</div>
							</div>
							<div class="form-group row">
								<label for="sel-status" class="col-sm-2 col-form-label">상태값</label>
								<div class="col-sm-2">
									<select name="use_yn" class="form-control select2" id="sel-status">
										<option value="Y" selected>정상</option>
										<option value="N">중지</option>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label for="sel-popup" class="col-sm-2 col-form-label">팝업기능 선택</label>
								<div class="col-sm-2">
									<select name="pop_yn" class="form-control select2" id="sel-popup">
										<option value="N" selected>레이어팝업</option>
										<option value="D">상단배너</option>
									</select>
								</div>
							</div>
							<div class="form-group row">
								<label for="dept" class="col-sm-2 col-form-label">크기 및 위치</label>
								<div class="col-sm-1">
									<input type="text" name="width" class="form-control" id="width" placeholder="width">
								</div>
								<div class="col-sm-1">
									<input type="text" name="height" class="form-control" id="height" placeholder="height">
								</div>
								<div class="col-sm-1">
									<input type="text" name="top" class="form-control" id="top" placeholder="top">
								</div>
								<div class="col-sm-1">
									<input type="text" name="left" class="form-control" id="left" placeholder="left">
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
	CKEDITOR.replace('contents');
	
	$(function () {
		//$('#startDate').datepicker();
		$('#startDate, #endDate').daterangepicker({
			locale : { format : 'YYYY-MM-DD'},
			singleDatePicker : true
		});
	});
</script>