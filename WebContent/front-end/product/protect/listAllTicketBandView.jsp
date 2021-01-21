<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.event.model.*"%>  
<%@ page import="com.ticket.model.*"%>  
<%@ page import="com.eventorderlist.model.*"%>  
<%@ page import="com.product.model.*"%> 
<%@ page import="com.member.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	MemberVo memberVo = (MemberVo) session.getAttribute("memberVo");
	ProductService ProductSvc = new ProductService();
    List<EventOrderListVO> list = ProductSvc.getEOrder(memberVo.getBandId());
    pageContext.setAttribute("list",list);
    TicketVO ticketVO = (TicketVO) request.getAttribute("ticketVO");
%>
<html>
<head>
<title>�����q����</title>
<link href="<%=request.getContextPath()%>/css/product/product.css" rel="stylesheet" type="text/css">
</head>
<body>
<%-- <%@ include file="/front-end/header_footer/header.jsp"%> --%>
<%@ include file="/css/member/member_center_top.file"%>
<div align="center" style="position:relative" id="table-1">
	�����q���� 
</div>

<div id="select" align="center">
<a href='<%=request.getContextPath()%>/front-end/product/protect/select_page.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/front-end/product/protect/select_page.jsp')">�^�ӫ~����</button></a>
<a href='<%=request.getContextPath()%>/front-end/product/protect/listAllProduct.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/front-end/product/protect/listAllProduct.jsp')">�C�X�����ӫ~</button></a>
<a href='<%=request.getContextPath()%>/front-end/product/protect/addProduct.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/front-end/product/protect/addProduct.jsp')">�s�W�ӫ~</button></a>
</div>
<div id="select" align="center">
<a href='<%=request.getContextPath()%>/front-end/product/protect/listAllOrdersBandView.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/front-end/product/protect/listAllOrdersBandView.jsp')">�C�X�ӫ~�q��</button></a>
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

<div class="table" align="center">
<table>
	<%@ include file="page1.file" %> 
	<c:forEach var="eVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
<%-- 	<c:forEach var="tVO" items="${list2}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">	 --%>
	<tr>
	<jsp:useBean id="TicketSvc" scope="page"
				class="com.ticket.model.TicketService" />
		<th>����q��s��</th>
		<th>���ʽs��</th>
		<th>���ʲ���s��</th>
		<th>���رi��</th>
		<th>��i���B</th>
		<th>�`���B</th>
		<th>�Ƶ�</th>
	</tr>
		<tr>
			<td>${eVO.orderlist_id}</td>
			<td>${eVO.ticket_id}</td>
			<td>${eVO.event_order_id}</td>
			<td>${eVO.orderlist_goods_amount}</td>		
			<td>${TicketSvc.getOneTicket(eVO.ticket_id).ticket_price}</td>
			<td>${eVO.orderlist_goods_amount*TicketSvc.getOneTicket(eVO.ticket_id).ticket_price }</td>
			<td>${eVO.orderlist_remarks}</td>		
		</tr>
<%-- 	</c:forEach> --%>
	</c:forEach>
</table>
<%@ include file="page2.file" %>
</div>
<%@ include file="/css/member/member_center_bottom.file"%>
	<jsp:include page="/front-end/header_footer/footer.jsp" flush="true" />
</body>
</html>