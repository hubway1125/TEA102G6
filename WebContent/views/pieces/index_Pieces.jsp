<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="com.pieces.model.PiecesVO"%>
<jsp:useBean id="piecesSvc" scope="page"
	class="com.pieces.model.PiecesService" />
<jsp:useBean id="piecesVO" scope="page"
	class="com.pieces.model.PiecesVO" />
<%-- <% --%>
// PiecesVO piecesVO = new PiecesVO();
<%-- %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Piece</title>
<style>
h1 {
	text-align: center;
}

table, tr, th, td {
	border: 1px solid blue;
	text-align: center;
	margin: 0 auto;
}

th {
	background-color: #a4c0f4;
	color: white;
}
</style>
</head>
<body>
	<h1>作品管理</h1>
	<!-- 	錯誤表列 -->
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<!-- 	private String piece_id; -->
	<!-- 	private String album_id; -->
	<!-- 	private byte[] piece; -->
	<!-- 	private Integer piece_status; -->
	<!-- 	private Integer piece_play_count; -->
	<!-- 	private Timestamp piece_add_time; -->
	<!-- 	private Timestamp piece_last_edit_time; -->
	<!-- 	private String piece_last_editor; -->

	<ul>
		<li>
			<FORM METHOD="post"
				ACTION="<%=request.getContextPath()%>/pieces/pieces.do">
				<b>輸入作品ID (如PIECES00000):</b> <input type="text" name="piece_id">
				<input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>
		<li>
			<FORM METHOD="post"
				ACTION="<%=request.getContextPath()%>/pieces/pieces.do">
				<b>選擇作品ID:</b> <select size="1" name="piece_id">
					<c:forEach var="piecesVO" items="${piecesSvc.allPieces}">
						<option value="${piecesVO.piece_id}">${piecesVO.piece_id}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>
		<li>
			<FORM METHOD="post"
				ACTION="<%=request.getContextPath()%>/pieces/pieces.do">
				<b>輸入專輯ID (如ALBUM00000):</b> <input type="text" name="album_id">
				<input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>
		<li>
			<FORM METHOD="post"
				ACTION="<%=request.getContextPath()%>/pieces/pieces.do">
				<b>選擇專輯ID:</b> <select size="1" name="album_id">
					<c:forEach var="piecesVO" items="${piecesSvc.allPieces}">
						<option value="${piecesVO.album_id}">${piecesVO.album_id}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getAlbum_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>
		<li>
			<FORM METHOD="post"
				ACTION="<%=request.getContextPath()%>/pieces/pieces.do">
				<b>選擇作品上架狀態:</b> <select size="1" name="piece_status">
					<option value="0">上架
					<option value="1">下架
				</select> <input type="hidden" name="action" value="getStatus_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>
		<li>
			<FORM METHOD="post"
				ACTION="<%=request.getContextPath()%>/pieces/pieces.do">
				<b>選擇作品新增日期區間:</b> 
				<br> 開始日期: <input name="start_date" id="start_date" type="text"> <br>
				<br> 結束日期: <input name="end_date" id="end_date" type="text">
				</select> <input type="hidden" name="action" value="getAddTimestampRange_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>



	</ul>

	<table>
		<tr>
			<th>作品ID</th>
			<th>專輯ID</th>
			<th>作品檔案</th>
			<th>作品狀態</th>
			<th>作品總播放次數</th>
			<th>作品新增時間</th>
			<th>作品最後編輯時間</th>
			<th>作品最後編輯者</th>
			<th>修改</th>
			<th>刪除</th>
		</tr>

		<c:forEach var="piecesVO" items="${piecesSvc.allPieces}">
			<tr>
				<td>${piecesVO.piece_id}</td>
				<td>${piecesVO.album_id}</td>
				<td>${piecesVO.piece}</td>
				<td>${piecesVO.piece_status == 0 ? "下架":"上架"}</td>
				<td>${piecesVO.piece_play_count}</td>
				<td>${piecesVO.piece_add_time}</td>
				<td>${piecesVO.piece_last_edit_time}</td>
				<td>${piecesVO.piece_last_editor}</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/pieces/pieces.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="修改"> <input type="hidden"
							name=piece_id value="${piecesVO.piece_id}"> <input
							type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/pieces/pieces.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="刪除"> <input type="hidden"
							name="piece_id" value="${piecesVO.piece_id}"> <input
							type="hidden" name="action" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>


	</table>
</body>
</html>