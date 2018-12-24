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
public class D_DonHang {
	
	/**
	 * 
	 */
	public D_DonHang() {
		// TODO Auto-generated constructor stub
	}
	
	public void add(ObjectContainer db,int dh_ma, String dh_ngaylap, String dh_ngaygiao, String dh_noigiao, 
            String dh_trangthaithanhtoan, O_NhanVien nv_duyet_donhang){
		try{
			O_DonHang bKhachHang = new O_DonHang(dh_ma, dh_ngaylap, dh_ngaygiao, dh_noigiao, 
		            dh_trangthaithanhtoan, nv_duyet_donhang);		
			db.store(bKhachHang);		
		}catch(Exception ex){
			throw ex;
		}
	}
	
	public void update(ObjectContainer db, int dh_ma, String dh_ngaylap, String dh_ngaygiao, String dh_noigiao, 
            String dh_trangthaithanhtoan, O_NhanVien nv_duyet_donhang){
		try{
			O_DonHang obj = (O_DonHang) db.queryByExample(new O_DonHang(dh_ma)).next();
			obj.setDh_ngaygiao(dh_ngaygiao);
			obj.setDh_ngaylap(dh_ngaylap);
			obj.setDh_noigiao(dh_noigiao);
			obj.setDh_trangthaithanhtoan(dh_trangthaithanhtoan);
			//obj.setDonhangSanPham(dhsp);
			db.store(obj);		
		}catch(Exception ex){
			throw ex;
		}
	}

	public void delete(ObjectContainer db, int ma){
		 try{
		 	O_DonHang bKhachHang = (O_DonHang) db.queryByExample(new O_DonHang(ma)).next();					
		 	db.delete(bKhachHang);	
		 }catch(Exception ex){
		 	throw ex;
		 }
	}

	public boolean exist(ObjectContainer db, int ma){
		try{
			Query query1 = db.query();
	        query1.constrain(O_DonHang.class);	        
	        query1.descend("ma").constrain(ma).equal();	        
	        ObjectSet<O_DonHang> bKhachHang = query1.execute();
	        if (bKhachHang.size()!=0) {
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

	public ObjectSet<O_DonHang> selectAll(ObjectContainer db){
		try{			
			return db.queryByExample(new O_DonHang());		
		}
		catch(Exception e){
			return null;
		}
	}

	public O_DonHang found_O_DonHang(ObjectContainer db, String ma){
		try{
			Query query1 = db.query();
	        query1.constrain(O_DonHang.class);	        
	        query1.descend("ma").constrain(ma).equal();	        
	        ObjectSet<O_DonHang> bKhachHang = query1.execute();	    
        	return bKhachHang.get(0);	        
		}catch(Exception e){
			System.out.println("hhh"+e.toString());
			return null;
		}		
	}

	
	public ObjectSet<O_DonHang> found_O_DonHang(ObjectContainer db,String ma,String hoTen){
		try{
			Query query1 = db.query();
	        query1.constrain(O_DonHang.class);	        
	        query1.descend("ma").constrain(ma).contains();	  
	        query1.descend("hoTen").constrain(hoTen).contains();	  
	        ObjectSet<O_DonHang> bKhachHang = query1.execute();	    
        	return bKhachHang;	        
		}catch(Exception e){
			System.out.println("hhh"+e.toString());
			return null;
		}		
	}
}
