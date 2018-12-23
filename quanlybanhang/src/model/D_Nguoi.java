package model;

import com.db4o.ObjectContainer;
import com.db4o.ObjectSet;
import com.db4o.query.Query;

public class D_Nguoi {

	public D_Nguoi() {
		// TODO Auto-generated constructor stub
	}
	/**
	 * Tim nguoi chinh xac theo ma
	 * Status: tested
	 * @param manguoi
	 * @return tra ve O_Nguoi duoc tim thay, null neu khong tim thay
	 */
	public O_Nguoi found_O_Nguoi(ObjectContainer db, String manguoi){
		try{
			Query query1 = db.query();
	        query1.constrain(O_Nguoi.class);	        
	        query1.descend("ma").constrain(manguoi).equal();	        
	        ObjectSet<O_Nguoi> o_Nguoi = query1.execute();	    
        	return o_Nguoi.get(0);	        
		}catch(Exception e){
			System.out.println("hhh"+e.toString());
			return null;
		}		
	}

}
