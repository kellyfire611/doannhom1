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
public class D_NhanVien {
	
	/**
	 * 
	 */
	public D_NhanVien() {
		// TODO Auto-generated constructor stub
	}
	
	public void add(ObjectContainer db,double nv_luong, String nv_ngaybatdaulamviec, int nd_ma, 
            String nd_ten, T_DiaChi nd_diachi, String nd_gioitinh, String nd_ngaysinh){
		try{
			O_NhanVien bNhanVien = new O_NhanVien(nv_luong, nv_ngaybatdaulamviec, nd_ma, 
	                nd_ten, nd_diachi, nd_gioitinh, nd_ngaysinh);		
			db.store(bNhanVien);		
		}catch(Exception ex){
			throw ex;
		}
	}
	
	public void update(ObjectContainer db, double nv_luong, String nv_ngaybatdaulamviec, int nd_ma, 
            String nd_ten, T_DiaChi nd_diachi, String nd_gioitinh, String nd_ngaysinh){
		try{
			O_NhanVien obj = (O_NhanVien) db.queryByExample(new O_NhanVien(nd_ma)).next();
			obj.setNd_diachi(nd_diachi);
			obj.setNd_gioitinh(nd_gioitinh);
			obj.setNd_ngaysinh(nd_ngaysinh);
			obj.setNd_ten(nd_ten);
			obj.setNv_luong(nv_luong);
			obj.setNv_ngaybatdaulamviec(nv_ngaybatdaulamviec);
			db.store(obj);		
		}catch(Exception ex){
			throw ex;
		}
	}

	public void delete(ObjectContainer db, int ma){
		 try{
		 	O_NhanVien bNhanVien = (O_NhanVien) db.queryByExample(new O_NhanVien(ma)).next();					
		 	db.delete(bNhanVien);	
		 }catch(Exception ex){
		 	throw ex;
		 }
	}

	public boolean exist(ObjectContainer db, int ma){
		try{
			Query query1 = db.query();
	        query1.constrain(O_NhanVien.class);	        
	        query1.descend("ma").constrain(ma).equal();	        
	        ObjectSet<O_NhanVien> bNhanVien = query1.execute();
	        if (bNhanVien.size()!=0) {
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

	public ObjectSet<O_NhanVien> selectAll(ObjectContainer db){
		try{			
			return db.queryByExample(new O_NhanVien());		
		}
		catch(Exception e){
			return null;
		}
	}

	public O_NhanVien found_O_NhanVien(ObjectContainer db, String ma){
		try{
			Query query1 = db.query();
	        query1.constrain(O_NhanVien.class);	        
	        query1.descend("ma").constrain(ma).equal();	        
	        ObjectSet<O_NhanVien> bNhanVien = query1.execute();	    
        	return bNhanVien.get(0);	        
		}catch(Exception e){
			System.out.println("hhh"+e.toString());
			return null;
		}		
	}

	
	public ObjectSet<O_NhanVien> found_O_NhanVien(ObjectContainer db,String ma,String hoTen){
		try{
			Query query1 = db.query();
	        query1.constrain(O_NhanVien.class);	        
	        query1.descend("ma").constrain(ma).contains();	  
	        query1.descend("hoTen").constrain(hoTen).contains();	  
	        ObjectSet<O_NhanVien> bNhanVien = query1.execute();	    
        	return bNhanVien;	        
		}catch(Exception e){
			System.out.println("hhh"+e.toString());
			return null;
		}		
	}
}
