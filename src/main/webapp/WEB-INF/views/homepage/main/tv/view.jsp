<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>모바일 영상영역탭 등록</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
						<li class="breadcrumb-item">메인관리</li>
						<li class="breadcrumb-item active">M영상영역탭</li>
					</ol>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</section>

	<!-- Main content -->
	<section class="content">
		<!-- Info boxes -->
		<div class="row">
			<div class="col-sm-6">
				<div class="info-box">
					<span class="info-box-icon bg-info elevation-1">
						<i class="fas fa-check-circle"></i>
					</span>

					<div class="info-box-content">
						<span class="info-box-text">노출 키워드 선택</span> 
						<span class="info-box-number"><c:out value="${interestKeyword.interestTitle }"></c:out></span> 
					</div>
					<!-- /.info-box-content -->
				</div>
				<!-- /.info-box -->
			</div>
			<!-- /.col -->
			<div class="col-sm-6">
				<div class="info-box">
					<span class="info-box-icon bg-success elevation-1">
						<i class="fas fa-comment"></i>
					</span>

					<div class="info-box-content">
						<span class="info-box-text">노출 키워드 명칭</span>
						<span class="info-box-number"><c:out value="${interestKeyword.keywordName }"></c:out></span>
					</div>
					<!-- /.info-box-content -->
				</div>
				<!-- /.info-box -->
			</div>
			<!-- /.col -->

		</div>
		<!-- /.row -->

		<div class="row">
			<div class="col-12">
				<div class="card card-info">
					<div class="card-header">
						<h3 class="card-title">등록</h3>
					</div>
					<!-- form start -->
					<form role="form" id="quickForm" method="post" action="write-proc.do" enctype="multipart/form-data">
						<div class="card-body">
							<div class="form-group row">
								<label for="sel-bcode" class="col-sm-2 col-form-label">노출키워드 선택</label>
								<div class="col-sm-10">
									<div class="row">
										<c:forEach items="${interestList }" var="interest" varStatus="dataCnt">
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="radio" class="radio-bCode-list" id="radio-bCode-${dataCnt.count }" name="interestTitle" value='<c:out value="${interest.interestTitle }"></c:out>'>
												<label for="radio-bCode-${dataCnt.count }"><c:out value="${interest.interestTitle }"></c:out></label>
											</div>
										</div>
										</c:forEach>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<label for="keywordName" class="col-sm-2 col-form-label">노출키워드 명칭</label>
								<div class="col-sm-5">
									<input type="text" name="keywordName" class="form-control" id="keywordName" placeholder="" >
								</div>
							</div>
						</div>
						<div class="card-footer">
							<div class="btn-group float-left">
								<button type="submit" class="btn btn-outline-secondary">갱신</button>
								<!-- <button type="button" class="btn btn-outline-secondary"	onClick="location.href='list.do'">취소</button> -->
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
		// 키워드 선택박스 설정
		$("input[name=interestTitle][value='${interestKeyword.interestTitle}']").prop("checked", true);
		$("#keywordName").val('${interestKeyword.keywordName }');
	});
</script>