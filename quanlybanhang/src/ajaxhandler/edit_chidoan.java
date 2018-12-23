package ajaxhandler;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Dispatch;

import com.db4o.ObjectContainer;

import model.D_BCHChiDoan;
import model.D_ChiDoan;
import model.D_User;
import model.PUB_Lib;
import sun.rmi.server.Dispatcher;

/**
 * Servlet implementation class edit_chidoan
 */
@WebServlet("/edit_chidoan")
public class edit_chidoan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public edit_chidoan() {
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
			D_User u = new D_User();
			if(cd.existChiDoan(db, ma)){
				
				conn.closeconnect();
				response.setContentType("text/plain");
		        response.getWriter().write("EXIST");	
			}
			else{
				
			cd.addChiDoan(db, ma, ten);
			u.addUser(db, ma, ma, "2");
			conn.closeconnect();
			response.setContentType("text/plain");
	        response.getWriter().write("OK");
	        
	        }
			
		
		
		}
			
		}
		
	


