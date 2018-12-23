package ajaxhandler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db4o.ObjectContainer;

import model.D_ChiDoan;
import model.D_Nguoi;
import model.D_SinhVien;
import model.O_ChiDoan;
import model.PUB_Lib;

/**
 * Servlet implementation class sua_sinh_vien
 */
@WebServlet("/sua_sinh_vien")
public class sua_sinh_vien extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sua_sinh_vien() {
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

		
		String masv =request.getParameter("masv");
		String tensv =request.getParameter("tensv");
		String diachi =request.getParameter("diachi");
		String sdt =request.getParameter("sdt");
		String mail =request.getParameter("mail");
		String fb =request.getParameter("fb");
		String skype =request.getParameter("skype");
		
		PUB_Lib conn = new PUB_Lib();
		conn.connect_cascade();
		ObjectContainer db = conn.getDb();
		
		D_SinhVien dsv = new D_SinhVien();
	
		
		
			dsv.updateSinhVien(db, masv, tensv, sdt, diachi, mail, fb, skype);//add sv vao sv sau do cap nhat sv thuoc chidoan
			
			response.setContentType("text/plain");
	        response.getWriter().write("cap nhat thanh cong");
	        conn.closeconnect();
		
	}

}
