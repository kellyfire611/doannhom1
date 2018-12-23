package ajaxhandler.backend.donhang;

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
import model.D_DonHang;
import model.D_User;
import model.PUB_Lib;
import model.T_DiaChi;
import sun.rmi.server.Dispatcher;

/**
 * Servlet implementation class edit_donhang
 */
@WebServlet(urlPatterns = { "/admin/donhang/delete/" })
public class delete_donhang extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public delete_donhang() {
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

		int MaDonHang = Integer.parseInt(request.getParameter("MaDonHang"));
		
		PUB_Lib conn = new PUB_Lib();
		conn.connect_cascade();
		ObjectContainer db = conn.getDb();
		D_DonHang d = new D_DonHang();
		d.delete(db, MaDonHang);
		
		response.setContentType("text/plain");
        response.getWriter().write("xoa");
        conn.closeconnect();
	}
}
