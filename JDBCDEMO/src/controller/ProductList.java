package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.JDBCConnection;
import entities.Product;

/**
 * Servlet implementation class ProductList
 */
@WebServlet("/ProductList")
public class ProductList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private List<Product> products;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		JDBCConnection jdbc = new JDBCConnection();
		Connection connection;
		try {
			connection = jdbc.getConnection();
			if (connection != null) {
				String productName = request.getParameter("txtName");
				this.getAllProduct(connection, productName);
				request.setAttribute("products", products);
				request.getRequestDispatcher("productList.jsp").forward(request, response);
			} else {
				PrintWriter out = response.getWriter();
				out.print("Connection fail!");;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private List<Product>getAllProduct(Connection connect, String productName) throws SQLException {
		products = new ArrayList<>();
		StringBuilder sql = new StringBuilder("SELECT * FROM PRODUCT WHERE 1=1");
		if (productName != null 
				&& !"".equals(productName)) {
			sql.append(" AND PRODUCTNAME LIKE ?");
		}
		PreparedStatement ps = connect.prepareStatement(sql.toString());
		if (productName != null 
				&& !"".equals(productName)) {
			ps.setString(1, "%"+productName+"%");
		}
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Product obj = new Product();
			obj.setId(rs.getInt("ID"));
			obj.setProductName(rs.getString("PRODUCTNAME"));
			obj.setDescription(rs.getString("DESCRIPTION"));
			obj.setPrice(rs.getFloat("PRICE"));
			products.add(obj);
		}
		return products;
	}
}
