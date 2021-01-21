<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>

<%
  EmpVO empVO = (EmpVO) request.getAttribute("empVO"); //EmpServlet.java (Concroller) �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
%>
<% 
	java.sql.Timestamp Emp_add_time = null;
  try {
	  Emp_add_time = empVO.getEmp_add_time();
   } catch (Exception e) {
	   Emp_add_time = new java.sql.Timestamp(System.currentTimeMillis());
   }
%>

<% 
	java.sql.Timestamp Emp_last_edit_time = null;
  try {
	  Emp_last_edit_time = empVO.getEmp_last_edit_time();
   } catch (Exception e) {
	   Emp_last_edit_time = new java.sql.Timestamp(System.currentTimeMillis());
   }
%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>���u��ƭק� - update_emp_input.jsp</title>

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
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>���u��ƭק� - update_emp_input.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/emp/home.jsp">�^����</a></h4>
	</td></tr>
</table>

<h3>��ƭק�:</h3>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/EmpServlet" name="form1">
<table>
	<tr>
		<td>���u�s��:<font color=red><b>*</b></font></td>
		<td><%=empVO.getEmp_id()%></td>
	</tr>
	<tr>
		<td>���u�K�X:</td>
		<td><input type="TEXT" name="emp_password" size="45"
								 value="<%=empVO.getEmp_password()%>" /></td> 
	</tr>
	<tr>
		<td>���Τ��:</td>
		<td><input name="emp_add_time" id="f_date1" type="text"></td>
	</tr>
	<tr>
		<td>�H�c:</td>
		<td><input type="TEXT" name="emp_mail" size="45" value="<%=empVO.getEmp_mail()%>" /></td>
	</tr>
	<tr>
		<td>���:</td>
		<td><input type="TEXT" name="emp_phone" size="45" value="<%=empVO.getEmp_phone()%>" /></td>
	</tr>
	<tr>
		<td>���u���A:</td>
		<td><input type="TEXT" name="emp_status" size="45" value="<%=empVO.getEmp_status()%>" /></td>
	</tr>
	<tr>
		<td>���u�{��:</td>
		<td><input type="TEXT" name="emp_auth" size="45" value="<%=empVO.getEmp_auth()%>" /></td>
	</tr>
	<tr>
		<td>�s��:</td>
		<td><input type="TEXT" name="emp_last_editor" size="45" 
							value="<%=empVO.getEmp_last_editor()%>" /></td>
	</tr>

	

</table>
<br>
<input type="hidden" name="emp_last_edit_time" value="<%=Emp_last_edit_time%>">
<input type="hidden" name="action" value="update">
<input type="hidden" name="emp_id" value="<%=empVO.getEmp_id()%>">
<input type="submit" value="�e�X�ק�"></FORM>
</body>



<!-- =========================================�H�U�� datetimepicker �������]�w========================================== -->


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/back-end/emp/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/back-end/emp/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/back-end/emp/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=Emp_add_time%>',
        });
</script>
</html>