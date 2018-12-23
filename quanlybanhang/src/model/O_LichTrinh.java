package model;
import java.util.*;

/**
 * 
 */

/**
 * @author TTHAN
 *
 */
public class O_LichTrinh {
	private String malichtrinh;
	private String tencongviec;
	private Date thoigianbatdau;
	private Date thoigianketthuc;
	private O_KeHoach cuaKeHoach;
	/**
	 * 
	 */
	public O_LichTrinh() {
		// TODO Auto-generated constructor stub
	}
	public O_LichTrinh(String malichtrinh) {
		this.malichtrinh=malichtrinh;
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param malichtrinh
	 * @param tencongviec
	 * @param thoigianbatdau
	 * @param thoigianketthuc
	 */
	public O_LichTrinh(String malichtrinh, String tencongviec, Date thoigianbatdau, Date thoigianketthuc, O_KeHoach cuaKeHoach) {
		this.malichtrinh = malichtrinh;
		this.tencongviec = tencongviec;
		this.thoigianbatdau = thoigianbatdau;
		this.thoigianketthuc = thoigianketthuc;
		this.cuaKeHoach = cuaKeHoach;
	}
	/**
	 * @return the malichtrinh
	 */
	public String getMalichtrinh() {
		return malichtrinh;
	}
	/**
	 * @param malichtrinh the malichtrinh to set
	 */
	public void setMalichtrinh(String malichtrinh) {
		this.malichtrinh = malichtrinh;
	}
	/**
	 * @return the tencongviec
	 */
	public String getTencongviec() {
		return tencongviec;
	}
	/**
	 * @param tencongviec the tencongviec to set
	 */
	public void setTencongviec(String tencongviec) {
		this.tencongviec = tencongviec;
	}
	/**
	 * @return the thoigianbatdau
	 */
	public Date getThoigianbatdau() {
		return thoigianbatdau;
	}
	/**
	 * @param thoigianbatdau the thoigianbatdau to set
	 */
	public void setThoigianbatdau(Date thoigianbatdau) {
		this.thoigianbatdau = thoigianbatdau;
	}
	/**
	 * @return the thoigianketthuc
	 */
	public Date getThoigianketthuc() {
		return thoigianketthuc;
	}
	/**
	 * @param thoigianketthuc the thoigianketthuc to set
	 */
	public void setThoigianketthuc(Date thoigianketthuc) {
		this.thoigianketthuc = thoigianketthuc;
	}
	/**
	 * @return the cuaKeHoach
	 */
	public O_KeHoach getCuaKeHoach() {
		return cuaKeHoach;
	}
	/**
	 * @param cuaKeHoach the cuaKeHoach to set
	 */
	public void setCuaKeHoach(O_KeHoach cuaKeHoach) {
		this.cuaKeHoach = cuaKeHoach;
	}


}
