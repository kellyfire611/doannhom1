package model;
import java.util.Collections;
import java.util.List;

import com.db4o.ObjectContainer;
import com.db4o.ObjectSet;
import com.db4o.query.Query;

/**
 * 
 */

/**
 * @author DELL
 *
 */
public class D_SinhVien {
	
	/**
	 * 
	 */
	public D_SinhVien() {
		// TODO Auto-generated constructor stub
	}
	public D_SinhVien(String ma) {
		// TODO Auto-generated constructor stub
	}
	/**
	 * ADD sinh vien
	 * Status: tested
	 * @param db
	 * @param masinhvien
	 * @param hoTen
	 * @param soDienThoai
	 * @param diaChi
	 * @param email
	 * @param diaChiFaceBook
	 * @param skype
	 */
	public void addSinhVien(ObjectContainer db,String masinhvien, String hoTen,String soDienThoai,String diaChi,String email, String diaChiFaceBook,String skype){
		try{
			O_SinhVien o_SinhVien = new O_SinhVien(masinhvien, hoTen, soDienThoai, diaChi, email, diaChiFaceBook, skype);		
			db.store(o_SinhVien);		
		}catch(Exception ex){
			throw ex;
		}
	}
	/**
	 * Update thong tin sinh vien (KHONG update thong tin chi doan)
	 * Status: tested
	 * @param db
	 * @param masinhvien
	 * @param hoTen
	 * @param soDienThoai
	 * @param diaChi
	 * @param email
	 * @param diaChiFaceBook
	 * @param skype
	 */
	public void updateSinhVien(ObjectContainer db,String masinhvien, String hoTen,String soDienThoai,String diaChi,String email, String diaChiFaceBook,String skype){
		try{
			O_SinhVien o_SinhVien = (O_SinhVien) db.queryByExample(new O_SinhVien(masinhvien)).next();					
			o_SinhVien.setDiaChi(diaChi);
			o_SinhVien.setDiaChiFaceBook(diaChiFaceBook);
			o_SinhVien.setEmail(email);
			o_SinhVien.setHoTen(hoTen);
			o_SinhVien.setSkype(skype);
			o_SinhVien.setSoDienThoai(soDienThoai);						
			db.store(o_SinhVien);		
		}catch(Exception ex){
			throw ex;
		}
	}
	/**
	 * Update thong tin sinh vien thuoc chi doan
	 * - tim chi doan hien tai cua sinh vien, remove sinh vien ra khoi chi doan do
	 * - set thuoc tinh chi doan hien tai cua sinh vien thanh chi doan moi
	 * - add sinh vien vao chi doan moi
	 * Status: tested
	 * @param db
	 * @param masinhvien
	 * @param thuocchidoan
	 */
	public void updateSinhVien(ObjectContainer db,String masinhvien,O_ChiDoan thuocchidoan){
		try{
			O_SinhVien o_SinhVien = (O_SinhVien) db.queryByExample(new O_SinhVien(masinhvien)).next();	
			if (o_SinhVien.getThuocChiDoan()!=null){
				O_ChiDoan o_ChiDoan = (O_ChiDoan) db.queryByExample(o_SinhVien.getThuocChiDoan()).next();
				o_ChiDoan.removeSinhVien(o_SinhVien);					
				db.store(o_ChiDoan);
			}
			o_SinhVien.setThuocChiDoan(thuocchidoan);			
			thuocchidoan.addSinhVien(o_SinhVien);
			db.store(o_SinhVien);
			db.store(thuocchidoan);
			
		}catch(Exception ex){
			throw ex;
		}
	}
	/**
	  * Xoa sinh vien:
	 * - remove sinh vien ra khoi danh sach thuc hien ke hoach
	 * - remove sinh vien ra khoi danh sach sinh vien cua chi doan
	 * @param masinhvien
	 * @throws Exception 
	 */
	public void deleteSinhvien(ObjectContainer db,String masinhvien){
		try{
			O_SinhVien o_SinhVien = (O_SinhVien) db.queryByExample(new O_SinhVien(masinhvien)).next();
			if (o_SinhVien.getThuocChiDoan()!=null){
				O_ChiDoan o_ChiDoan = (O_ChiDoan) db.queryByExample(o_SinhVien.getThuocChiDoan()).next();
				o_ChiDoan.removeSinhVien(o_SinhVien);	
				db.store(o_ChiDoan);
			}
			D_User d_User = new D_User();
			if (d_User.selectUser_Nguoi(db, masinhvien)!=null){
				O_User o_User = (O_User) db.queryByExample(d_User.selectUser_Nguoi(db, masinhvien)).next();
				d_User.deleteUser(db, o_User.getUserName());
			}
			for (O_KeHoach k : o_SinhVien.getDsKeHoach()) {
	            k.removeSinhVien(o_SinhVien);
	            db.store(k);
	        }			
				
			db.delete(o_SinhVien);	
		}catch(Exception ex){
			throw ex;
		}
	}
	/**
	 * select all sinh vien
	 * Status: tested
	 * @param db
	 * @return
	 */
	public ObjectSet<O_SinhVien> selectAllSinhVien(ObjectContainer db){
		try{			
			return db.queryByExample(new O_SinhVien());		
		}
		catch(Exception e){
			return null;
		}
	}
	/**
	 * Select danh sach ke hoach cua sinh vien
	 * Status: tested
	 * @param db
	 * @param masinhvien
	 * @return tra ve List O_SinhVien
	 */
	public List<O_KeHoach> selectSinhVien_KeHoach(ObjectContainer db,String masinhvien){
		try{			
			ObjectSet<O_SinhVien> svs= db.queryByExample(new O_SinhVien(masinhvien));	
			O_SinhVien cd = svs.get(0);
			List<O_KeHoach> dskh = cd.getDsKeHoach();
			dskh.removeAll(Collections.singleton(null));
			return dskh;
		}
		catch(Exception e){
			return null;
		}
	}
	/**
	 * Tim sinh vien theo ma
	 * @param masinhvien
	 * @return true neu tim thay, false neu tim khong thay
	 */
	public boolean existSinhVien(ObjectContainer db,String masinhvien){
		try{
			Query query1 = db.query();
	        query1.constrain(O_SinhVien.class);	        
	        query1.descend("ma").constrain(masinhvien).equal();	        
	        ObjectSet<O_SinhVien> sinhvien = query1.execute();
	        if (sinhvien.size()!=0) {
	        	return true;
	        }
	        else {
	        	return false;
	        }
		}catch(Exception e){
			System.out.println("hhh"+e.toString());
			return false;
		}		
	}
	/**
	 * Tim sinh vien chinh xac theo ma
	 * Status: tested
	 * @param masinhvien
	 * @return tra ve danh sach cac O_SinhVien duoc tim thay theo kieu ObjectSet, null neu khong tim thay
	 */
	public O_SinhVien found_O_SinhVien(ObjectContainer db, String masinhvien){
		try{
			Query query1 = db.query();
	        query1.constrain(O_SinhVien.class);	        
	        query1.descend("ma").constrain(masinhvien).equal();	        
	        ObjectSet<O_SinhVien> o_SinhVien = query1.execute();	    
        	return o_SinhVien.get(0);	        
		}catch(Exception e){
			System.out.println("hhh"+e.toString());
			return null;
		}		
	}
	/**
	 * Bo sung ke hoach thuc hien cho sinh vien, ham nay tuong duong voi D_KeHoach.addSinhVien()
	 * @param db
	 * @param masinhvien
	 * @param kehoach
	 */
	public void addKehoach(ObjectContainer db, String masinhvien,O_KeHoach kehoach){
		O_SinhVien o_SinhVien = (O_SinhVien) db.queryByExample(new O_SinhVien(masinhvien)).next();	
		o_SinhVien.addKeHoach(kehoach);
		O_KeHoach o_KeHoach = (O_KeHoach) db.queryByExample(kehoach).next();
		o_KeHoach.addSinhVien(o_SinhVien);
		//add sinh vien vao ke hoach
		db.store(o_KeHoach);
		db.store(o_SinhVien);
	}
	public void removeKehoach(ObjectContainer db, String masinhvien,O_KeHoach kehoach){
		O_SinhVien o_SinhVien = (O_SinhVien) db.queryByExample(new O_SinhVien(masinhvien)).next();	
		o_SinhVien.removeKeHoach(kehoach);
		O_KeHoach o_KeHoach = (O_KeHoach) db.queryByExample(kehoach).next();
		o_KeHoach.removeSinhVien(o_SinhVien);
		//remove sinh vien vao ke hoach
		db.store(o_KeHoach);
		db.store(o_SinhVien);
	}
	
}
