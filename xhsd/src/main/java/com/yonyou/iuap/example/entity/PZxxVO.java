package com.yonyou.iuap.example.entity;



import com.yonyou.iuap.persistence.jdbc.framework.annotation.*;
import com.yonyou.iuap.persistence.vo.BaseEntity;

import java.sql.Timestamp;



/**
 * <b> 此处简要描述此类功能 </b>
 * <p>
 *   此处添加类的描述信息
 * </p>
 * @author 
 * @version 
 */
@Entity(namespace = "xhsd",name = "PZxxVO")
@Table(name="demo_pzxx")
public class PZxxVO extends BaseEntity {
	  
	@Id
	@GeneratedValue(strategy=Stragegy.UUID,moudle="")
	@Column(name = "id_pzxx")
	private String id_pzxx;

	@Column(name = "pzbm")
	private String pzbm;

	@Column(name = "isbn")
	private String isbn;

	@Column(name = "sm")
	private String sm;

	@Column(name = "dj")
	private Double dj;

	@Column(name = "cbrq")
	private Timestamp cbrq;

	@Column(name = "ysny")
	private Timestamp ysny;


	@Column(name = "dr")
    private java.lang.Integer dr = 0 ;
      
    @Column(name = "ts")
    private java.sql.Timestamp ts ;

	public String getId_pzxx() {
		return this.id_pzxx;
	}

	public void setId_pzxx(String id_pzxx) {
		this.id_pzxx = id_pzxx;
	}
	

	public String getPzbm() {
		return this.pzbm;
	}

	public void setPzbm(String pzbm) {
		this.pzbm = pzbm;
	}
	

	public String getIsbn() {
		return this.isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	

	public String getSm() {
		return this.sm;
	}

	public void setSm(String sm) {
		this.sm = sm;
	}
	

	public Double getDj() {
		return this.dj;
	}

	public void setDj(Double dj) {
		this.dj = dj;
	}
	

	public Timestamp getCbrq() {
		return this.cbrq;
	}

	public void setCbrq(Timestamp cbrq) {
		this.cbrq = cbrq;
	}
	

	public Timestamp getYsny() {
		return this.ysny;
	}

	public void setYsny(Timestamp ysny) {
		this.ysny = ysny;
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
	        return "PZxxVO";
	    }

	    @Override
	    public String getNamespace() {
	        return "xhsd";
	    }
}