<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈페이지 관리자 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/adminlte.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css?211029">
<script src="${pageContext.request.contextPath}/resources/plugins/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/custom/utils.js"></script>
</head>
<body>
	<div id="login_wrap_1710">
		<div class="text_area">
			<p>★ 개인정보보호를 위한 1인 1아이디 시스템 운영 ★</p>
			<p class="tel">아이디가 없으신 분은 "사번/이름/소속(지역, 행정/간호팀)/해당업무"를 메일로 전달주시기 바랍니다. </p>
			<span>	
				- 문의 : 인사지원팀 박종배 (#77) 1594 / 02-750-1594 / jbpark@jsd1.co.kr<br>
				- 문의 : 인사지원팀 송두원 (#77) 1595 / 02-750-1595 / lunt@jsd1.co.kr<br>
			</span>	
		</div>
		<form name="BZLogin" method="post" action="loginCheck.do">
		<!-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> -->
		<input type="hidden" name="Cmd" value="LOGIN">
		<div class="login_top">
			<table width="100%" height="100%"  style="text-align:center;border:1px solid #ddd;font-size:12px;">
				<tr>
					<td width="50%" style="cursor:default;background-color:#3857a7;color:#fff;">
						<b>JASENG</b>(홈페이지)
						<br>의료진/간호사관리, MRI, 홈페이지업무
					</td>
					<td width="50%" style="cursor:pointer;" onClick="location.href='https://cs.jaseng.co.kr/';">
						<b>CS JASENG</b>(고객지원)
						<br>상담/예약, 해피존, 미디어팀활동, 기타업무
					</td>
				</tr>
			</table>
		</div>
		<div class="login_area">
			<div class="id_pass">
				<input type="text" name="id" class="id" title="아이디" tabindex="1" value="M24412"/>
				<input type="password" name="password" class="pass" title="비밀번호" tabindex="2" value="`jaybee1007" />
			</div>
			<button type="submit">login</button>
			<!-- <a href="javascript:pw_find(2);" class="alink_btn_01_blue">비밀번호찾기</a> -->
			<button type="button" class="alink_btn_01_blue" data-toggle="modal" data-target="#modal-popup">비밀번호찾기</button>
		</div>
		</form>
	</div>
	
	<!-- BranchCenter ModalPopup  -->
	<div class="modal fade" id="modal-popup">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">비밀번호 찾기</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="input-group input-group-m">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-pen"></i></span>
						</div>
						<input type="text" class="form-control" id="findID" placeholder="사번(ID) 입력"> 
					</div>
				</div>
				<div class="modal-footer justify-content-between">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="btn-sendMail">메일발송</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	
	<script>
		$('#btn-sendMail').click(function() {
			var PARAM_ID = $('#findID').val();
			$.jbAjaxPostJson('${pageContext.request.contextPath}/findpwd.do', {id : PARAM_ID}, 
					function(result) {
						console.log(result);
						if(result.result == true) {
							$('#modal-popup').modal('hide');
							alert(result.message);
							$('#findID').val("");
						}
						else {
							alert(result.message);
							$('#findID').val("");
						}
					}, function(error) {
						// fail		
						alert("장애발생으로 관리자에게 문의하십시오!");
				});
		});
	</script>
</body>
</html>