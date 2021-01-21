<%@page import="java.util.List"%>
<%@page import="com.productphoto.model.ProductPhotoVO"%>
<%@page import="com.productphoto.model.ProductPhotoService"%>
<%@ page import="com.member.model.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	MemberVo memberVo = (MemberVo) session.getAttribute("memberVo");
	if (memberVo == null) {
		response.sendRedirect(request.getContextPath() + "/front-end/member/Login.jsp");
	} ;
%>
<html>
<head>
<title>�ӫ~�Ӥ�����</title>
<link href="<%=request.getContextPath()%>/css/product/product.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor='white'>
	<%@ include file="/front-end/header_footer/header.jsp"%>
	<%@ include file="/css/member/member_center_top.file"%>
<div align="center" style="position:relative" id="table-1">
   �ӫ~�Ӥ�����
</div>

<div align="center" id="select">
<a href='<%=request.getContextPath()%>/front-end/product/protect/select_page.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/front-end/product/protect/select_page.jsp')">�^�ֹΰӫ~����</button></a>
<a href='<%=request.getContextPath()%>/front-end/productphoto/protect/listAllProductPhoto.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/front-end/productphoto/protect/listAllProductPhoto.jsp')">�Ҧ��Ӥ����</button></a>
<a href='<%=request.getContextPath()%>/front-end/productphoto/protect/addProductPhoto_input.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/front-end/productphoto/protect/addProductPhoto_input.jsp')">�s�W�ӫ~�Ӥ�</button></a>
</div>
	
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<%@ include file="/css/member/member_center_bottom.file"%>
<jsp:include page="/front-end/header_footer/footer.jsp" flush="true" />
</body>
</html>