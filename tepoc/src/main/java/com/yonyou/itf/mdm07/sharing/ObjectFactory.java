
package com.yonyou.itf.mdm07.sharing;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the com.yonyou.itf.mdm07.sharing package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _SourceIDBean_QNAME = new QName("http://sharing.mdm07.itf.yonyou.com/SourceIDBean", "SourceIDBean");
    private final static QName _IDMapping_QNAME = new QName("http://sharing.mdm07.itf.yonyou.com/IDMapping", "IDMapping");
    private final static QName _MasterDataState_QNAME = new QName("http://sharing.mdm07.itf.yonyou.com/MasterDataState", "MasterDataState");
    private final static QName _MdmRetVO_QNAME = new QName("http://sharing.mdm07.itf.yonyou.com/MdmRetVO", "MdmRetVO");
    private final static QName _DeleteListMdByIdsString_QNAME = new QName("http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", "string");
    private final static QName _DeleteListMdByIdsString1_QNAME = new QName("http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", "string1");
    private final static QName _DeleteListMdByIdsResponseReturn_QNAME = new QName("http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", "return");
    private final static QName _QueryXmlMdByIdString2_QNAME = new QName("http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", "string2");
    private final static QName _QueryXmlMdByIdBoolean_QNAME = new QName("http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", "boolean");
    private final static QName _QueryMdByConditionString4_QNAME = new QName("http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", "string4");
    private final static QName _QueryMdmcodeByGdCodeString3_QNAME = new QName("http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", "string3");
    private final static QName _QueryIdsSingleResponseReturnKey_QNAME = new QName("http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", "key");
    private final static QName _QueryIdsSingleResponseReturnValue_QNAME = new QName("http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", "value");
    private final static QName _MdmRetVOMessage_QNAME = new QName("http://sharing.mdm07.itf.yonyou.com/MdmRetVO", "message");
    private final static QName _MdmRetVOData_QNAME = new QName("http://sharing.mdm07.itf.yonyou.com/MdmRetVO", "data");
    private final static QName _MdmRetVOSuccess_QNAME = new QName("http://sharing.mdm07.itf.yonyou.com/MdmRetVO", "success");
    private final static QName _IDMappingGdCode_QNAME = new QName("http://sharing.mdm07.itf.yonyou.com/IDMapping", "gdCode");
    private final static QName _IDMappingIdMappingKey_QNAME = new QName("http://sharing.mdm07.itf.yonyou.com/IDMapping", "key");
    private final static QName _IDMappingIdMappingValue_QNAME = new QName("http://sharing.mdm07.itf.yonyou.com/IDMapping", "value");
    private final static QName _SourceIDBeanGdCode_QNAME = new QName("http://sharing.mdm07.itf.yonyou.com/SourceIDBean", "gdCode");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: com.yonyou.itf.mdm07.sharing
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link QueryIdsSingleResponse }
     * 
     */
    public QueryIdsSingleResponse createQueryIdsSingleResponse() {
        return new QueryIdsSingleResponse();
    }

    /**
     * Create an instance of {@link IDMapping }
     * 
     */
    public IDMapping createIDMapping() {
        return new IDMapping();
    }

    /**
     * Create an instance of {@link SourceIDBean }
     * 
     */
    public SourceIDBean createSourceIDBean() {
        return new SourceIDBean();
    }

    /**
     * Create an instance of {@link MdmRetVO }
     * 
     */
    public MdmRetVO createMdmRetVO() {
        return new MdmRetVO();
    }

    /**
     * Create an instance of {@link DeleteListMdByIds }
     * 
     */
    public DeleteListMdByIds createDeleteListMdByIds() {
        return new DeleteListMdByIds();
    }

    /**
     * Create an instance of {@link DeleteListMdByIdsResponse }
     * 
     */
    public DeleteListMdByIdsResponse createDeleteListMdByIdsResponse() {
        return new DeleteListMdByIdsResponse();
    }

    /**
     * Create an instance of {@link QueryXmlMdById }
     * 
     */
    public QueryXmlMdById createQueryXmlMdById() {
        return new QueryXmlMdById();
    }

    /**
     * Create an instance of {@link QueryXmlMdByIdResponse }
     * 
     */
    public QueryXmlMdByIdResponse createQueryXmlMdByIdResponse() {
        return new QueryXmlMdByIdResponse();
    }

    /**
     * Create an instance of {@link QueryListMdByType }
     * 
     */
    public QueryListMdByType createQueryListMdByType() {
        return new QueryListMdByType();
    }

    /**
     * Create an instance of {@link QueryListMdByTypeResponse }
     * 
     */
    public QueryListMdByTypeResponse createQueryListMdByTypeResponse() {
        return new QueryListMdByTypeResponse();
    }

    /**
     * Create an instance of {@link QueryMdByCondition }
     * 
     */
    public QueryMdByCondition createQueryMdByCondition() {
        return new QueryMdByCondition();
    }

    /**
     * Create an instance of {@link QueryMdByConditionResponse }
     * 
     */
    public QueryMdByConditionResponse createQueryMdByConditionResponse() {
        return new QueryMdByConditionResponse();
    }

    /**
     * Create an instance of {@link QueryXmlListMdByType }
     * 
     */
    public QueryXmlListMdByType createQueryXmlListMdByType() {
        return new QueryXmlListMdByType();
    }

    /**
     * Create an instance of {@link QueryXmlListMdByTypeResponse }
     * 
     */
    public QueryXmlListMdByTypeResponse createQueryXmlListMdByTypeResponse() {
        return new QueryXmlListMdByTypeResponse();
    }

    /**
     * Create an instance of {@link QueryListMdByIds }
     * 
     */
    public QueryListMdByIds createQueryListMdByIds() {
        return new QueryListMdByIds();
    }

    /**
     * Create an instance of {@link QueryListMdByIdsResponse }
     * 
     */
    public QueryListMdByIdsResponse createQueryListMdByIdsResponse() {
        return new QueryListMdByIdsResponse();
    }

    /**
     * Create an instance of {@link QueryNewMdAfter }
     * 
     */
    public QueryNewMdAfter createQueryNewMdAfter() {
        return new QueryNewMdAfter();
    }

    /**
     * Create an instance of {@link QueryNewMdAfterResponse }
     * 
     */
    public QueryNewMdAfterResponse createQueryNewMdAfterResponse() {
        return new QueryNewMdAfterResponse();
    }

    /**
     * Create an instance of {@link QueryMdmcodeByGdCode }
     * 
     */
    public QueryMdmcodeByGdCode createQueryMdmcodeByGdCode() {
        return new QueryMdmcodeByGdCode();
    }

    /**
     * Create an instance of {@link QueryMdmcodeByGdCodeResponse }
     * 
     */
    public QueryMdmcodeByGdCodeResponse createQueryMdmcodeByGdCodeResponse() {
        return new QueryMdmcodeByGdCodeResponse();
    }

    /**
     * Create an instance of {@link QueryIdsSingle }
     * 
     */
    public QueryIdsSingle createQueryIdsSingle() {
        return new QueryIdsSingle();
    }

    /**
     * Create an instance of {@link QueryIdsSingleResponse.Return }
     * 
     */
    public QueryIdsSingleResponse.Return createQueryIdsSingleResponseReturn() {
        return new QueryIdsSingleResponse.Return();
    }

    /**
     * Create an instance of {@link InsertMd }
     * 
     */
    public InsertMd createInsertMd() {
        return new InsertMd();
    }

    /**
     * Create an instance of {@link InsertMdResponse }
     * 
     */
    public InsertMdResponse createInsertMdResponse() {
        return new InsertMdResponse();
    }

    /**
     * Create an instance of {@link DeleteMdById }
     * 
     */
    public DeleteMdById createDeleteMdById() {
        return new DeleteMdById();
    }

    /**
     * Create an instance of {@link DeleteMdByIdResponse }
     * 
     */
    public DeleteMdByIdResponse createDeleteMdByIdResponse() {
        return new DeleteMdByIdResponse();
    }

    /**
     * Create an instance of {@link UpdateMd }
     * 
     */
    public UpdateMd createUpdateMd() {
        return new UpdateMd();
    }

    /**
     * Create an instance of {@link UpdateMdResponse }
     * 
     */
    public UpdateMdResponse createUpdateMdResponse() {
        return new UpdateMdResponse();
    }

    /**
     * Create an instance of {@link QueryMdById }
     * 
     */
    public QueryMdById createQueryMdById() {
        return new QueryMdById();
    }

    /**
     * Create an instance of {@link QueryMdByIdResponse }
     * 
     */
    public QueryMdByIdResponse createQueryMdByIdResponse() {
        return new QueryMdByIdResponse();
    }

    /**
     * Create an instance of {@link QueryMdByName }
     * 
     */
    public QueryMdByName createQueryMdByName() {
        return new QueryMdByName();
    }

    /**
     * Create an instance of {@link QueryMdByNameResponse }
     * 
     */
    public QueryMdByNameResponse createQueryMdByNameResponse() {
        return new QueryMdByNameResponse();
    }

    /**
     * Create an instance of {@link QueryMdByCode }
     * 
     */
    public QueryMdByCode createQueryMdByCode() {
        return new QueryMdByCode();
    }

    /**
     * Create an instance of {@link QueryMdByCodeResponse }
     * 
     */
    public QueryMdByCodeResponse createQueryMdByCodeResponse() {
        return new QueryMdByCodeResponse();
    }

    /**
     * Create an instance of {@link QueryIdsMulti }
     * 
     */
    public QueryIdsMulti createQueryIdsMulti() {
        return new QueryIdsMulti();
    }

    /**
     * Create an instance of {@link QueryIdsMultiResponse }
     * 
     */
    public QueryIdsMultiResponse createQueryIdsMultiResponse() {
        return new QueryIdsMultiResponse();
    }

    /**
     * Create an instance of {@link SubscribeMd }
     * 
     */
    public SubscribeMd createSubscribeMd() {
        return new SubscribeMd();
    }

    /**
     * Create an instance of {@link SubscribeMdResponse }
     * 
     */
    public SubscribeMdResponse createSubscribeMdResponse() {
        return new SubscribeMdResponse();
    }

    /**
     * Create an instance of {@link ChangeBackgroundTaskStatus }
     * 
     */
    public ChangeBackgroundTaskStatus createChangeBackgroundTaskStatus() {
        return new ChangeBackgroundTaskStatus();
    }

    /**
     * Create an instance of {@link ChangeBackgroundTaskStatusResponse }
     * 
     */
    public ChangeBackgroundTaskStatusResponse createChangeBackgroundTaskStatusResponse() {
        return new ChangeBackgroundTaskStatusResponse();
    }

    /**
     * Create an instance of {@link QueryMDMCodeByIdsMulti }
     * 
     */
    public QueryMDMCodeByIdsMulti createQueryMDMCodeByIdsMulti() {
        return new QueryMDMCodeByIdsMulti();
    }

    /**
     * Create an instance of {@link QueryMDMCodeByIdsMultiResponse }
     * 
     */
    public QueryMDMCodeByIdsMultiResponse createQueryMDMCodeByIdsMultiResponse() {
        return new QueryMDMCodeByIdsMultiResponse();
    }

    /**
     * Create an instance of {@link IDMapping.IdMapping }
     * 
     */
    public IDMapping.IdMapping createIDMappingIdMapping() {
        return new IDMapping.IdMapping();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link SourceIDBean }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/SourceIDBean", name = "SourceIDBean")
    public JAXBElement<SourceIDBean> createSourceIDBean(SourceIDBean value) {
        return new JAXBElement<SourceIDBean>(_SourceIDBean_QNAME, SourceIDBean.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link IDMapping }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IDMapping", name = "IDMapping")
    public JAXBElement<IDMapping> createIDMapping(IDMapping value) {
        return new JAXBElement<IDMapping>(_IDMapping_QNAME, IDMapping.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link MasterDataState }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/MasterDataState", name = "MasterDataState")
    public JAXBElement<MasterDataState> createMasterDataState(MasterDataState value) {
        return new JAXBElement<MasterDataState>(_MasterDataState_QNAME, MasterDataState.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link MdmRetVO }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/MdmRetVO", name = "MdmRetVO")
    public JAXBElement<MdmRetVO> createMdmRetVO(MdmRetVO value) {
        return new JAXBElement<MdmRetVO>(_MdmRetVO_QNAME, MdmRetVO.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string", scope = DeleteListMdByIds.class)
    public JAXBElement<String> createDeleteListMdByIdsString(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsString_QNAME, String.class, DeleteListMdByIds.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string1", scope = DeleteListMdByIds.class)
    public JAXBElement<String> createDeleteListMdByIdsString1(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsString1_QNAME, String.class, DeleteListMdByIds.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link MdmRetVO }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "return", scope = DeleteListMdByIdsResponse.class)
    public JAXBElement<MdmRetVO> createDeleteListMdByIdsResponseReturn(MdmRetVO value) {
        return new JAXBElement<MdmRetVO>(_DeleteListMdByIdsResponseReturn_QNAME, MdmRetVO.class, DeleteListMdByIdsResponse.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string", scope = QueryXmlMdById.class)
    public JAXBElement<String> createQueryXmlMdByIdString(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsString_QNAME, String.class, QueryXmlMdById.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string1", scope = QueryXmlMdById.class)
    public JAXBElement<String> createQueryXmlMdByIdString1(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsString1_QNAME, String.class, QueryXmlMdById.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string2", scope = QueryXmlMdById.class)
    public JAXBElement<String> createQueryXmlMdByIdString2(String value) {
        return new JAXBElement<String>(_QueryXmlMdByIdString2_QNAME, String.class, QueryXmlMdById.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Boolean }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "boolean", scope = QueryXmlMdById.class)
    public JAXBElement<Boolean> createQueryXmlMdByIdBoolean(Boolean value) {
        return new JAXBElement<Boolean>(_QueryXmlMdByIdBoolean_QNAME, Boolean.class, QueryXmlMdById.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link MdmRetVO }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "return", scope = QueryXmlMdByIdResponse.class)
    public JAXBElement<MdmRetVO> createQueryXmlMdByIdResponseReturn(MdmRetVO value) {
        return new JAXBElement<MdmRetVO>(_DeleteListMdByIdsResponseReturn_QNAME, MdmRetVO.class, QueryXmlMdByIdResponse.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string", scope = QueryListMdByType.class)
    public JAXBElement<String> createQueryListMdByTypeString(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsString_QNAME, String.class, QueryListMdByType.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string1", scope = QueryListMdByType.class)
    public JAXBElement<String> createQueryListMdByTypeString1(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsString1_QNAME, String.class, QueryListMdByType.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Boolean }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "boolean", scope = QueryListMdByType.class)
    public JAXBElement<Boolean> createQueryListMdByTypeBoolean(Boolean value) {
        return new JAXBElement<Boolean>(_QueryXmlMdByIdBoolean_QNAME, Boolean.class, QueryListMdByType.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link MdmRetVO }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "return", scope = QueryListMdByTypeResponse.class)
    public JAXBElement<MdmRetVO> createQueryListMdByTypeResponseReturn(MdmRetVO value) {
        return new JAXBElement<MdmRetVO>(_DeleteListMdByIdsResponseReturn_QNAME, MdmRetVO.class, QueryListMdByTypeResponse.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string", scope = QueryMdByCondition.class)
    public JAXBElement<String> createQueryMdByConditionString(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsString_QNAME, String.class, QueryMdByCondition.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string1", scope = QueryMdByCondition.class)
    public JAXBElement<String> createQueryMdByConditionString1(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsString1_QNAME, String.class, QueryMdByCondition.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string2", scope = QueryMdByCondition.class)
    public JAXBElement<String> createQueryMdByConditionString2(String value) {
        return new JAXBElement<String>(_QueryXmlMdByIdString2_QNAME, String.class, QueryMdByCondition.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Boolean }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "boolean", scope = QueryMdByCondition.class)
    public JAXBElement<Boolean> createQueryMdByConditionBoolean(Boolean value) {
        return new JAXBElement<Boolean>(_QueryXmlMdByIdBoolean_QNAME, Boolean.class, QueryMdByCondition.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string4", scope = QueryMdByCondition.class)
    public JAXBElement<String> createQueryMdByConditionString4(String value) {
        return new JAXBElement<String>(_QueryMdByConditionString4_QNAME, String.class, QueryMdByCondition.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link MdmRetVO }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "return", scope = QueryMdByConditionResponse.class)
    public JAXBElement<MdmRetVO> createQueryMdByConditionResponseReturn(MdmRetVO value) {
        return new JAXBElement<MdmRetVO>(_DeleteListMdByIdsResponseReturn_QNAME, MdmRetVO.class, QueryMdByConditionResponse.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string", scope = QueryXmlListMdByType.class)
    public JAXBElement<String> createQueryXmlListMdByTypeString(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsString_QNAME, String.class, QueryXmlListMdByType.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string1", scope = QueryXmlListMdByType.class)
    public JAXBElement<String> createQueryXmlListMdByTypeString1(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsString1_QNAME, String.class, QueryXmlListMdByType.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Boolean }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "boolean", scope = QueryXmlListMdByType.class)
    public JAXBElement<Boolean> createQueryXmlListMdByTypeBoolean(Boolean value) {
        return new JAXBElement<Boolean>(_QueryXmlMdByIdBoolean_QNAME, Boolean.class, QueryXmlListMdByType.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link MdmRetVO }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "return", scope = QueryXmlListMdByTypeResponse.class)
    public JAXBElement<MdmRetVO> createQueryXmlListMdByTypeResponseReturn(MdmRetVO value) {
        return new JAXBElement<MdmRetVO>(_DeleteListMdByIdsResponseReturn_QNAME, MdmRetVO.class, QueryXmlListMdByTypeResponse.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string", scope = QueryListMdByIds.class)
    public JAXBElement<String> createQueryListMdByIdsString(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsString_QNAME, String.class, QueryListMdByIds.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string1", scope = QueryListMdByIds.class)
    public JAXBElement<String> createQueryListMdByIdsString1(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsString1_QNAME, String.class, QueryListMdByIds.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Boolean }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "boolean", scope = QueryListMdByIds.class)
    public JAXBElement<Boolean> createQueryListMdByIdsBoolean(Boolean value) {
        return new JAXBElement<Boolean>(_QueryXmlMdByIdBoolean_QNAME, Boolean.class, QueryListMdByIds.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link MdmRetVO }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "return", scope = QueryListMdByIdsResponse.class)
    public JAXBElement<MdmRetVO> createQueryListMdByIdsResponseReturn(MdmRetVO value) {
        return new JAXBElement<MdmRetVO>(_DeleteListMdByIdsResponseReturn_QNAME, MdmRetVO.class, QueryListMdByIdsResponse.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string", scope = QueryNewMdAfter.class)
    public JAXBElement<String> createQueryNewMdAfterString(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsString_QNAME, String.class, QueryNewMdAfter.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string1", scope = QueryNewMdAfter.class)
    public JAXBElement<String> createQueryNewMdAfterString1(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsString1_QNAME, String.class, QueryNewMdAfter.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string2", scope = QueryNewMdAfter.class)
    public JAXBElement<String> createQueryNewMdAfterString2(String value) {
        return new JAXBElement<String>(_QueryXmlMdByIdString2_QNAME, String.class, QueryNewMdAfter.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Boolean }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "boolean", scope = QueryNewMdAfter.class)
    public JAXBElement<Boolean> createQueryNewMdAfterBoolean(Boolean value) {
        return new JAXBElement<Boolean>(_QueryXmlMdByIdBoolean_QNAME, Boolean.class, QueryNewMdAfter.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link MdmRetVO }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "return", scope = QueryNewMdAfterResponse.class)
    public JAXBElement<MdmRetVO> createQueryNewMdAfterResponseReturn(MdmRetVO value) {
        return new JAXBElement<MdmRetVO>(_DeleteListMdByIdsResponseReturn_QNAME, MdmRetVO.class, QueryNewMdAfterResponse.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string", scope = QueryMdmcodeByGdCode.class)
    public JAXBElement<String> createQueryMdmcodeByGdCodeString(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsString_QNAME, String.class, QueryMdmcodeByGdCode.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string1", scope = QueryMdmcodeByGdCode.class)
    public JAXBElement<String> createQueryMdmcodeByGdCodeString1(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsString1_QNAME, String.class, QueryMdmcodeByGdCode.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string2", scope = QueryMdmcodeByGdCode.class)
    public JAXBElement<String> createQueryMdmcodeByGdCodeString2(String value) {
        return new JAXBElement<String>(_QueryXmlMdByIdString2_QNAME, String.class, QueryMdmcodeByGdCode.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string3", scope = QueryMdmcodeByGdCode.class)
    public JAXBElement<String> createQueryMdmcodeByGdCodeString3(String value) {
        return new JAXBElement<String>(_QueryMdmcodeByGdCodeString3_QNAME, String.class, QueryMdmcodeByGdCode.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link MdmRetVO }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "return", scope = QueryMdmcodeByGdCodeResponse.class)
    public JAXBElement<MdmRetVO> createQueryMdmcodeByGdCodeResponseReturn(MdmRetVO value) {
        return new JAXBElement<MdmRetVO>(_DeleteListMdByIdsResponseReturn_QNAME, MdmRetVO.class, QueryMdmcodeByGdCodeResponse.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string", scope = QueryIdsSingle.class)
    public JAXBElement<String> createQueryIdsSingleString(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsString_QNAME, String.class, QueryIdsSingle.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string1", scope = QueryIdsSingle.class)
    public JAXBElement<String> createQueryIdsSingleString1(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsString1_QNAME, String.class, QueryIdsSingle.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string3", scope = QueryIdsSingle.class)
    public JAXBElement<String> createQueryIdsSingleString3(String value) {
        return new JAXBElement<String>(_QueryMdmcodeByGdCodeString3_QNAME, String.class, QueryIdsSingle.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string", scope = InsertMd.class)
    public JAXBElement<String> createInsertMdString(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsString_QNAME, String.class, InsertMd.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string1", scope = InsertMd.class)
    public JAXBElement<String> createInsertMdString1(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsString1_QNAME, String.class, InsertMd.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string2", scope = InsertMd.class)
    public JAXBElement<String> createInsertMdString2(String value) {
        return new JAXBElement<String>(_QueryXmlMdByIdString2_QNAME, String.class, InsertMd.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link MdmRetVO }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "return", scope = InsertMdResponse.class)
    public JAXBElement<MdmRetVO> createInsertMdResponseReturn(MdmRetVO value) {
        return new JAXBElement<MdmRetVO>(_DeleteListMdByIdsResponseReturn_QNAME, MdmRetVO.class, InsertMdResponse.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string", scope = DeleteMdById.class)
    public JAXBElement<String> createDeleteMdByIdString(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsString_QNAME, String.class, DeleteMdById.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string1", scope = DeleteMdById.class)
    public JAXBElement<String> createDeleteMdByIdString1(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsString1_QNAME, String.class, DeleteMdById.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string2", scope = DeleteMdById.class)
    public JAXBElement<String> createDeleteMdByIdString2(String value) {
        return new JAXBElement<String>(_QueryXmlMdByIdString2_QNAME, String.class, DeleteMdById.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link MdmRetVO }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "return", scope = DeleteMdByIdResponse.class)
    public JAXBElement<MdmRetVO> createDeleteMdByIdResponseReturn(MdmRetVO value) {
        return new JAXBElement<MdmRetVO>(_DeleteListMdByIdsResponseReturn_QNAME, MdmRetVO.class, DeleteMdByIdResponse.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string", scope = UpdateMd.class)
    public JAXBElement<String> createUpdateMdString(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsString_QNAME, String.class, UpdateMd.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string1", scope = UpdateMd.class)
    public JAXBElement<String> createUpdateMdString1(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsString1_QNAME, String.class, UpdateMd.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string2", scope = UpdateMd.class)
    public JAXBElement<String> createUpdateMdString2(String value) {
        return new JAXBElement<String>(_QueryXmlMdByIdString2_QNAME, String.class, UpdateMd.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link MdmRetVO }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "return", scope = UpdateMdResponse.class)
    public JAXBElement<MdmRetVO> createUpdateMdResponseReturn(MdmRetVO value) {
        return new JAXBElement<MdmRetVO>(_DeleteListMdByIdsResponseReturn_QNAME, MdmRetVO.class, UpdateMdResponse.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string", scope = QueryMdById.class)
    public JAXBElement<String> createQueryMdByIdString(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsString_QNAME, String.class, QueryMdById.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string1", scope = QueryMdById.class)
    public JAXBElement<String> createQueryMdByIdString1(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsString1_QNAME, String.class, QueryMdById.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string2", scope = QueryMdById.class)
    public JAXBElement<String> createQueryMdByIdString2(String value) {
        return new JAXBElement<String>(_QueryXmlMdByIdString2_QNAME, String.class, QueryMdById.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Boolean }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "boolean", scope = QueryMdById.class)
    public JAXBElement<Boolean> createQueryMdByIdBoolean(Boolean value) {
        return new JAXBElement<Boolean>(_QueryXmlMdByIdBoolean_QNAME, Boolean.class, QueryMdById.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link MdmRetVO }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "return", scope = QueryMdByIdResponse.class)
    public JAXBElement<MdmRetVO> createQueryMdByIdResponseReturn(MdmRetVO value) {
        return new JAXBElement<MdmRetVO>(_DeleteListMdByIdsResponseReturn_QNAME, MdmRetVO.class, QueryMdByIdResponse.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string", scope = QueryMdByName.class)
    public JAXBElement<String> createQueryMdByNameString(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsString_QNAME, String.class, QueryMdByName.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string1", scope = QueryMdByName.class)
    public JAXBElement<String> createQueryMdByNameString1(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsString1_QNAME, String.class, QueryMdByName.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string2", scope = QueryMdByName.class)
    public JAXBElement<String> createQueryMdByNameString2(String value) {
        return new JAXBElement<String>(_QueryXmlMdByIdString2_QNAME, String.class, QueryMdByName.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Boolean }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "boolean", scope = QueryMdByName.class)
    public JAXBElement<Boolean> createQueryMdByNameBoolean(Boolean value) {
        return new JAXBElement<Boolean>(_QueryXmlMdByIdBoolean_QNAME, Boolean.class, QueryMdByName.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link MdmRetVO }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "return", scope = QueryMdByNameResponse.class)
    public JAXBElement<MdmRetVO> createQueryMdByNameResponseReturn(MdmRetVO value) {
        return new JAXBElement<MdmRetVO>(_DeleteListMdByIdsResponseReturn_QNAME, MdmRetVO.class, QueryMdByNameResponse.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string", scope = QueryMdByCode.class)
    public JAXBElement<String> createQueryMdByCodeString(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsString_QNAME, String.class, QueryMdByCode.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string1", scope = QueryMdByCode.class)
    public JAXBElement<String> createQueryMdByCodeString1(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsString1_QNAME, String.class, QueryMdByCode.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string2", scope = QueryMdByCode.class)
    public JAXBElement<String> createQueryMdByCodeString2(String value) {
        return new JAXBElement<String>(_QueryXmlMdByIdString2_QNAME, String.class, QueryMdByCode.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Boolean }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "boolean", scope = QueryMdByCode.class)
    public JAXBElement<Boolean> createQueryMdByCodeBoolean(Boolean value) {
        return new JAXBElement<Boolean>(_QueryXmlMdByIdBoolean_QNAME, Boolean.class, QueryMdByCode.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link MdmRetVO }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "return", scope = QueryMdByCodeResponse.class)
    public JAXBElement<MdmRetVO> createQueryMdByCodeResponseReturn(MdmRetVO value) {
        return new JAXBElement<MdmRetVO>(_DeleteListMdByIdsResponseReturn_QNAME, MdmRetVO.class, QueryMdByCodeResponse.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string", scope = QueryIdsMulti.class)
    public JAXBElement<String> createQueryIdsMultiString(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsString_QNAME, String.class, QueryIdsMulti.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string2", scope = QueryIdsMulti.class)
    public JAXBElement<String> createQueryIdsMultiString2(String value) {
        return new JAXBElement<String>(_QueryXmlMdByIdString2_QNAME, String.class, QueryIdsMulti.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string", scope = SubscribeMd.class)
    public JAXBElement<String> createSubscribeMdString(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsString_QNAME, String.class, SubscribeMd.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string1", scope = SubscribeMd.class)
    public JAXBElement<String> createSubscribeMdString1(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsString1_QNAME, String.class, SubscribeMd.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Boolean }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "boolean", scope = SubscribeMd.class)
    public JAXBElement<Boolean> createSubscribeMdBoolean(Boolean value) {
        return new JAXBElement<Boolean>(_QueryXmlMdByIdBoolean_QNAME, Boolean.class, SubscribeMd.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "return", scope = SubscribeMdResponse.class)
    public JAXBElement<String> createSubscribeMdResponseReturn(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsResponseReturn_QNAME, String.class, SubscribeMdResponse.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string", scope = ChangeBackgroundTaskStatus.class)
    public JAXBElement<String> createChangeBackgroundTaskStatusString(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsString_QNAME, String.class, ChangeBackgroundTaskStatus.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Boolean }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "boolean", scope = ChangeBackgroundTaskStatus.class)
    public JAXBElement<Boolean> createChangeBackgroundTaskStatusBoolean(Boolean value) {
        return new JAXBElement<Boolean>(_QueryXmlMdByIdBoolean_QNAME, Boolean.class, ChangeBackgroundTaskStatus.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "return", scope = ChangeBackgroundTaskStatusResponse.class)
    public JAXBElement<String> createChangeBackgroundTaskStatusResponseReturn(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsResponseReturn_QNAME, String.class, ChangeBackgroundTaskStatusResponse.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "string", scope = QueryMDMCodeByIdsMulti.class)
    public JAXBElement<String> createQueryMDMCodeByIdsMultiString(String value) {
        return new JAXBElement<String>(_DeleteListMdByIdsString_QNAME, String.class, QueryMDMCodeByIdsMulti.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "key", scope = QueryIdsSingleResponse.Return.class)
    public JAXBElement<String> createQueryIdsSingleResponseReturnKey(String value) {
        return new JAXBElement<String>(_QueryIdsSingleResponseReturnKey_QNAME, String.class, QueryIdsSingleResponse.Return.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IMdSharingCenterService", name = "value", scope = QueryIdsSingleResponse.Return.class)
    public JAXBElement<String> createQueryIdsSingleResponseReturnValue(String value) {
        return new JAXBElement<String>(_QueryIdsSingleResponseReturnValue_QNAME, String.class, QueryIdsSingleResponse.Return.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/MdmRetVO", name = "message", scope = MdmRetVO.class)
    public JAXBElement<String> createMdmRetVOMessage(String value) {
        return new JAXBElement<String>(_MdmRetVOMessage_QNAME, String.class, MdmRetVO.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/MdmRetVO", name = "data", scope = MdmRetVO.class)
    public JAXBElement<String> createMdmRetVOData(String value) {
        return new JAXBElement<String>(_MdmRetVOData_QNAME, String.class, MdmRetVO.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link Boolean }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/MdmRetVO", name = "success", scope = MdmRetVO.class)
    public JAXBElement<Boolean> createMdmRetVOSuccess(Boolean value) {
        return new JAXBElement<Boolean>(_MdmRetVOSuccess_QNAME, Boolean.class, MdmRetVO.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IDMapping", name = "gdCode", scope = IDMapping.class)
    public JAXBElement<String> createIDMappingGdCode(String value) {
        return new JAXBElement<String>(_IDMappingGdCode_QNAME, String.class, IDMapping.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IDMapping", name = "key", scope = IDMapping.IdMapping.class)
    public JAXBElement<String> createIDMappingIdMappingKey(String value) {
        return new JAXBElement<String>(_IDMappingIdMappingKey_QNAME, String.class, IDMapping.IdMapping.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/IDMapping", name = "value", scope = IDMapping.IdMapping.class)
    public JAXBElement<String> createIDMappingIdMappingValue(String value) {
        return new JAXBElement<String>(_IDMappingIdMappingValue_QNAME, String.class, IDMapping.IdMapping.class, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link String }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://sharing.mdm07.itf.yonyou.com/SourceIDBean", name = "gdCode", scope = SourceIDBean.class)
    public JAXBElement<String> createSourceIDBeanGdCode(String value) {
        return new JAXBElement<String>(_SourceIDBeanGdCode_QNAME, String.class, SourceIDBean.class, value);
    }

}
