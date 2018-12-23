/**
 * 
 */
package model;

/**
 * @author DELL
 *
 */
public class O_HoTroKinhPhi {
	private String mahotro;
	private O_KeHoach hotrokehoach;
	private O_NguonKinhPhi tunguonkinhphi;
	private int sotien;
	
	/**
	 * 
	 */
	public O_HoTroKinhPhi() {
		// TODO Auto-generated constructor stub
	}
	public O_HoTroKinhPhi(String mahotro) {
		this.mahotro = mahotro;
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param mahotro
	 * @param hotrokehoach
	 * @param tunguonkinhphi
	 * @param sotien
	 */
	public O_HoTroKinhPhi(String mahotro, O_KeHoach hotrokehoach, O_NguonKinhPhi tunguonkinhphi, int sotien) {
		this.mahotro = mahotro;
		this.hotrokehoach = hotrokehoach;
		this.tunguonkinhphi = tunguonkinhphi;
		this.sotien = sotien;
	}
	/**
	 * @return the mahotro
	 */
	public String getMahotro() {
		return mahotro;
	}
	/**
	 * @param mahotro the mahotro to set
	 */
	public void setMahotro(String mahotro) {
		this.mahotro = mahotro;
	}
	/**
	 * @return the hotrokehoach
	 */
	public O_KeHoach getHotrokehoach() {
		return hotrokehoach;
	}
	/**
	 * @param hotrokehoach the hotrokehoach to set
	 */
	public void setHotrokehoach(O_KeHoach hotrokehoach) {
		this.hotrokehoach = hotrokehoach;
	}
	/**
	 * @return the tunguonkinhphi
	 */
	public O_NguonKinhPhi getTunguonkinhphi() {
		return tunguonkinhphi;
	}
	/**
	 * @param tunguonkinhphi the tunguonkinhphi to set
	 */
	public void setTunguonkinhphi(O_NguonKinhPhi tunguonkinhphi) {
		this.tunguonkinhphi = tunguonkinhphi;
	}
	/**
	 * @return the sotien
	 */
	public int getSotien() {
		return sotien;
	}
	/**
	 * @param sotien the sotien to set
	 */
	public void setSotien(int sotien) {
		this.sotien = sotien;
	}
}
