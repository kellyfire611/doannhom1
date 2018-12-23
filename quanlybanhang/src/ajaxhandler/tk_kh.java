package ajaxhandler;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db4o.ObjectContainer;
import com.db4o.ObjectSet;

import model.B_ThongKe;
import model.O_KeHoach;
import model.PUB_Lib;

/**
 * Servlet implementation class tk_kh
 */
@WebServlet("/tk_kh")
public class tk_kh extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public tk_kh() {
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
		int tuthang = Integer.parseInt(request.getParameter("tuthang"));
		int denthang = Integer.parseInt(request.getParameter("denthang"));
		int tunam = Integer.parseInt(request.getParameter("tunam"));
		int dennam = Integer.parseInt(request.getParameter("dennam"));
//		String loai = request.getParameter("loai");
		int loai = Integer.parseInt(request.getParameter("loai"));
		PUB_Lib conn = new PUB_Lib();
		conn.connect_cascade();
		ObjectContainer db = conn.getDb();
		B_ThongKe tk = new B_ThongKe();
		ObjectSet<O_KeHoach> khs = null ;
		SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy");
		NumberFormat formatter = new DecimalFormat("###,###");	
		
		response.setContentType("text/html;charset=UTF-8");	        	  
		PrintWriter pw = response.getWriter();
 

