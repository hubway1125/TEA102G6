<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ListOneTag</title>
<style>
table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 5px;
	text-align: center;
}
</style>
</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>Tag資料 - listOneTag.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/tags/index_tags.jsp"><img src="<%=request.getContextPath()%>/back-end/tags/images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>
	<table>
		<tr>
			<th>Tag ID</th>
			<th>Tag Name</th>
			<th>Tag Add Time</th>
		</tr>
		<tr>
			<td>${tagsVO.tag_id}</td>
			<td>${tagsVO.tag_name}</td>
			<td><fmt:formatDate value="${tagsVO.tag_add_time}"
						pattern="yyyy-MM-dd HH:mm:ss" /></td>
		</tr>
	</table>

</body>
</html>