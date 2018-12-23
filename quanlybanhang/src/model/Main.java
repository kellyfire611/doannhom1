package model;
import java.util.*;

import com.db4o.ObjectContainer;
import com.db4o.ObjectSet;

public class Main {

	@SuppressWarnings("deprecation")
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try{
			System.out.println("start ");
			PUB_Lib conn = new PUB_Lib();
			conn.connect_cascade();
			ObjectContainer db=conn.getDb();
	  
			  B_ThongKe tk = new B_ThongKe();
			  D_KeHoach kh = new D_KeHoach();
			//ObjectSet<O_KeHoach> khs = tk.DS_KeHoachDaDuyet(db, Integer.parseInt(tuthang), Integer.parseInt(tunam), Integer.parseInt(denthang), Integer.parseInt(dennam));
			  ObjectSet<O_KeHoach> khs = tk.DS_KeHoachChuaThucHien(db,1,2010, 12,2020);
			//  ObjectSet<O_KeHoach> khs1 = tk.DS_KeHoachChuaThucHien(db,1,2010, 12,2015);
			  for(O_KeHoach khss :khs){
				  System.out.println(khss.getDiaDiem());
			  }
			System.out.println("aa");
			  conn.closeconnect();
//			String ma="bch04";
//			D_BCHChiDoan d_BCHChiDoan = new D_BCHChiDoan();
			D_SinhVien d_sinhvien=new D_SinhVien();
			D_KeHoach d_KeHoach = new D_KeHoach();
//			D_ChiDoan d_ChiDoan = new D_ChiDoan();	
//			D_NguonKinhPhi d_NguonKinhPhi = new D_NguonKinhPhi();	
//			D_LichTrinh d_LichTrinh= new D_LichTrinh();
//			D_HoTroKinhPhi d_HoTroKinhPhi= new D_HoTroKinhPhi();
//			D_User d_User = new D_User();
//			D_Nguoi d_nguoi = new D_Nguoi();
//			 O_SinhVien o_sv = d_sinhvien.found_O_SinhVien(db, "sv108");			   
//		     d_KeHoach.addSinhVien(db, "KH01", o_sv);	
//			 System.out.println(o_sv.getHoTen());
//			d_BCHChiDoan.addBCHChiDoan(db, "bch01", "Tran Thanh On", "0923 494 444", "Can Tho",CONS_Lib.BITHU,"hhh@gmail.com","sssss","ff");
//			d_BCHChiDoan.addBCHChiDoan(db,"bch02", "Tan Van Trung", "0923 494 555", "Vinh Long",CONS_Lib.PBT,"aaaaaaa@gmail.com","eeeeee","tt");
//			d_BCHChiDoan.addBCHChiDoan(db,"bch03", "Tran Van Thanh", "0923 494 666", "Soc Trang",CONS_Lib.UV,"yyy@gmail.com","yyyyy","mmmm");
//			d_BCHChiDoan.addBCHChiDoan(db,"bch04", "Tran Van Hao", "0923 494 999", "Ca�n Tho",CONS_Lib.UV,"sxxx@gmail.com","ggggg","zzzzz");
//						
//			ObjectSet<O_BCHChiDoan> bchs=d_BCHChiDoan.selectAllBCHChiDoan(db);
//			for (O_BCHChiDoan bch:bchs){
//				System.out.println(bch.getHoTen());
//			}
//			d_HoTroKinhPhi.addHoTroKinhPhi(db, "HT01", 500000, d_KeHoach.found_O_KeHoach(db, "KH01"), d_NguonKinhPhi.found_O_NguonKinhPhi(db, "KP01"));		
//			d_HoTroKinhPhi.addHoTroKinhPhi(db, "HT02", 1000000, d_KeHoach.found_O_KeHoach(db, "KH01"), d_NguonKinhPhi.found_O_NguonKinhPhi(db, "KP02"));	
//			d_HoTroKinhPhi.addHoTroKinhPhi(db, "HT03", 1500000, d_KeHoach.found_O_KeHoach(db, "KH02"), d_NguonKinhPhi.found_O_NguonKinhPhi(db, "KP03"));
//			d_ChiDoan.addChiDoan(db, "cd02", "He thong thong tin k22");
//			d_ChiDoan.addChiDoan(db, "cd03", "He thong thong tin k23");
//			d_ChiDoan.addChiDoan(db, "cd04", "He thong thong tin k23");
//			d_ChiDoan.addChiDoan(db, "cd05", "He thong thong tin k26");
//			d_ChiDoan.updateChiDoan(db, "cd04",  "He thong thong tin k24");
//			d_ChiDoan.addSinhVien(db, "cd04", d_sinhvien.found_O_SinhVien(db, "bch01"));
//			d_ChiDoan.deleteChiDoan(db, "cd04");
//			d_ChiDoan.removeSinhVien(db, "cd04", d_sinhvien.found_O_SinhVien(db, "bch01"));
//			d_KeHoach.addKeHoach(db, "KH01", new Date(2015, 1, 1), new Date(2015, 12, 1),
//			"Khoa CNTT", "Quyet san", true, false, 500000, d_ChiDoan.found_O_ChiDoan(db,"cd03"));
//	
//	d_KeHoach.addKeHoach(db, "KH04", new Date(2015, 1, 1), new Date(2015, 12, 1),
//			"Khoa CNTT", "Ve Sinh phong lab 2222", true, false, d_ChiDoan.found_O_ChiDoan(db,"cd05"));
//
//			ObjectSet<O_ChiDoan> cds=d_ChiDoan.selectAllChiDoan(db);
//			for (O_ChiDoan sv:cds){
//				System.out.println(sv.getMachidoan()+": "+ sv.getTenchidoan());
//			}
//			List<O_SinhVien> svs=d_ChiDoan.selectSinhVien_ChiDoan(db, "cd02");			
//			for (O_SinhVien sv:svs){
//				System.out.println(sv.getMa()+": "+ sv.getHoTen());
//			}
//			List<O_KeHoach> khs=d_ChiDoan.selectKeHoach_ChiDoan(db, "cd03");			
//			for (O_KeHoach sv:khs){
//				System.out.println(sv.getMakehoach()+": "+ sv.getNoiDung());
//			}
//			System.out.println("=========================================");
//			ObjectSet<O_SinhVien> sele = d_sinhvien.selectAllSinhVien(db);
//			for (O_SinhVien sv:sele){
//				System.out.println(sv.getMa()+": "+ sv.getHoTen());
//			}
//			System.out.println("=========================================");
//			List<O_KeHoach> dskh = d_sinhvien.selectSinhVien_KeHoach(db, "sv03");
//			for (O_KeHoach sv:dskh){
//				System.out.println(sv.getMakehoach()+": "+ sv.getNoiDung());
//			}
//			System.out.println("=========================================");
//			ObjectSet<O_KeHoach> sekh = d_KeHoach.selectAllKeHoach(db);
//			for (O_KeHoach sv:sekh){
//				System.out.println(sv.getMakehoach()+": "+ sv.getNoiDung());
//			}
//			System.out.println("=========================================");
//			List<O_SinhVien> sesv = d_KeHoach.selectSinhVien_KeHoach(db, "KH01");
//			for (O_SinhVien sv:sesv){
//				System.out.println(sv.getMa()+": "+ sv.getHoTen());
//			}
//			System.out.println("=========================================");
//			List<O_LichTrinh> selt = d_KeHoach.selectLichTrinh_KeHoach(db, "KH02");
//			for (O_LichTrinh sv:selt){
//				System.out.println(sv.getMalichtrinh()+": "+ sv.getTencongviec());
//			}
//			System.out.println("=========================================");
//			List<O_HoTroKinhPhi> senkp = d_KeHoach.selectNguonKinhPhi_KeHoach(db,  "KH01");
//			for (O_HoTroKinhPhi sv:senkp){
//				System.out.println(sv.getMahotro()+": "+ sv.getSotien());
//			}
			
//			d_ChiDoan.removeKeHoach(db, "cd03", d_KeHoach.found_O_KeHoach(db, "KH01"));
//			d_ChiDoan.removeKeHoach(db, "cd03", d_KeHoach.found_O_KeHoach(db, "KH01"));
//			d_ChiDoan.addKeHoach(db, "cd03", d_KeHoach.found_O_KeHoach(db, "KH01"));
//			d_sinhvien.updateSinhVien(db, "sv01", d_ChiDoan.found_O_ChiDoan(db, "cd02"));
//			d_sinhvien.addSinhVien(db, "sv01", "Test sinh vien 01", "0982 8888880", "Hau giang", "tthan@ctu.edu.vn", "sss", "ddddd");
//			d_sinhvien.addSinhVien(db, "sv02", "Test sinh vien 02", "0982 8888881", "Can Tho", "tthan@ctu.edu.vn", "sss", "ddddd");
//			d_sinhvien.addSinhVien(db, "sv03", "Test sinh vien 03", "0982 8888882", "Soc Trang", "tthan@ctu.edu.vn", "sss", "ddddd");
//			d_sinhvien.addSinhVien(db, "sv04", "Test sinh vien 04", "0982 8888883", "Bac Lieu", "tthan@ctu.edu.vn", "sss", "ddddd");
//			d_sinhvien.addSinhVien(db, "sv05", "Test sinh vien 05", "0982 8888884", "Ca Mau", "tthan@ctu.edu.vn", "sss", "ddddd");
//			d_sinhvien.addSinhVien(db, "sv06", "Test sinh vien 06", "0982 8888885", "Hai Phong", "tthan@ctu.edu.vn", "sss", "ddddd");
//			O_SinhVien sinhviens= d_sinhvien.found_O_SinhVien(db,"sv04");					
			
//	        d_ChiDoan.addSinhVien(db, "cd02", sinhviens);
//	        d_KeHoach.addSinhVien(db, "KH01", sinhviens);
//	        d_KeHoach.addSinhVien(db, "KH01", d_sinhvien.found_O_SinhVien(db,"sv01"));
//	        d_KeHoach.addSinhVien(db, "KH01", d_sinhvien.found_O_SinhVien(db,"sv03"));
//	        d_sinhvien.deleteSinhvien(db, "sv01");
//	        d_User.addUser(db, "sv02", "123456789", "admin", d_nguoi.found_O_Nguoi(db, "sv02"));
//	        d_User.addUser(db, "sv03", "123456789", "admin", d_nguoi.found_O_Nguoi(db, "sv03"));
//	        d_User.addUser(db, "sv04", "123456789", "bi thu chi doan", d_nguoi.found_O_Nguoi(db, "sv04"));
//	        d_User.addUser(db, "bch01", "123456789", "bi thu chi doan", d_nguoi.found_O_Nguoi(db, "bch01"));
//			d_NguonKinhPhi.addNguonKinhPhi(db, "KP01", "Quy chi doan");
//			d_NguonKinhPhi.addNguonKinhPhi(db, "KP02", "Doan khoa ho tro");
//			d_NguonKinhPhi.addNguonKinhPhi(db, "KP03", "Doan truong ho tro");
//			d_KeHoach.addKinhPhi(db, "KH01", d_NguonKinhPhi.found_O_NguonKinhPhi(db, "KP01"));
//			d_KeHoach.addNguonKinhPhi(db, "KH01", d_NguonKinhPhi.found_O_NguonKinhPhi(db, "KP02"));
//			d_KeHoach.addNguonKinhPhi(db, "KH02", d_NguonKinhPhi.found_O_NguonKinhPhi(db, "KP03"));
//			d_LichTrinh.addLichTrinh(db, "LT01", "Quyet san truoc", new Date(2015,1,1), new Date(2015,6,1), d_KeHoach.found_O_KeHoach(db, "KH01"));
//			d_LichTrinh.addLichTrinh(db, "LT02", "Quyet san sau", new Date(2015,6,2), new Date(2015,12,15), d_KeHoach.found_O_KeHoach(db, "KH01"));
//			d_LichTrinh.addLichTrinh(db, "LT03", "Quyet san truoc & sau", new Date(2015,12,15), new Date(2015,12,31), d_KeHoach.found_O_KeHoach(db, "KH01"));
//			d_LichTrinh.addLichTrinh(db, "LT04", "Ve sinh LAB 01, 02, 03,04", new Date(2015,1,1), new Date(2015,6,1), d_KeHoach.found_O_KeHoach(db, "KH02"));
//			d_LichTrinh.addLichTrinh(db, "LT05", "Ve sinh LAB 05, 06, 07,08", new Date(2015,6,2), new Date(2015,12,15), d_KeHoach.found_O_KeHoach(db, "KH02"));
//			d_LichTrinh.addLichTrinh(db, "LT06", "Ve sinh LAB 09, 10, 11, 12", new Date(2015,12,15), new Date(2015,12,31), d_KeHoach.found_O_KeHoach(db, "KH02"));
//			d_LichTrinh.addLichTrinh(db, "LT008", "Ve sinh LAB 09, 10, 11, 12", new Date(2015,12,15), new Date(2015,12,31), d_KeHoach.found_O_KeHoach(db, "KH03"));
			
					    
			

//			String tg_bd = "01-02-2015";
//			String tg_kt = "02-02-2015";
//			String diadiem = "Khoa CNTT";
//			String noidung = "Quyet san 2";
//			String machidoan = "cd05";					
//			Boolean isDuyet=false;
//			Boolean isDaThucHien=false;
				
//			SimpleDateFormat dt = new SimpleDateFormat("dd-MM-yyyy");
//	        Date ngayBatDau = null;
//			try {
//				ngayBatDau = dt.parse(tg_bd);
//			} catch (ParseException e1) {
//				e1.printStackTrace();
//			}
//	        Date ngayKetThuc = null;
//			try {
//				ngayKetThuc = dt.parse(tg_kt);
//			} catch (ParseException e) {
//				e.printStackTrace();
//			}				        
//			D_ChiDoan cd = new D_ChiDoan();	
//			O_ChiDoan o_cd = cd.found_O_ChiDoan(db, machidoan);
//			
//			kh.updateKeHoach(db, makehoach, ngayBatDau, ngayKetThuc, diadiem, noidung, isDuyet, isDaThucHien, o_cd);					
//			kh.addLichTrinh(db, makehoach, lichTrinh);
/*			D_KeHoach kh = new D_KeHoach();
			D_LichTrinh lt = new D_LichTrinh();
			String makehoach = "KH04_TEST";
			O_LichTrinh o_lt = lt.found_O_LichTrinhn(db,"LT04");
		   // if (o_lt != null) {
		    	//kh.addLichTrinh(db, makehoach, o_lt);
		    //}
			System.out.println(o_lt.getTencongviec()+'-'+o_lt.getMalichtrinh());
		    System.out.println("OK");*/
//			B_ThongKe tk = new B_ThongKe();
//		 ObjectSet<O_KeHoach> khs = tk.DS_KeHoachDaDuyet(db,1,2010, 12,2015);
	   //  ObjectSet<O_KeHoach> khs1 = tk.DS_KeHoachChuaThucHien(db,1,2010, 12,2015);
	     for(O_KeHoach khss :khs){
	    	 System.out.println(khss.getDiaDiem());
	     }
//	     for(O_KeHoach khss :khs1){
//	      khss.getDiaDiem();
//	     }

			conn.closeconnect();
			System.out.println("Xong ");
		} 
		
		catch(Exception ex)
		{
			System.out.println("eeeeeeeeeeeeeeeeeeeeee "+ex.toString());
		}
	}

}
