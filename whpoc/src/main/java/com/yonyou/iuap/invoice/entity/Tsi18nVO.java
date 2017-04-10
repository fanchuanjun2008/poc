package com.yonyou.iuap.invoice.entity;

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
@Entity(namespace = "whpoc",name = "Tsi18n")
@Table(name="whpoc_Tsi18n")
public class Tsi18nVO extends BaseEntity {
	  
	@Id
	@GeneratedValue(strategy=Stragegy.UUID,moudle="")
	@Column(name = "id")
	private String id;
	
	@Column(name = "type")
	private String type;
	
	@Column(name = "keyy")
	private String keyy;
	
	@Column(name = "zh_value")
	private String zhvalue;
	
	@Column(name = "en_value")
	private String envalue;
	

	@Column(name = "dr")
    private java.lang.Integer dr = 0 ;
      
    @Column(name = "ts")
    private java.sql.Timestamp ts ;    	

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}
	

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}
	

	public String getKeyy() {
		return this.keyy;
	}

	public void setKeyy(String keyy) {
		this.keyy = keyy;
	}
	

	public String getZhvalue() {
		return this.zhvalue;
	}

	public void setZhvalue(String zhvalue) {
		this.zhvalue = zhvalue;
	}
	

	public String getEnvalue() {
		return this.envalue;
	}

	public void setEnvalue(String envalue) {
		this.envalue = envalue;
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
	        return "Tsi18n";
	    }

	    @Override
	    public String getNamespace() {
	        return "whpoc";
	    }
}