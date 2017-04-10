package com.yonyou.iuap.invoice.uitemplate.ref;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import iuap.ref.sdk.refmodel.model.AbstractGridRefModel;
import iuap.ref.sdk.refmodel.vo.RefViewModelVO;
import iuap.ref.test.RefGridRESTController;

/**
 *
 * @author zhh
 * @date 2017年3月27日 下午9:18:30
 * @JDK jdk1.7
 */
@Controller
@RequestMapping(value = "/ref_company")
public class CompanyRefController extends AbstractGridRefModel {

	@Override
	public List<Map<String, String>> filterRefJSON(RefViewModelVO paramRefViewModelVO) {
		return null;
	}

	@Override
	public List<Map<String, String>> matchPKRefJSON(RefViewModelVO paramRefViewModelVO) {
		return null;
	}

	@Override
	public List<Map<String, String>> matchBlurRefJSON(RefViewModelVO paramRefViewModelVO) {
		return null;
	}

	@Override
	public Map<String, Object> getCommonRefData(RefViewModelVO paramRefViewModelVO) {
		return null;
	}

}
