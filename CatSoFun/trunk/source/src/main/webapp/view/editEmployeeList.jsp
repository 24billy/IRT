<%@ taglib prefix="s" uri="/struts-tags"%> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Spring-4 + Struts-3 + Hibernate Integration Demo</title>
    <style>
	table.list
	{
		border-collapse:collapse;
		width: 40%;
	}
	table.list, table.list td, table.list th
	{
		border:1px solid gray;
		padding: 5px;
	}
	</style>
</head>
<body>
 
<h2>Spring-4 + Struts-3 + Hibernate Integration Demo</h2>
 
<s:form method="post" action="add">
    <table>
	    <tr>
	        <td><s:textfield key="label.firstname" name="employee.firstname"/></td> 
	    </tr>
	    <tr>
	        <td><s:textfield key="label.lastname" name="employee.lastname"/></td>
	    </tr>
	    <tr>
	        <td><s:textfield key="label.email" name="employee.email"/></td>
	    </tr>
	    <tr>
	        <td><s:textfield key="label.telephone" name="employee.telephone"/></td>
	    </tr>
	    <tr>
	        <td>
	        	<s:submit key="label.add"></s:submit>
	        </td>
	    </tr>
	</table> 
</s:form>
 
     
<h3>Employees</h3>
<c:if  test="${!empty employees}">
	<table class="list">
		<tr>
		    <th align="left">Name</th>
		    <th align="left">Email</th>
		    <th align="left">Telephone</th>
		    <th align="left">Actions</th>
		</tr>
		<c:forEach items="${employees}" var="emp">
		    <tr>
		        <td>${emp.lastname}, ${emp.firstname} </td>
		        <td>${emp.email}</td>
		        <td>${emp.telephone}</td>
		        <td><a href="delete/${emp.id}">delete</a></td>
		    </tr>
		</c:forEach>
	</table>
</c:if>
 
</body>
</html>