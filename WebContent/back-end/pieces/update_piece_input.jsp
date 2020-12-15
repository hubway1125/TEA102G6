<%@page import="com.tags.model.TagsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>作品資料修改 - update_piece_input.jsp</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/pieces/update_piece_input.css">
</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td>
				<h3>作品資料修改 - update_piece_input.jsp</h3>
				<h4>
					<a href="<%=request.getContextPath()%>/back-end/pieces/index_pieces.jsp"><img
						src="<%=request.getContextPath()%>/images/back1.gif" width="100" height="32" border="0">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>資料修改:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="pieces.do" name="form1">
		<table>
			<tr>
				<td>piece_id:</font></td>
				<td>${piecesVO.piece_id}</td>
			</tr>
			<tr>
				<td>album_id:</td>
				<td><input type="TEXT" name="album_id" size="45"
					value="${piecesVO.album_id}" /></td>
			</tr>
				<tr>
				<td>piece:</td>
				<td><input type="file" name="piece" size="45"
					value="" /></td>
			</tr>
				<tr>
				<td>piece_status:</td>
				<td>
				<select name="piece_status">
					<option ${piecesVO.piece_status==0?"selected":""} value="0">下架</option>
					<option ${piecesVO.piece_status==1?"selected":""} value="1">上架</option>
				</select>
				</td>
			</tr>
				<tr>
				<td>piece_play_count:</td>
				<td><input type="TEXT" readonly name="piece_play_count" size="45"
					value="${piecesVO.piece_play_count}" /></td>
			</tr>
			<tr>
				<td>piece_add_time:</td>
				<td><fmt:formatDate
								value="${piecesVO.piece_add_time}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
			</tr>
			<tr>
				<td>piece_last_edit_time:</td>
				<td><fmt:formatDate
								value="${piecesVO.piece_last_edit_time}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
			</tr>
					<tr>
				<td>piece_last_editor:</td>
				<td><input type="TEXT" readonly name="piece_last_editor" size="45"
					value="${piecesVO.piece_last_editor}" /></td>
			</tr>
		</table>

		<br> <input type="hidden" name="action" value="update"> <input
			type="hidden" name="piece_id" value="${piecesVO.piece_id}"> <input
			type="submit" value="送出修改">
	</FORM>

</body>
</html>