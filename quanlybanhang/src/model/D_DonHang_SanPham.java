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
public class D_DonHang_SanPham {
	
	/**
	 * 
	 */
	public D_DonHang_SanPham() {
		// TODO Auto-generated constructor stub
	}
	
	public void add(ObjectContainer db,int sp_dh_soluong, O_SanPham sanpham, O_DonHang donhang){
		try{
			O_DonHang_SanPham bKhachHang = new O_DonHang_SanPham(sp_dh_soluong, sanpham, donhang);		
			db.store(bKhachHang);		
		}catch(Exception ex){
			throw ex;
		}
	}
	
	public void update(ObjectContainer db, int sp_dh_soluong, O_SanPham sanpham, O_DonHang donhang){
		try{
			O_DonHang_SanPham obj = (O_DonHang_SanPham) db.queryByExample(new O_DonHang_SanPham(sp_dh_soluong, sanpham, donhang)).next();
			obj.setSp_dh_soluong(sp_dh_soluong);
			obj.setDonhang(donhang);
			obj.setSanpham(sanpham);
			db.store(obj);		
		}catch(Exception ex){
			throw ex;
		}
	}

	public void delete(ObjectContainer db, int sp_dh_soluong, O_SanPham sanpham, O_DonHang donhang){
		 try{
		 	O_DonHang_SanPham bKhachHang = (O_DonHang_SanPham) db.queryByExample(new O_DonHang_SanPham(sp_dh_soluong, sanpham, donhang)).next();					
		 	db.delete(bKhachHang);	
		 }catch(Exception ex){
		 	throw ex;
		 }
	}

	public boolean exist(ObjectContainer db, int ma){
		try{
			Query query1 = db.query();
	        query1.constrain(O_DonHang_SanPham.class);	        
	        query1.descend("ma").constrain(ma).equal();	        
	        ObjectSet<O_DonHang_SanPham> bKhachHang = query1.execute();
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

	public ObjectSet<O_DonHang_SanPham> selectAll(ObjectContainer db){
		try{			
			return db.queryByExample(new O_DonHang_SanPham());		
		}
		catch(Exception e){
			return null;
		}
	}

	public O_DonHang_SanPham found_O_DonHang_SanPham(ObjectContainer db, String ma){
		try{
			Query query1 = db.query();
	        query1.constrain(O_DonHang_SanPham.class);	        
	        query1.descend("ma").constrain(ma).equal();	        
	        ObjectSet<O_DonHang_SanPham> bKhachHang = query1.execute();	    
        	return bKhachHang.get(0);	        
		}catch(Exception e){
			System.out.println("hhh"+e.toString());
			return null;
		}		
	}

	
	public ObjectSet<O_DonHang_SanPham> found_O_DonHang_SanPham(ObjectContainer db,String ma,String hoTen){
		try{
			Query query1 = db.query();
	        query1.constrain(O_DonHang_SanPham.class);	        
	        query1.descend("ma").constrain(ma).contains();	  
	        query1.descend("hoTen").constrain(hoTen).contains();	  
	        ObjectSet<O_DonHang_SanPham> bKhachHang = query1.execute();	    
        	return bKhachHang;	        
		}catch(Exception e){
			System.out.println("hhh"+e.toString());
			return null;
		}		
	}
}
