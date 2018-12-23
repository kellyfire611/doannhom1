package ajaxhandler;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db4o.ObjectContainer;

import model.D_BCHChiDoan;
import model.D_SinhVien;
import model.O_SinhVien;
import model.PUB_Lib;

/**
 * Servlet implementation class update_bchchidoan
 */
@WebServlet("/update_bchchidoan")
public class update_bchchidoan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update_bchchidoan() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String task = request.getParameter("task");
		String masinhvien = request.getParameter("masinhvien");
		PUB_Lib conn = new PUB_Lib();
		conn.connect_cascade();
		ObjectContainer db=conn.getDb();
		D_BCHChiDoan bch = new D_BCHChiDoan();
		
		
			
			String chucvu = request.getParameter("chucvu");
			String chucvucu = request.getParameter("chucvucu");
			D_SinhVien dsv = new D_SinhVien();
			O_SinhVien sv = dsv.found_O_SinhVien(db, masinhvien);
			if(chucvucu==""){
				bch.addBCHChiDoan(db, masinhvien, sv.getHoTen(), sv.getSoDienThoai(), sv.getDiaChi(), chucvu, sv.getEmail(), sv.getDiaChiFaceBook(), sv.getSkype());
				conn.closeconnect();
				response.setContentType("text/plain");
		        response.getWriter().write("them thanh cong");
			}
			else{
				bch.updateBCHChiDoan(db, masinhvien, sv.getHoTen(), sv.getSoDienThoai(), sv.getDiaChi(), chucvu, sv.getEmail(), sv.getDiaChiFaceBook(), sv.getSkype());
				conn.closeconnect();
				response.setContentType("text/plain");
		        response.getWriter().write("cap nhat thanh cong");
			}
		
		
		/*	String machidoan = request.getParameter("machidoan");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/cap_nhat_ban_chap_hanh_chi_doan/*");
		request.setAttribute("machidoan",machidoan);
		dispatcher.forward(request,response);*/
		}

}
