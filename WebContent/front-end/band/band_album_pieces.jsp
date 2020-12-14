<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List" %>
<jsp:useBean id="bandSvc" scope="page" class="com.band.model.BandService"></jsp:useBean>
<jsp:useBean id="albumSvc" scope="page" class="com.album.model.AlbumService"></jsp:useBean>
<jsp:useBean id="piecesSvc" scope="page" class="com.pieces.model.PiecesService"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Band_Album_Pieces</title>
</head>
<style>
	img.small{
		width: 200px;
	}
</style>
<body>
<ol>
<% String band_id = "BAND00250"; request.setAttribute("band_id", band_id); %>
	<li>band banner</li>
	<img class="small" src="<%=request.getContextPath()%>/band/getBandBanner.do?band_id=${band_id}">
	<li>band photo</li>
	<img class="small" src="<%=request.getContextPath()%>/band/getBandPhoto.do?band_id=${band_id}">
	<li>band intro</li>
	${bandSvc.getOneBand(band_id).band_intro}
	<li>band pieces amount</li>
	<li>band fans amount</li>
	<li>album photo</li>
	<c:forEach var="albumVO" items="${albumSvc.allAlbums}">
		<c:if test="${albumVO.band_id == band_id}">
			<img class="small" src="<%=request.getContextPath()%>/band/getAlbumPhoto.do?album_id=${albumVO.album_id}">
		</c:if>
	</c:forEach>
	<li>album name</li>${bandSvc.getOneBand(band_id).band_name}
	<li>album intro</li>${bandSvc.getOneBand(band_id).band_intro}
	<li>all albums</li>
	<c:forEach var="albumVO" items="${albumSvc.allAlbums}">
		<c:if test="${albumVO.band_id == band_id}">
			${albumVO.album_name}<br>
		</c:if>
	</c:forEach>
	<li>pieces names</li>
	<c:forEach var="albumVO" items="${albumSvc.allAlbums}">
		<c:if test="${albumVO.band_id == band_id}">
			<c:forEach var="piecesVO" items="${piecesSvc.allPieces}">
				<c:if test="${piecesVO.album_id == albumVO.album_id}">
					${piecesVO.piece_id} 狀態:${piecesVO.piece_status==0?"下架":"上架"}<br>
<%-- 					<audio src="<%=request.getContextPath()%>/pieces/getPiece.do?piece_id=${piecesVO.piece_id}"></audio> --%>
					<audio controls autoplay loop>
					<source src="<%=request.getContextPath()%>/pieces/getPiece.do?piece_id=${piecesVO.piece_id}" type="audio/mpeg">
					</audio>
				</c:if>
			</c:forEach>
		</c:if>
	</c:forEach>
	<li>pieces</li>
</ol>

</body>
</html>