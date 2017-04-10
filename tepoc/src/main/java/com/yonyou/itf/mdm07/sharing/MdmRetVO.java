
package com.yonyou.itf.mdm07.sharing;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementRef;
import javax.xml.bind.annotation.XmlSchemaType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>MdmRetVO complex type的 Java 类。
 * 
 * <p>以下模式片段指定包含在此类中的预期内容。
 * 
 * <pre>
 * &lt;complexType name="MdmRetVO"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="message" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="dataStates" type="{http://sharing.mdm07.itf.yonyou.com/MasterDataState}MasterDataState" maxOccurs="unbounded" minOccurs="0"/&gt;
 *         &lt;element name="data" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="success" type="{http://www.w3.org/2001/XMLSchema}boolean" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "MdmRetVO", namespace = "http://sharing.mdm07.itf.yonyou.com/MdmRetVO", propOrder = {
    "message",
    "dataStates",
    "data",
    "success"
})
public class MdmRetVO {

    @XmlElementRef(name = "message", namespace = "http://sharing.mdm07.itf.yonyou.com/MdmRetVO", type = JAXBElement.class, required = false)
    protected JAXBElement<String> message;
    @XmlElement(nillable = true)
    @XmlSchemaType(name = "string")
    protected List<MasterDataState> dataStates;
    @XmlElementRef(name = "data", namespace = "http://sharing.mdm07.itf.yonyou.com/MdmRetVO", type = JAXBElement.class, required = false)
    protected JAXBElement<String> data;
    @XmlElementRef(name = "success", namespace = "http://sharing.mdm07.itf.yonyou.com/MdmRetVO", type = JAXBElement.class, required = false)
    protected JAXBElement<Boolean> success;

    /**
     * 获取message属性的值。
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link String }{@code >}
     *     
     */
    public JAXBElement<String> getMessage() {
        return message;
    }

    /**
     * 设置message属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link String }{@code >}
     *     
     */
    public void setMessage(JAXBElement<String> value) {
        this.message = value;
    }

    /**
     * Gets the value of the dataStates property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the dataStates property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getDataStates().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link MasterDataState }
     * 
     * 
     */
    public List<MasterDataState> getDataStates() {
        if (dataStates == null) {
            dataStates = new ArrayList<MasterDataState>();
        }
        return this.dataStates;
    }

    /**
     * 获取data属性的值。
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link String }{@code >}
     *     
     */
    public JAXBElement<String> getData() {
        return data;
    }

    /**
     * 设置data属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link String }{@code >}
     *     
     */
    public void setData(JAXBElement<String> value) {
        this.data = value;
    }

    /**
     * 获取success属性的值。
     * 
     * @return
     *     possible object is
     *     {@link JAXBElement }{@code <}{@link Boolean }{@code >}
     *     
     */
    public JAXBElement<Boolean> getSuccess() {
        return success;
    }

    /**
     * 设置success属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link JAXBElement }{@code <}{@link Boolean }{@code >}
     *     
     */
    public void setSuccess(JAXBElement<Boolean> value) {
        this.success = value;
    }

}
