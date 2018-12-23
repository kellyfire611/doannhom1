package model;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import com.db4o.ObjectContainer;
import com.db4o.ObjectSet;
import com.db4o.query.Query;

public class D_KeHoach {

	public D_KeHoach() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * ADD Nguon kinh phi 9 doi so, add ke hoach vao danh sach ke hoach cua chi doan
	 * @param makehoach
	 * @param ngayBatDau
	 * @param ngayKetThuc
	 * @param diaDiem
	 * @param noiDung
	 * @param maChiDoan
	 * @param duyet
	 * @param daThucHien
	 * @param kinhPhi
	 * @param cuaChiDoan
	 */
	
	public void addKeHoach(ObjectContainer db, String makehoach, Date ngayBatDau, Date ngayKetThuc, String diaDiem, 
			String noiDung, Boolean duyet, Boolean daThucHien, O_ChiDoan cuaChiDoan){
		try{
			O_KeHoach KeHoach = new O_KeHoach (makehoach, ngayBatDau, ngayKetThuc, diaDiem, noiDung, duyet, daThucHien,  cuaChiDoan);					
			O_ChiDoan o_ChiDoan = (O_ChiDoan) db.queryByExample(cuaChiDoan).next();
			o_ChiDoan.addKeHoach(KeHoach);
			db.store(o_ChiDoan);
			db.store(KeHoach);		
		}catch(Exception ex){
			throw ex;
		}
	}

	/**
	 * ADD Nguon kinh phi 12 doi so, add ke hoach vao dskehoach cua sinh vien, add ke hoach vao dskehoach cua nguon kinh phi
	 * @param makehoach
	 * @param ngayBatDau
	 * @param ngayKetThuc
	 * @param diaDiem
	 * @param noiDung
	 * @param maChiDoan
	 * @param duyet
	 * @param daThucHien
	 * @param kinhPhi
	 * @param cuaChiDoan
	 * @param dssinhvien
	 * @param dsnguonKinhPhi
	 * @param dslichTrinh	
	 */
	
	public void addKeHoach(ObjectContainer db,String makehoach, Date ngayBatDau, Date ngayKetThuc, String diaDiem, String noiDung,
			String maChiDoan, Boolean duyet, Boolean daThucHien,List<O_SinhVien> dssinhvien,
			List<O_HoTroKinhPhi> dsKinhPhi, List<O_LichTrinh> dslichTrinh, O_ChiDoan cuaChiDoan){
		try{
			O_KeHoach KeHoach = new O_KeHoach (makehoach, ngayBatDau, ngayKetThuc, diaDiem, noiDung, maChiDoan, duyet, daThucHien, 
					dssinhvien, dsKinhPhi, dslichTrinh, cuaChiDoan);			
			O_ChiDoan o_ChiDoan = (O_ChiDoan) db.queryByExample(cuaChiDoan).next();
			o_ChiDoan.addKeHoach(KeHoach);
			//add ke hoach vao danh sach ke hoach thuc hien cua tat ca cac sinh vien trong ke hoach 
			for(O_SinhVien sv:dssinhvien){
				O_SinhVien o_SinhVien = (O_SinhVien) db.queryByExample(sv).next();
				o_SinhVien.addKeHoach(KeHoach);
				db.store(sv);
			}
			//add ke hoach vao danh sach ke hoach do nguon kinh phi tai tro
			for(O_HoTroKinhPhi kp:dsKinhPhi){
				O_HoTroKinhPhi o_HoTroKinhPhi = (O_HoTroKinhPhi) db.queryByExample(kp).next();
				o_HoTroKinhPhi.setHotrokehoach(KeHoach);
				db.store(kp);
			}
			db.store(o_ChiDoan);
			db.store(KeHoach);		
		}catch(Exception ex){
			throw ex;
		}
	}
	
