<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.request.contextPath}/resources/js/jquery/jquery.twbsPagination.js"></script>

	<table>
		<tr>
			<th>ID</th>
			<th>name</th>
			<th>description</th>
			<th>use</th>
			<th>user</th>
		</tr>
		<c:forEach var="row" items="${data.list }">
		<tr>
			<td>${row.ID }</td>
			<td>${row.NAME }</td>
			<td>${row.DESCRIPTION }</td>
			<td>${row.USE_YN }</td>
			<td>${row.REG_USER }</td>
		</tr>
		</c:forEach>
	</table>
	<ul id="pagination" class="pagination"></ul>
	
<script>
$(function() {
	$('#pagination').twbsPagination({
		totalPages: '${data.totalPages}',
		visiblesPasges: '${data.visiblePage}',
		href: '?currentPage={{number}}',
		onPageClick: function(event, page) {
			// 여기서 href 함수 대신 ajax로 post 넘겨도 될듯함.
		}
	});
});
</script>