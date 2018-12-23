package model;
import java.util.ArrayList;
import java.util.List;


/**
 * @author TTHAN
 *
 */
public class O_Nguoi {
	private String ma;
	private String hoTen;
	private String soDienThoai;
	private String diaChi;
	private List<O_User> dsuser;
	

	/**
	 * 
	 */
	public O_Nguoi() {
		super();
		this.dsuser=new ArrayList<O_User>();
		// TODO Auto-generated constructor stub
	}
	public O_Nguoi(String ma) {
		this.ma=ma;
		this.dsuser=new ArrayList<O_User>();
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * @param ma mã sinh viên/BCH chi đoàn/BCH đoàn khoa
	 * @param hoTen Họ tên
	 * @param soDienThoai Số điện thoại
	 * @param diaChi Địa chỉ	 
	 * @param dsuser
	 */
	public O_Nguoi(String ma, String hoTen, String soDienThoai, String diaChi) {
		this.ma = ma;
		this.hoTen = hoTen;
		this.soDienThoai = soDienThoai;
		this.diaChi = diaChi;
		this.dsuser = new ArrayList<O_User>();
	}
	
	/**
	 * @return the ma
	 */
	public String getMa() {
		return ma;
	}
	
	/**
	 * @param ma the ma to set
	 */
	public void setMa(String ma) {
		this.ma = ma;
	}
	/**
	 * @return the hoTen
	 */
	public String getHoTen() {
		return hoTen;
	}
	/**
	 * @param hoTen the hoTen to set
	 */
	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}
	/**
	 * @return the soDienThoai
	 */
	public String getSoDienThoai() {
		return soDienThoai;
	}
	/**
	 * @param soDienThoai the soDienThoai to set
	 */
	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}
	/**
	 * @return the diaChi
	 */
	public String getDiaChi() {
		return diaChi;
	}
	/**
	 * @param diaChi the diaChi to set
	 */
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	/**
	 * @return the dsuser
	 */
	public List<O_User> getDsuser() {
		return dsuser;
	}

	/**
	 * @param dsuser the dsuser to set
	 */
	public void setDsuser(List<O_User> dsuser) {
		this.dsuser = dsuser;
	}
	/**
	 * Ham add Nguoi
	 * @return tra ve true neu add thanh cong, nguoc lai false
	 * @param 
	 * 
	 */
	public boolean addUser(O_User user){ 
		return this.dsuser.add(user);
	}
	
		
}
