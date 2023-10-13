<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<h2>TEST</h2>

<button id="btn-close">브라우져 종료 테스트</button>
	
<!-- <a href="#" onclick="javascript:window.open('','_self').close();">창닫기</a> -->
	
<script>
$(function() {
	
	$('#btn-close').click(function() {
		//window.open('about:blank', '_self').close();
		
		//window.open('','_self','');
        //window.close();
        
        //window.opener = self;
		//self.close();
        
		// chrome 브라우저는 사용자가 띄운 상태에서는 위의 스크립트가 적용되지 않음.
		
	});
});
</script>