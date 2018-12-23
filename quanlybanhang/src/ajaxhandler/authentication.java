package ajaxhandler;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import com.sun.org.apache.xml.internal.security.signature.ObjectContainer;
import model.PUB_Lib;
import com.db4o.ObjectContainer;
import com.db4o.ObjectSet;

import model.D_User;

/**
 * Servlet implementation class edit_kehoach
 */
@WebServlet("/authentication")
public class authentication extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public authentication() {
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
		// TODO Auto-generated method stub
		String task = request.getParameter("task");
		PUB_Lib conn = new PUB_Lib();
		conn.connect_cascade();
		ObjectContainer db=conn.getDb();
		D_User d_user = new D_User();
		switch (task) {
		case "check_login":								
			String username = request.getParameter("Username");
			String password = request.getParameter("Password");
			response.setContentType("text/plain");					
			if(d_user.checkLogin(db, username, password))
			{
				response.getWriter().write("OK");
				
			} else {
				response.getWriter().write("NO");
			}
	        conn.closeconnect();
            break;   		
		}		
	}
}
