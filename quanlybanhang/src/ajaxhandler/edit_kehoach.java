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

import model.D_BCHChiDoan;
import model.D_ChiDoan;
import model.D_KeHoach;
import model.D_LichTrinh;
import model.D_NguonKinhPhi;
import model.D_SinhVien;
import model.D_HoTroKinhPhi;
import model.O_BCHChiDoan;
import model.O_ChiDoan;
import model.O_HoTroKinhPhi;
import model.O_KeHoach;
import model.O_LichTrinh;
import model.O_NguonKinhPhi;
import model.O_SinhVien;
/**
 * Servlet implementation class edit_kehoach
 */
@WebServlet("/edit_kehoach")
public class edit_kehoach extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public edit_kehoach() {
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
		D_KeHoach kh = new D_KeHoach();
		D_ChiDoan cd = new D_ChiDoan();	
		D_LichTrinh lt = new D_LichTrinh();
		D_BCHChiDoan bchcd= new D_BCHChiDoan();
		D_SinhVien d_sv= new D_SinhVien();
		D_HoTroKinhPhi d_htkp= new D_HoTroKinhPhi();
		D_NguonKinhPhi d_nkp = new D_NguonKinhPhi();
		SimpleDateFormat dt = new SimpleDateFormat("dd-MM-yyyy");
		switch (task) {
		case "sua_ke_hoach":								
			String makehoach = request.getParameter("MaKeHoach");
			String tg_bd = request.getParameter("ThoiGianBD");
			String tg_kt = request.getParameter("ThoiGianKT");
			String diadiem = request.getParameter("DiaDiem");
			String noidung = request.getParameter("NoiDung");
			String machidoan = request.getParameter("MaChiDoan");
			Boolean isDuyet = Boolean.parseBoolean(request.getParameter("Duyet"));
			Boolean isDaThucHien = Boolean.parseBoolean(request.getParameter("DaThucHien"));						
			
			
	        Date ngayBatDau = null;
			try {
				ngayBatDau = dt.parse(tg_bd);
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
	        Date ngayKetThuc = null;
			try {
				ngayKetThuc = dt.parse(tg_kt);
			} catch (ParseException e) {
				e.printStackTrace();
			}
				       							       	       			
			O_ChiDoan o_cd = cd.found_O_ChiDoan(db, machidoan);
			
			kh.updateKeHoach(db, makehoach, ngayBatDau, ngayKetThuc, diadiem, noidung, isDuyet, isDaThucHien, o_cd);					
			
			response.setContentType("text/plain");
	        response.getWriter().write("OK");
	        conn.closeconnect();
            break;   
		case "them_ke_hoach":						
			String makehoach_them = request.getParameter("MaKeHoach");
			String tg_bd_them = request.getParameter("ThoiGianBD");
			String tg_kt_them = request.getParameter("ThoiGianKT");
			String diadiem_them = request.getParameter("DiaDiem");
			String noidung_them = request.getParameter("NoiDung");
			String machidoan_them = request.getParameter("MaChiDoan");
			Boolean isDuyet_them = Boolean.parseBoolean(request.getParameter("Duyet"));
			Boolean isDaThucHien_them = Boolean.parseBoolean(request.getParameter("DaThucHien"));
			
			//==Kiểm tra trùng mã kế hoạch
			
			Boolean isExist = kh.existKeHoach(db, makehoach_them);
			if (isExist) {
				response.setContentType("text/plain");
		        response.getWriter().write("EXISTS_MAKH");
			} else {
		        Date ngayBatDau_them = null;
				try {
					ngayBatDau_them = dt.parse(tg_bd_them);
				} catch (ParseException e1) {
					e1.printStackTrace();
				}
		        Date ngayKetThuc_them = null;
				try {
					ngayKetThuc_them = dt.parse(tg_kt_them);
				} catch (ParseException e) {
					e.printStackTrace();
				}
					       							       	       			
				O_ChiDoan o_cd_them = cd.found_O_ChiDoan(db, machidoan_them);
				
				kh.addKeHoach(db, makehoach_them, ngayBatDau_them, ngayKetThuc_them, diadiem_them, noidung_them, isDuyet_them, isDaThucHien_them, o_cd_them);
				
				response.setContentType("text/plain");
		        response.getWriter().write("OK");
			}
					
	        conn.closeconnect();
            break;   
		case "them_lich_trinh_vao_ke_hoach":								
			String makehoach_lt = request.getParameter("MaKeHoach");
			String data = request.getParameter("data_lichtrinh");											       							       	       			
			String[] arrLichTrinh = data.split(",");
			
			for (int i = 1; i < arrLichTrinh.length; i++) {
				String[] arrLT = arrLichTrinh[i].split("@");
			    String ma_lichtrinh = arrLT[0];
			    String tencongviec = arrLT[1];
			    String tgbd = arrLT[2];
			    String tgkt = arrLT[3];
			    
			    Date tgbd_lt = null;
			    Date tgkt_lt = null;
				try {
					tgbd_lt = dt.parse(tgbd);
				} catch (ParseException e1) {
					e1.printStackTrace();
				}
		       
				try {
					tgkt_lt = dt.parse(tgkt);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				O_KeHoach o_kh_lichtrinh = kh.found_O_KeHoach(db, makehoach_lt);
				lt.addLichTrinh(db, ma_lichtrinh, tencongviec, tgbd_lt, tgkt_lt, o_kh_lichtrinh);
		
			}
			
			response.setContentType("text/plain");
	        response.getWriter().write("OK");
	        conn.closeconnect();
            break;  
		case "them_lich_trinh_f":								
			String makehoach_ltf = request.getParameter("MaKeHoach");
			String malt = request.getParameter("MaLichTrinh");
			String tencv = request.getParameter("TenCongViec");
			String tgbd = request.getParameter("TGBD");
			String tgkt = request.getParameter("TGKT");
			Date tgbd_lt = null;
		    Date tgkt_lt = null;
			try {
				tgbd_lt = dt.parse(tgbd);
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
	       
			try {
				tgkt_lt = dt.parse(tgkt);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			Boolean isExistLT = lt.existLichTrinh(db, malt);
			if (isExistLT) {
				response.setContentType("text/plain");
		        response.getWriter().write("EXISTS_MALT");
			} else {
				O_KeHoach o_kh_lichtrinh_f = kh.found_O_KeHoach(db, makehoach_ltf);
				lt.addLichTrinh(db, malt, tencv, tgbd_lt, tgkt_lt, o_kh_lichtrinh_f);								
				
				response.setContentType("text/plain");
		        response.getWriter().write("OK");
			}
			
			
	        conn.closeconnect();
            break;  
		case "them_sinh_vien_vao_ke_hoach":								
			String makehoach_sv = request.getParameter("MaKeHoach");
			String data_sv = request.getParameter("data_sinhvien");											       							       	       			
			String[] arrSV = data_sv.split("@");
			for (int i = 1; i < arrSV.length; i++) {
			    String masv = arrSV[i];
			    O_SinhVien o_sv = d_sv.found_O_SinhVien(db, masv);			   
			    kh.addSinhVien(db, makehoach_sv, o_sv);
			}
			
			response.setContentType("text/plain");
	        response.getWriter().write("OK");
	        conn.closeconnect();
            break;  
		case "them_ho_tro_kinh_phi":								
			String makehoach_ht = request.getParameter("MaKeHoach");
			String data_ht = request.getParameter("data_hotrokp");											       							       	       			
			String[] arrData = data_ht.split(",");			
			
			for (int i = 1; i < arrData.length; i++) {
			    String[] arrNKP = arrData[i].split("@");
			    String ma_ht_kp = arrNKP[0];
			    String ma_nguon_kp = arrNKP[1];
			    int sotien = Integer.parseInt(arrNKP[2]);
			    O_KeHoach o_kh_hotro = kh.found_O_KeHoach(db, makehoach_ht);
			    O_NguonKinhPhi o_nkp_hotro = d_nkp.found_O_NguonKinhPhi(db, ma_nguon_kp);
			    d_htkp.addHoTroKinhPhi(db, ma_ht_kp, sotien, o_kh_hotro, o_nkp_hotro);
			}
			
			response.setContentType("text/plain");
	        response.getWriter().write("OK");
	        conn.closeconnect();
            break; 
		case "them_ho_tro_kinh_phi_f":								
			String makehoach_htf = request.getParameter("MaKeHoach");
			String mahotro_f = request.getParameter("MaHoTro");											       							       	       			
			String mankp = request.getParameter("MaNguonKP");	
			int sotien = Integer.parseInt(request.getParameter("SoTien"));				  
			
			Boolean isExistHT = d_htkp.existHoTroKinhPhi(db, mahotro_f);
			if (isExistHT) {
				response.setContentType("text/plain");
		        response.getWriter().write("EXISTS_MAHT");
			} else {
				O_KeHoach o_kh_hotro_f = kh.found_O_KeHoach(db, makehoach_htf);
			    O_NguonKinhPhi o_nkp_hotro_f = d_nkp.found_O_NguonKinhPhi(db, mankp);
			    d_htkp.addHoTroKinhPhi(db, mahotro_f, sotien, o_kh_hotro_f, o_nkp_hotro_f);
				
				response.setContentType("text/plain");
		        response.getWriter().write("OK");
			}
		    
	        conn.closeconnect();
            break; 
		case "xoa_ke_hoach":								
			String makehoach_xoa = request.getParameter("MaKeHoach");		
			kh.deleteKeHoach(db, makehoach_xoa);
			
			response.setContentType("text/plain");
	        response.getWriter().write("OK");
	        conn.closeconnect();
            break;  
		case "xoa_sv_ke_hoach":								
			String makehoach_sv_xoa = request.getParameter("MaKeHoach");
			String masv_xoa = request.getParameter("MASV");
			O_SinhVien o_sv_xoa= d_sv.found_O_SinhVien(db, masv_xoa);
			kh.removeSinhVien(db, makehoach_sv_xoa, o_sv_xoa);
			
			response.setContentType("text/plain");
	        response.getWriter().write("OK");
	        conn.closeconnect();
            break; 
		case "xoa_htkp_ke_hoach":								
			String makehoach_htkp_xoa = request.getParameter("MaKeHoach");
			String mahotro_xoa = request.getParameter("MaHoTroKP");
			O_HoTroKinhPhi o_htkp_xoa= d_htkp.found_O_HoTroKinhPhi(db, mahotro_xoa);
			kh.removeNguonKinhPhi(db, makehoach_htkp_xoa, o_htkp_xoa);
			
			response.setContentType("text/plain");
	        response.getWriter().write("OK");
	        conn.closeconnect();
            break; 
		case "xoa_lichtrinh_ke_hoach":								
			String makehoach_lt_xoa = request.getParameter("MaKeHoach");
			String malt_xoa = request.getParameter("MaLichTrinh");
			
			O_LichTrinh o_lt_xoa= lt.found_O_LichTrinhn(db, malt_xoa);
			kh.removeLichTrinh(db, makehoach_lt_xoa, o_lt_xoa);
			
			response.setContentType("text/plain");
	        response.getWriter().write("OK");
	        conn.closeconnect();
            break; 
		case "load_dssv_chi_doan":								
			String machidoan_load = request.getParameter("MaChiDoan");		
			O_ChiDoan o_cd_l = cd.found_O_ChiDoan(db,machidoan_load);
			List<O_SinhVien> dssv= cd.selectSinhVien_ChiDoan(db, machidoan_load);			
			
			response.setContentType("text/html;charset=UTF-8");	        	        
	        PrintWriter pw = response.getWriter();
	        pw.println("<h4 class='semi-bold'>Danh sách sinh viên chi đoàn "+ o_cd_l.getTenchidoan()+"</h4>");
	        pw.println("<br>");
	        pw.println("<table class='table table-bordered no-more-tables'>");
	        pw.println("<thead>"
		        		+ "<tr>"
			        		+ "<th width='1%'>"
			        		+ "<div class='checkbox check-default'>"
	        				+ "<input id='checkbox_allsv' value='1' class='checkall' type='checkbox'>"
							+ "<label for='checkbox_allsv'></label>"
							+ "</div></th>"
							+ "<th class='text-center' width='12%'>Mã sinh viên</th>"
							+ "<th class='text-center' width='12%'>Họ và tên</th>"
							+ "<th class='text-center' width='12%'>Email</th>"
							+ "<th class='text-center' width='12%'>Chức vụ</th>"
			        	+ "</tr>"
		        	+ "</thead>");
	        	if (dssv.size()!=0) {
        		for (O_SinhVien sv : dssv) {        			
        			String masv=sv.getMa();
        			O_BCHChiDoan bchtemp = bchcd.found_O_BCHChiDoan(db, masv);
        			String chuc_vu="&nbsp;";
        			if (bchtemp != null) {
        				chuc_vu=bchtemp.getChucVu();
        			}
        			pw.println("<tr class='tr_sv'>"
    					+ "<td>"
        					+ "<div class='checkbox check-default'>"
        					+ "<input id='checkbox"+masv+"' value='"+masv+"' type='checkbox' class='check_sinhvien'>"
        					+ "<label for='checkbox"+masv+"'></label>"
        					+ "</div>"
    					+ "</td>"
    					+ "<td class='text-left'>"+masv+"</td>"
    					+ "<td class='text-left'>"+sv.getHoTen()+"</td>"
    					+ "<td class='text-left'>"+sv.getEmail()+"</td>"
    					+ "<td class='text-left'>"+chuc_vu+"</td>"
					+ "</tr>");
        		}	        		
	        	} else {
	        		pw.println("<tr class='tr_sinhvien'>"
		        				+ "<td colspan='5'>"
		        				+ "Không tìm thấy thông tin lịch trình"
		        				+ "</td>"
	        				+ "</tr>");
	        	}
	        pw.println("</table>");
	        
	        conn.closeconnect();
            break; 
		}		
	}
}
