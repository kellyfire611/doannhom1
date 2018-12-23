package model;
import com.db4o.Db4oEmbedded;
import com.db4o.ObjectContainer;
import com.db4o.config.EmbeddedConfiguration;

public class PUB_Lib {

	private ObjectContainer db;
	public PUB_Lib() {
		// TODO Auto-generated constructor stub
	}
	 
	/**
	 * @return the db
	 */
	public ObjectContainer getDb() {
		return db;
	}

	/**
	 * @param db the db to set
	 */
	public void setDb(ObjectContainer db) {
		this.db = db;
	}

	public void connect(){
		db = Db4oEmbedded.openFile(CONS_Lib.DB_PATH);
	}
	/**
	 * Connect với cascadeOnUpdate và cascadeOnDelete
	 */
	public void connect_cascade(){
		EmbeddedConfiguration config = Db4oEmbedded.newConfiguration(); 
		config.common().objectClass(O_BCHChiDoan.class).cascadeOnUpdate(true);
		config.common().objectClass(O_SinhVien.class).cascadeOnUpdate(true);		
		config.common().objectClass(O_ChiDoan.class).cascadeOnUpdate(true);
		config.common().objectClass(O_NguonKinhPhi.class).cascadeOnUpdate(true);
		config.common().objectClass(O_KeHoach.class).cascadeOnUpdate(true);
		config.common().objectClass(O_HoTroKinhPhi.class).cascadeOnUpdate(true);
		config.common().objectClass(O_LichTrinh.class).cascadeOnUpdate(true);
		config.common().objectClass(O_DoanKhoa.class).cascadeOnUpdate(true);
		db = Db4oEmbedded.openFile(config,CONS_Lib.DB_PATH);
	}
	public void closeconnect(){
		db.close();
	}
}
