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
					<h1>메뉴 등록</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
						<li class="breadcrumb-item">메뉴관리</li>
						<li class="breadcrumb-item active">메뉴 등록</li>
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
					<form role="form" id="quickForm" method="post" action="../write-proc.do">
						<input type="hidden" name="parentIdx" value='<c:out value="${parentIdx }"></c:out>'>
						<input type="hidden" name="depth" value='<c:out value="${depth }"></c:out>'>
						<div class="card-body">
							<div class="form-group row">
								<label for="menuName" class="col-sm-2 col-form-label">메뉴명</label>
								<div class="col-sm-4">
									<input type="text" name="name" class="form-control" id="menuName" placeholder="메뉴명" required="required">
								</div>
							</div>
							<c:if test="${depth ne 2 }">
								<div class="form-group row">
									<label for="url" class="col-sm-2 col-form-label">URL</label>
									<div class="col-sm-4">
										<input type="text" name="url" class="form-control" id="url" placeholder="/depth1/depth3" required="required">
									</div>
								</div>
							</c:if>
							<div class="form-group row">
								<label for="sort" class="col-sm-2 col-form-label">SORT</label>
								<div class="col-sm-1">
									<input type="text" name="sort" class="form-control" id="sort" placeholder="순서">
								</div>
							</div>
							<div class="form-group row">
								<label for="sel-status" class="col-sm-2 col-form-label">상태값</label>
								<div class="col-sm-2">
									<select name="useYN" class="form-control select2" id="sel-status">
										<option value="Y" selected>사용</option>
										<option value="N">중지</option>
									</select>
								</div>
							</div>
						</div>
						<div class="card-footer">
							<div class="btn-group float-left">
								<button type="submit" class="btn btn-outline-secondary">등록</button>
								<button type="button" class="btn btn-outline-secondary"	onClick="location.href='../list.do'">취소</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
</div>