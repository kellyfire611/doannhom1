package model;
import java.util.Date;

import com.db4o.ObjectContainer;
import com.db4o.ObjectSet;
import com.db4o.query.Query;

public class D_LichTrinh {

	public D_LichTrinh() {
		// TODO Auto-generated constructor stub
	}
	/**
	 * ADD lich trinh thuc hien cua ke hoach, add vao dslichtrinh cua ke hoach
	 * Status: tested
	 * @param db
	 * @param malichtrinh
	 * @param tencongviec
	 * @param thoigianbatdau
	 * @param thoigianketthuc
	 * @param cuaKeHoach
	 */
	public void addLichTrinh(ObjectContainer db,String malichtrinh, String tencongviec,Date thoigianbatdau,Date thoigianketthuc, O_KeHoach cuaKeHoach){
		try{
			O_LichTrinh o_LichTrinh = new O_LichTrinh(malichtrinh, tencongviec, thoigianbatdau, thoigianketthuc, cuaKeHoach);
			O_KeHoach o_KeHoach = (O_KeHoach) db.queryByExample(cuaKeHoach).next();
			o_KeHoach.addLichTrinh(o_LichTrinh);
			db.store(o_KeHoach);
 			db.store(o_LichTrinh);		
		}catch(Exception ex){
			throw ex;
		}
	}
	/**
	 * Update lich trinh thuc hien cua ke hoachS
	 * @param db
	 * @param malichtrinh
	 * @param tencongviec
	 * @param thoigianbatdau
	 * @param thoigianketthuc
	 * @param cuaKeHoach
	 */
	public void updateLichTrinh(ObjectContainer db,String malichtrinh, String tencongviec,Date thoigianbatdau,Date thoigianketthuc, O_KeHoach cuaKeHoach){
		try{
			O_LichTrinh o_LichTrinh = (O_LichTrinh) db.queryByExample(new O_LichTrinh(malichtrinh)).next();		
			O_KeHoach o_KeHoach = (O_KeHoach) db.queryByExample(o_LichTrinh.getCuaKeHoach()).next();
			o_KeHoach.removeLichTrinh(o_LichTrinh);
			O_KeHoach o_KeHoach_new = (O_KeHoach) db.queryByExample(cuaKeHoach).next();
			o_KeHoach_new.addLichTrinh(o_LichTrinh);
			o_LichTrinh.setTencongviec(tencongviec);
			o_LichTrinh.setThoigianbatdau(thoigianbatdau);
			o_LichTrinh.setThoigianketthuc(thoigianketthuc);
			o_LichTrinh.setCuaKeHoach(cuaKeHoach);
			db.store(o_LichTrinh);		
		}catch(Exception ex){
			throw ex;
		}
	}
	/**
	 * Xoa lich trinh, remove lich trinh ra khoi dslichtrinh cua ke hoach
	 * @param malichtrinh
	 */
	public void deleteLichTrinh(ObjectContainer db,String malichtrinh){
		  try{
		   O_LichTrinh o_LichTrinh = (O_LichTrinh) db.queryByExample(new O_LichTrinh(malichtrinh)).next();    
		   O_KeHoach o_KeHoach = (O_KeHoach) db.queryByExample(o_LichTrinh.getCuaKeHoach()).next(); 
		   o_KeHoach.removeLichTrinh(o_LichTrinh);
		   db.store(o_KeHoach);
		   db.delete(o_LichTrinh); 
		   
		  }catch(Exception ex){
		   throw ex;
	  }
	 }
	/**
	 * Tim lich trinh
	 * @param db
	 * @param malichtrinh
	 * @return
	 */
	public boolean existLichTrinh(ObjectContainer db,String malichtrinh){
		try{
			Query query1 = db.query();
	        query1.constrain(O_LichTrinh.class);	        
	        query1.descend("malichtrinh").constrain(malichtrinh).equal();	        
	        ObjectSet<O_LichTrinh> o_LichTrinh = query1.execute();
	        if (o_LichTrinh.size()!=0) {
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
	 * select all lich trinh
	 * Status: tested
	 * @param db
	 * @return
	 */
	public ObjectSet<O_LichTrinh> selectAllChiDoan(ObjectContainer db){
		try{			
			return db.queryByExample(new O_LichTrinh());		
		}
		catch(Exception e){
			return null;
		}
	}
	/** Tim lich trinh theo ma
	 * @param db
	 * @param malichtrinh
	 * @return tra ve danh sach O_LichTrinh duoc tim thay, null neu tim khong thay
	 */
	public O_LichTrinh found_O_LichTrinhn(ObjectContainer db, String malichtrinh){
		try{
			Query query1 = db.query();
	        query1.constrain(O_LichTrinh.class);	        
	        query1.descend("malichtrinh").constrain(malichtrinh).equal();	        
	        ObjectSet<O_LichTrinh> o_LichTrinh = query1.execute();	    
        	return o_LichTrinh.get(0);	        
		}catch(Exception e){
			System.out.println("hhh"+e.toString());
			return null;
		}		
	}
	/**
	 * select all lich trinh
	 * Status: tested
	 * @param db
	 * @return
	 */
	public ObjectSet<O_LichTrinh> selectAllLichTrinh(ObjectContainer db){
		try{			
			return db.queryByExample(new O_LichTrinh());		
		}
		catch(Exception e){
			return null;
		}
	}
	
}
