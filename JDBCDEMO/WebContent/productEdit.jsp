<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@page import="entities.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%
		Connection cnn = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			cnn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:namnv", "qltk",
					"123456");
			
			String sql = "SELECT * FROM PRODUCT WHERE ID = ?";
			
			PreparedStatement ps = cnn.prepareStatement(sql);
			ps.setString(1, request.getParameter("id"));
			
			ResultSet rs = ps.executeQuery();

			Product obj = new Product();

			if (rs.next()) {
				
				obj.setId(rs.getInt("ID"));
				obj.setProductName(rs.getString("PRODUCTNAME"));
				obj.setDescription(rs.getString("DESCRIPTION"));
				obj.setPrice(rs.getFloat("PRICE"));

			}

			request.setAttribute("product", obj);

		} catch (Exception ex) {
			ex.printStackTrace();
		}
	%>
<body>
<form action="ProductEdit" method="post">
	<input type="hidden" name='txtId' value="${product.id }" /> 
	Name: <input type="text" value="${product.productName }" name="txtName" /> <br>
	Description: <input type="text" value="${product.description }" name="txtDescription" /> <br>
	Price: <input type="text" name="txtPrice" value="${product.price }" /> <br>
	<input type="submit" value="Save" />
</form>
</body>
</html>