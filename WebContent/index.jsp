<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index Menu</title>
<link rel="stylesheet" href="./css/index.css">
</head>
<body>

	<div class="title">
		<h1>Welcome to the Index Menu!</h1>
	</div>
	<div class="title">
		<h3>Index Pages</h3>
	</div>
	
	<div class="container">
		<div class="parent">
			<div class="link">
				<a	href="<%=request.getContextPath()%>/back-end/tags/index_tags.jsp">Go to the Index_Tags.jsp</a>
			</div>
			<div class="link">
				<a	href="<%=request.getContextPath()%>/back-end/pieces/index_pieces.jsp">Go to the Index_Pieces.jsp</a>
			</div>
		</div>
		<div class="parent">
			<div class="link">
				<a href="<%=request.getContextPath()%>/back-end/bandtag/index_bandtag.jsp">Go to the Index_BandTags.jsp</a>
			</div>
			<div class="link">
				<a href="<%=request.getContextPath()%>/back-end/album/index_album.jsp">Go to the Index_Albums.jsp</a>
			</div>
		</div>
		<div class="parent">
			<div class="link">
				<a href="<%=request.getContextPath()%>/front-end/band/band_album_pieces.jsp">Go to the band_album_pieces.jsp</a>
			</div>
			<div class="link">
				<a href="<%=request.getContextPath()%>/front-end/band/band_album_pieces.jsp">Go to the band_album_pieces.jsp</a>
			</div>
		</div>
	</div>







</body>
</html>