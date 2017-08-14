package com.yonyou.iuap.example.entity;



import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;

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
@Entity(namespace = "xhsd",name = "BdxxVO")
@Table(name="demo_bdxx")
public class BdxxVO extends BaseEntity {
	  
	@Id
	@GeneratedValue(strategy=Stragegy.UUID,moudle="")
	@Column(name = "id_bdxx")
	private String id_bdxx;

	@Column(name = "ywbm")
	private String ywbm;

	@Column(name = "zddwbm")
	private String zddwbm;
	private String zddwbmName;

	@Column(name = "zddh")
	private String zddh;

	@Column(name = "pzbm")
	private String pzbm;
	private String pzbmName;

	@Column(name = "zdsl")
	private BigDecimal zdsl;

	@Column(name = "fhsl")
	private BigDecimal fhsl;

	@Column(name = "fhzk")
	private BigDecimal fhzk;

	@Column(name = "zkbj")
	private String zkbj;

	@Column(name = "lrrq")
	private Date lrrq;

	@Column(name = "clrq")
	private Date clrq;

	@Column(name = "bz")
	private String bz;
	
	@Column(name = "kcsl")
	private BigDecimal kcsl;
	@Column(name = "yfsl")
	private BigDecimal yfsl;
	
	
	
	


	public BigDecimal getYfsl() {
		return yfsl;
	}

	public void setYfsl(BigDecimal yfsl) {
		this.yfsl = yfsl;
	}

	public BigDecimal getKcsl() {
		return kcsl;
	}

	public void setKcsl(BigDecimal kcsl) {
		this.kcsl = kcsl;
	}

	@Column(name = "dr")
    private java.lang.Integer dr = 0 ;
      
    @Column(name = "ts")
    private java.sql.Timestamp ts ;    	

	public String getId_bdxx() {
		return this.id_bdxx;
	}

	public void setId_bdxx(String id_bdxx) {
		this.id_bdxx = id_bdxx;
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
	

	public BigDecimal getZdsl() {
		return this.zdsl;
	}

	public void setZdsl(BigDecimal zdsl) {
		this.zdsl = zdsl;
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
	

	public String getZkbj() {
		return this.zkbj;
	}

	public void setZkbj(String zkbj) {
		this.zkbj = zkbj;
	}
	

	public Date getLrrq() {
		return this.lrrq;
	}

	public void setLrrq(Date lrrq) {
		this.lrrq = lrrq;
	}
	

	public Date getClrq() {
		return this.clrq;
	}

	public void setClrq(Date clrq) {
		this.clrq = clrq;
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
	
	public String getZddwbmName() {
		return zddwbmName;
	}

	public void setZddwbmName(String zddwbmName) {
		this.zddwbmName = zddwbmName;
	}

	public String getPzbmName() {
		return pzbmName;
	}

	public void setPzbmName(String pzbmName) {
		this.pzbmName = pzbmName;
	}
	
	@Override
    public String getMetaDefinedName() {
	        return "BdxxVO";
	    }

	    @Override
	    public String getNamespace() {
	        return "xhsd";
	    }
}