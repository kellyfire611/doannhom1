package model;
import java.util.*;

/**
 * @author TTHAN
 *
 */
public class O_ChiDoan {
	private String machidoan;
	private String tenchidoan;
	private List<O_SinhVien> dssinhVien;
	private List<O_KeHoach> dskeHoach;
	
	public O_ChiDoan() {
		this.dskeHoach = new ArrayList<O_KeHoach>();
		this.dssinhVien = new ArrayList<O_SinhVien>();
	}
	/**
	 * @param machidoan
	 */
	public O_ChiDoan(String machidoan) {
		this.machidoan = machidoan;			
		this.dskeHoach = new ArrayList<O_KeHoach>();
		this.dssinhVien = new ArrayList<O_SinhVien>();
	}
	/**
	 * @param machidoan
	 * @param tenchidoan	
	 */
	public O_ChiDoan(String machidoan, String tenchidoan) {
		this.machidoan = machidoan;
		this.tenchidoan = tenchidoan;		
		this.dskeHoach = new ArrayList<O_KeHoach>();
		this.dssinhVien = new ArrayList<O_SinhVien>();
	}
	/**
	 * @param machidoan
	 * @param tenchidoan
	 * @param dssinhVien
	 * @param dskeHoach
	 */
	public O_ChiDoan(String machidoan, String tenchidoan, List<O_SinhVien> dssinhVien, List<O_KeHoach> dskeHoach) {
		this.machidoan = machidoan;
		this.tenchidoan = tenchidoan;
		this.dssinhVien = dssinhVien;
		this.dskeHoach = dskeHoach;
	}
	/**
	 * @return the dssinhVien
	 */
	public List<O_SinhVien> getDssinhVien() {
		return dssinhVien;
	}
	/**
	 * @param dssinhVien the dssinhVien to set
	 */
	public void setDssinhVien(List<O_SinhVien> dssinhVien) {
		this.dssinhVien = dssinhVien;
	}
	/**
	 * @return the dskeHoach
	 */
	public List<O_KeHoach> getDskeHoach() {
		return dskeHoach;
	}
	/**
	 * @param dskeHoach the dskeHoach to set
	 */
	public void setDskeHoach(List<O_KeHoach> dskeHoach) {
		this.dskeHoach = dskeHoach;
	}
	/**
	 * @return the machidoan
	 */
	public String getMachidoan() {
		return machidoan;
	}
	/**
	 * @param machidoan the machidoan to set
	 */
	public void setMachidoan(String machidoan) {
		this.machidoan = machidoan;
	}
	/**
	 * @return the tenchidoan
	 */
	public String getTenchidoan() {
		return tenchidoan;
	}
	/**
	 * @param tenchidoan the tenchidoan to set
	 */
	public void setTenchidoan(String tenchidoan) {
		this.tenchidoan = tenchidoan;
	}
	/**
	 * @param sinh vien bo sung sinh vien vao chi doan
	 */
	public boolean addSinhVien(O_SinhVien sinhVien) {
		return this.dssinhVien.add(sinhVien);
	}
	/**
	 * @param sinh vien remove sinh vien khoi danh sach sinh vien cua chi doan
	 */
	public boolean removeSinhVien(O_SinhVien sinhVien) {
		return this.dssinhVien.remove(sinhVien);
	}
	/**
	 * @param sinh vien bo sung ke hoach cho chi doan
	 */
	public boolean addKeHoach(O_KeHoach keHoach) {
		return this.dskeHoach.add(keHoach);
	}
	/**
	 * @param sinh vien remove ke hoach khoi danh sach ke hoach cua chi doan
	 */
	public boolean removeKeHoach(O_KeHoach keHoach) {
		return this.dskeHoach.remove(keHoach);
	}

}
