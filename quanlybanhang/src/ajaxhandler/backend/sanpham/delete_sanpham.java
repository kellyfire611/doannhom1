package ajaxhandler.backend.sanpham;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Dispatch;

import com.db4o.ObjectContainer;

import model.D_BCHChiDoan;
import model.D_DoanKhoa;
import model.D_SanPham;
import model.D_User;
import model.PUB_Lib;
import model.T_DiaChi;
import sun.rmi.server.Dispatcher;

/**
 * Servlet implementation class edit_sanpham
 */
@WebServlet(urlPatterns = { "/admin/sanpham/delete/" })
public class delete_sanpham extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public delete_sanpham() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String task = request.getParameter("task");

		int MaSanPham = Integer.parseInt(request.getParameter("MaSanPham"));
		
		PUB_Lib conn = new PUB_Lib();
		conn.connect_cascade();
		ObjectContainer db = conn.getDb();
		D_SanPham d = new D_SanPham();
		d.delete(db, MaSanPham);
		
		response.setContentType("text/plain");
        response.getWriter().write("xoa");
        conn.closeconnect();
	}
}
