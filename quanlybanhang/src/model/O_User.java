package model;
import java.util.ArrayList;

/**
 * 
 */

/**
 * @author DELL
 *
 */
//@SuppressWarnings("unused")
public class O_User  {
	private String userName;
	private String passWord;
	private String quyen;
	private O_Nguoi nguoi;
	
	/**
	 * 
	 */
	public O_User() {
		// TODO Auto-generated constructor stub
	}
	/**
	 * @param userName
	 * @param passWord
	 * @param quyen
	 * @param nguoi: tai khoan nay cua ai
	 * 
	 */
	
	public O_User(String userName ) {
		this.userName = userName;
		}
	
	public O_User(String userName , String passWord) {
		this.userName = userName;
		this.passWord = passWord;
		}
	
	public O_User(String userName , String passWord, String quyen) {
		this.userName = userName;
		this.passWord = passWord;
		this.quyen = quyen;		
	}
	public O_User(String userName , String passWord, String quyen,O_Nguoi o_nguoi) {
		this.userName = userName;
		this.passWord = passWord;
		this.quyen = quyen;
		this.nguoi = o_nguoi;
	}	
	
	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}
	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public void setUserName(String userName, String passWord) {
		this.userName = userName;
		this.passWord = passWord;		
			}
	/**
	 * @return the passWord
	 */
	public String getPassWord() {
		return passWord;
	}
	/**
	 * @param passWord the passWord to set
	 */
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	/**
	 * @return the quyen
	 */
	public String getQuyen() {
		return quyen;
	}
	/**
	 * @param quyen the quyen to set
	 */
	public void setQuyen(String quyen) {
		this.quyen = quyen;
	}
	/**
	 * @return the nguoi
	 */
	public O_Nguoi getNguoi() {
		return nguoi;
	}
	/**
	 * @param nguoi the nguoi to set
	 */
	public void setNguoi(O_Nguoi nguoi) {
		this.nguoi = nguoi;
	}
	
	
}
