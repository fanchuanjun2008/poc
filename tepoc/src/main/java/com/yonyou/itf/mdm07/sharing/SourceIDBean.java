
package com.yonyou.itf.mdm07.sharing;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementRef;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>SourceIDBean complex type的 Java 类。
 * 
 * <p>以下模式片段指定包含在此类中的预期内容。
 * 
 * <pre>
 * &lt;complexType name="SourceIDBean"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="gdCode" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="srcIds" type="{http://www.w3.org/2001/XMLSchema}string" maxOccurs="unbounded" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "SourceIDBean", namespace = "http://sharing.mdm07.itf.yonyou.com/SourceIDBean", propOrder = {
    "gdCode",
    "srcIds"
})
public class SourceIDBean {

    @XmlElementRef(name = "gdCode", namespace = "http://sharing.mdm07.itf.yonyou.com/SourceIDBean", type = JAXBElement.class, required = false)
    protected JAXBElement<String> gdCode;
    @XmlElement(nillable = true)
    protected List<String> srcIds;

    /**
     * 获取gdCode属性的值。
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link String }{@code >}
     *     
     */
    public JAXBElement<String> getGdCode() {
        return gdCode;
    }

    /**
     * 设置gdCode属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link String }{@code >}
     *     
     */
    public void setGdCode(JAXBElement<String> value) {
        this.gdCode = value;
    }

    /**
     * Gets the value of the srcIds property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the srcIds property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getSrcIds().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link String }
     * 
     * 
     */
    public List<String> getSrcIds() {
        if (srcIds == null) {
            srcIds = new ArrayList<String>();
        }
        return this.srcIds;
    }

}
