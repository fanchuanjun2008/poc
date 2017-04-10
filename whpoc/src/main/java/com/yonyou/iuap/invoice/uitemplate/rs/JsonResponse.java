package com.yonyou.iuap.invoice.uitemplate.rs;

import java.util.LinkedHashMap;

import com.alibaba.fastjson.JSON;

/**
 * @date 2016骞�鏈�6鏃�
 *
 * @author zhangqiang6
 *
 * @Description: TODO
 *
 **/

public class JsonResponse extends LinkedHashMap<String, Object> {

	private static final long serialVersionUID = -3957696416833580484L;

	public static final int SUCCESS = 1;

	public static final int FAILED = 0;

	public static final int NOTFINISHED = 2;

	public static final String STATUS = "status";

	public static final String MESSAGE = "msg";

	public static final String DATA = "data";

	public JsonResponse() {
		super();
	}

	public JsonResponse(int flag, String msg) {
		super();
		put(STATUS, flag);
		put(MESSAGE, msg);
	}

	public void failed() {
		this.put(STATUS, FAILED);
	}

	public void failed(String msg) {
		put(STATUS, FAILED);
		put(MESSAGE, msg);
	}

	public void success() {
		put(STATUS, SUCCESS);
	}

	public void success(String msg) {
		put(STATUS, SUCCESS);
		put(MESSAGE, msg);
	}

	public void success(String key, Object value) {
		this.put(STATUS, SUCCESS);
		this.put(key, value);
	}

	public void success(String msg, String key, Object value) {
		this.put(STATUS, SUCCESS);
		this.put(MESSAGE, msg);
		this.put(key, value);
	}

	public void setStatus(int status) {
		put(STATUS, status);
	}

	public void setMessage(String msg) {
		put(MESSAGE, msg);
	}

	public boolean isfailed() {
		return get(STATUS) != null && (Integer) get(STATUS) == FAILED;
	}

	@Override
	public String toString() {
		return JSON.toJSONString(this);
	}

}
