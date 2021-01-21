<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.favorites.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%-- ���X Concroller EmpServlet.java�w�s�Jrequest��EmpVO����--%>
<%FavoritesVO favoritesVO = (FavoritesVO) request.getAttribute("favoritesVO");%>

<html>
<head>
<title>listOneFavorites.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }

</style>

<style>
  table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>�|���̷R - ListOneFavorites.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/favorites/F_home.jsp">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>����</th>
		<th>�|���s��</th>
		<th>��������</th>
		<th>���ýs��</th>
		<th>�[�J�ɶ�</th>
	</tr>
	<tr>
		<td><%=favoritesVO.getUniqueid()%></td>
		<td><%=favoritesVO.getMember_id()%></td>
		<td><%=favoritesVO.getFavorite_type()%></td>
		<td><%=favoritesVO.getFavorite_id()%></td>
		<td><%=favoritesVO.getFavorite_add_time()%></td>
		
	</tr>
</table>

</body>
</html>