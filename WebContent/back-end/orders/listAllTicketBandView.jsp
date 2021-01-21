<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.event.model.*"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	EventService EventSvc = new EventService();
    List<EventVO> list = EventSvc.getAll();
    pageContext.setAttribute("list",list);
%>
<html>
<head>
<title>�����q����</title>

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
  img{
  width: 100px;
  height: 100px;
  }
</style>
</head>

<div align="center" style="position:relative" id="table-1">
	�����q���� 
</div>

<div align="center" style="position:relative;top:10px;bottom: 10px;">
<a href='<%=request.getContextPath()%>/back-end/product/select_page.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/back-end/product/select_page.jsp')">�^�ӫ~����</button></a>
<a href='<%=request.getContextPath()%>/back-end/product/listAllProductManagement.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/back-end/product/listAllProductManagement.jsp')">�C�X�����ӫ~</button></a>
<a href='<%=request.getContextPath()%>/back-end/product/listAllProductUnapproval.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/back-end/product/listAllProductUnapproval.jsp')">�ӫ~�f��</button></a>
<a href='<%=request.getContextPath()%>/back-end/orders/listAllOrdersMView.jsp'><button id="searchTable" onclick="window.location.href('<%=request.getContextPath()%>/back-end/orders/listAllOrdersMView.jsp')">�C�X�ӫ~�q��</button></a>
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
	<tbody>
	<tr>
		<th>���ʽs��</th>
		<th>�ֹνs��</th>
		<th>��������</th>
		<th>���ʱƧ�</th>
		<th>���ʼ��D</th>
		<th>���ʸԱ�</th>
		<th>���ʮ���</th>
		<th>���ʰϰ�</th>
		<th>���ʳ��a</th>
		<th>���ʿ���</th>
		<th>���ʿ�������</th>
		<th>���ʦa�}</th>
		<th>���ʶ}�l�ɶ�</th>
		<th>���ʤW�[�ɶ�</th>
		<th>�̫�ק�ɶ�</th>
		<th>�̫�ק��</th>
		<th>���ʪ��A</th>
		<th>�y���</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="eventVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${eventVO.event_id}</td>
			<td>${eventVO.band_id}</td>
			<td>${eventVO.event_type}</td>
			<td>${eventVO.event_sort}</td>
			<td>${eventVO.event_title}</td>
			<td>${eventVO.event_detail}</td>
			<td><img src="<%=request.getContextPath()%>/EventPicController?action=getEventPoster&event_id=${eventVO.event_id}"></td>
			<td>${eventVO.event_area}</td>
			<td>${eventVO.event_place}</td>
			<td>${eventVO.event_city}</td>
			<td>${eventVO.event_cityarea}</td>
			<td>${eventVO.event_address}</td>
			<td>${eventVO.event_start_time}</td>
			<td>${eventVO.event_on_time}</td>
			<td>${eventVO.event_last_edit_time}</td>
			<td>${eventVO.event_last_editor}</td>
			<td>${eventVO.event_status}</td>
			<td><img src="<%=request.getContextPath()%>/EventPicController?action=getEventSeat&event_id=${eventVO.event_id}"></td>	
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>
</div>

</body>
</html>