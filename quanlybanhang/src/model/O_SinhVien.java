package model;
import java.util.ArrayList;
import java.util.List;

/**
 * 
 */

/**
 * @author TTHAN
 *
 */
public class O_SinhVien extends O_Nguoi{
	private String email;
	private String diaChiFaceBook;
	private String skype;
	private List<O_KeHoach> dsKeHoach;
	private O_ChiDoan thuocChiDoan;
	/**
	 * 
	 */
	public O_SinhVien() {
		// TODO Auto-generated constructor stub
		this.dsKeHoach  = new ArrayList<O_KeHoach>();
	}
	public O_SinhVien(String ma){
		super(ma);
		this.dsKeHoach  = new ArrayList<O_KeHoach>();
	}
	/**
	 * 
	 * @param ma
	 * @param hoTen
	 * @param soDienThoai
	 * @param diaChi
	 * @param email
	 * @param diaChiFaceBook
	 * @param skype
	 */
	public O_SinhVien(String ma, String hoTen, String soDienThoai
			, String diaChi,String email, String diaChiFaceBook,String skype) {
		super(ma, hoTen, soDienThoai, diaChi);
		this.dsKeHoach = new ArrayList<O_KeHoach>();
		this.diaChiFaceBook=diaChiFaceBook;
		this.skype=skype;
		this.email=email;
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the diaChiFaceBook
	 */
	public String getDiaChiFaceBook() {
		return diaChiFaceBook;
	}
	/**
	 * @param diaChiFaceBook the diaChiFaceBook to set
	 */
	public void setDiaChiFaceBook(String diaChiFaceBook) {
		this.diaChiFaceBook = diaChiFaceBook;
	}
	/**
	 * @return the skype
	 */
	public String getSkype() {
		return skype;
	}
	/**
	 * @param skype the skype to set
	 */
	public void setSkype(String skype) {
		this.skype = skype;
	}
	/**
	 * @return the dsKeHoach
	 */
	public List<O_KeHoach> getDsKeHoach() {
		return dsKeHoach;
	}
	/**
	 * @param dsKeHoach the dsKeHoach to set
	 */
	public void setDsKeHoach(List<O_KeHoach> dsKeHoach) {
		this.dsKeHoach = dsKeHoach;
	}
	/**
	 * @return the thuocChiDoan
	 */
	public O_ChiDoan getThuocChiDoan() {
		return thuocChiDoan;
	}
	/**
	 * @param thuocChiDoan the thuocChiDoan to set
	 */
	public void setThuocChiDoan(O_ChiDoan thuocChiDoan) {
		this.thuocChiDoan = thuocChiDoan;
	}
	/**
	 * 
	 * @param keHoach ke hoach can bo sung vao khi sinh vien thuc hien ke hoach
	 * @return
	 */
	public boolean addKeHoach(O_KeHoach keHoach){
		return this.dsKeHoach.add(keHoach);
	}
	/**
	 * 
	 * @param keHoach remove ke hoach khoi danh sach ke hoach thuc hien cua sinh vien
	 * @return
	 */
	public boolean removeKeHoach(O_KeHoach keHoach){
		return this.dsKeHoach.remove(keHoach);
	}
	
}
