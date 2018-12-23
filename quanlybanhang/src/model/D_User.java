package model;
import java.util.List;

import com.db4o.ObjectContainer;
import com.db4o.ObjectSet;
import com.db4o.query.Query;


@SuppressWarnings("unused")
public class D_User {

	public D_User() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public D_User(String userName) {
		// TODO Auto-generated constructor stub
	}
	
				
	/** Add user 3 doi so
	 * 	
	 * @param db
	 * @param userName
	 * @param passWord
	 * @param quyen
	 * @throws Exception
	 */
	public void addUser(ObjectContainer db,String userName, String passWord, String quyen){
		try{
			O_User o_User = new O_User(userName, passWord, quyen );					
			db.store(o_User);		
		}catch(Exception ex){
			throw ex;
		}
	}
	/** Add user 4 doi so
	 * 	
	 * @param db
	 * @param userName
	 * @param passWord
	 * @param quyen
	 * @throws Exception
	 */
	public void addUser(ObjectContainer db,String userName, String passWord, String quyen, O_Nguoi o_nguoi){
		try{
			O_User o_User = new O_User(userName, passWord, quyen, o_nguoi);					
			db.store(o_User);		
		}catch(Exception ex){
			throw ex;
		}
	}
	
	/**
	 * Update User theo User Name
	 * @param db
	 * @param userName
	 * @param passWord
	 * @throws Exception 
	 */
	public void updateUser(ObjectContainer db,String userName, String passWord, String quyen) {
		try{
			O_User o_User = (O_User) db.queryByExample(new O_User(userName)).next();
			o_User.setUserName(userName);
			o_User.setPassWord (passWord);
			o_User.setQuyen (quyen);			
			db.store(o_User);		
		}catch(Exception ex){
			throw ex;
		}
	}

	
	
	
	/**	 
	 * Xoa User theo UserName
	 * @param db
	 * @param userName
	 * @throws Exception 
	 */
	public void deleteUser(ObjectContainer db,String userName){
		try{
			O_User o_User = (O_User) db.queryByExample(new O_User(userName)).next();					
			db.delete(o_User);	
		}catch(Exception ex){
			throw ex;
		}
	}
	
	
	/**
	 * TÃ¬m user theo User Name
	 *  * @param ma
	 * @return true náº¿u tÃ¬m tháº¥y, false náº¿u tÃ¬m khÃ´ng tháº¥y
	 */
	public boolean existUser(ObjectContainer db,String userName){
		try{
			Query query1 = db.query();
	        query1.constrain(O_User.class);	        
	        query1.descend("userName").constrain(userName).equal();	        
	        ObjectSet<O_User> o_User = query1.execute();
	        if (o_User.size()!=0) {
	        	return true;
	        }
	        else {
	        	return false;
	        }
		}catch(Exception e){
			System.out.println("hhh"+e.toString());
			return false;
		}		
	}

	/**
	 * TÃ¬m User theo User Name
	 * @param ma
	 * @return tráº£ vá»� danh sÃ¡ch Ä‘á»‘i tÆ°á»£ng(ObjectSet) cÃ¡c O_User Ä‘Æ°á»£c tÃ¬m tháº¥y, null náº¿u xáº£y ra lá»—i
	 */
	public ObjectSet<O_User> found_O_User(ObjectContainer db,String userName){
		try{
			Query query2 = db.query();
	        query2.constrain(O_User.class);	        
	        query2.descend("userName").constrain(userName).equal();	        
	        ObjectSet<O_User> o_User = query2.execute();
	        return o_User;	        
		}catch(Exception e){
			System.out.println("hhh"+e.toString());
			return null;
		}		
	}

	/**
	 * select all user
	 * Status: tested
	 * @param db
	 * @return
	 */
	public ObjectSet<O_User> selectAllUser(ObjectContainer db){
		try{			
			return db.queryByExample(new O_User());		
		}
		catch(Exception e){
			return null;
		}
	}
	/**
	 * Tim user theo ma nguoi
	 * @param db
	 * @param manguoi manguoi co the la ma sinh vien, ma ban chap hanh, ma BCH ban khoa
	 * @return
	 */
	public O_User selectUser_Nguoi(ObjectContainer db,String manguoi){
		try{			
			return (O_User) db.queryByExample(new O_User(manguoi)).get(0);		
		}
		catch(Exception e){
			return null;
		}
	}
	
	/**
	 * TÃ¬m User theo User Name
	 * @param ma
	 * @return tra ve danh sach O_User duoc tim thay, null neu xay ra loi
	 */
	public ObjectSet<O_User> found_O_User1 (ObjectContainer db,String quyen){
		try{
			Query query2 = db.query();
	        query2.constrain(O_User.class);	        
	        query2.descend("quyen").constrain(quyen).equal();	        
	        ObjectSet<O_User> o_User = query2.execute();
	        return o_User;	        
		}catch(Exception e){
			System.out.println("hhh"+e.toString());
			return null;
		}		
	}	
	
	
	public boolean checkLogin(ObjectContainer db,String username, String password){
		try{
			boolean t = false;
			 O_User user = new O_User(username,password);
			 
	         ObjectSet<O_User> users = db.queryByExample(user);
	         if (users.size()!=0) {
	        	 return true;
	         } else {
	        	 return false;
	         }
	         
	         
//	         for (O_User kq:users){
//	        	 if(kq.getUserName().equals(username))
//	        	 {	if(kq.getPassWord().equals(password))
//	        		 {
//	        		 t= true;
//	        		 break;
//	        		 }
//	        	 }
//	         }
	         //return t;
		}catch(Exception ex){ 		
			throw ex;//hoac return false khi co bat ky loi nao
		}
		
	}
	
	
}
