package ajaxhandler.backend.khachhang;

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
@WebServlet(urlPatterns = { "/admin/khachhang/create-edit/" })
public class create_edit_khachhang extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public create_edit_khachhang() {
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

		String LoaiKhachHang = request.getParameter("LoaiKhachHang");
		int MaKhachHang = Integer.parseInt(request.getParameter("MaKhachHang"));
		String TenKhachHang = request.getParameter("TenKhachHang");
		String DiaChiKhachHang = request.getParameter("DiaChiKhachHang");
		String GioiTinhKhachHang = request.getParameter("GioiTinhKhachHang");
		String NgaySinhKhachHang = request.getParameter("NgaySinhKhachHang");
		String DienThoaiKhachHang = request.getParameter("DienThoaiKhachHang");
		String EmailKhachHang = request.getParameter("EmailKhachHang");
		PUB_Lib conn = new PUB_Lib();
		conn.connect_cascade();
		ObjectContainer db = conn.getDb();
		D_KhachHang d = new D_KhachHang();
		
		switch (task) {
			case "them":
				// Nếu đã có thì không thêm nữa
				if (d.exist(db, MaKhachHang)) {
					conn.closeconnect();
					response.setContentType("text/plain");
					response.getWriter().write("EXIST");
				} else {
					T_DiaChi diachi = new T_DiaChi();
					diachi.setDuong(DiaChiKhachHang);
					d.add(db, DienThoaiKhachHang, EmailKhachHang, LoaiKhachHang, MaKhachHang, TenKhachHang, diachi, GioiTinhKhachHang, NgaySinhKhachHang);
					conn.closeconnect();
					response.setContentType("text/plain");
					response.getWriter().write("OK");
				}
			break;
			case "sua":
				// Cập nhật
				T_DiaChi diachi = new T_DiaChi();
				diachi.setDuong(DiaChiKhachHang);
				d.update(db, DienThoaiKhachHang, EmailKhachHang, LoaiKhachHang, MaKhachHang, TenKhachHang, diachi, GioiTinhKhachHang, NgaySinhKhachHang);
			break;
		}
	}
}
