<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>검색</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
						<li class="breadcrumb-item">SEO관리</li>
						<li class="breadcrumb-item active">검색</li>
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
					<form role="form" id="quickForm" method="post" action="modify-proc.do">
						<input type="hidden" name="idx" value="${data.idx }">
						<div class="card-body">
							<div class="form-group row">
								<label for="bName" class="col-sm-2 col-form-label">URL</label>
								<div class="col-sm-10">
									<input type="text" name="url" class="form-control" id="url" value="${data.url }" placeholder="URL" required="required">
								</div>
							</div>
							<div class="form-group row">
								<label for="bFolder" class="col-sm-2 col-form-label">title</label>
								<div class="col-sm-10">
									<input type="text" name="title" class="form-control" id="title" value="${data.title}" placeholder="meta tag title" required="required">
								</div>
							</div>
							<div class="form-group row">
								<label for="bAddr" class="col-sm-2 col-form-label">description</label>
								<div class="col-sm-10">
									<input type="text" name="description" class="form-control" id="description" value="${data.description}" placeholder="meta tag description" required="required">
								</div>
							</div>
							<div class="form-group row">
								<label for="bDomain" class="col-sm-2 col-form-label">keywords</label>
								<div class="col-sm-10">
									<input type="text" name="keywords" class="form-control" id="keywords" value="${data.keywords}" placeholder="meta tag keywords">
								</div>
							</div>
							<div class="form-group row">
								<label for="kakaopf" class="col-sm-2 col-form-label">OG:URL</label>
								<div class="col-sm-10">
									<input type="text" name="ogUrl" class="form-control" id="ogUrl" value="${data.ogUrl}">
								</div>
							</div>
							<div class="form-group row">
								<label for="facebook" class="col-sm-2 col-form-label">OG:Image</label>
								<div class="col-sm-10">
									<input type="text" name="ogImage" class="form-control" id="ogImage" value="${data.ogImage}">
								</div>
							</div>
							<div class="form-group row">
								<label for="blog" class="col-sm-2 col-form-label">category1</label>
								<div class="col-sm-10">
									<input type="text" name="category1" class="form-control" id="category1" value="${data.category1}" placeholder="breadcrumb depth 1">
								</div>
							</div>
							<div class="form-group row">
								<label for="cafe" class="col-sm-2 col-form-label">category1_link</label>
								<div class="col-sm-10">
									<input type="text" name="category1_link" class="form-control" id="category1_link" value="${data.category1_link}" placeholder="breadcrumb depth 1 link">
								</div>
							</div>
							<div class="form-group row">
								<label for="blog" class="col-sm-2 col-form-label">category2</label>
								<div class="col-sm-10">
									<input type="text" name="category2" class="form-control" id="category2" value="${data.category2}" placeholder="breadcrumb depth 2">
								</div>
							</div>
							<div class="form-group row">
								<label for="cafe" class="col-sm-2 col-form-label">category2_link</label>
								<div class="col-sm-10">
									<input type="text" name="category2_link" class="form-control" id="category2_link" value="${data.category2_link}" placeholder="breadcrumb depth 2 link">
								</div>
							</div>
							<div class="form-group row">
								<label for="blog" class="col-sm-2 col-form-label">category3</label>
								<div class="col-sm-10">
									<input type="text" name="category3" class="form-control" id="category3" value="${data.category3}" placeholder="breadcrumb depth 3">
								</div>
							</div>
							<div class="form-group row">
								<label for="cafe" class="col-sm-2 col-form-label">category3_link</label>
								<div class="col-sm-10">
									<input type="text" name="category3_link" class="form-control" id="category3_link" value="${data.category3_link}" placeholder="breadcrumb depth 3 link">
								</div>
							</div>
							<div class="form-group row">
								<label for="blog" class="col-sm-2 col-form-label">category4</label>
								<div class="col-sm-10">
									<input type="text" name="category4" class="form-control" id="category4" value="${data.category4}" placeholder="breadcrumb depth 4">
								</div>
							</div>
							<div class="form-group row">
								<label for="cafe" class="col-sm-2 col-form-label">category4_link</label>
								<div class="col-sm-10">
									<input type="text" name="category4_link" class="form-control" id="category4_link" value="${data.category4_link}" placeholder="breadcrumb depth 4 link">
								</div>
							</div>
							<div class="form-group row">
								<label for="npost" class="col-sm-2 col-form-label">gubun</label>
								<div class="col-sm-2">
									<input type="text" name="gubun" class="form-control" id="gubun" value="${data.gubun}">
								</div>
							</div>
							<div class="form-group row">
								<label for="audioclip" class="col-sm-2 col-form-label">pageInfo</label>
								<div class="col-sm-2">
									<input type="text" name="pageInfo" class="form-control" id="pageInfo" value="${data.pageInfo}">
								</div>
							</div>
							<div class="form-group row">
								<label for="youtube" class="col-sm-2 col-form-label">depth1</label>
								<div class="col-sm-2">
									<input type="text" name="depth1" class="form-control" id="depth1" value="${data.depth1}">
								</div>
							</div>
							<div class="form-group row">
								<label for="instagram" class="col-sm-2 col-form-label">depth2</label>
								<div class="col-sm-2">
									<input type="text" name=depth2 class="form-control" id="depth2" value="${data.depth2}">
								</div>
							</div>
							<div class="form-group row">
								<label for="bStatus" class="col-sm-2 col-form-label">상태</label>
								<div class="col-sm-2">
									<select name="useYN" class="form-control select2" id="useYN">
										<option value="Y" ${data.useYN == 'Y' ? 'selected' : '' }>사용</option>
										<option value="N" ${data.useYN == 'N' ? 'selected' : '' }>미사용</option>
									</select>
								</div>
							</div>
						</div>
						<div class="card-footer">
							<div class="btn-group float-left" >
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
	$(function() {
		$('#btn-delete').click(function() {
			if(!confirm("삭제하시겠습니까?")) return;
			$('#quickForm').attr('action', 'remove.do').attr('onsubmit', '').submit();
		});
	});
</script>