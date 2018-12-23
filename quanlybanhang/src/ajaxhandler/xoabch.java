package ajaxhandler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db4o.ObjectContainer;

import model.D_BCHChiDoan;
import model.PUB_Lib;

/**
 * Servlet implementation class xoabch
 */
@WebServlet("/xoabch")
public class xoabch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xoabch() {
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
		bch.deleteBCHChiDoan(db, masinhvien);
		response.setContentType("text/plain");
        response.getWriter().write("xoa");
        conn.closeconnect();
	}

}