		if(loai == 1){
			khs =tk.DS_KeHoachDaDuyet(db,tuthang,tunam, denthang, dennam);
			if(khs.size()!=0){
							      
			       for( O_KeHoach kehoach : khs)
			        {
			        	String makh = kehoach.getMakehoach();
			        	String date_kt = DATE_FORMAT.format(kehoach.getNgayKetThuc());
			        	String date_bd = DATE_FORMAT.format(kehoach.getNgayBatDau());
			        	String dd = kehoach.getDiaDiem();
			        	String nd = kehoach.getNoiDung();
			        	String cd = kehoach.getCuaChiDoan().getTenchidoan();
			        	
			        	pw.println("<tr style='color:black;'><td style='width: 200px;' class='sorting_1'>"+makh+"</td>");
			        	pw.println("<td style='width: 150px;' class=' sorting_1'>"+date_bd+"</td>");
			        	pw.println("<td style='width: 150px;' class=' sorting_1'>"+date_kt+"</td>");
			        	pw.println("<td style='width: 150px;' class=' sorting_1'>"+dd+"</td>");
			        	pw.println("<td style='width: 150px;' class=' sorting_1'>"+nd+"</td>");
			        	pw.println("<td style='width: 150px;' class=' sorting_1'>"+cd+"</td>");
			        	if (kehoach.getDuyet()) {
			        		pw.println("<td style='width: 150px;' class=' sorting_1' align='center'><span class='icon-ok'></span></td>");
			        		
			        	}
			        	else 
			        	{pw.println("<td style='width: 150px;' class=' sorting_1' align='center'></td>");}
			        	
			        	if (kehoach.getDaThucHien()) {
			        		pw.println("<td style='width: 150px;' class=' sorting_1' align='center'><span class='icon-ok'></span></td>");
			        		
			        	}
			        	else 
			        	{
			        		pw.println("<td style='width: 150px;' class=' sorting_1' align='center'></td>");
			        		}
			        	pw.println("</tr>");
			    		
			      }  
			    }
			        else
			        	pw.println("<td style='width: 150px;color:red;'>khong co du lieu</td>");
		}
		if(loai == 2){
			khs =tk.DS_KeHoachChuaDuyet(db,tuthang,tunam, denthang, dennam);
			if(khs.size()!=0){
	        	
			      
			       for( O_KeHoach kehoach : khs)
			        {
			        	String makh = kehoach.getMakehoach();
			        	String date_kt = DATE_FORMAT.format(kehoach.getNgayKetThuc());
			        	String date_bd = DATE_FORMAT.format(kehoach.getNgayBatDau());
			        	String dd = kehoach.getDiaDiem();
			        	String nd = kehoach.getNoiDung();
			        	String cd = kehoach.getCuaChiDoan().getTenchidoan();
			        	
			        	pw.println("<tr style='color:black;><td style='width: 200px;' class='sorting_1'>"+makh+"</td>");
			        	pw.println("<td style='width: 150px;' class=' sorting_1'>"+date_bd+"</td>");
			        	pw.println("<td  style='width: 150px;' class=' sorting_1'>"+date_kt+"</td>");
			        	pw.println("<td style='width: 150px;' class=' sorting_1'>"+dd+"</td>");
			        	pw.println("<td style='width: 150px;' class=' sorting_1'>"+nd+"</td>");
			        	pw.println("<td style='width: 150px;' class=' sorting_1'>"+cd+"</td>");
			        	if (kehoach.getDuyet()) {
			        		pw.println("<td style='width: 150px;' class=' sorting_1' align='center'><span class='icon-ok'></span></td>");
			        		
			        	}
			        	else 
			        	{pw.println("<td style='width: 150px;' class=' sorting_1' align='center'></td>");}
			        	
			        	if (kehoach.getDaThucHien()) {
			        		pw.println("<td style='width: 150px;' class=' sorting_1' align='center'><span class='icon-ok'></span></td>");
			        		
			        	}
			        	else 
			        	{
			        		pw.println("<td style='width: 150px;' class=' sorting_1' align='center'></td>");
			        		}
			        	pw.println("</tr>");
			    		
			      }  }
			        else
			        	pw.println("<td style='width: 150px;color:red;'>khong co du lieu</td>");
		}
		if(loai == 3){
			khs =tk.DS_KeHoachDaThucHien(db,tuthang,tunam, denthang, dennam);
			if(khs.size()!=0){
	        	
			      
			       for( O_KeHoach kehoach : khs)
			        {
			        	String makh = kehoach.getMakehoach();
			        	String date_kt = DATE_FORMAT.format(kehoach.getNgayKetThuc());
			        	String date_bd = DATE_FORMAT.format(kehoach.getNgayBatDau());
			        	String dd = kehoach.getDiaDiem();
			        	String nd = kehoach.getNoiDung();
			        	String cd = kehoach.getCuaChiDoan().getTenchidoan();
			        	
			        	pw.println("<tr  style='color:black;><td style='width: 200px;' class='sorting_1'>"+makh+"</td>");
			        	pw.println("<td style='width: 150px;' class=' sorting_1'>"+date_bd+"</td>");
			        	pw.println("<td style='width: 150px;' class=' sorting_1'>"+date_kt+"</td>");
			        	pw.println("<td style='width: 150px;' class=' sorting_1'>"+dd+"</td>");
			        	pw.println("<td style='width: 150px;' class=' sorting_1'>"+nd+"</td>");
			        	pw.println("<td style='width: 150px;' class=' sorting_1'>"+cd+"</td>");
			        	if (kehoach.getDuyet()) {
			        		pw.println("<td style='width: 150px;' class=' sorting_1' align='center'><span class='icon-ok'></span></td>");
			        		
			        	}
			        	else 
			        	{pw.println("<td style='width: 150px;' class=' sorting_1' align='center'></td>");}
			        	
			        	if (kehoach.getDaThucHien()) {
			        		pw.println("<td style='width: 150px;' class=' sorting_1' align='center'><span class='icon-ok'></span></td>");
			        		
			        	}
			        	else 
			        	{
			        		pw.println("<td style='width: 150px;' class=' sorting_1' align='center'></td>");
			        		}
			        	pw.println("</tr>");
			    		
			      }  }
			        else
			        	pw.println("<td style='width: 150px;color:red;'>khong co du lieu</td>");
		}
		if(loai == 4){
			khs =tk.DS_KeHoachChuaThucHien(db,tuthang,tunam, denthang, dennam);
			if(khs.size()!=0){
	        	
			      
			       for( O_KeHoach kehoach : khs)
			        {
			        	String makh = kehoach.getMakehoach();
			        	String date_kt = DATE_FORMAT.format(kehoach.getNgayKetThuc());
			        	String date_bd = DATE_FORMAT.format(kehoach.getNgayBatDau());
			        	String dd = kehoach.getDiaDiem();
			        	String nd = kehoach.getNoiDung();
			        	String cd = kehoach.getCuaChiDoan().getTenchidoan();
			        	
			        	pw.println("<tr  style='color:black;><td style='width: 200px;' class='sorting_1'>"+makh+"</td>");
			        	pw.println("<td style='width: 150px;' class=' sorting_1'>"+date_bd+"</td>");
			        	pw.println("<td style='width: 150px;' class=' sorting_1'>"+date_kt+"</td>");
			        	pw.println("<td style='width: 150px;' class=' sorting_1'>"+dd+"</td>");
			        	pw.println("<td style='width: 150px;' class=' sorting_1'>"+nd+"</td>");
			        	pw.println("<td style='width: 150px;' class=' sorting_1'>"+cd+"</td>");
			        	if (kehoach.getDuyet()) {
			        		pw.println("<td style='width: 150px;' class=' sorting_1' align='center'><span class='icon-ok'></span></td>");
			        		
			        	}
			        	else 
			        	{pw.println("<td style='width: 150px;' class=' sorting_1' align='center'></td>");}
			        	
			        	if (kehoach.getDaThucHien()) {
			        		pw.println("<td style='width: 150px;' class=' sorting_1' align='center'><span class='icon-ok'></span></td>");
			        		
			        	}
			        	else 
			        	{
			        		pw.println("<td style='width: 150px;' class=' sorting_1' align='center'></td>");
			        		}
			        	pw.println("</tr>");
			    		
			      }  }
			        else
			        	pw.println("<td style='width: 150px;color:red;'>khong co du lieu</td>");
		}
		
		
	
       conn.closeconnect();

	}

}
