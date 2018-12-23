package model;
import com.db4o.ObjectContainer;
import com.db4o.ObjectSet;

import com.db4o.query.Query;

/**
 * 
 */

/**
 * @author TTHAN
 *
 */
public class D_BCHChiDoan {
	
	/**
	 * 
	 */
	public D_BCHChiDoan() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * ADD ban chap hanh chi doan
	 * Status: tested
	 * @param ma
	 * @param hoTen
	 * @param soDienThoai
	 * @param diaChi
	 * @param chucvu
	 * @param email
	 * @param diaChiFaceBook
	 * @param skype
	 */

	public void addBCHChiDoan(ObjectContainer db,String ma, String hoTen,String soDienThoai,String diaChi,String chucvu,String email, String diaChiFaceBook,String skype){
		try{
			O_BCHChiDoan bBCHChiDoan = new O_BCHChiDoan(ma, hoTen,soDienThoai, diaChi,email,diaChiFaceBook,skype);		
			bBCHChiDoan.setChucVu(chucvu);
			db.store(bBCHChiDoan);		
		}catch(Exception ex){
			throw ex;
		}
	}
	
	/**
	 * Update ban chap hanh chi doan
	 * Status: tested
	 * @param ma
	 * @param hoTen
	 * @param soDienThoai
	 * @param diaChi
	 * @param chucvu
	 * @param email
	 * @param diaChiFaceBook
	 * @param skype
	 */
	public void updateBCHChiDoan(ObjectContainer db,String ma, String hoTen,String soDienThoai,String diaChi,String chucvu,String email, String diaChiFaceBook,String skype){
		try{
			O_BCHChiDoan bBCHChiDoan = (O_BCHChiDoan) db.queryByExample(new O_BCHChiDoan(ma)).next();					
			bBCHChiDoan.setDiaChi(diaChi);
			bBCHChiDoan.setDiaChiFaceBook(diaChiFaceBook);
			bBCHChiDoan.setEmail(email);
			bBCHChiDoan.setHoTen(hoTen);
			bBCHChiDoan.setSkype(skype);
			bBCHChiDoan.setSoDienThoai(soDienThoai);		
			bBCHChiDoan.setChucVu(chucvu);		
			db.store(bBCHChiDoan);		
		}catch(Exception ex){
			throw ex;
		}
	}
	/**
	 * Xoa ban chap hanh chi doan
	 * @param ma
	 */
	public void deleteBCHChiDoan(ObjectContainer db,String ma){
		try{
			O_BCHChiDoan bBCHChiDoan = (O_BCHChiDoan) db.queryByExample(new O_BCHChiDoan(ma)).next();					
			db.delete(bBCHChiDoan);	
		}catch(Exception ex){
			throw ex;
		}
	}
	/**
	 * Tim chap hanh chi doan theo ma
	 * @param ma
	 * @return true neu tim thay, false neu khong tim thay
	 */
	public boolean existBCHChiDoan(ObjectContainer db,String ma){
		try{
			Query query1 = db.query();
	        query1.constrain(O_BCHChiDoan.class);	        
	        query1.descend("ma").constrain(ma).equal();	        
	        ObjectSet<O_BCHChiDoan> bBCHChiDoan = query1.execute();
	        if (bBCHChiDoan.size()!=0) {
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
	 * select all ban chap hanh chi doan
	 * Status: tested
	 * @param db
	 * @return
	 */
	public ObjectSet<O_BCHChiDoan> selectAllBCHChiDoan(ObjectContainer db){
		try{			
			return db.queryByExample(new O_BCHChiDoan());		
		}
		catch(Exception e){
			return null;
		}
	}
	/**
	 * Tim ban chap ahnh chi doan chinh xac theo ma
	 * @param ma
	 * @return tra ve danh sach O_BCHChiDoan theo dang ObjectSet, null tim khong thay
	 */
	public O_BCHChiDoan found_O_BCHChiDoan(ObjectContainer db, String ma){
		try{
			Query query1 = db.query();
	        query1.constrain(O_BCHChiDoan.class);	        
	        query1.descend("ma").constrain(ma).equal();	        
	        ObjectSet<O_BCHChiDoan> bBCHChiDoan = query1.execute();	    
        	return bBCHChiDoan.get(0);	        
		}catch(Exception e){
			System.out.println("hhh"+e.toString());
			return null;
		}		
	}
	/**
	 * tim tuong doi theo ma ban chap hanh chi doan
	 * @param ma
	 * @return tra ve danh sach cac O_BCHChiDoan duoc tim thay, null neu tim khong thay
	 */
	public ObjectSet<O_BCHChiDoan> found_O_BCHChiDoan(ObjectContainer db,String ma,String hoTen){
		try{
			Query query1 = db.query();
	        query1.constrain(O_BCHChiDoan.class);	        
	        query1.descend("ma").constrain(ma).contains();	  
	        query1.descend("hoTen").constrain(hoTen).contains();	  
	        ObjectSet<O_BCHChiDoan> bBCHChiDoan = query1.execute();	    
        	return bBCHChiDoan;	        
		}catch(Exception e){
			System.out.println("hhh"+e.toString());
			return null;
		}		
	}
}
