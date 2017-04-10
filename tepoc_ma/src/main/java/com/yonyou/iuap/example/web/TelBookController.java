package com.yonyou.iuap.example.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.yonyou.iuap.context.InvocationInfoProxy;
import com.yonyou.iuap.example.entity.meta.EnumVo;
import com.yonyou.iuap.example.entity.meta.Sex;
import com.yonyou.iuap.example.entity.meta.Telbook;
import com.yonyou.iuap.example.service.TelBookService;
import com.yonyou.iuap.example.utils.EnumUtils;
import com.yonyou.iuap.example.validator.TelBookValidator;
import com.yonyou.iuap.mvc.type.SearchParams;
import com.yonyou.iuap.system.service.CommonService;

@Controller
@RequestMapping(value = "/telbook")
public class TelBookController extends BaseController {
    private static Logger logger = LoggerFactory.getLogger(TelBookController.class);

    @Autowired
    private TelBookService telbookservice;

    @Autowired
    private TelBookValidator validtor;
    @Autowired
    private CommonService commonService;

    /**
     *
     * @param pageRequest
     * @param searchParams
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public @ResponseBody Object page(PageRequest pageRequest, SearchParams searchParams) {
    	Map sysUserparams = new HashMap();
    	sysUserparams.put("requestopr", "get");
    	sysUserparams.put("requesturl", "/telbook/list");
    	sysUserparams.put("responseType", "java.lang.Object");
		String sessionObj = InvocationInfoProxy.getToken();
		sysUserparams.put("sessionObj", sessionObj);
		Object telbookresult = commonService.service(sysUserparams);
		JSONObject json = new JSONObject();
		JSONObject resultjson = (JSONObject) json.toJSON(telbookresult);
		String status = (String) resultjson.get("status");
		if(status == "success"){
			JSONObject data = (JSONObject) resultjson.get("data");
			return data;
		}else{
			String data = (String) resultjson.get("data");
			return data;
		}
//        Page<Telbook> tmpdata = telbookservice.selectAllByPage(pageRequest, searchParams);
//        Page<Telbook> data = telbookservice.selectInstit(tmpdata);
//        return buildSuccess(data);
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public @ResponseBody Object save(@RequestBody List<Telbook> list) {
        validtor.valid(list);
        telbookservice.save(list);
        return buildSuccess();
    }

    @RequestMapping(value = "/del", method = RequestMethod.POST)
    public @ResponseBody Object del(@RequestBody List<Telbook> list) {
        telbookservice.batchDeleteByPrimaryKey(list);
        return buildSuccess();
    }

    /** 查询枚举值 */
    @RequestMapping(value = "/loadEnum", method = RequestMethod.GET)
    @ResponseBody
    public Object loadEnum() throws Exception {
        Map<String, List<EnumVo>> map = EnumUtils.loadEnum(Sex.class);
        return super.buildMapSuccess(map);
    }

}
