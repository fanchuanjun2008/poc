package com.yonyou.iuap.bpm.service;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * 组合controller返回结果并支持json输出
 *
 * @author liuhanc
 */
@Service
public class JsonResultService {
    private Logger log = LoggerFactory.getLogger(getClass());

    private ObjectMapper mapper = new ObjectMapper();

    public JsonResultService() {
        mapper.setVisibility(PropertyAccessor.FIELD, JsonAutoDetect.Visibility.ANY);
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
    }

    public String toJson(Object obj) {
        try {
            String json = mapper.writeValueAsString(obj);
            return json;
        } catch (JsonProcessingException e) {
            log.error("序列化对象为json时异常", e);
            return e.getMessage();
        }
    }

    public <T> T toObject(String json, Class<T> cls) {
        try {
            //log.debug("反序列化对象.json=[" + json + "],cls=" + cls.getName());
            return mapper.readValue(json, cls);
        } catch (Exception e) {
            log.error("反序列化对象失败.json=[" + json + "],cls=" + cls.getName(), e);
            return null;
        }
    }

    public ArrayNode createArrayNode() {
        return mapper.createArrayNode();
    }

    public ObjectNode createObjectNode() {
        return mapper.createObjectNode();
    }

    public Map<String, Object> buildMap(boolean success, String msg, Object data) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("success", success);
        map.put("msg", msg);
        map.put("data", data);
        return map;
    }

    public Map<String, Object> successMap(String msg, Object data) {
        return buildMap(true, msg, data);
    }

    public Map<String, Object> failMap(String msg, Object data) {
        return buildMap(false, msg == null ? "用户可能过期" : msg, data);//NullPointerException
    }

    public String successMapJson(String msg, Object data) {
        return toJson(successMap(msg, data));
    }

    public String failMapJson(String msg, Object data) {
        return toJson(failMap(msg, data));
    }
}

