package model;
import java.util.ArrayList;
import java.util.List;

/**
 * @author TTHAN
 * @update lnquyen
 */
public class O_NguonKinhPhi {
	private String maNguonKinhphi;
	private String tenNguonKinhphi;
	private List<O_HoTroKinhPhi> dsHoTro;
	
	/**
	 * 
	 */
	public O_NguonKinhPhi() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param maNguonKinhphi
	 * @param tenNguonKinhphi
	 * @param dsKeHoach
	 */
	public O_NguonKinhPhi(String maNguonKinhphi) {
		this.maNguonKinhphi = maNguonKinhphi;
		this.dsHoTro =  new ArrayList<O_HoTroKinhPhi>();
	}
	
	public O_NguonKinhPhi(String maNguonKinhphi, String tenNguonKinhphi) {
		this.maNguonKinhphi = maNguonKinhphi;
		this.tenNguonKinhphi = tenNguonKinhphi;
		this.dsHoTro =  new ArrayList<O_HoTroKinhPhi>();
	}
	
	public O_NguonKinhPhi(String maNguonKinhphi, String tenNguonKinhphi, List<O_HoTroKinhPhi> dsKeHoach) {
		this.maNguonKinhphi = maNguonKinhphi;
		this.tenNguonKinhphi = tenNguonKinhphi;
		this.dsHoTro = dsKeHoach;
	}

	/**
	 * @return the maNguonKinhphi
	 */
	public String getMaNguonKinhphi() {
		return maNguonKinhphi;
	}

	/**
	 * @param maNguonKinhphi the maNguonKinhphi to set
	 */
	public void setMaNguonKinhphi(String maNguonKinhphi) {
		this.maNguonKinhphi = maNguonKinhphi;
	}

	/**
	 * @return the tenNguonKinhphi
	 */
	public String getTenNguonKinhphi() {
		return tenNguonKinhphi;
	}

	/**
	 * @param tenNguonKinhphi the tenNguonKinhphi to set
	 */
	public void setTenNguonKinhphi(String tenNguonKinhphi) {
		this.tenNguonKinhphi = tenNguonKinhphi;
	}

	/**
	 * @return the dsKeHoach
	 */
	public List<O_HoTroKinhPhi> getDsHoTro() {
		return dsHoTro;
	}

	/**
	 * @param dshotro the dshotro to set
	 */
	public void setDsHoTro(List<O_HoTroKinhPhi> dshotro) {
		this.dsHoTro = dshotro;
	}
	/**
	 * 
	 * @param hotrokehoach bo sung ke hoach ma nguon kinh phi ho tro
	 * @return
	 */
	public boolean addHoTro(O_HoTroKinhPhi hotrokehoach){
		return this.dsHoTro.add(hotrokehoach);
	}
	/**
	 * remove khoi danh sach cac ke hoach ho tro cua nguon kinh phi
	 * @param hotrokehoach remove ke hoach ma nguon kinh phi ho tro
	 * @return
	 */
	public boolean removeKeHoach(O_HoTroKinhPhi hotrokehoach){
		return this.dsHoTro.remove(hotrokehoach);
	}
}
