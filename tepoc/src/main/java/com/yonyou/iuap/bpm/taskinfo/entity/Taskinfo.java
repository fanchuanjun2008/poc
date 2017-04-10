package com.yonyou.iuap.bpm.taskinfo.entity;

import java.io.Serializable;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

import yonyou.bpm.rest.response.runtime.task.TaskResponse;
	


/**
 * <b> 此处简要描述此类功能 </b>
 * <p>
 *   此处添加类的描述信息
 * </p>
 * @author 
 * @version 
 */

@JsonIgnoreProperties(ignoreUnknown = true)
public class Taskinfo extends TaskResponse implements Serializable{

}