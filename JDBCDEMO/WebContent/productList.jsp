<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="ProductList" method="post">
		Name: <input type="text" name="txtName" value="${param.txtName }" /> <input type="submit" value="Search" />
		<table style="width: 800px;">
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Description</th>
				<th>Price</th>
				<th></th>
			</tr>
			<c:forEach var="item" items="${products }">
				<tr>
					<td>${item.id }</td>
					<td>${item.productName }</td>
					<td>${item.description }</td>
					<td>${item.price }</td>
					<td><a href="productEdit.jsp?id=${item.id }">Edit</a></td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>