package model;

import java.util.Calendar;
import com.db4o.ObjectContainer;
import com.db4o.ObjectSet;
import com.db4o.query.Constraint;
import com.db4o.query.Query;

public class B_ThongKe {
	public B_ThongKe() {
		// TODO Auto-generated constructor stub
	}
	/**
	 * Tra danh sach ke hoach co ngay bat dau trong khoang thoi gian bao cao va da duoc duyet
	 * @param db
	 * @param tuThang nhap vao tu thang can bao cao, luu y: thang trong nam di tu 0 den 11
	 * @param tuNam
	 * @param denThang vi du: thang 1 thi truyen vao la 0, thang 12 thi truyen vao 11
	 * @param denNam
	 * @return
	 */
	public ObjectSet<O_KeHoach> DS_KeHoachDaDuyet(ObjectContainer db,int tuThang, int tuNam,int denThang,int denNam){
		try{
			Calendar calendar = Calendar.getInstance();
	        calendar.set(tuNam, tuThang, 1);
	        Calendar calendar1 = Calendar.getInstance();
	        calendar1.set(denNam, denThang, 1);
			Query query1 = db.query();
	        query1.constrain(O_KeHoach.class);	        
	        Constraint constr = query1.descend("ngayBatDau").constrain(calendar.getTime()).greater();	        
	        Constraint constr1 = query1.descend("ngayBatDau").constrain(calendar1.getTime()).smaller().and(constr);
	        query1.descend("duyet").constrain(true).and(constr1);
	        ObjectSet<O_KeHoach> o_KeHoach = query1.execute();	    
        	return o_KeHoach;	        
		}catch(Exception e){
			return null;
		}			
	}
	/**
	 * Tra danh sach ke hoach co ngay bat dau trong khoang thoi gian bao cao va da CHUA duoc duyet
	 * @param db
	 * @param tuThang nhap vao tu thang can bao cao, luu y: thang trong nam di tu 0 den 11
	 * @param tuNam
	 * @param denThang vi du: thang 1 thi truyen vao la 0, thang 12 thi truyen vao 11
	 * @param denNam
	 * @return
	 */
	public ObjectSet<O_KeHoach> DS_KeHoachChuaDuyet(ObjectContainer db,int tuThang, int tuNam,int denThang,int denNam){
		try{
			Calendar calendar = Calendar.getInstance();
	        calendar.set(tuNam, tuThang, 1);
	        Calendar calendar1 = Calendar.getInstance();
	        calendar1.set(denNam, denThang, 1);
			Query query1 = db.query();
	        query1.constrain(O_KeHoach.class);	        
	        Constraint constr = query1.descend("ngayBatDau").constrain(calendar.getTime()).greater();	        
	        Constraint constr1 = query1.descend("ngayBatDau").constrain(calendar1.getTime()).smaller().and(constr);
	        query1.descend("duyet").constrain(false).and(constr1);
	        ObjectSet<O_KeHoach> o_KeHoach = query1.execute();	    
        	return o_KeHoach;	        
		}catch(Exception e){
			return null;
		}			
	}
	/**
	 * Tra danh sach ke hoach co ngay bat dau trong khoang thoi gian bao cao va da thuc hien
	 * @param db
	 * @param tuThang nhap vao tu thang can bao cao, luu y: thang trong nam di tu 0 den 11
	 * @param tuNam
	 * @param denThang vi du: thang 1 thi truyen vao la 0, thang 12 thi truyen vao 11
	 * @param denNam
	 * @return
	 */
	public ObjectSet<O_KeHoach> DS_KeHoachDaThucHien(ObjectContainer db,int tuThang, int tuNam,int denThang,int denNam){
		try{
			Calendar calendar = Calendar.getInstance();
	        calendar.set(tuNam, tuThang, 1);
	        Calendar calendar1 = Calendar.getInstance();
	        calendar1.set(denNam, denThang, 1);
			Query query1 = db.query();
	        query1.constrain(O_KeHoach.class);	        
	        Constraint constr = query1.descend("ngayBatDau").constrain(calendar.getTime()).greater();	        
	        Constraint constr1 = query1.descend("ngayBatDau").constrain(calendar1.getTime()).smaller().and(constr);
	        query1.descend("daThucHien").constrain(true).and(constr1);
	        ObjectSet<O_KeHoach> o_KeHoach = query1.execute();	    
        	return o_KeHoach;	        
		}catch(Exception e){
			return null;
		}			
	}
	/**
	 * Tra danh sach ke hoach co ngay bat dau trong khoang thoi gian bao cao va CHUA thuc hien
	 * @param db
	 * @param tuThang nhap vao tu thang can bao cao, luu y: thang trong nam di tu 0 den 11
	 * @param tuNam
	 * @param denThang vi du: thang 1 thi truyen vao la 0, thang 12 thi truyen vao 11
	 * @param denNam
	 * @return
	 */
	public ObjectSet<O_KeHoach> DS_KeHoachChuaThucHien(ObjectContainer db,int tuThang, int tuNam,int denThang,int denNam){
		try{
			Calendar calendar = Calendar.getInstance();
	        calendar.set(tuNam, tuThang, 1);
	        Calendar calendar1 = Calendar.getInstance();
	        calendar1.set(denNam, denThang, 1);
			Query query1 = db.query();
	        query1.constrain(O_KeHoach.class);	        
	        Constraint constr = query1.descend("ngayBatDau").constrain(calendar.getTime()).greater();	        
	        Constraint constr1 = query1.descend("ngayBatDau").constrain(calendar1.getTime()).smaller().and(constr);
	        query1.descend("daThucHien").constrain(false).and(constr1);
	        ObjectSet<O_KeHoach> o_KeHoach = query1.execute();	    
        	return o_KeHoach;	        
		}catch(Exception e){
			return null;
		}				
	}
	/**
	 * Thong ke danh sach cac hoat dong cua sinh vien trong mot khoang thoi gian.
	 * Luu y: chi xet nhung ke hoach ma sinh vien co tham gia va da thuc hien
	 * @param db
	 * @param sinhvien
	 * @param tuThang
	 * @param tuNam
	 * @param denThang
	 * @param denNam
	 * @return
	 */
	public ObjectSet<O_KeHoach> TK_HoatDongSinhVien(ObjectContainer db,O_SinhVien sinhvien,int tuThang, int tuNam,int denThang,int denNam){
		try{
			Calendar calendar = Calendar.getInstance();
	        calendar.set(tuNam, tuThang, 1);
	        Calendar calendar1 = Calendar.getInstance();
	        calendar1.set(denNam, denThang, 1);
			Query query1 = db.query();
	        query1.constrain(O_KeHoach.class);	        
	        Constraint constr = query1.descend("ngayBatDau").constrain(calendar.getTime()).greater();	        
	        Constraint constr1 = query1.descend("ngayBatDau").constrain(calendar1.getTime()).smaller().and(constr);
	        Constraint constr2 = query1.descend("dssinhvien").constrain(sinhvien).contains().and(constr1);
	        query1.descend("daThucHien").constrain(true).contains().and(constr2);
	        ObjectSet<O_KeHoach> o_KeHoach = query1.execute();	    
        	return o_KeHoach;	        
		}catch(Exception e){
			return null;
		}			
	}
	/**
	 * Thong ke danh sach cac hoat dong cua sinh vien trong mot khoang thoi gian.
	 * Luu y: xet nhung ke hoach cua chi doan va khong phan biet da thuc hien hay chua
	 * @param db
	 * @param chidoan
	 * @param tuThang
	 * @param tuNam
	 * @param denThang
	 * @param denNam
	 * @return
	 */
	public ObjectSet<O_KeHoach> TK_HoatDongChiDoan(ObjectContainer db,O_ChiDoan chidoan,int tuThang, int tuNam,int denThang,int denNam){
		try{
			Calendar calendar = Calendar.getInstance();
	        calendar.set(tuNam, tuThang, 1);
	        Calendar calendar1 = Calendar.getInstance();
	        calendar1.set(denNam, denThang, 1);
			Query query1 = db.query();
	        query1.constrain(O_KeHoach.class);	        
	        Constraint constr = query1.descend("ngayBatDau").constrain(calendar.getTime()).greater();	        
	        Constraint constr1 = query1.descend("ngayBatDau").constrain(calendar1.getTime()).smaller().and(constr);
	        query1.descend("cuaChiDoan").constrain(chidoan).and(constr1);
	        ObjectSet<O_KeHoach> o_KeHoach = query1.execute();	    
        	return o_KeHoach;	        
		}catch(Exception e){
			return null;
		}			
	}
	/**
	 * Thong ke danh sach cac hoat dong cua sinh vien trong mot khoang thoi gian.
	 * Luu y: xet nhung ke hoach cua chi doan va khong phan biet da thuc hien hay chua
	 * @param db
	 * @param nguonkinhphi
	 * @param tuThang
	 * @param tuNam
	 * @param denThang
	 * @param denNam
	 * @return
	 */
	public ObjectSet<O_KeHoach> TK_KeHoachTheoNguonKinhPhi(ObjectContainer db,O_NguonKinhPhi nguonkinhphi,int tuThang, int tuNam,int denThang,int denNam){
		try{
			Calendar calendar = Calendar.getInstance();
	        calendar.set(tuNam, tuThang, 1);
	        Calendar calendar1 = Calendar.getInstance();
	        calendar1.set(denNam, denThang, 1);
			Query query1 = db.query();
	        query1.constrain(O_HoTroKinhPhi.class);	        
	        Constraint constr = query1.descend("ngayBatDau").constrain(calendar.getTime()).greater();	        
	        Constraint constr1 = query1.descend("ngayBatDau").constrain(calendar1.getTime()).smaller().and(constr);
	        query1.descend("cuaChiDoan").constrain(nguonkinhphi).and(constr1);
	        ObjectSet<O_KeHoach> o_KeHoach = query1.execute();	    
        	return o_KeHoach;	        
		}catch(Exception e){
			return null;
		}			
	}
	/**
	 * Thong ke danh sach cac hoat dong cua sinh vien trong mot khoang thoi gian.
	 * Luu y: xet nhung ke hoach cua chi doan va khong phan biet da thuc hien hay chua
	 * @param db
	 * @param nguonkinhphi
	 * @return
	 */
	public ObjectSet<O_LichTrinh> TK_LichTrinhThucHienKeHoach(ObjectContainer db,O_KeHoach kehoach){
		try{   
			Query query1 = db.query();
	        query1.constrain(O_LichTrinh.class);
	        query1.descend("cuaKeHoach").constrain(kehoach);
	        ObjectSet<O_LichTrinh> o_LichTrinh = query1.execute();	    
        	return o_LichTrinh;	        
		}catch(Exception e){
			return null;
		}			
	}
}
