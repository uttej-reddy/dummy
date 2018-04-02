<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List Customers</title>
<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>
<body>
	<div id="wrapper">
	<div id="header">
		<h2>Welcome To CRM Tool</h2>
	</div>
	</div>

	<div id="container">
		<div id="content">
		
		<input type="button" value="Add Customer" class="add-button"
		onclick="window.location.href='showFormAdd'; return false;"
		/>
		
		<table>
		
		<tr>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Email</th>
			<th>Action</th>
		</tr>
		
		<c:forEach var="tempCustomer" items="${customers}">
			
			<c:url var="updateLink" value="/customer/showFormForUpdate">
				<c:param name="customerId" value="${tempCustomer.id}"></c:param>
			
			</c:url>
			
			<c:url var="deleteLink" value="/customer/deleteCustomer">
				<c:param name="customerId" value="${tempCustomer.id}"></c:param>
			
			</c:url>
			
		
			<tr>
				<td>${tempCustomer.firstName}</td>
				<td>${tempCustomer.lastName}</td>
				<td>${tempCustomer.email}</td>
				<td><a href="${updateLink}">Update</a>
				|
				<a href="${deleteLink}" onclick="return confirm('Are you sure want to delete');">Delete</a>
				
				</td>
			</tr>
		
		</c:forEach>
		</table>
		</div>
	</div>
</body>
</html>