package com.yonyou.iuap.example.entity;



import java.math.BigDecimal;

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
@Entity(namespace = "xhsd",name = "KCVO")
@Table(name="demo_kcb")
public class KCVO extends BaseEntity {
	  
	@Id
	@GeneratedValue(strategy=Stragegy.UUID,moudle="")
	@Column(name = "id_kcb")
	private String id_kcb;

	@Column(name = "ywbm")
	private String ywbm;

	@Column(name = "pzbm")
	private String pzbm;

	@Column(name = "kcsl")
	private BigDecimal kcsl;

	@Column(name = "kczk")
	private Double kczk;

	@Column(name = "kczt")
	private String kczt;


	@Column(name = "dr")
    private java.lang.Integer dr = 0 ;
      
    @Column(name = "ts")
    private java.sql.Timestamp ts ;    	

	public String getId_kcb() {
		return this.id_kcb;
	}

	public void setId_kcb(String id_kcb) {
		this.id_kcb = id_kcb;
	}
	

	public String getYwbm() {
		return this.ywbm;
	}

	public void setYwbm(String ywbm) {
		this.ywbm = ywbm;
	}
	

	public String getPzbm() {
		return this.pzbm;
	}

	public void setPzbm(String pzbm) {
		this.pzbm = pzbm;
	}
	

	public BigDecimal getKcsl() {
		return this.kcsl;
	}

	public void setKcsl(BigDecimal kcsl) {
		this.kcsl = kcsl;
	}
	

	public Double getKczk() {
		return this.kczk;
	}

	public void setKczk(Double kczk) {
		this.kczk = kczk;
	}
	

	public String getKczt() {
		return this.kczt;
	}

	public void setKczt(String kczt) {
		this.kczt = kczt;
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
	        return "KCVO";
	    }

	    @Override
	    public String getNamespace() {
	        return "xhsd";
	    }
}