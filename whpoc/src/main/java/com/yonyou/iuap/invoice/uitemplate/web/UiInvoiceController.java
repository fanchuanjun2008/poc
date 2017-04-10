package com.yonyou.iuap.invoice.uitemplate.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.yonyou.iuap.example.web.BaseController;
import com.yonyou.iuap.invoice.entity.InvoiceVO;
import com.yonyou.iuap.invoice.service.InvoiceService;
import com.yonyou.iuap.invoice.uitemplate.rs.JsonResponse;
import com.yonyou.iuap.invoice.web.InvoiceController;
import com.yonyou.iuap.mvc.annotation.FrontModelExchange;
import com.yonyou.iuap.mvc.type.SearchParams;

import iuap.uitemplate.translate.ITranslateDataService;

/**
 *
 * @author zhh
 * @date 2017年3月27日 下午2:08:51
 * @JDK jdk1.7
 */
@Controller
@RequestMapping(value = "/ui_invoice")
public class UiInvoiceController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(InvoiceController.class);

	@Autowired
	private InvoiceService service;

	@Autowired
	@Qualifier("TranslateDataServiceImpl")
	private ITranslateDataService translateDataService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public @ResponseBody Object list(PageRequest pageRequest,
			@FrontModelExchange(modelType = InvoiceVO.class) SearchParams searchParams) {
		JsonResponse results = new JsonResponse();
		try {
			Page<InvoiceVO> page = service.selectAllByPage(searchParams.getSearchMap(), pageRequest);
			results.success("data", page);
			return JSONObject.toJSONString(results);
		} catch (Exception e) {
			logger.error("列表加载异常：", e);
			results.failed("列表加载异常！");
			return JSONObject.toJSONString(results);
		}
	}

	@RequestMapping(value = "/render", method = RequestMethod.GET)
	public @ResponseBody Object render(@RequestParam(value = "templateInfo") String templateInfo,
			HttpServletRequest request) {
		JsonResponse results = new JsonResponse();
		try {
			String id = request.getParameter("id");
			InvoiceVO vo = new InvoiceVO();
			if (StringUtils.isNotEmpty(id)) {
				vo = service.getByTsid(id);
			}

			return translateDataService.translateEntityToJSONByTemplate(templateInfo, vo).toString();
		} catch (Exception e) {
			logger.error("初始化模板异常：", e);
			results.failed("初始化模板异常！");
			return JSONObject.toJSONString(results);
		}

	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public @ResponseBody Object add(@RequestParam(value = "templateInfo") String templateInfo,
			@RequestParam(value = "headData") String headData) {
		JsonResponse results = new JsonResponse();
		try {
			InvoiceVO[] vos = (InvoiceVO[]) translateDataService.translateJsonToValueObjects(headData, templateInfo);
			if (vos.length > 0) {
				InvoiceVO invoiceVO = vos[0];
				this.service.save(invoiceVO);
			}
		} catch (Exception e) {
			logger.error("新增异常：", e);
			results.failed("新增异常！");
			return JSONObject.toJSONString(results);
		}

		return JSONObject.toJSONString("保存成功！");
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public @ResponseBody Object update(@RequestParam(value = "templateInfo") String templateInfo,
			@RequestParam(value = "headData") String headData) {
		JsonResponse results = new JsonResponse();
		try {
			InvoiceVO[] vos = (InvoiceVO[]) translateDataService.translateJsonToValueObjects(headData, templateInfo);
			if (vos.length > 0) {
				InvoiceVO invoiceVO = vos[0];
				this.service.save(invoiceVO);
			}
		} catch (Exception e) {
			logger.error("更新异常：", e);
			results.failed("更新异常！");
			return JSONObject.toJSONString(results);
		}
		return JSONObject.toJSONString("更新成功！");
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public @ResponseBody Object delete(@RequestParam(value = "id") String id) {
		try {
			InvoiceVO vo = service.getByTsid(id);
			if (vo != null) {
				List<InvoiceVO> list = new ArrayList<InvoiceVO>();
				list.add(vo);
				service.batchDeleteEntity(list);
			}
		} catch (Exception e) {
			logger.error("删除异常：", e);
			return super.buildGlobalError("删除异常！");
		}
		return super.buildSuccess(true);
	}

	@RequestMapping(value = "/delBatch", method = RequestMethod.POST)
	public @ResponseBody Object deleteBatch(@RequestBody List<InvoiceVO> objs, HttpServletRequest request)
			throws Exception {
		logger.debug("execute del operate.");
		service.batchDeleteEntity(objs);
		return super.buildSuccess(objs);
	}
}
