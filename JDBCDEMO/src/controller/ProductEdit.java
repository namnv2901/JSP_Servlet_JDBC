package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProductEdit
 */
@WebServlet("/ProductEdit")
public class ProductEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductEdit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection cnn = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			cnn = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:namnv", "qltk",
					"123456");
			
			String sql = "UPDATE PRODUCT set PRODUCTNAME=?, DESCRIPTION=?, PRICE=? WHERE ID=?";
	
			
			PreparedStatement ps = cnn.prepareStatement(sql);
			ps.setString(1, request.getParameter("txtName"));
			ps.setString(2, request.getParameter("txtDescription"));
			ps.setString(3, request.getParameter("txtPrice"));
			ps.setString(4, request.getParameter("txtId"));
			
			int result = ps.executeUpdate();
			
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("location", "index.jsp");


		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

}
