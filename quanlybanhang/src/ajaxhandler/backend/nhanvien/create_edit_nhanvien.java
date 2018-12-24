package ajaxhandler.backend.nhanvien;

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
import model.D_NhanVien;
import model.D_User;
import model.PUB_Lib;
import model.T_DiaChi;
import sun.rmi.server.Dispatcher;

/**
 * Servlet implementation class edit_NhanVien
 */
@WebServlet(urlPatterns = { "/admin/nhanvien/create-edit/" })
public class create_edit_nhanvien extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public create_edit_nhanvien() {
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

		int MaNhanVien = Integer.parseInt(request.getParameter("MaNhanVien"));
		String TenNhanVien = request.getParameter("TenNhanVien");
		String DiaChiNhanVien = request.getParameter("DiaChiNhanVien");
		String GioiTinhNhanVien = request.getParameter("GioiTinhNhanVien");
		String NgaySinhNhanVien = request.getParameter("NgaySinhNhanVien");
		String NgayBatDauLamViecNhanVien = request.getParameter("NgayBatDauLamViecNhanVien");
		Double LuongNhanVien = Double.parseDouble(request.getParameter("LuongNhanVien"));
		
		PUB_Lib conn = new PUB_Lib();
		conn.connect_cascade();
		ObjectContainer db = conn.getDb();
		D_NhanVien d = new D_NhanVien();
		
		switch (task) {
			case "them":
				// Nếu đã có thì không thêm nữa
				if (d.exist(db, MaNhanVien)) {
					conn.closeconnect();
					response.setContentType("text/plain");
					response.getWriter().write("EXIST");
				} else {
					T_DiaChi diachi = new T_DiaChi();
					diachi.setDuong(DiaChiNhanVien);
					d.add(db, LuongNhanVien, NgayBatDauLamViecNhanVien, MaNhanVien, TenNhanVien, diachi, GioiTinhNhanVien, NgaySinhNhanVien);   
					conn.closeconnect();
					response.setContentType("text/plain");
					response.getWriter().write("OK");
				}
			break;
			case "sua":
				// Cập nhật
				T_DiaChi diachi = new T_DiaChi();
				diachi.setDuong(DiaChiNhanVien);
				d.update(db, LuongNhanVien, NgayBatDauLamViecNhanVien, MaNhanVien, TenNhanVien, diachi, GioiTinhNhanVien, NgaySinhNhanVien);
			break;
		}
	}
}
