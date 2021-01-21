<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.product.model.*"%> 
<%@ page import="com.member.model.*"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	MemberVo memberVo = (MemberVo) session.getAttribute("memberVo");

	ProductService ProductSvc = new ProductService();
    List<ProductVO> list = ProductSvc.getBandListByTime(memberVo.getBandId());
    pageContext.setAttribute("list",list);
%>

<html>
<head>
<title>�Ҧ��ӫ~��� </title>
<link href="<%=request.getContextPath()%>/css/product/product.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor='white'>
<%@ include file="/front-end/header_footer/header.jsp"%>
<%@ include file="/css/member/member_center_top.file"%>
<script type="text/javascript">
alert('�w�e�X�f��');
</script>

<div align="center" style="position:relative" id="table-1">
	�Ҧ��ӫ~��� 
</div>


<div id="select" align="center">
<a href='<%=request.getContextPath()%>/front-end/product/protect/select_page.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/front-end/product/protect/select_page.jsp')">�^�ӫ~����</button></a>
<a href='<%=request.getContextPath()%>/front-end/product/protect/addProduct.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/front-end/product/protect/addProduct.jsp')">�s�W�ӫ~</button></a>
<a href='<%=request.getContextPath()%>/front-end/product/protect/listAllOrdersBandView.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/front-end/product/protect/listAllOrdersBandView.jsp')">�C�X�ӫ~�q��</button></a>
</div>
<div id="select" align="center">
<a href='<%=request.getContextPath()%>/front-end/product/protect/listAllTicketBandView.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/front-end/product/protect/listAllTicketBandView.jsp')">�C�X�����q��</button></a>
<a href='<%=request.getContextPath()%>/front-end/productphoto/protect/select_page.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/front-end/productphoto/protect/select_page.jsp')">�ӫ~�Ӥ�����</button></a>
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

<div class="table">
<table>

	<%@ include file="page1.file" %> 
	<c:forEach var="productVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
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
		<th>�馩</th>
		<th>�馩�}�l�ɶ�</th>
		<th>�馩�����ɶ�</th>
		<th>�̫�ק�ɶ�</th>
		<th>�̫�ק��</th>
		<th>�ק�</th>	
	</tr>
		<tr>
			<td>${productVO.product_id}</td>
			<td>${productVO.band_id}</td>
			<td>
			<c:choose>
			<c:when test="${productVO.product_type == 1}">
			  �W��
			</c:when>
			<c:when test="${productVO.product_type == 2}">
			  �Ǥl
			</c:when>
			<c:otherwise>
			�t��
			</c:otherwise>
			</c:choose>
			</td>
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
			<td>${productVO.product_discount}</td>
			<td><fmt:formatDate value="${productVO.product_discount_on_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td><fmt:formatDate value="${productVO.product_discount_off_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td><fmt:formatDate value="${productVO.product_last_edit_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td>${productVO.product_last_editor}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/product/product.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�" id="submit">
			     <input type="hidden" name="product_id"  value="${productVO.product_id}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>
</div>
<%@ include file="/css/member/member_center_bottom.file"%>
	<jsp:include page="/front-end/header_footer/footer.jsp" flush="true" />
</body>
</html>