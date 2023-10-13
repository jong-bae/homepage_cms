<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>담당자 등록</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
						<li class="breadcrumb-item">담당자관리</li>
						<li class="breadcrumb-item active">담당자</li>
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
					<form role="form" id="quickForm" method="post" action="write-proc.do" onsubmit="return validation();">
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
								<label for="idno" class="col-sm-2 col-form-label">사번</label>
								<div class="col-sm-3">
									<input type="text" name="id" class="form-control" id="idno" placeholder="사번">
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPassword3" class="col-sm-2 col-form-label">비밀번호</label>
								<div class="col-sm-4">
									<input type="password" name="password" class="form-control" id="password" placeholder="비밀번호">
								</div>
							</div>
							<div class="form-group row">
								<label for="name" class="col-sm-2 col-form-label">이름</label>
								<div class="col-sm-3">
									<input type="text" name="name" class="form-control" id="name" placeholder="이름">
								</div>
							</div>
							<div class="form-group row">
								<label for="dept" class="col-sm-2 col-form-label">부서</label>
								<div class="col-sm-3">
									<input type="text" name="dept" class="form-control" id="dept" placeholder="부서">
								</div>
							</div>
							<div class="form-group row">
								<label for="email" class="col-sm-2 col-form-label">Email</label>
								<div class="col-sm-3">
									<input type="text" name="email" class="form-control" id="email" placeholder="email">
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
								<label for="" class="col-sm-2 col-form-label">권한</label>
								<div class="col-sm-10">
									<div class="row">
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="radio" id="auth-master" name="auth" class="radio-auth" value="master">
												<label for="auth-master">MASTER</label>
											</div>
										</div>
										<div class="col-sm-2">
											<div class="icheck-primary d-inline">
												<input type="radio" id="auth-general" name="auth" class="radio-auth" value="general">
												<label for="auth-general">GENERAL</label>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<label for="" class="col-sm-2 col-form-label">메뉴권한</label>
								<div class="col-sm-10">
								<c:forEach items="${menuList }" var="depth2" varStatus="depth2Cnt">
									<div class="form-group"> <!-- 뎁스2 반복시작 -->
										<div class="col-sm-3">
											<i class="fas fa-caret-right"> <c:out value="${depth2.name}"></c:out></i>
										</div>
										<div class="col-sm-8">
											<div class="row">
											<c:forEach items="${depth2.menuList }" var="depth3" varStatus="depth3Cnt">
												<div class="col-sm-4">
													<div class="icheck-primary d-inline">
														<input type="checkbox" id="role_${depth2Cnt.count}_${depth3Cnt.count}" name="role" value='<c:out value="${depth3.idx }"></c:out>'>
														<label for="role_${depth2Cnt.count}_${depth3Cnt.count}"><c:out value="${depth3.name }"></c:out></label>
													</div>
												</div>
											</c:forEach>
											</div>
										</div>
									</div>
								</c:forEach>
									<!-- <div class="form-group"> 뎁스2 반복시작
										<div class="col-sm-2">
											<label for="test">뎁스2</label>
										</div>
										<div class="col-sm-8">
											<div class="icheck-primary d-inline">	 뎁스3 반복시작
												<label for="test1">뎁스3</label>
												<input type="checkbox" id="test1" name="">
											</div>
											<div class="icheck-primary d-inline">
												<label for="test2">뎁스3</label>
												<input type="checkbox" id="test2" name="">
											</div>
										</div>
									</div> -->
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
	function validation() {
		if(!formValidation_empty('idno')) return false;
		if(!formValidation_empty('password')) return false;
		if(!formValidation_empty('name')) return false;
		if(!formValidation_empty('email')) return false;
		if(!formValidation_radio('radio-auth')) return false;
	}
</script>