package model;
/**
 * 
 */

/**
 * @author TTHAN
 *
 */
public class O_BCHChiDoan extends O_SinhVien {
	private String chucVu;

	
	/**
	 * 
	 */
	public O_BCHChiDoan() {
		// TODO Auto-generated constructor stub
	}
	public O_BCHChiDoan(String ma) {
		// TODO Auto-generated constructor stub
		super(ma);
	}

	/*** 
	 * @param ma
	 * @param hoTen
	 * @param soDienThoai
	 * @param diaChi
	 * @param email
	 * @param diaChiFaceBook
	 * @param skype
	 */

	public O_BCHChiDoan(String ma, String hoTen, String soDienThoai, String diaChi
						,String email, String diaChiFaceBook,String skype) {
		super(ma, hoTen, soDienThoai, diaChi, email, diaChiFaceBook, skype);

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
