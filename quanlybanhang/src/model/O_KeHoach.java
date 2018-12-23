package model;
import java.util.*;

/**
 * 
 */

/**
 * @author TTHAN
 *
 */
public class O_KeHoach {
	private String makehoach;
	private Date ngayBatDau;
	private Date ngayKetThuc;
	private String diaDiem;
	private String noiDung;
	private Boolean duyet;
	private Boolean daThucHien;	
	private List<O_SinhVien> dssinhvien;
	private List<O_LichTrinh> dslichTrinh;
	private List<O_HoTroKinhPhi> dskinhphi;
	private O_ChiDoan cuaChiDoan;	
	public O_KeHoach() {
		// TODO Auto-generated constructor stub
	}
	

	/**
	 * @param makehoach
	 * @param ngayBatDau
	 * @param ngayKetThuc
	 * @param diaDiem
	 * @param noiDung
	 * @param maChiDoan
	 * @param duyet
	 * @param daThucHien
	 * @param kinhPhi
	 * @param dssinhvien
	 * @param dsnguonKinhPhi
	 * @param dslichTrinh
	 * @param cuaChiDoan
	 */
	public O_KeHoach(String makehoach) {
		this.makehoach = makehoach;		
		this.dssinhvien = new ArrayList<O_SinhVien>();		
		this.dskinhphi = new ArrayList<O_HoTroKinhPhi>();
		this.dslichTrinh = new ArrayList<O_LichTrinh>();
	}
	
	public O_KeHoach(String makehoach, Date ngayBatDau, Date ngayKetThuc, String diaDiem, String noiDung,
			 Boolean duyet, Boolean daThucHien,  O_ChiDoan cuaChiDoan) {
		this.makehoach = makehoach;
		this.ngayBatDau = ngayBatDau;
		this.ngayKetThuc = ngayKetThuc;
		this.diaDiem = diaDiem;
		this.noiDung = noiDung;
		this.duyet = duyet;
		this.daThucHien = daThucHien;
		this.dssinhvien = new ArrayList<O_SinhVien>();
		this.dskinhphi = new ArrayList<O_HoTroKinhPhi>();
		this.dslichTrinh = new ArrayList<O_LichTrinh>();
		this.cuaChiDoan = cuaChiDoan;
	}
	
	public O_KeHoach(String makehoach, Date ngayBatDau, Date ngayKetThuc, String diaDiem, String noiDung,
			String maChiDoan, Boolean duyet, Boolean daThucHien, List<O_SinhVien> dssinhvien,
			List<O_HoTroKinhPhi> dsKinhPhi, List<O_LichTrinh> dslichTrinh, O_ChiDoan cuaChiDoan) {
		this.makehoach = makehoach;
		this.ngayBatDau = ngayBatDau;
		this.ngayKetThuc = ngayKetThuc;
		this.diaDiem = diaDiem;
		this.noiDung = noiDung;
		this.duyet = duyet;
		this.daThucHien = daThucHien;
		this.dssinhvien = dssinhvien;
		this.dskinhphi = dsKinhPhi;
		this.dslichTrinh = dslichTrinh;
		this.cuaChiDoan = cuaChiDoan;
	}


	/**
	 * @return the makehoach
	 */
	public String getMakehoach() {
		return makehoach;
	}

	/**
	 * @param makehoach the makehoach to set
	 */
	public void setMakehoach(String makehoach) {
		this.makehoach = makehoach;
	}

	/**
	 * @return the ngayBatDau
	 */
	public Date getNgayBatDau() {
		return ngayBatDau;
	}

	/**
	 * @param ngayBatDau the ngayBatDau to set
	 */
	public void setNgayBatDau(Date ngayBatDau) {
		this.ngayBatDau = ngayBatDau;
	}

	/**
	 * @return the ngayKetThuc
	 */
	public Date getNgayKetThuc() {
		return ngayKetThuc;
	}

	/**
	 * @param ngayKetThuc the ngayKetThuc to set
	 */
	public void setNgayKetThuc(Date ngayKetThuc) {
		this.ngayKetThuc = ngayKetThuc;
	}

	/**
	 * @return the diaDiem
	 */
	public String getDiaDiem() {
		return diaDiem;
	}

