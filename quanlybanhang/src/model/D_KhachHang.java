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
public class D_KhachHang {
	
	/**
	 * 
	 */
	public D_KhachHang() {
		// TODO Auto-generated constructor stub
	}
	
	public void add(ObjectContainer db,String kh_dienthoai, String kh_email, String kh_loaiKH, 
	int nd_ma, String nd_ten, T_DiaChi nd_diachi, String nd_gioitinh, String nd_ngaysinh){
		try{
			O_KhachHang bKhachHang = new O_KhachHang(kh_dienthoai, kh_email,kh_loaiKH, nd_ma,nd_ten,nd_diachi,nd_gioitinh,nd_ngaysinh);		
			db.store(bKhachHang);		
		}catch(Exception ex){
			throw ex;
		}
	}
	
	public void update(ObjectContainer db, String kh_dienthoai, String kh_email, String kh_loaiKH, 
		int nd_ma, String nd_ten, T_DiaChi nd_diachi, String nd_gioitinh, String nd_ngaysinh){
		try{
			O_KhachHang obj = (O_KhachHang) db.queryByExample(new O_KhachHang(nd_ma)).next();
			obj.setKh_dienthoai(kh_dienthoai);
			obj.setKh_email(kh_email);
			obj.setKh_loaiKH(kh_loaiKH);
			obj.setNd_ten(nd_ten);
			obj.setNd_diachi(nd_diachi);
			obj.setNd_gioitinh(nd_gioitinh);
			obj.setNd_ngaysinh(nd_ngaysinh);
			db.store(obj);		
		}catch(Exception ex){
			throw ex;
		}
	}

	public void delete(ObjectContainer db, int ma){
		 try{
		 	O_KhachHang bKhachHang = (O_KhachHang) db.queryByExample(new O_KhachHang(ma)).next();					
		 	db.delete(bKhachHang);	
		 }catch(Exception ex){
		 	throw ex;
		 }
	}

	public boolean exist(ObjectContainer db, int ma){
		try{
			Query query1 = db.query();
	        query1.constrain(O_KhachHang.class);	        
	        query1.descend("ma").constrain(ma).equal();	        
	        ObjectSet<O_KhachHang> bKhachHang = query1.execute();
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

	public ObjectSet<O_KhachHang> selectAll(ObjectContainer db){
		try{			
			return db.queryByExample(new O_KhachHang());		
		}
		catch(Exception e){
			return null;
		}
	}

	public O_KhachHang found_O_KhachHang(ObjectContainer db, String ma){
		try{
			Query query1 = db.query();
	        query1.constrain(O_KhachHang.class);	        
	        query1.descend("ma").constrain(ma).equal();	        
	        ObjectSet<O_KhachHang> bKhachHang = query1.execute();	    
        	return bKhachHang.get(0);	        
		}catch(Exception e){
			System.out.println("hhh"+e.toString());
			return null;
		}		
	}

	
	public ObjectSet<O_KhachHang> found_O_KhachHang(ObjectContainer db,String ma,String hoTen){
		try{
			Query query1 = db.query();
	        query1.constrain(O_KhachHang.class);	        
	        query1.descend("ma").constrain(ma).contains();	  
	        query1.descend("hoTen").constrain(hoTen).contains();	  
	        ObjectSet<O_KhachHang> bKhachHang = query1.execute();	    
        	return bKhachHang;	        
		}catch(Exception e){
			System.out.println("hhh"+e.toString());
			return null;
		}		
	}
}
