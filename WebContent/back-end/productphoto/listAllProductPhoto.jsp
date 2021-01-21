<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.productphoto.model.*"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	ProductPhotoService ProductPhotoSVC = new  ProductPhotoService();
	List<ProductPhotoVO> list =	ProductPhotoSVC.getAll();
	pageContext.setAttribute("list",list);
%>

<html>
<head>
<title>�Ҧ��Ӥ����</title>
<link href="<%=request.getContextPath()%>/css/product/product.css" rel="stylesheet" type="text/css">
<link
 href="<%=request.getContextPath()%>/vendors/sb-admin-2/vendor/fontawesome-free/css/all.min.css"
 rel="stylesheet" type="text/css">
<link
 href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
 rel="stylesheet">

<!-- Custom styles for this template -->
<link
 href="<%=request.getContextPath()%>/vendors/sb-admin-2/css/sb-admin-2.min.css"
 rel="stylesheet">

<!-- Custom styles for this page -->
<link
 href="<%=request.getContextPath()%>/vendors/sb-admin-2/vendor/datatables/dataTables.bootstrap4.min.css"
 rel="stylesheet">
</head>
<body bgcolor='white'>
<%@ include file="/back-end/sb/page1.file" %>
<div align="center" style="position:relative" id="table-1">
	�Ҧ��Ӥ���� 
</div>

<div align="center" id="select">
<a href='<%=request.getContextPath()%>/back-end/product/protect/select_page.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/back-end/product/protect/select_page.jsp')">�^��x�ӫ~����</button></a>
<a href='<%=request.getContextPath()%>/back-end/product/protect/listAllProductManagement.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/back-end/product/listAllProductManagement.jsp')">�C�X�����ӫ~</button></a>
<a href='<%=request.getContextPath()%>/back-end/product/protect/listAllProductUnapproval.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/back-end/product/listAllProductUnapproval.jsp')">��x�ӫ~�f��</button></a>
</div>
<div align="center" id="select">
<a href='<%=request.getContextPath()%>/back-end/product/protect/listAllOrdersMView.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/back-end/orders/listAllOrdersMView.jsp')">�C�X�ӫ~�q��</button></a>
<a href='<%=request.getContextPath()%>/back-end/product/protect/listAllTicketBandView.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/back-end/orders/listAllTicketBandView.jsp')">�C�X�����q��</button></a>
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

<table width=75% >
	<tr>
		<th>�Ӥ��s��</th>
		<th>�ӫ~�s��</th>
		<th>�Ӥ��ɮ�</th>
		<th>�Ƨ�</th>
		<th>�W�Ǯɶ�</th>
		<th>�R��</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="productPhotoVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr>
			<td>${productPhotoVO.productphoto_id}</td>
			<td>${productPhotoVO.product_id}</td>			
			<td><img src="<%=request.getContextPath()%>/ShowProductPhoto?productphoto_id=${productPhotoVO.productphoto_id}"  height="180" width="180"></img></td>
			<td>${productPhotoVO.productphoto_sort}</td>
			<td><fmt:formatDate value="${productPhotoVO.productphoto_add_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/productphoto/productphoto.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�R��" id="submit2">
			     <input type="hidden" name="productphoto_id"  value="${productPhotoVO.productphoto_id}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>
<%@ include file="/back-end/sb/page2.file" %>
</body>
</html>