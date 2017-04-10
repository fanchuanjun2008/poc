
package com.yonyou.itf.mdm07.sharing;

import javax.xml.bind.annotation.XmlEnum;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>MasterDataState�� Java �ࡣ
 * 
 * <p>����ģʽƬ��ָ�������ڴ����е�Ԥ�����ݡ�
 * <p>
 * <pre>
 * &lt;simpleType name="MasterDataState"&gt;
 *   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}string"&gt;
 *     &lt;enumeration value="NONE"/&gt;
 *     &lt;enumeration value="UNCHANGE"/&gt;
 *     &lt;enumeration value="SEAL"/&gt;
 *     &lt;enumeration value="UPDATED"/&gt;
 *     &lt;enumeration value="DELETED"/&gt;
 *   &lt;/restriction&gt;
 * &lt;/simpleType&gt;
 * </pre>
 * 
 */
@XmlType(name = "MasterDataState", namespace = "http://sharing.mdm07.itf.yonyou.com/MasterDataState")
@XmlEnum
public enum MasterDataState {

    NONE,
    UNCHANGE,
    SEAL,
    UPDATED,
    DELETED;

    public String value() {
        return name();
    }

    public static MasterDataState fromValue(String v) {
        return valueOf(v);
    }

}
