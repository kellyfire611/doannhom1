package ajaxhandler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db4o.ObjectContainer;

import model.D_DoanKhoa;
import model.PUB_Lib;

/**
 * Servlet implementation class sua_bch_khoa
 */
@WebServlet("/sua_bch_khoa")
public class sua_bch_khoa extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sua_bch_khoa() {
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
		
		String ma =request.getParameter("ma");
		String ten =request.getParameter("ten");
		String chucvu =request.getParameter("chucvu");
		String diachi =request.getParameter("dc");
		String sdt =request.getParameter("sdt");
		
		PUB_Lib conn = new PUB_Lib();
		conn.connect_cascade();
		ObjectContainer db = conn.getDb();
		D_DoanKhoa dk = new D_DoanKhoa();
		dk.updateDoanKhoa(db, ma, ten, sdt, diachi, chucvu);
		
		response.setContentType("text/plain");
        response.getWriter().write("Cap Nhat ban chap hanh doan khoa thanh cong");
		conn.closeconnect();
	}

}