	/**
	 * @param diaDiem the diaDiem to set
	 */
	public void setDiaDiem(String diaDiem) {
		this.diaDiem = diaDiem;
	}

	/**
	 * @return the noiDung
	 */
	public String getNoiDung() {
		return noiDung;
	}

	/**
	 * @param noiDung the noiDung to set
	 */
	public void setNoiDung(String noiDung) {
		this.noiDung = noiDung;
	}


	/**
	 * @return the duyet
	 */
	public Boolean getDuyet() {
		return duyet;
	}

	/**
	 * @param duyet the duyet to set
	 */
	public void setDuyet(Boolean duyet) {
		this.duyet = duyet;
	}

	/**
	 * @return the daThucHien
	 */
	public Boolean getDaThucHien() {
		return daThucHien;
	}

	/**
	 * @param daThucHien the daThucHien to set
	 */
	public void setDaThucHien(Boolean daThucHien) {
		this.daThucHien = daThucHien;
	}

	
	/**
	 * @return the dssinhvien
	 */
	public List<O_SinhVien> getDssinhvien() {
		return dssinhvien;
	}

	/**
	 * @param dssinhvien the dssinhvien to set
	 */
	public void setDssinhvien(List<O_SinhVien> dssinhvien) {
		this.dssinhvien = dssinhvien;
	}

	/**
	 * @return the dsnguonKinhPhi
	 */
	public List<O_HoTroKinhPhi> getDsKinhPhi() {
		return dskinhphi;
	}

	/**
	 * @param dsnguonKinhPhi the dsnguonKinhPhi to set
	 */
	public void setDsnguonKinhPhi(List<O_HoTroKinhPhi> dsnguonKinhPhi) {
		this.dskinhphi = dsnguonKinhPhi;
	}

	/**
	 * @return the dslichTrinh
	 */
	public List<O_LichTrinh> getDslichTrinh() {
		return dslichTrinh;
	}

	/**
	 * @param dslichTrinh the dslichTrinh to set
	 */
	public void setDslichTrinh(List<O_LichTrinh> dslichTrinh) {
		this.dslichTrinh = dslichTrinh;
	}


	/**
	 * @return the cuaChiDoan
	 */
	public O_ChiDoan getCuaChiDoan() {
		return cuaChiDoan;
	}


	/**
	 * @param cuaChiDoan the cuaChiDoan to set
	 */
	public void setCuaChiDoan(O_ChiDoan cuaChiDoan) {
		this.cuaChiDoan = cuaChiDoan;
	}
	
	/**
	 * @param sinhvien bo sung sinh vien vao thuc hien ke hoach
	 * @return true neu add thanh cong, nguoc lai false
	 */
	public boolean addSinhVien(O_SinhVien sinhvien){
		return this.dssinhvien.add(sinhvien);
	}
	/**
	 * remove sinh vien ra khoi danh sach thuc hien ke hoach
	 * @param sinhvien
	 * @return
	 */
	public boolean removeSinhVien(O_SinhVien sinhvien){
		return this.dssinhvien.remove(sinhvien);
	}
	/**
	 * 
	 * @param lichTrinh bo sung lich trinh vao ke hoach thuc hien
	 * @return true neu add thanh cong, nguoc lai false
	 */
	public boolean addLichTrinh(O_LichTrinh lichTrinh){
		return this.dslichTrinh.add(lichTrinh);
	}
	/**
	 * 
	 * @param lichTrinh remove lich trinh vao ke hoach thuc hien
	 * @return true neu remove thanh cong, nguoc lai false
	 */
	public boolean removeLichTrinh(O_LichTrinh lichTrinh){
		return this.dslichTrinh.remove(lichTrinh);
	}
	/** 
	 * @param nguonKinhPhi bo sung nguon kinh phi vao ke hoach
	 * @return true neu add thanh cong, nguoc lai false
	 */
	public boolean addHoTroKinhPhi(O_HoTroKinhPhi nguonKinhPhi){
		return this.dskinhphi.add(nguonKinhPhi);
	}
	/**
	 * remove nguon kinh phi khoi danh sach nguon kinh phi cua ke hoach
	 * @param nguonKinhPhi
	 * @return
	 */
	public boolean removeHoTroKinhPhi(O_HoTroKinhPhi nguonKinhPhi){
		return this.dskinhphi.remove(nguonKinhPhi);
	}

}
