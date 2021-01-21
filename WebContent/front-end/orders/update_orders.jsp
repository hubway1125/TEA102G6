<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.orders.model.*"%>
<%@ page import="static com.orders.controller.OrdersServlet.UPDATE_VO"%>

<%
	OrdersVO ordersVO = (OrdersVO) request.getAttribute(UPDATE_VO); //OrdersServlet.java (Concroller) �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>�q���ƭק�</title>

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
		<tr>
			<td>
				<h3>�q���ƭק�</h3>
				<h4>
					<a
						href="<%=request.getContextPath()%>/front_end/orders/select_page.jsp">�^����</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>��ƭק�:</h3>

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post"
		ACTION="${pageContext.request.contextPath}/orders/ordersServlet"
		name="form1">
		<table>
			<tr>
				<td>�q��s��:<font color=red><b>*</b></font></td>
				<td><%=ordersVO.getOrder_id()%>
				<input type="hidden" name="order_id" value="<%=ordersVO.getOrder_id()%>"></td>
			</tr>
			<tr>
				<td>�|���s��:<font color=red><b>*</b></font></td>
				<td><%=ordersVO.getMember_id()%>
				<input type="hidden" name="member_id" value="<%=ordersVO.getMember_id()%>"></td>
			</tr>
			<tr>
				<td>�q�檬�A:</td>
				<td><select name="order_status">
						<option value="0">�B�z��</option>
						<option value="1">�w�X�f</option>
						<option value="2">�����b</option>
				</select></td>
			</tr>
			<tr>
				<td>�U����:<font color=red><b>*</b></font></td>
				<td><%=ordersVO.getOrder_place_time()%>
				<input type="hidden" name="order_place_time" value="<%=ordersVO.getOrder_place_time()%>"></td>
			</tr>
			<tr>
				<td>�R�a�W��:</td>
				<td><input type="TEXT" name="order_name" size="45"
					value="<%=ordersVO.getOrder_name()%>" /></td>
			</tr>
			<tr>
				<td>�R�a�H�c:</td>
				<td><input type="TEXT" name="order_mail" size="45"
					value="<%=ordersVO.getOrder_mail()%>" /></td>
			</tr>
			<tr>
				<td>�R�a�q��:</td>
				<td><input type="TEXT" name="order_phone" size="45"
					value="<%=ordersVO.getOrder_phone()%>" /></td>
			</tr>

			<tr>
				<td>�B�e�ɶ�:</td>
				<td><input type="TEXT" name="order_delivery_time"
					id="delivery_time" size="45"
					value="<%=ordersVO.getOrder_delivery_time()%>" /></td>
			</tr>

			<tr>
				<td>����ɶ�:</td>
				<td><input type="TEXT" name="order_received_time"
					id="received_time" size="45"
					value="<%=ordersVO.getOrder_received_time()%>" /></td>
			</tr>


			<%-- 	<jsp:useBean id="deptSvc" scope="page" class="com.dept.model.DeptService" /> --%>
			<!-- 	<tr> -->
			<!-- 		<td>����:<font color=red><b>*</b></font></td> -->
			<!-- 		<td><select size="1" name="deptno"> -->
			<%-- 			<c:forEach var="deptVO" items="${deptSvc.all}"> --%>
			<%-- 				<option value="${deptVO.deptno}" ${(empVO.deptno==deptVO.deptno)?'selected':'' } >${deptVO.dname} --%>
			<%-- 			</c:forEach> --%>
			<!-- 		</select></td> -->
			<!-- 	</tr> -->

		</table>
		<br> <input type="hidden" name="action" value="update"> <input
			type="hidden" name="update" value="<%=ordersVO.getOrder_id()%>">
		<input type="submit" value="�e�X�ק�">
	</FORM>
</body>



<!-- =========================================�H�U�� datetimepicker �������]�w========================================== -->

<%
	java.sql.Timestamp order_delivery_time = null;
	try {
		order_delivery_time = ordersVO.getOrder_delivery_time();
	} catch (Exception e) {
		order_delivery_time = new java.sql.Timestamp(System.currentTimeMillis());
	}
%>

<%
	java.sql.Timestamp order_received_time = null;
	try {
		order_received_time = ordersVO.getOrder_received_time();
	} catch (Exception e) {
		order_received_time = new java.sql.Timestamp(System.currentTimeMillis());
	}
%>


<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>

<script>
$.datetimepicker.setLocale('zh');
$("#delivery_time").datetimepicker({
     theme: '',              //theme: 'dark',
     timepicker:true,       //timepicker:true,
     step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
     format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
     value: '<%=order_delivery_time%>'
   //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
   //startDate:	            '2017/07/10',  // �_�l��
   //minDate:               '-1970-01-01', // �h������(���t)���e
   //maxDate:               '+1970-01-01'  // �h������(���t)����
});

$.datetimepicker.setLocale('zh');
$("#received_time").datetimepicker({
     theme: '',              //theme: 'dark',
     timepicker:true,       //timepicker:true,
     step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
     format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
	   value: '<%=order_received_time%>'
	
	//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
	//startDate:	            '2017/07/10',  // �_�l��
	//minDate:               '-1970-01-01', // �h������(���t)���e
	//maxDate:               '+1970-01-01'  // �h������(���t)����
	});

	// ----------------------------------------------------------�H�U�ΨӱƩw�L�k��ܪ����-----------------------------------------------------------

	//      1.�H�U���Y�@�Ѥ��e������L�k���
	//      var somedate1 = new Date('2017-06-15');
	//      $('#f_date1').datetimepicker({
	//          beforeShowDay: function(date) {
	//        	  if (  date.getYear() <  somedate1.getYear() || 
	//		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
	//		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
	//              ) {
	//                   return [false, ""]
	//              }
	//              return [true, ""];
	//      }});

	//      2.�H�U���Y�@�Ѥ��᪺����L�k���
	//      var somedate2 = new Date('2017-06-15');
	//      $('#f_date1').datetimepicker({
	//          beforeShowDay: function(date) {
	//        	  if (  date.getYear() >  somedate2.getYear() || 
	//		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
	//		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
	//              ) {
	//                   return [false, ""]
	//              }
	//              return [true, ""];
	//      }});

	//      3.�H�U����Ӥ�����~������L�k��� (�]�i���ݭn������L���)
	//      var somedate1 = new Date('2017-06-15');
	//      var somedate2 = new Date('2017-06-25');
	//      $('#f_date1').datetimepicker({
	//          beforeShowDay: function(date) {
	//        	  if (  date.getYear() <  somedate1.getYear() || 
	//		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
	//		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
	//		             ||
	//		            date.getYear() >  somedate2.getYear() || 
	//		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
	//		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
	//              ) {
	//                   return [false, ""]
	//              }
	//              return [true, ""];
	//      }});
</script>



</html>