	/**
	 * ADD sinh vien vao ke hoach, add ke hoach vao danh sach thuc hien cua sinh vien
	 * @param manguonkinhphi
	 * @param keHoach
	 */
	public void addSinhVien(ObjectContainer db,String ma,O_SinhVien sinhVien ){		
		O_KeHoach o_KeHoach = (O_KeHoach) db.queryByExample(new O_KeHoach(ma)).next();
		o_KeHoach.addSinhVien(sinhVien);		
		O_SinhVien o_SinhVien = (O_SinhVien) db.queryByExample(sinhVien).next();
		o_SinhVien.addKeHoach(o_KeHoach);
		db.store(o_SinhVien);
		db.store(o_KeHoach);		
	}
	/**
	 * remove sinh vien ra khoi danh sach sinh vien thuc hien ke hoach,
	 * remove ke hoach ra khoi danh sach ke hoach thuc hien cua sinh vien
	 * @param db
	 * @param ma
	 * @param sinhVien
	 */
	public void removeSinhVien(ObjectContainer db,String ma,O_SinhVien sinhVien ){		
		O_KeHoach o_KeHoach = (O_KeHoach) db.queryByExample(new O_KeHoach(ma)).next();
		o_KeHoach.removeSinhVien(sinhVien);	
		O_SinhVien sinhvien = (O_SinhVien) db.queryByExample(sinhVien).next();
		sinhvien.removeKeHoach(o_KeHoach);
		db.store(sinhvien);
		db.store(o_KeHoach);		
	}
	/**
	 * ADD nguon kinh phi vao ke hoach, ADD ke hoach vao nguon kinh phi
	 * Status: tested
	 * @param manguonkinhphi
	 * @param keHoach
	 */
	public void addNguonKinhPhi(ObjectContainer db,String ma,O_HoTroKinhPhi nguonKinhPhi ){		
		O_KeHoach o_KeHoach = (O_KeHoach) db.queryByExample(new O_KeHoach(ma)).next();
		o_KeHoach.addHoTroKinhPhi(nguonKinhPhi);	
		O_HoTroKinhPhi o_HoTroKinhPhi = (O_HoTroKinhPhi) db.queryByExample(nguonKinhPhi).next();
		o_HoTroKinhPhi.setHotrokehoach(o_KeHoach);
		db.store(o_HoTroKinhPhi);
		db.store(o_KeHoach);		
	}
	/**
	 * REMOVE nguon kinh phi khoi ke hoach, REMOVE ke hoach khoi danh sach ke hoach cua nguon kinh phi
	 * @param manguonkinhphi
	 * @param keHoach
	 */
	public void removeNguonKinhPhi(ObjectContainer db,String ma,O_HoTroKinhPhi nguonKinhPhi ){		
		O_KeHoach o_KeHoach = (O_KeHoach) db.queryByExample(new O_KeHoach(ma)).next();
		o_KeHoach.removeHoTroKinhPhi(nguonKinhPhi);
		O_HoTroKinhPhi o_HoTroKinhPhi = (O_HoTroKinhPhi) db.queryByExample(nguonKinhPhi).next();
		o_HoTroKinhPhi.setHotrokehoach(o_KeHoach);
		db.store(o_HoTroKinhPhi);
		db.store(o_KeHoach);		
	}
	/**
	 * ADD nguon kinh phi vao ke hoach
	 * @param manguonkinhphi
	 * @param keHoach
	 */
	public void addLichTrinh(ObjectContainer db,String ma,O_LichTrinh lichTrinh ){		
		O_KeHoach o_KeHoach = (O_KeHoach) db.queryByExample(new O_KeHoach(ma)).next();
		o_KeHoach.addLichTrinh(lichTrinh);		
		db.store(o_KeHoach);		
	}
	/**
	 * REMOVE lich trinh ra khoi ke hoach(xoa lich trinh)
	 * @param db
	 * @param ma
	 * @param lichTrinh
	 */
	public void removeLichTrinh(ObjectContainer db,String ma,O_LichTrinh lichTrinh ){		
		O_KeHoach o_KeHoach = (O_KeHoach) db.queryByExample(new O_KeHoach(ma)).next();
		o_KeHoach.removeLichTrinh(lichTrinh);
		D_LichTrinh d_LichTrinh = new D_LichTrinh();
		d_LichTrinh.deleteLichTrinh(db, lichTrinh.getMalichtrinh());		
		db.store(o_KeHoach);		
	}
		
	/**
	 * Update ke hoach
	 * @param makehoach
	 * @param ngayBatDau
	 * @param ngayKetThuc
	 * @param diaDiem
	 * @param noiDung
	 * @param maChiDoan
	 * @param duyet
	 * @param daThucHien
	 * @param kinhPhi
	 * @param cuaChiDoan
	 */
	public void updateKeHoach(ObjectContainer db,String ma, Date ngayBatDau, Date ngayKetThuc, String diaDiem, 
			String noiDung, Boolean duyet, Boolean daThucHien, O_ChiDoan cuaChiDoan) {
		try {
			O_KeHoach o_KeHoach = (O_KeHoach) db.queryByExample(new O_KeHoach(ma)).next();			
			O_ChiDoan o_ChiDoan = (O_ChiDoan) db.queryByExample(o_KeHoach.getCuaChiDoan()).next();
			o_ChiDoan.removeKeHoach(o_KeHoach);
			//bo ke hoach ra khoi chi doan cu
			db.store(o_ChiDoan);
			O_ChiDoan o_ChiDoan_new = (O_ChiDoan) db.queryByExample(cuaChiDoan).next();
			o_ChiDoan_new.addKeHoach(o_KeHoach);
			//add ke hoach vao chi doan moi
			db.store(o_ChiDoan_new);
			o_KeHoach.setMakehoach(ma);		
			o_KeHoach.setNgayBatDau(ngayBatDau);
			o_KeHoach.setNgayKetThuc(ngayKetThuc);
			o_KeHoach.setDiaDiem(diaDiem);
			o_KeHoach.setNoiDung(noiDung);			
			o_KeHoach.setDuyet(duyet);
			o_KeHoach.setDaThucHien(daThucHien);
			o_KeHoach.setCuaChiDoan(cuaChiDoan);
			db.store(o_KeHoach);	
		} catch(Exception ex) {
			throw ex;
		}
	}
	
