<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.product.model.*"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	ProductService ProductSvc = new ProductService();
    List<ProductVO> list = ProductSvc.getUnapproval();
    pageContext.setAttribute("list",list);
%>

<html>
<head>
<title>�Ҧ��ݼf�ְӫ~���</title>
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
 <style>
	.nowrap {
	   white-space:nowrap;
	}
 </style>
</head>
<body bgcolor='white'>
<%@ include file="/back-end/sb/page1.file" %>
<div align="center" style="position:relative" id="table-1">
	�ݼf�ְӫ~��� 
</div>

<div align="center" id="select">
<%-- <a href='<%=request.getContextPath()%>/back-end/product/protect/select_page.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/back-end/product/protect/select_page.jsp')">�^��x�ӫ~����</button></a> --%>
<%-- <a href='<%=request.getContextPath()%>/back-end/product/protect/listAllProductManagement.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/back-end/product/protect/listAllProductManagement.jsp')">�C�X�����ӫ~</button></a> --%>
<%-- <a href='<%=request.getContextPath()%>/back-end/product/protect/listAllOrdersMView.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/back-end/product/protect/listAllOrdersMView.jsp')">�C�X�ӫ~�q��</button></a> --%>
<!-- </div> -->
<!-- <div align="center" id="select"> -->
<%-- <a href='<%=request.getContextPath()%>/back-end/product/protect/listAllTicketBandView.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/back-end/product/protect/listAllTicketBandView.jsp')">�C�X�����q��</button></a> --%>
<%-- <a href='<%=request.getContextPath()%>/back-end/productphoto/listAllProductPhoto.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/back-end/productphoto/listAllProductPhoto.jsp')">�C�X�ӫ~�Ӥ�</button></a> --%>
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

<%@ include file="page1.file" %> 
<div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered nowrap"  id="dataTable" cellspacing="0">
                <thead>
					<tr>
						<th>�ӫ~�s��</th>
						<th>�ֹνs��</th>
						<th>�ӫ~����</th>
						<th>�ӫ~�W��</th>
						<th>�ӫ~²��</th>
						<th>�ӫ~�Բӻ���</th>
						<th>�ӫ~���</th>
						<th>�ӫ~�w�s�q</th>
						<th>�f�֪��A</th>
						<th>�W�U�[���A</th>
						<th>�w�p�W�[�ɶ�</th>
						<th>�w�p�U�[�ɶ�</th>
						<th>����ɶ�</th>
						<th>�馩</th>
						<th>�馩�}�l�ɶ�</th>
						<th>�馩�����ɶ�</th>
						<th>�̫�ק�ɶ�</th>
						<th>�̫�ק��</th>
						<th>�f��</th>
					</tr>
			</thead>
			<c:forEach var="productVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
			<tbody>
				<tr>
					<td>${productVO.product_id}</td>
					<td>${productVO.band_id}</td>
					<td><c:choose>
					<c:when test="${productVO.product_type == 1}">
					  �W��
					</c:when>
					<c:when test="${productVO.product_type == 2}">
					  �Ǥl
					</c:when>
					<c:otherwise>
					�t��
					</c:otherwise>
					</c:choose></td>
					<td>${productVO.product_name}</td>
					<td>${productVO.product_intro}</td>
					<td>${productVO.product_detail}</td>
					<td>${productVO.product_price}</td>
					<td>${productVO.product_stock}</td>
					<td>
					<c:choose>
					<c:when test="${productVO.product_check_status == 1}">
					  �w�f��
					</c:when>
					<c:otherwise>
					�ݼf��
					</c:otherwise>
					</c:choose>
					</td>
					<td>
					<c:choose>
					<c:when test="${productVO.product_status == 1}">
					  �W�[
					</c:when>
					<c:otherwise>
					�U�[
					</c:otherwise>
					</c:choose>
					</td>
					<td><fmt:formatDate value="${productVO.product_on_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td><fmt:formatDate value="${productVO.product_off_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td><fmt:formatDate value="${productVO.product_add_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td>${productVO.product_discount}</td>
					<td><fmt:formatDate value="${productVO.product_discount_on_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td><fmt:formatDate value="${productVO.product_discount_off_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td><fmt:formatDate value="${productVO.product_last_edit_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td>${productVO.product_last_editor}</td>
					<td>
					  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product.do" style="margin-bottom: 0px;">
					     <input type="submit" value="�I���T�{�f��" id="submit2" class="approval_btn">
					     <input type="hidden" name="product_id"  value="${productVO.product_id}">
					     <input type="hidden" name="action"	value="approval"></FORM>
					</td>
				</tr>
			</tbody>	
	</c:forEach>
</table>
<script
		src="<%=request.getContextPath()%>/vendors/sb-admin-2/vendor/jquery/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/vendors/sb-admin-2/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script>
		$(function(){
			$(document).on("click", ".approval_btn", function(){
				alert("�w�����f��");
			})
		})	
	</script>
<%@ include file="page2.file" %>
<%@ include file="/back-end/sb/page2.file" %>
</body>
</html>