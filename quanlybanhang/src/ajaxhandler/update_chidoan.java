package ajaxhandler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db4o.ObjectContainer;

import model.D_ChiDoan;
import model.PUB_Lib;

/**
 * Servlet implementation class update_chidoan
 */
@WebServlet("/update_chidoan")
public class update_chidoan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update_chidoan() {
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

		String ma = request.getParameter("MaChiDoan");
		String ten = request.getParameter("TenChiDoan");
		PUB_Lib conn = new PUB_Lib();
		conn.connect_cascade();
		ObjectContainer db=conn.getDb();
		D_ChiDoan cd = new D_ChiDoan();
		cd.updateChiDoan(db, ma, ten);
		conn.closeconnect();
		response.setContentType("text/plain");
        response.getWriter().write("cap nhat thanh cong");
        
        
	}

}
