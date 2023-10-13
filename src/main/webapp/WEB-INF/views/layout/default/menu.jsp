<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="javascript:;" role="button"><i class="fas fa-bars"></i></a>
        </li>
        <c:forEach items="${userSession.topMenuList }" var="data">
        	<c:if test="${data.useYN eq 'Y' }">
	        	<li class="nav-item d-none d-sm-inline-block">
	            	<a href="javascript:;" onclick="menuAjax(${data.idx });" class="nav-link"><c:out value="${data.name }"></c:out></a>
	        	</li>
        	</c:if>
        </c:forEach>
    </ul>
    <ul class="navbar-nav ml-auto">
    	<li class="nav-item">
       		<a class="nav-link" href="/pwdChange.do" role="button" title="비밀번호 변경">
          		<i class="fas fa-key"></i>
        	</a>
      </li>
    	<li class="nav-item">
       		<a class="nav-link" href="/logout.do" role="button" title="로그아웃">
          		<i class="fas fa-sign-out-alt"></i>
        	</a>
      </li>
    </ul>
</nav>
<!-- /.navbar -->

<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="/index.do" class="brand-link text-center">
        <!--<img src="dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">-->
        <span class="brand-text font-weight-light">JASENG CMS</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <!-- <img src="/resources/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image"> -->
                <i class="fas fa-user-circle" style="font-size: 2.1rem;"></i>
            </div>
            <div class="info">
                <a href="javascript:;" class="d-block"><c:out value="${userSession.name } (${userSession.id })"></c:out></a>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
            <c:if test="${userSession.menuList ne null }">
            	<li class="nav-header"><c:out value="${userSession.menuList[0].parentName }"></c:out></li>
	            <c:forEach items="${userSession.menuList }" var="depth2">
	            	<li class="nav-item has-treeview depth2">
	            		<a href="javascript:;" class="nav-link">
	            			<i class="nav-icon fas fa-circle"></i>
	            			<p><c:out value="${depth2.name }"></c:out><i class="right fas fa-angle-left"></i></p>
	            		</a>
	            		<ul class="nav nav-treeview">
	            		<c:forEach items="${depth2.menuList }" var="depth3">
	            			<li class="nav-item depth3">
	            				<a href="${depth3.url }" class="nav-link ${depth3.addClass }">
	            					<i class="far fa-circle nav-icon"></i>
	            					<p><c:out value="${depth3.name }"></c:out></p>
	            				</a>
	            			</li>
	            		</c:forEach>
	            		</ul>
	            	</li>
	            </c:forEach>
            </c:if>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
<script>
	function menuAjax(IDX) {
		var obj = new Object();
		obj.idx = IDX;
		obj.depth = 1;
		
		$.jbAjaxPostJson('${pageContext.request.contextPath}/treeMenuAjax.do', obj,
			function(result) {
				//console.log(result);
				$('div.sidebar nav.mt-2 ul.nav-sidebar').children().remove();
				$('div.sidebar nav.mt-2 ul.nav-sidebar').append('<li class="nav-header">'+ result[0].parentName +'</li>');
				
				var elementString = '';
				$.each(result, function(k, val) {
					// 2Depth
					elementString += '<li class="nav-item has-treeview"><a href="javascript:;" class="nav-link"><i class="nav-icon fas fa-circle">\
						</i><p>'+ val.name +'<i class="right fas fa-angle-left"></i></p></a><ul class="nav nav-treeview">';
					
					$.each(val.menuList, function(key, value){
						// 3Depth
						elementString += '<li class="nav-item"><a href="'+ value.url +'" class="nav-link"><i class="far fa-circle nav-icon"></i><p>'+ value.name +'</p></a></li>';
					});
					elementString += '</ul></li>';
				});
				$(elementString).insertAfter('div.sidebar nav.mt-2 ul.nav-sidebar li.nav-header');
			},
			function(result) {
				// fail 
			}
		);
	}
	
	$(function () {
		$('.depth3 > a.active').parents('li.depth2').children('a').addClass('active');
		$('.depth3 > a.active').parents('li.depth2').addClass('menu-open');
		$('.depth3 > a.active').parents('ul.nav-treeview').css('display', 'block');
	});
	
</script>
<style>
.nav-sidebar .nav-treeview {   margin-left: 12px; }
</style>
