package ajaxhandler.backend.bacao.doanhthu;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Dispatch;

import com.db4o.ObjectContainer;

import model.D_DoanKhoa;
import model.D_KhachHang;
import model.D_User;
import model.PUB_Lib;
import model.T_DiaChi;
import sun.rmi.server.Dispatcher;

/**
 * Servlet implementation class edit_KhachHang
 */
@WebServlet(urlPatterns = { "/admin/thongke/doanhthu/donhang" })
public class baocao_doanhthu_donhang extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public baocao_doanhthu_donhang() {
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
	    String tuNgay = request.getParameter("tuNgay");
	    String denNgay = request.getParameter("denNgay");
		
		PUB_Lib conn = new PUB_Lib();
		conn.connect_cascade();
		ObjectContainer db = conn.getDb();
		D_KhachHang d = new D_KhachHang();
		d.delete(db, MaKhachHang);
		
		
		
		response.setContentType("text/plain");
        response.getWriter().write("xoa");
        conn.closeconnect();
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
}
