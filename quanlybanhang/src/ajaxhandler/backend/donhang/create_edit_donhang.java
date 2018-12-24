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

import model.D_DoanKhoa;
import model.D_DonHang;
import model.D_User;
import model.O_NhanVien;
import model.PUB_Lib;
import model.T_DiaChi;
import sun.rmi.server.Dispatcher;

/**
 * Servlet implementation class edit_donhang
 */
@WebServlet(urlPatterns = { "/admin/donhang/create-edit/" })
public class create_edit_donhang extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public create_edit_donhang() {
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
		String NgayLapDonHang = request.getParameter("NgayLapDonHang");
		String NgayGiaoDonHang = request.getParameter("NgayGiaoDonHang");
		String NoiGiaoDonHang = request.getParameter("NoiGiaoDonHang");
		String TinhTrangThanhToanDonHang = request.getParameter("TinhTrangThanhToanDonHang");
		String NhanVienDuyetDonHang = request.getParameter("NhanVienDuyetDonHang");
		
		PUB_Lib conn = new PUB_Lib();
		conn.connect_cascade();
		ObjectContainer db = conn.getDb();
		D_DonHang d = new D_DonHang();
		
		switch (task) {
			case "them":
				// Nếu đã có thì không thêm nữa
				if (d.exist(db, MaDonHang)) {
					conn.closeconnect();
					response.setContentType("text/plain");
					response.getWriter().write("EXIST");
				} else {
					O_NhanVien nvDuyet = new O_NhanVien();
					nvDuyet.setNd_ten(NhanVienDuyetDonHang);
					d.add(db, MaDonHang, NgayLapDonHang, NgayLapDonHang, NoiGiaoDonHang, TinhTrangThanhToanDonHang, nvDuyet);
					conn.closeconnect();
					response.setContentType("text/plain");
					response.getWriter().write("OK");
				}
			break;
			case "sua":
				// Cập nhật
				O_NhanVien nvDuyet = new O_NhanVien();
				nvDuyet.setNd_ten(NhanVienDuyetDonHang);
				d.update(db, MaDonHang, NgayLapDonHang, NgayLapDonHang, NoiGiaoDonHang, TinhTrangThanhToanDonHang, nvDuyet);
			break;
		}
	}
}
