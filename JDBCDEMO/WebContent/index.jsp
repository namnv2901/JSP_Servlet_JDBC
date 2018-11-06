<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@page import="entities.*"%>
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
	<%
		Connection cnn = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			cnn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:namnv", "qltk",
					"123456");
			
			String sql = "SELECT * FROM PRODUCT";
			if (request.getParameter("txtName") != null) {
				sql += " WHERE PRODUCTNAME LIKE ?";
			}
			
			PreparedStatement ps = cnn.prepareStatement(sql);
			if (request.getParameter("txtName") != null) {
				ps.setString(1, "%"+request.getParameter("txtName")+"%");
			}
			ResultSet rs = ps.executeQuery();

			List<Product> products = new ArrayList<Product>();

			while (rs.next()) {
				Product obj = new Product();
				obj.setId(rs.getInt("ID"));
				obj.setProductName(rs.getString("PRODUCTNAME"));
				obj.setDescription(rs.getString("DESCRIPTION"));
				obj.setPrice(rs.getFloat("PRICE"));

				products.add(obj);
			}

			request.setAttribute("products", products);

		} catch (Exception ex) {
			ex.printStackTrace();
		}
	%>
	<form action="index.jsp" method="get">
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