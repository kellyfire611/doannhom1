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
public class D_SanPham {
	
	/**
	 * 
	 */
	public D_SanPham() {
		// TODO Auto-generated constructor stub
	}
	
	public void add(ObjectContainer db,int sp_ma, String sp_ten, double sp_gia, String sp_mota, 
            int sp_soluong, String sp_loaisp, String sp_nhasanxuat, String sp_hinhanh){
		try{
			O_SanPham bKhachHang = new O_SanPham(sp_ma, sp_ten, sp_gia, sp_mota, 
		            sp_soluong, sp_loaisp, sp_nhasanxuat, sp_hinhanh);		
			db.store(bKhachHang);		
		}catch(Exception ex){
			throw ex;
		}
	}
	
	public void update(ObjectContainer db, int sp_ma, String sp_ten, double sp_gia, String sp_mota, 
            int sp_soluong, String sp_loaisp, String sp_nhasanxuat, String sp_hinhanh){
		try{
			O_SanPham obj = (O_SanPham) db.queryByExample(new O_SanPham(sp_ma)).next();
			obj.setSp_giaBan(sp_gia);
			obj.setSp_hinhanh(sp_hinhanh);
			obj.setSp_loaisp(sp_loaisp);
			obj.setSp_mota(sp_mota);
			obj.setSp_nhasanxuat(sp_nhasanxuat);
			obj.setSp_soluongton(sp_soluong);
			obj.setSp_ten(sp_ten);
			db.store(obj);		
		}catch(Exception ex){
			throw ex;
		}
	}

	public void delete(ObjectContainer db, int ma){
		 try{
		 	O_SanPham bKhachHang = (O_SanPham) db.queryByExample(new O_SanPham(ma)).next();					
		 	db.delete(bKhachHang);	
		 }catch(Exception ex){
		 	throw ex;
		 }
	}

	public boolean exist(ObjectContainer db, int ma){
		try{
			Query query1 = db.query();
	        query1.constrain(O_SanPham.class);	        
	        query1.descend("ma").constrain(ma).equal();	        
	        ObjectSet<O_SanPham> bKhachHang = query1.execute();
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

	public ObjectSet<O_SanPham> selectAll(ObjectContainer db){
		try{			
			return db.queryByExample(new O_SanPham());		
		}
		catch(Exception e){
			return null;
		}
	}

	public O_SanPham found_O_SanPham(ObjectContainer db, String ma){
		try{
			Query query1 = db.query();
	        query1.constrain(O_SanPham.class);	        
	        query1.descend("ma").constrain(ma).equal();	        
	        ObjectSet<O_SanPham> bKhachHang = query1.execute();	    
        	return bKhachHang.get(0);	        
		}catch(Exception e){
			System.out.println("hhh"+e.toString());
			return null;
		}		
	}

	
	public ObjectSet<O_SanPham> found_O_SanPham(ObjectContainer db,String ma,String hoTen){
		try{
			Query query1 = db.query();
	        query1.constrain(O_SanPham.class);	        
	        query1.descend("ma").constrain(ma).contains();	  
	        query1.descend("hoTen").constrain(hoTen).contains();	  
	        ObjectSet<O_SanPham> bKhachHang = query1.execute();	    
        	return bKhachHang;	        
		}catch(Exception e){
			System.out.println("hhh"+e.toString());
			return null;
		}		
	}
}
