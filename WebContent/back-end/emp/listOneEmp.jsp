<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%-- ���X Concroller EmpServlet.java�w�s�Jrequest��EmpVO����--%>
<%EmpVO empVO = (EmpVO) request.getAttribute("empVO");%>

<html>
<head>
<title>listOneEmp.jsp</title>

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
		 <h3>���u��� - ListOneEmp.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/emp/home.jsp">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>���u�s��</th>
		<th>���u�K�X</th>
		<th>�[�J�ɶ�</th>
		<th>�H�c</th>
		<th>������X</th>
		<th>���A</th>
		<th>�{��</th>
		<th>�̫�s��ɶ�</th>
		<th>�s��</th>
	</tr>
	<tr>
		<td><%=empVO.getEmp_id()%></td>
		<td><%=empVO.getEmp_password()%></td>
		<td><%=empVO.getEmp_add_time()%></td>
		<td><%=empVO.getEmp_mail()%></td>
		<td><%=empVO.getEmp_phone()%></td>
		<td><%=empVO.getEmp_status()%></td>
		<td><%=empVO.getEmp_auth()%></td>
		<td><%=empVO.getEmp_last_edit_time()%></td>
		<td><%=empVO.getEmp_last_editor()%></td>
	</tr>
</table>

</body>
</html>