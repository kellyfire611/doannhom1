package model;
import java.util.*;

import com.db4o.ObjectContainer;
import com.db4o.ObjectSet;
import com.db4o.query.Query;

public class D_ChiDoan {
	
	public D_ChiDoan() {
		// TODO Auto-generated constructor stub
		 
	}
	
	/**
	 * ADD chi doan 2 doi so
	 * Status: tested
	 * @param machidoan
	 * @param Tenchidoan
	 */
	public void addChiDoan(ObjectContainer db,String machidoan, String Tenchidoan){
		try{
			O_ChiDoan ChiDoan = new O_ChiDoan(machidoan, Tenchidoan);					
			db.store(ChiDoan);		
		}catch(Exception ex){
			throw ex;
		}
	}
	/**
	 * ADD chi doan 4 doi so
	 *  Status: NOT tested
	 * @param machidoan
	 * @param Ten
	 * @param dssinhvien
	 * @param dskeHoach
	 */
	public void addChiDoan(ObjectContainer db,String machidoan, String Ten, List<O_SinhVien> dssinhvien, List<O_KeHoach> dskeHoach){
		try{
			O_ChiDoan ChiDoan = new O_ChiDoan(machidoan, Ten,dssinhvien,dskeHoach);	
			for(O_SinhVien sv:dssinhvien){
				O_SinhVien o_SinhVien=(O_SinhVien) db.queryByExample(sv).next();
				o_SinhVien.setThuocChiDoan(ChiDoan);
				db.store(o_SinhVien);
			}
			for(O_KeHoach kh:dskeHoach){
				O_KeHoach o_kh = (O_KeHoach) db.queryByExample(kh).next();
				kh.setCuaChiDoan(ChiDoan);
				db.store(o_kh);
			}
			db.store(ChiDoan);				
		}catch(Exception ex){
			throw ex;
		}
	}
	/**
	 * ADD sinh vien vao chi doan
	 * cap nhat thong tin thuoc chi doan cua sinh vien la chi doan dang thao tac
	 * Status: tested
	 * @param machidoan
	 * @param sinhVien object sinh vien
	 */
	public void addSinhVien(ObjectContainer db,String machidoan,O_SinhVien sinhVien ){		
		O_ChiDoan o_ChiDoan = (O_ChiDoan) db.queryByExample(new O_ChiDoan(machidoan)).next();
		o_ChiDoan.addSinhVien(sinhVien);				
		O_SinhVien o_SinhVien = (O_SinhVien) db.queryByExample(sinhVien).next();
		o_SinhVien.setThuocChiDoan(o_ChiDoan);
		db.store(o_SinhVien);
		db.store(o_ChiDoan);		
	}
	/**
	 * Remove sinh vien ra khoi danh sach sinh vien thuoc chi doan, 
	 * cap nhat thong tin thuoc chi doan cua sinh vien
	 * Status: tested
	 * @param db
	 * @param machidoan
	 * @param sinhVien object sinh vien
	 */
	public void removeSinhVien(ObjectContainer db,String machidoan,O_SinhVien sinhVien ){		
		O_ChiDoan o_ChiDoan = (O_ChiDoan) db.queryByExample(new O_ChiDoan(machidoan)).next();
		o_ChiDoan.removeSinhVien(sinhVien);
		O_SinhVien o_SinhVien = (O_SinhVien) db.queryByExample(sinhVien).next();
		o_SinhVien.setThuocChiDoan(null);
		db.store(o_SinhVien);
		db.store(o_ChiDoan);		
	}
	/**
	 * ADD ke hoach thuc hien cua chi doan, set thuoc tinh cuachidoan  cua ke hoach
	 * Status: tested
	 * @param machidoan
	 * @param keHoach
	 */
	public void addKeHoach(ObjectContainer db,String machidoan,O_KeHoach keHoach){
		O_ChiDoan o_ChiDoan = (O_ChiDoan) db.queryByExample(new O_ChiDoan(machidoan)).next();
		o_ChiDoan.addKeHoach(keHoach);		
		O_KeHoach o_KeHoach = (O_KeHoach) db.queryByExample(keHoach).next();
		o_KeHoach.setCuaChiDoan(o_ChiDoan);
		db.store(o_KeHoach);
		db.store(o_ChiDoan);
	}
	/**
	 * REMOVE ke hoach khoi chi doan, set thuoc tinh cuachidoan cua ke hoach thanh null, 
	 * sau khi remove ke hoach khoi chi doan, ke hoach do se khong thuoc chi doan nao ca, c� the xoa hoac chinh sang chi doan khac
	 * Status: tested
	 * @param db
	 * @param machidoan
	 * @param kehoach
	 */
	public void removeKeHoach(ObjectContainer db, String machidoan, O_KeHoach kehoach){
		O_ChiDoan o_ChiDoan = (O_ChiDoan) db.queryByExample(new O_ChiDoan(machidoan)).next();
		o_ChiDoan.removeKeHoach(kehoach);
		O_KeHoach o_KeHoach = (O_KeHoach) db.queryByExample(kehoach).next();
		o_KeHoach.setCuaChiDoan(null);
		db.store(o_KeHoach);
		db.store(o_ChiDoan);
	}
	/**
	 * Update ma va ten cua chi doan
	 * Status: tested
	 * @param machidoan
	 * @param ten
	 */
	public void updateChiDoan(ObjectContainer db,String machidoan, String ten){
		try{
			O_ChiDoan o_ChiDoan = (O_ChiDoan) db.queryByExample(new O_ChiDoan(machidoan)).next();					
			o_ChiDoan.setMachidoan(machidoan);
			o_ChiDoan.setTenchidoan(ten);				
			db.store(o_ChiDoan);	
		}catch(Exception ex){
			throw ex;
		}
	}
	/**
	 * Update ma, ten, ds sinh vien, ds ke hoach cua chi doan
	 * Status: NOT tested
	 * @param machidoan
	 * @param ten
	 * @param dssinhVien
	 * @param dskeHoach
	 */
	public void updateChiDoan(ObjectContainer db,String machidoan, String ten, List<O_SinhVien> dssinhVien, List<O_KeHoach> dskeHoach){
		try{
			O_ChiDoan o_ChiDoan = (O_ChiDoan) db.queryByExample(new O_ChiDoan(machidoan)).next();					
			o_ChiDoan.setMachidoan(machidoan);
			o_ChiDoan.setTenchidoan(ten);	
			o_ChiDoan.setDssinhVien(dssinhVien);
			o_ChiDoan.setDskeHoach(dskeHoach);
			db.store(o_ChiDoan);
		}catch(Exception ex){
			throw ex;
		}
	}
	/**
	 * Xoa chi doan: chi xoa khi chi doan khong co ke hoach nao, neu co thi khong cho xoa, 	 
	 * phai xoa ke hoach cua chi doan truoc
	 * Status: tested
	 * @param machidoan
	 */
	public boolean deleteChiDoan(ObjectContainer db,String machidoan){
		try{
			O_ChiDoan bChiDoan = (O_ChiDoan) db.queryByExample(new O_ChiDoan(machidoan)).next();				
	//	if (bChiDoan.getDskeHoach().isEmpty()){			
			
				for (O_SinhVien sv:bChiDoan.getDssinhVien()){
					sv.setThuocChiDoan(null);
					db.store(sv);
				}
				db.delete(bChiDoan);	
				return true;
			//}else{
			//	return false;
			//}
			
		}catch(Exception ex){
			return false;
		}
	}
	/**
	 * select all chi doan
	 * Status: tested
	 * @param db
	 * @return
	 */
	public ObjectSet<O_ChiDoan> selectAllChiDoan(ObjectContainer db){
		try{			
			return db.queryByExample(new O_ChiDoan());		
		}
		catch(Exception e){
			return null;
		}
	}
	/**
	 * Select danh sach sinh vien cua chi doan
	 * Status: tested
	 * @param db
	 * @param machidoan
	 * @return tra ve List O_SinhVien
	 */
	public List<O_SinhVien> selectSinhVien_ChiDoan(ObjectContainer db,String machidoan){
		try{			
			ObjectSet<O_ChiDoan> svs= db.queryByExample(new O_ChiDoan(machidoan));	
			O_ChiDoan cd = svs.get(0);
			List<O_SinhVien> dssv = cd.getDssinhVien();
			dssv.removeAll(Collections.singleton(null));
			return dssv;
		}
		catch(Exception e){
			return null;
		}
	}
	/**
	 * Select danh sach ke hoach cua chi doan
	 * Status: tested
	 * @param db
	 * @param machidoan
	 * @return tra ve List O_KeHoach
	 */
	public List<O_KeHoach> selectKeHoach_ChiDoan(ObjectContainer db,String machidoan){
		try{			
			ObjectSet<O_ChiDoan> khs= db.queryByExample(new O_ChiDoan(machidoan));	
			O_ChiDoan cd = khs.get(0);
			List<O_KeHoach> dskh = cd.getDskeHoach();
			dskh.removeAll(Collections.singleton(null));
			return dskh;
		}
		catch(Exception e){
			return null;
		}
	}
	/**
	 * Tim chi doan theo ma
	 * @param ma
	 * @return true neu tim thay, false neu tim khong thay
	 */
	public boolean existChiDoan(ObjectContainer db,String ma){
		try{
			Query query1 = db.query();
	        query1.constrain(O_ChiDoan.class);	        
	        query1.descend("machidoan").constrain(ma).equal();	        
	        ObjectSet<O_ChiDoan> bChiDoan = query1.execute();
	        if (bChiDoan.size()!=0) {
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
	 * Tim chi doan theo ma 
	 * Status: tested
	 * @param ma
	 * @return tra ve  O_ChiDoan duoc tim thay, null neu tim khong thay
	 */
	public O_ChiDoan found_O_ChiDoan(ObjectContainer db,String ma){
		try{
			Query query1 = db.query();
	        query1.constrain(O_ChiDoan.class);	        
	        query1.descend("machidoan").constrain(ma).equal();	        
	        ObjectSet<O_ChiDoan> o_ChiDoan = query1.execute();
	        return o_ChiDoan.get(0);	        
		}catch(Exception e){
			System.out.println("hhh"+e.toString());
			return null;
		}		
	}
}
