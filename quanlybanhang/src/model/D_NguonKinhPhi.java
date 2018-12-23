package model;
import java.util.List;

import com.db4o.ObjectContainer;
import com.db4o.ObjectSet;
import com.db4o.query.Query;

/**
 * @author LNQUYEN
 *
 */

public class D_NguonKinhPhi {

	public D_NguonKinhPhi() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * ADD Nguon kinh phi 2 doi so
	 * Status: tested
	 * @param ma
	 * @param Ten
	 */
	public void addNguonKinhPhi(ObjectContainer db,String ma, String Ten){
		try{
			O_NguonKinhPhi NguonKinhPhi = new O_NguonKinhPhi(ma,Ten);					
			db.store(NguonKinhPhi);		
		}catch(Exception ex){
			throw ex;
		}
	}
	/**
	 * ADD Nguon kinh phi 3 doi so
	 * @param ma
	 * @param Ten
	 * @param dskehoach
	 */
	public void addNguonKinhPhi(ObjectContainer db,String ma, String Ten,List<O_HoTroKinhPhi> dsHoTro){
		try{
			O_NguonKinhPhi NguonKinhPhi = new O_NguonKinhPhi(ma,Ten,dsHoTro);				
			for(O_HoTroKinhPhi kh:dsHoTro){
				O_HoTroKinhPhi o_KeHoach = (O_HoTroKinhPhi) db.queryByExample(kh).next();
				o_KeHoach.setTunguonkinhphi(NguonKinhPhi);
				db.store(o_KeHoach);
			}
			db.store(NguonKinhPhi);		
		}catch(Exception ex){
			throw ex;
		}
	}
	/**
	 * ADD ke hoach vao nguon kinh phi
	 * @param manguonkinhphi
	 * @param keHoach
	 */
	public void addHoTroKinhPhi(ObjectContainer db,String ma,O_HoTroKinhPhi keHoach){
		O_NguonKinhPhi o_nguonkinhphi = (O_NguonKinhPhi) db.queryByExample(new O_NguonKinhPhi(ma)).next();
		o_nguonkinhphi.addHoTro(keHoach);	
		O_HoTroKinhPhi o_KeHoach = (O_HoTroKinhPhi) db.queryByExample(keHoach).next();
		o_KeHoach.setTunguonkinhphi(o_nguonkinhphi);
		db.store(o_KeHoach);
		db.store(o_nguonkinhphi);
	}
	/**
	 * REMOVE ho tro ra khoi dshotro cua nguon kinh phi
	 * @param db
	 * @param ma
	 * @param keHoach
	 */
	public void removeHotroKinhPhi(ObjectContainer db,String ma,O_HoTroKinhPhi keHoach){
		O_NguonKinhPhi o_nguonkinhphi = (O_NguonKinhPhi) db.queryByExample(new O_NguonKinhPhi(ma)).next();
		o_nguonkinhphi.removeKeHoach(keHoach);		
		O_KeHoach o_KeHoach = (O_KeHoach) db.queryByExample(keHoach.getHotrokehoach()).next();
		o_KeHoach.removeHoTroKinhPhi(keHoach);
		O_HoTroKinhPhi o_HoTroKinhPhi = (O_HoTroKinhPhi) db.queryByExample(keHoach).next();
		db.store(o_KeHoach);
		db.delete(o_HoTroKinhPhi);
		db.store(o_nguonkinhphi);
	}
	/**
	 * Update ma va ten nguon kinh phi
	 * @param ma
	 * @param ten
	 */
	public void updateNguonKinhPhi(ObjectContainer db,String ma, String ten){
		try{
			O_NguonKinhPhi o_nguonkinhphi = (O_NguonKinhPhi) db.queryByExample(new O_NguonKinhPhi(ma)).next();					
			o_nguonkinhphi.setMaNguonKinhphi(ma);
			o_nguonkinhphi.setTenNguonKinhphi(ten);				
			db.store(o_nguonkinhphi);	
		}catch(Exception ex){
			throw ex;
		}
	}
	
	/**
	 * Update ma, ten va dskehoach cua nguon kinh phi
	 * cua sinh vien
	 * @param ma
	 * @param ten
	 */
	public void updateNguonKinhPhi(ObjectContainer db,String ma, String ten, List<O_HoTroKinhPhi> dshotro){
		try{
			O_NguonKinhPhi o_nguonkinhphi = (O_NguonKinhPhi) db.queryByExample(new O_NguonKinhPhi(ma)).next();				
			for(O_HoTroKinhPhi kh:dshotro){
				O_HoTroKinhPhi kh_=(O_HoTroKinhPhi) db.queryByExample(kh).next();
				kh_.setTunguonkinhphi(o_nguonkinhphi);
				db.store(kh_);
			}
			o_nguonkinhphi.setMaNguonKinhphi(ma);
			o_nguonkinhphi.setTenNguonKinhphi(ten);	
			o_nguonkinhphi.setDsHoTro(dshotro);			
			db.store(o_nguonkinhphi);	
		}catch(Exception ex){
			throw ex;
		}
	}
	
	/**
	 * Xoa nguon kinh phi
	 * @param ma
	 */
	public void deleteNguonKinhPhi(ObjectContainer db,String ma){
		try{
			O_NguonKinhPhi o_nguonkinhphi = (O_NguonKinhPhi) db.queryByExample(new O_NguonKinhPhi(ma)).next();	
			D_HoTroKinhPhi d_HoTroKinhPhi =  new D_HoTroKinhPhi();
			for(O_HoTroKinhPhi kh:o_nguonkinhphi.getDsHoTro()){				
				d_HoTroKinhPhi.deleteHoTroKinhPhi(db, kh.getMahotro());
				db.store(kh);
			}
			db.delete(o_nguonkinhphi);	
		}catch(Exception ex){
			throw ex;
		}
	}
	/**
	 * select all nguon kinh phi
	 * Status: tested
	 * @param db
	 * @return
	 */
	public ObjectSet<O_NguonKinhPhi> selectAllNguonKinhPhi(ObjectContainer db){
		try{			
			return db.queryByExample(new O_NguonKinhPhi());		
		}
		catch(Exception e){
			return null;
		}
	}
	/**
	 * Tim nguon kinh phi theo ma
	 * Status: tested
	 * @param ma
	 * @return true neu tim thay, false neu tim khong thay
	 */
	public boolean existNguonKinhPhi(ObjectContainer db,String ma){
		try{
			Query query1 = db.query();
	        query1.constrain(O_NguonKinhPhi.class);	        
	        query1.descend("maNguonKinhphi").constrain(ma).equal();	        
	        ObjectSet<O_NguonKinhPhi> r_nguonkinhphi = query1.execute();
	        if (r_nguonkinhphi.size()!=0) {
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
	 * Tim nguon kinh phi chinh xac theo ma 
	 * @param ma
	 * @return tra ve O_NguonKinhPhi duoc tim thay, null neu xay ra loi
	 */
	public O_NguonKinhPhi found_O_NguonKinhPhi(ObjectContainer db,String ma){
		try{
			Query query1 = db.query();
	        query1.constrain(O_NguonKinhPhi.class);	        
	        query1.descend("maNguonKinhphi").constrain(ma).equal();	        
	        ObjectSet<O_NguonKinhPhi> r_nguonkinhphi = query1.execute();
	        return r_nguonkinhphi.get(0);	        
		}catch(Exception e){
			System.out.println("hhh"+e.toString());
			return null;
		}		
	}
}
