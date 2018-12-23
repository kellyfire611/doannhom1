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

import model.D_DoanKhoa;
import model.D_SanPham;
import model.D_User;
import model.PUB_Lib;
import model.T_DiaChi;
import sun.rmi.server.Dispatcher;

/**
 * Servlet implementation class edit_sanpham
 */
@WebServlet(urlPatterns = { "/admin/sanpham/create-edit/" })
public class create_edit_sanpham extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public create_edit_sanpham() {
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

		String LoaiSanPham = request.getParameter("LoaiSanPham");
		int MaSanPham = Integer.parseInt(request.getParameter("MaSanPham"));
		String TenSanPham = request.getParameter("TenSanPham");
		Double GiaBanSanPham = Double.parseDouble(request.getParameter("GiaBanSanPham"));
		String MoTaSanPham = request.getParameter("MoTaSanPham");
		String NhaSanXuatSanPham = request.getParameter("NhaSanXuatSanPham");
		String HinhAnhSanPham = request.getParameter("HinhAnhSanPham");
		int SoLuongTonSanPham = Integer.parseInt(request.getParameter("SoLuongTonSanPham"));
		PUB_Lib conn = new PUB_Lib();
		conn.connect_cascade();
		ObjectContainer db = conn.getDb();
		D_SanPham d = new D_SanPham();
		
		switch (task) {
			case "them":
				// Nếu đã có thì không thêm nữa
				if (d.exist(db, MaSanPham)) {
					conn.closeconnect();
					response.setContentType("text/plain");
					response.getWriter().write("EXIST");
				} else {
					d.add(db, MaSanPham, TenSanPham, GiaBanSanPham, MoTaSanPham, SoLuongTonSanPham, LoaiSanPham, NhaSanXuatSanPham, HinhAnhSanPham);
					conn.closeconnect();
					response.setContentType("text/plain");
					response.getWriter().write("OK");
				}
			break;
			case "sua":
				// Cập nhật
				d.update(db, MaSanPham, TenSanPham, GiaBanSanPham, MoTaSanPham, SoLuongTonSanPham, LoaiSanPham, NhaSanXuatSanPham, HinhAnhSanPham);
			break;
		}
	}
}
