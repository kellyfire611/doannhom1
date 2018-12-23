package model;
import com.db4o.ObjectContainer;
import com.db4o.ObjectSet;
import com.db4o.query.Query;

public class D_DoanKhoa {

	public D_DoanKhoa() {
		// TODO Auto-generated constructor stub
	}
	/**
	 * ADD ban chap hanh doan khoa
	 * @param db
	 * @param ma
	 * @param hoTen
	 * @param soDienThoai
	 * @param diaChi
	 * @param chucvu
	 * @param email
	 * @param diaChiFaceBook
	 * @param skype
	 */
	public void addDoanKhoa(ObjectContainer db,String ma, String hoTen,String soDienThoai,String diaChi,String chucvu){
		try{
			
			O_DoanKhoa o_DoanKhoa = new O_DoanKhoa(ma, hoTen,soDienThoai, diaChi);		
			o_DoanKhoa.setChucVu(chucvu);
			db.store(o_DoanKhoa);		
		}catch(Exception ex){
			throw ex;
		}
	}
	/**
	 * Update ban chap hanh doan khoa
	 * @param db
	 * @param ma
	 * @param hoTen
	 * @param soDienThoai
	 * @param diaChi
	 * @param chucvu
	 */
	public void updateDoanKhoa(ObjectContainer db,String ma, String hoTen,String soDienThoai,String diaChi,String chucvu){
		try{
			O_DoanKhoa o_DoanKhoa = (O_DoanKhoa) db.queryByExample(new O_DoanKhoa(ma)).next();					
			o_DoanKhoa.setDiaChi(diaChi);
			o_DoanKhoa.setSoDienThoai(soDienThoai);
			o_DoanKhoa.setHoTen(hoTen);					
			o_DoanKhoa.setChucVu(chucvu);		
			db.store(o_DoanKhoa);		
		}catch(Exception ex){
			throw ex;
		}
	}
	/**
	 * Xoa ban chap hanh doan khoa theo ma
	 * @param db
	 * @param ma
	 */
	public void deleteDoanKhoa(ObjectContainer db,String ma){
		try{
			O_DoanKhoa o_DoanKhoa = (O_DoanKhoa) db.queryByExample(new O_DoanKhoa(ma)).next();					
			db.delete(o_DoanKhoa);	
		}catch(Exception ex){
			throw ex;
		}
	}
	/**
	 * Tim chap hanh doan khoa theo ma
	 * @param ma
	 * @return true neu tim thay, false neu tim khong thay
	 */
	public boolean existDoanKhoa(ObjectContainer db,String ma){
		try{
			Query query1 = db.query();
	        query1.constrain(O_DoanKhoa.class);	        
	        query1.descend("ma").constrain(ma).equal();	        
	        ObjectSet<O_DoanKhoa> o_DoanKhoa = query1.execute();
	        if (o_DoanKhoa.size()!=0) {
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
	 * Tim BCH doan khoa chinh xac theo ma
	 * @param ma
	 * @return tra ve danh sach cac O_DoanKhoa duoc tim thay theo ObjectSet, null neu tim khong thay
	 */
	public O_DoanKhoa found_O_DoanKhoa(ObjectContainer db, String ma){
		try{
			Query query1 = db.query();
	        query1.constrain(O_DoanKhoa.class);	        
	        query1.descend("ma").constrain(ma).equal();	        
	        ObjectSet<O_DoanKhoa> o_DoanKhoa = query1.execute();	    
        	return o_DoanKhoa.get(0);	        
		}catch(Exception e){
			System.out.println("hhh"+e.toString());
			return null;
		}		
	}
}
