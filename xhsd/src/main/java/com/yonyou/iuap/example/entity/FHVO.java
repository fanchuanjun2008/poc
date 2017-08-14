package com.yonyou.iuap.example.entity;

import java.math.BigDecimal;
import java.util.Date;
	


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
@Entity(namespace = "xhsd",name = "FHVO")
@Table(name="demo_fhb")
public class FHVO extends BaseEntity {
	  
	@Id
	@GeneratedValue(strategy=Stragegy.UUID,moudle="")
	@Column(name = "id_fhb")
	private String id_fhb;

	@Column(name = "ywbm")
	private String ywbm;

	@Column(name = "zddwbm")
	private String zddwbm;

	@Column(name = "zddh")
	private String zddh;

	@Column(name = "pzbm")
	private String pzbm;

	@Column(name = "fhsl")
	private BigDecimal fhsl;

	@Column(name = "fhzk")
	private BigDecimal fhzk;

	@Column(name = "fdrq")
	private Date fdrq;

	@Column(name = "fdr")
	private String fdr;

	@Column(name = "clzt")
	private String clzt;

	@Column(name = "bz")
	private String bz;


	@Column(name = "dr")
    private java.lang.Integer dr = 0 ;
      
    @Column(name = "ts")
    private java.sql.Timestamp ts ;    	

	public String getId_fhb() {
		return this.id_fhb;
	}

	public void setId_fhb(String id_fhb) {
		this.id_fhb = id_fhb;
	}
	

	public String getYwbm() {
		return this.ywbm;
	}

	public void setYwbm(String ywbm) {
		this.ywbm = ywbm;
	}
	

	public String getZddwbm() {
		return this.zddwbm;
	}

	public void setZddwbm(String zddwbm) {
		this.zddwbm = zddwbm;
	}
	

	public String getZddh() {
		return this.zddh;
	}

	public void setZddh(String zddh) {
		this.zddh = zddh;
	}
	

	public String getPzbm() {
		return this.pzbm;
	}

	public void setPzbm(String pzbm) {
		this.pzbm = pzbm;
	}
	

	public BigDecimal getFhsl() {
		return this.fhsl;
	}

	public void setFhsl(BigDecimal fhsl) {
		this.fhsl = fhsl;
	}
	

	public BigDecimal getFhzk() {
		return this.fhzk;
	}

	public void setFhzk(BigDecimal fhzk) {
		this.fhzk = fhzk;
	}
	

	public Date getFdrq() {
		return this.fdrq;
	}

	public void setFdrq(Date fdrq) {
		this.fdrq = fdrq;
	}
	

	public String getFdr() {
		return this.fdr;
	}

	public void setFdr(String fdr) {
		this.fdr = fdr;
	}
	

	public String getClzt() {
		return this.clzt;
	}

	public void setClzt(String clzt) {
		this.clzt = clzt;
	}
	

	public String getBz() {
		return this.bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
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
	        return "FHVO";
	    }

	    @Override
	    public String getNamespace() {
	        return "xhsd";
	    }
}