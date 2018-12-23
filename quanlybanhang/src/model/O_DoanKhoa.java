package model;
/**
 * 
 */

/**
 * @author TTHAN
 *
 */
public class O_DoanKhoa extends O_Nguoi{
	private String chucVu;

	

	/**
	 * 
	 */
	public O_DoanKhoa() {
		// TODO Auto-generated constructor stub
	}
	public O_DoanKhoa(String ma) {
		// TODO Auto-generated constructor stub
		super(ma);
	}
	/**
	 * @param ma
	 * @param hoTen
	 * @param soDienThoai
	 * @param diaChi
	 * @param dsuser
	 */
	public O_DoanKhoa(String ma, String hoTen, String soDienThoai, String diaChi) {
		super(ma, hoTen, soDienThoai, diaChi);
		// TODO Auto-generated constructor stub
	}

	/**
	 * @return the chucVu
	 */
	public String getChucVu() {
		return chucVu;
	}

	/**
	 * @param chucVu the chucVu to set
	 */
	public void setChucVu(String chucVu) {
		this.chucVu = chucVu;
	}

}

