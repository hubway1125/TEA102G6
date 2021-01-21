<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.product.model.*"%>  
<%@ page import="com.orderlist.model.*"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
ProductVO productVO = (ProductVO) request.getAttribute("productVO");
	ProductService ProductSvc = new ProductService();
    List<OrderListVO> list = ProductSvc.getOrder("BAND00000");
    pageContext.setAttribute("list",list);
%>

<html>
<head>
<title>�ֹ̼ΦC�X�ӫ~�q���� </title>
<style>
   div#table-1 {
	width: 330px;
	background-color: #dee2e6;
	font-size: 40px;
	margin-top: 10px;
	margin-bottom: 10px;
	padding: 10px 20px;
    border: 5px groove gray;
    height: 50px;
    text-align: center;
    margin:0px auto;
    color: #4f5d75;
  }
  button#searchTable{
  margin-right:8px;
  margin-left:8px;
  margin-bottom:30px;
  background-color: #dee2e6;
  border: none;
  color: #4f5d75;
  font-size: 25px;
  padding: 15px 15px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  border-radius: 15px;;
  width:190px;
  height:60px;
  }
  
  button#searchTable:hover{
  margin-right:8px;
  margin-left:8px;
  margin-bottom:30px;
  background-color: #3d5a80;
  border: none;
  color: #f8f9fa;
  font-size: 25px;
  padding: 15px 15px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  border-radius: 15px;;
  width:190px;
  height:60px;
  }
  
  div#table {
	    border-collapse: collapse;
	    margin: 0 auto;
	    text-align: center;
	    padding-top: 10px;
	}
	table th
	{
	    border: 2px solid #cad9ea;
	    color: #012a4a;
	    text-align: center;
	    height: 45px;
	    font-size: 18px;
	    word-wrap:break-word;
	    table-layout:fixed
	}
	table td
	{
	    border: 2px solid #cad9ea;
	    color: #012a4a;
	    text-align: center;
	    height: 30px;
	    font-size: 14px;
	    word-wrap:break-word;
	    table-layout:fixed
	}
	table thead th
	{
	    background-color: #CCE8EB;
	    text-align: center;
	    width: 100px;
	    word-wrap:break-word;
	    table-layout:fixed
	}
	table tr:nth-child(odd)
	{
	    background: #fff;
	    text-align: center;
	    word-wrap:break-word;
	    table-layout:fixed
	}
	table tr:nth-child(even)
	{
	    background: #E1F6FF;
	    text-align: center;
	    word-wrap:break-word;
	    table-layout:fixed
	}
  #submit{
  background-color:#c0d6df;
  color:#012a4a;
  font-size: 14px;
  }
  #submit:hover{
  background-color:#3d5a80;
  color:#f8f9fa;
  font-size: 14px;
  }
</style>

</head>
<body bgcolor='white'>

<div align="center" style="position:relative" id="table-1">
	�q����TEST
</div>

<div align="center" style="position:relative;top:10px;bottom: 10px;">
<a href='<%=request.getContextPath()%>/front-end/product/select_page.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/front-end/product/select_page.jsp')">�^�ӫ~����</button></a>
<a href='<%=request.getContextPath()%>/front-end/product/addProduct.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/front-end/product/addProduct.jsp')">�s�W�ӫ~</button></a>
<a href='<%=request.getContextPath()%>/front-end/orders/listAllOrdersBandView.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/front-end/orders/listAllOrdersBandView.jsp')">�C�X�ӫ~�q��</button></a>
<a href='<%=request.getContextPath()%>/front-end/orders/listAllTicketBandView.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/front-end/orders/listAllTicketBandView.jsp')">�C�X�����q��</button></a>
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

<div class="table" >
<table width = "100%">
	<tbody>
	<tr>
		<th>�q����ӽs��</th>
		<th>�q��s��</th>
		<th>�ӫ~�s��</th>
		<th>�ӫ~�ƶq</th>
		<th>�Ƶ�</th>
		<th>�����P��</th>
		<th>���y</th>
		<th>�����ɶ�</th>
		<th>���B</th>			
	</tr>
	</tbody>
	<%@ include file="page1.file" %> 
<%-- 	<jsp:useBean id="p" class="com.product.model.ProductVO"></jsp:useBean> --%>
<%-- 	<jsp:useBean id="o" class="com.orderlist.model.OrderListVO"></jsp:useBean> --%>
	<c:forEach var="ol" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr>
			<td>${ol.orderlist_id}</td>
			<td>${ol.order_id}</td>
			<td>${ol.product_id}</td>
			<td>${ol.orderlist_goods_amount}</td>
			<td>${ol.orderlist_remarks}</td>
			<td>${ol.review_score}</td>
			<td>${ol.review_msg}</td>
			<td>${ol.review_time}</td>
			<td>${ol.price}</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>
</div>

</body>
</html>