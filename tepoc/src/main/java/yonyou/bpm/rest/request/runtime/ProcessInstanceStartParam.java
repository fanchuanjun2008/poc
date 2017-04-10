
package yonyou.bpm.rest.request.runtime;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import yonyou.bpm.rest.request.AssignInfo;
import yonyou.bpm.rest.request.RestVariable;

public class ProcessInstanceStartParam implements Serializable{

	private static final long serialVersionUID = 1L;
	
	/**
	 * 单据主键
	 */
	private String businessKey;
	/**
	 * 租户id
	 */
	private String tenantId;
	/**
	 *流程定义id
	 */
	private String processDefinitionId;
	/**
	 * 流程定义key
	 */
	private String processDefinitionKey;
	/**
	 *流程实例名称
	 */
	protected String processInstanceName;
	/**
	 * 表单关键特性字段显示值
	 */
	//private String keyFeature;
	/**
	 * 消息名称
	 */
	private String message;	
	/**
	 * 是否执行下一步
	 */
	private Boolean isNext;
	/**
	 * 负责人
	 */
	private String assignee;
	/**
	 * 变量
	 */
	private List<RestVariable> Variables;
	
	private AssignInfo assignInfo;
	private String superProcessInstancId;
	
	private Boolean returnProcessInstance;
	
	private Boolean returnVariables;
	
	private Boolean returnHistoricTasks;
	private Boolean returnHistoricTaskParticipants;
	private Boolean returnTasks;
	private Boolean returnTaskParticipants;

	public String getBusinessKey() {
		return businessKey;
	}

	public void setBusinessKey(String businessKey) {
		this.businessKey = businessKey;
	}
	/**
	 * @deprecated
	 * @return
	 */
	public String getTenantId() {
		return tenantId;
	}
	/**
	 * @deprecated
	 * @param tenantId
	 */
	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	public List<RestVariable> getVariables() {
		return Variables;
	}

	public void setVariables(List<RestVariable> variables) {
		Variables = variables;
	}
	public void addVariable(String name,Object value){
		addVariable(name, value, null, null);
	}

	public void addVariable(String name,Object value,String scope,String type){
		if(Variables==null){
			Variables=new ArrayList<RestVariable>();
		}
		RestVariable restVariable=new RestVariable();
		restVariable.setName(name);
		restVariable.setValue(value);
		restVariable.setScope(scope);
		restVariable.setType(type);
		Variables.add(restVariable);
	}

	public String getProcessDefinitionId() {
		return processDefinitionId;
	}

	public void setProcessDefinitionId(String processDefinitionId) {
		this.processDefinitionId = processDefinitionId;
	}

	public String getProcessDefinitionKey() {
		return processDefinitionKey;
	}

	public void setProcessDefinitionKey(String processDefinitionKey) {
		this.processDefinitionKey = processDefinitionKey;
	}
	
	public String getProcessInstanceName() {
		return processInstanceName;
	}

	public void setProcessInstanceName(String processInstanceName) {
		this.processInstanceName = processInstanceName;
	}

//	public String getKeyFeature() {
//		return keyFeature;
//	}
//
//	public void setKeyFeature(String keyFeature) {
//		this.keyFeature = keyFeature;
//	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Boolean getIsNext() {
		return isNext;
	}

	public void setIsNext(Boolean isNext) {
		this.isNext = isNext;
	}

	public String getAssignee() {
		return assignee;
	}

	public void setAssignee(String assignee) {
		this.assignee = assignee;
	}

	public AssignInfo getAssignInfo() {
		return assignInfo;
	}

	public void setAssignInfo(AssignInfo assignInfo) {
		this.assignInfo = assignInfo;
	}

	public Boolean getReturnVariables() {
		return returnVariables;
	}

	public void setReturnVariables(Boolean returnVariables) {
		this.returnVariables = returnVariables;
	}

	public Boolean getReturnHistoricTasks() {
		return returnHistoricTasks;
	}

	public void setReturnHistoricTasks(Boolean returnHistoricTasks) {
		this.returnHistoricTasks = returnHistoricTasks;
	}

	public Boolean getReturnHistoricTaskParticipants() {
		return returnHistoricTaskParticipants;
	}

	public void setReturnHistoricTaskParticipants(
			Boolean returnHistoricTaskParticipants) {
		this.returnHistoricTaskParticipants = returnHistoricTaskParticipants;
		if(returnHistoricTaskParticipants){
			setReturnHistoricTasks(true);
		}
		
	}

	public Boolean getReturnTasks() {
		return returnTasks;
	}

	public void setReturnTasks(Boolean returnTasks) {
		this.returnTasks = returnTasks;
	}

	public Boolean getReturnTaskParticipants() {
		return returnTaskParticipants;
	}

	public void setReturnTaskParticipants(Boolean returnTaskParticipants) {
		this.returnTaskParticipants = returnTaskParticipants;
		if(returnTaskParticipants){
			returnTasks=true;
		}
	}

	public Boolean getReturnProcessInstance() {
		return returnProcessInstance;
	}

	public void setReturnProcessInstance(Boolean returnProcessInstance) {
		this.returnProcessInstance = returnProcessInstance;
	}

	public String getSuperProcessInstancId() {
		return superProcessInstancId;
	}

	public void setSuperProcessInstancId(String superProcessInstancId) {
		this.superProcessInstancId = superProcessInstancId;
	}

}
