package com.yonyou.iuap.example.entity;



import com.yonyou.iuap.persistence.jdbc.framework.annotation.Column;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Entity;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.GeneratedValue;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Id;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Stragegy;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Table;
import com.yonyou.iuap.persistence.vo.BaseEntity;



/**
 * <b> 此处简要描述此类功能 </b>
 * <p>
 *   此处添加类的描述信息
 * </p>
 * @author 
 * @version 
 */
@Entity(namespace = "xhsd",name = "KHxxVO")
@Table(name="demo_khxx")
public class KHxxVO extends BaseEntity {
	  
	@Id
	@GeneratedValue(strategy=Stragegy.UUID,moudle="")
	@Column(name = "id_khxx")
	private String id_khxx;

	@Column(name = "khbh")
	private String khbh;

	@Column(name = "khmc")
	private String khmc;

	@Column(name = "kyzt")
	private String kyzt;


	@Column(name = "dr")
    private java.lang.Integer dr = 0 ;
      
    @Column(name = "ts")
    private java.sql.Timestamp ts ;    	

	public String getId_khxx() {
		return this.id_khxx;
	}

	public void setId_khxx(String id_khxx) {
		this.id_khxx = id_khxx;
	}
	

	public String getKhbh() {
		return this.khbh;
	}

	public void setKhbh(String khbh) {
		this.khbh = khbh;
	}
	

	public String getKhmc() {
		return this.khmc;
	}

	public void setKhmc(String khmc) {
		this.khmc = khmc;
	}
	

	public String getKyzt() {
		return this.kyzt;
	}

	public void setKyzt(String kyzt) {
		this.kyzt = kyzt;
	}
	
	    	
	public java.lang.Integer getDr () {
		return dr;
	}
	
	public void setDr (java.lang.Integer newDr ) {
	 	this.dr = newDr;
	} 	
	
	public java.sql.Timestamp getTs () {
		return ts;
	}
	
	public void setTs (java.sql.Timestamp newTs ) {
	 	this.ts = newTs;
	} 
	
	@Override
    public String getMetaDefinedName() {
	        return "KHxxVO";
	    }

	    @Override
	    public String getNamespace() {
	        return "xhsd";
	    }
}