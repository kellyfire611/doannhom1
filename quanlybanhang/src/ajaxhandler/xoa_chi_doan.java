package ajaxhandler;
import java.util.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db4o.ObjectContainer;
import com.db4o.ObjectSet;


import model.D_ChiDoan;
import model.D_KeHoach;
import model.D_SinhVien;
import model.O_KeHoach;
import model.O_SinhVien;
import model.PUB_Lib;

/**
 * Servlet implementation class xoa_chi_doan
 */
@WebServlet("/xoa_chi_doan")
public class xoa_chi_doan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xoa_chi_doan() {
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
		String ma = request.getParameter("ma");
		PUB_Lib conn = new PUB_Lib();
		conn.connect_cascade();
		ObjectContainer db = conn.getDb();
		D_ChiDoan cd = new D_ChiDoan();
		D_KeHoach dkh = new D_KeHoach();
		//D_SinhVien dsk = new D_SinhVien();
		
		
		List <O_KeHoach> khs = cd.selectKeHoach_ChiDoan(db, ma);
		
			
		for(O_KeHoach kh :khs){
			
			dkh.deleteKeHoach(db, kh.getMakehoach());			
		}
					
		cd.deleteChiDoan(db, ma);
		response.setContentType("text/plain");
        response.getWriter().write("xoa thanh cong");
		// response.getWriter().write(khs.get(0).getMakehoach());
        conn.closeconnect();
		
	}

}