	/**
	 * Xoa ke hoach, xoa tat ca lich trinh thuoc ke hoach, remove ke hoach ra khoi dskehoach cua tat ca sinh vien, 
	 * remove ke hoach ra khoi dskehoach cua nguon kinh phi
	 * @param ma
	 */
	public void deleteKeHoach(ObjectContainer db,String ma){
		try{
			O_KeHoach o_KeHoach = (O_KeHoach) db.queryByExample(new O_KeHoach(ma)).next();
			D_LichTrinh d_LichTrinh = new D_LichTrinh();
			//xoa tat ca lich trinh thuoc ke hoach
			for(O_LichTrinh lt:o_KeHoach.getDslichTrinh()){
				d_LichTrinh.deleteLichTrinh(db, lt.getMalichtrinh());
			}
			//remove ke hoach khoi danh sach sach ke hoach thuc hien cua sinh vien
			D_SinhVien d_sinhvien = new D_SinhVien();
			for(O_SinhVien sv:o_KeHoach.getDssinhvien()){
				sv.removeKeHoach(o_KeHoach);
				db.store(sv);
			}
			if (o_KeHoach.getDsKinhPhi().size()!=0) return;
			//delete ho tro kinh phi cua ke hoach
			/*D_HoTroKinhPhi d_HoTroKinhPhi = new D_HoTroKinhPhi();
			for(O_HoTroKinhPhi kp:o_KeHoach.getDsKinhPhi()){
				d_HoTroKinhPhi.deleteHoTroKinhPhi(db, kp.getMahotro());*/
//			}			
			db.delete(o_KeHoach);	
		}catch(Exception ex){
			throw ex;
		}
	}
	/**
	 * select all ke hoach
	 * Status: tested
	 * @param db
	 * @return
	 */
	public ObjectSet<O_KeHoach> selectAllKeHoach(ObjectContainer db){
		try{			
			return db.queryByExample(new O_KeHoach());		
		}
		catch(Exception e){
			return null;
		}
	}
	/**
	 * Select danh sach sinh vien cua ke hoach
	 * Status: tested
	 * @param db
	 * @param machidoan
	 * @return tra ve List O_SinhVien
	 */
	public List<O_SinhVien> selectSinhVien_KeHoach(ObjectContainer db,String makehoach){
		try{			
			ObjectSet<O_KeHoach> svs= db.queryByExample(new O_KeHoach(makehoach));	
			O_KeHoach cd = svs.get(0);
			List<O_SinhVien> dssv = cd.getDssinhvien();
			dssv.removeAll(Collections.singleton(null));
			return dssv;
		}
		catch(Exception e){
			return null;
		}
	}
	/**
	 * Select danh sach ho tro tu nguon kinh phi cua ke hoach
	 * Status: tested
	 * @param db
	 * @param machidoan
	 * @return tra ve List O_SinhVien
	 */
	public List<O_HoTroKinhPhi> selectNguonKinhPhi_KeHoach(ObjectContainer db,String makehoach){
		try{			
			ObjectSet<O_KeHoach> svs= db.queryByExample(new O_KeHoach(makehoach));	
			O_KeHoach cd = svs.get(0);
			List<O_HoTroKinhPhi> nkp = cd.getDsKinhPhi();
			nkp.removeAll(Collections.singleton(null));
			return nkp;
		}
		catch(Exception e){
			return null;
		}
	}
	/**
	 * Select danh sach lich trinh cua ke hoach
	 * Status: tested
	 * @param db
	 * @param machidoan
	 * @return tra ve List O_SinhVien
	 */
	public List<O_LichTrinh> selectLichTrinh_KeHoach(ObjectContainer db,String makehoach){
		try{			
			ObjectSet<O_KeHoach> svs= db.queryByExample(new O_KeHoach(makehoach));	
			O_KeHoach cd = svs.get(0);
			List<O_LichTrinh> lt = cd.getDslichTrinh();
			lt.removeAll(Collections.singleton(null));
			return lt;
		}
		catch(Exception e){
			return null;
		}
	}
	/**
	 * Tim ke hoach theo ma
	 * @param ma
	 * @return true neu tim thay, false neu tim khong thay
	 */
	public boolean existKeHoach(ObjectContainer db,String ma){
		try{
			Query query1 = db.query();
	        query1.constrain(O_KeHoach.class);	        
	        query1.descend("makehoach").constrain(ma).equal();	        
	        ObjectSet<O_KeHoach> result = query1.execute();
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
	
	/**
	 * Tim ke hoach theo ma 
	 * @param ma
	 * @return tra ve O_KeHoach duoc tim thay, null neu tim khongn thay
	 */
	public O_KeHoach found_O_KeHoach(ObjectContainer db,String ma){
		try{
			Query query1 = db.query();
	        query1.constrain(O_KeHoach.class);	        
	        query1.descend("makehoach").constrain(ma).equal();	        
	        ObjectSet<O_KeHoach> result = query1.execute();
	        return result.get(0);
		}catch(Exception e){
			System.out.println("hhh"+e.toString());
			return null;
		}		
	}
	
	
}
