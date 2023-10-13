<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<script src="${pageContext.request.contextPath}/resources/js/custom/utils.js"></script>

	<h1>
		Hello world! <spring:message code="jb.common.title"/> 
	</h1>
	
	<P>  The time on the server is ${serverTime} </P>
	<%-- <P id="p-tag">  The time on the server is ${serverTime2} </P> --%>
	<%-- <p> ${id} </p>
	<p> ${name} </p>
	<button id="btn-refresh">시간갱신TEST</button> --%>
	
	<!-- <button id="btn-close">브라우져 종료 테스트</button> -->
	
	<!-- <a href="#" onclick="javascript:window.open('','_self').close();">창닫기</a> -->

<script>
	var obj = new Object();
	$(function() {
		//location.href="http://200.101.103.21";
		
		$('#btn-refresh').click(function() {
			obj.data = 'testdata';
			$.jbAjaxPostJson('${pageContext.request.contextPath}/ajaxTest', obj,
					function(result) {
						$('#p-tag').text('The time on the server is ' + result.today);
					},
					function(result) {
						
					}
			);
		});
		
		/* $('#btn-close').click(function() {
			//window.open("", "_self").close();
			
			window.open('','_self','');
            window.close(); 
            
		}); */
	});
</script>