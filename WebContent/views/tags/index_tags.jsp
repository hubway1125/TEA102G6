<%@page import="java.util.List"%>
<%@page import="com.tags.model.TagsService"%>
<%@page import="com.tags.model.TagsVO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="tagsSvc" scope="page"
	class="com.tags.model.TagsService" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Select_Page.jsp</title>
<style>
table, tr, th, td {
	border: 1px solid blue;
	text-align: center
}

th, td {
	padding: 5px;
}
</style>

</head>
<body>

	<h3>資料查詢:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color:red">請修正以下錯誤:</font>
		<ul>
		    <c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	
	
	<ul>
		<li>
			<FORM METHOD="post"
				ACTION="<%=request.getContextPath()%>/tags/tags.do">
				<b>輸入Tag ID (如TAGS00000):</b> <input type="text" name="tag_id">
				<input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>
		<li>
			<FORM METHOD="post"
				ACTION="<%=request.getContextPath()%>/tags/tags.do">
				<b>選擇 Tag ID:</b> <select size="1" name="tag_id">
					<c:forEach var="tagsVO" items="${tagsSvc.allTags}">
						<option value="${tagsVO.tag_id}">${tagsVO.tag_id}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>
		<li>
			<FORM METHOD="post"
				ACTION="<%=request.getContextPath()%>/tags/tags.do">
				<b>選擇Tag NAME:</b> <select size="1" name="tag_id">
					<c:forEach var="tagsVO" items="${tagsSvc.allTags}">
						<option value="${tagsVO.tag_id}">${tagsVO.tag_name}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>
		<li>
			<FORM METHOD="post"
				ACTION="<%=request.getContextPath()%>/tags/tags.do">
				<b>選擇Tag Add Time:</b> <select size="1" name="tag_id">
					<c:forEach var="tagsVO" items="${tagsSvc.allTags}">
						<option
							value="${tagsVO.tag_id}"><fmt:formatDate
								value="${tagsVO.tag_add_time}" pattern="yyyy-MM-dd HH:mm:ss" />
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>
	</ul>


	<h3>Tag 管理</h3>
	<ul>
		<li><a href='<%=request.getContextPath()%>/views/tags/addTags.jsp'>Add</a>
			a new Tag.</li>
	</ul>
	<% 
// 		pageContext.setAttribute("list", tagsSvc.getAllTags()) ; 
	    TagsService tagsService = new TagsService();
	    List<TagsVO> list = tagsService.getAllTags();
	    pageContext.setAttribute("list",list);
	%>
	<%@ include file="pages/page1.file" %> 
	<table>
		<tr>
			<th>Tag ID</th>
			<th>Tag Name</th>
			<th>Tag Add Time</th>
			<th>修改</th>
			<th>刪除</th>
		</tr>

		<c:forEach var="tagsVO" items="${tagsSvc.allTags}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
			<tr>
				<td>${tagsVO.tag_id}</td>
				<td>${tagsVO.tag_name}</td>
				<td><fmt:formatDate value="${tagsVO.tag_add_time}"
						pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td>
				  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/tags/tags.do" style="margin-bottom: 0px;">
				     <input type="submit" value="修改">
				     <input type="hidden" name="tag_id"  value="${tagsVO.tag_id}">
				     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
				</td>
				<td>
				  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/tags/tags.do" style="margin-bottom: 0px;">
				     <input type="submit" value="刪除">
				     <input type="hidden" name="tag_id"  value="${tagsVO.tag_id}">
				     <input type="hidden" name="action" value="delete"></FORM>
				</td>
			</tr>
		</c:forEach>
		
	</table>
	<%@ include file="pages/page2.file" %> 

</body>
</html>