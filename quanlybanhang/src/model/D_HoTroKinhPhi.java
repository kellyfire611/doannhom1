/**
 * 
 */
package model;

import com.db4o.ObjectContainer;
import com.db4o.ObjectSet;
import com.db4o.query.Query;

/**
 * @author DELL
 *
 */
public class D_HoTroKinhPhi {

	/**
	 * 
	 */
	public D_HoTroKinhPhi() {
		// TODO Auto-generated constructor stub
	}
	public void addHoTroKinhPhi(ObjectContainer db,String mahotro,int sotien,O_KeHoach hotrokehoach,O_NguonKinhPhi tunguonkinhphi){
		O_HoTroKinhPhi o_HoTroKinhPhi = new O_HoTroKinhPhi(mahotro, hotrokehoach, tunguonkinhphi, sotien);
		O_KeHoach o_KeHoach = (O_KeHoach) db.queryByExample(hotrokehoach).next();
		o_KeHoach.addHoTroKinhPhi(o_HoTroKinhPhi);
		db.store(o_KeHoach);
		O_NguonKinhPhi o_NguonKinhPhi = (O_NguonKinhPhi) db.queryByExample(tunguonkinhphi).next();
		o_NguonKinhPhi.addHoTro(o_HoTroKinhPhi);
		db.store(o_NguonKinhPhi);
		db.store(o_HoTroKinhPhi);
	}
	/**
	 * Xoa ho tro kinh phi
	 * @param db
	 * @param mahotro
	 */
	public void deleteHoTroKinhPhi(ObjectContainer db,String mahotro){
		try{
			O_HoTroKinhPhi o_HoTroKinhPhi = (O_HoTroKinhPhi) db.queryByExample(new O_HoTroKinhPhi(mahotro)).next();				
			O_KeHoach o_KeHoach = (O_KeHoach) db.queryByExample(o_HoTroKinhPhi.getHotrokehoach());
			o_KeHoach.removeHoTroKinhPhi(o_HoTroKinhPhi);
			db.store(o_KeHoach);
			O_NguonKinhPhi o_NguonKinhPhi = (O_NguonKinhPhi)db.queryByExample(o_HoTroKinhPhi.getTunguonkinhphi()).next();
			o_NguonKinhPhi.removeKeHoach(o_HoTroKinhPhi);
			db.store(o_NguonKinhPhi);
			db.delete(o_HoTroKinhPhi);	
		}catch(Exception ex){
			throw ex;
		}
	}
	/**
	 * Tim ho tro kinh phí chinh xac theo ma
	 * Status: tested
	 * @param mahotro
	 * @return tra ve danh sach cac O_SinhVien duoc tim thay theo kieu ObjectSet, null neu khong tim thay
	 */
	public O_HoTroKinhPhi found_O_HoTroKinhPhi(ObjectContainer db, String mahotro){
		try{
			Query query1 = db.query();
	        query1.constrain(O_HoTroKinhPhi.class);	        
	        query1.descend("mahotro").constrain(mahotro).equal();	        
	        ObjectSet<O_HoTroKinhPhi> obj = query1.execute();	    
        	return obj.get(0);	        
		}catch(Exception e){
			System.out.println("hhh"+e.toString());
			return null;
		}		
	}
	/**
	 * Tim ke hoach theo ma
	 * @param ma
	 * @return true neu tim thay, false neu tim khong thay
	 */
	public boolean existHoTroKinhPhi(ObjectContainer db,String ma){
		try{
			Query query1 = db.query();
	        query1.constrain(O_HoTroKinhPhi.class);	        
	        query1.descend("mahotro").constrain(ma).equal();	        
	        ObjectSet<O_HoTroKinhPhi> result = query1.execute();
	        if (result.size()!=0) {
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

}
