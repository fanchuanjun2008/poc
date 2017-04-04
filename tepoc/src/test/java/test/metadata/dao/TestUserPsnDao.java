package test.metadata.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.junit.experimental.categories.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ContextConfiguration;
import org.springside.modules.test.category.UnStable;
import org.springside.modules.test.spring.SpringContextTestCase;

import com.yonyou.iuap.context.ContextHolder;
import com.yonyou.iuap.context.InvocationInfoProxy;
import com.yonyou.iuap.persistence.bs.dao.DAOException;
import com.yonyou.iuap.tepoc.entity.UserDeptVO;
import com.yonyou.iuap.tepoc.entity.UserPsnVO;
import com.yonyou.iuap.tepoc.entity.UserRoleVO;
import com.yonyou.iuap.tepoc.service.UserPsnService;

@Category(UnStable.class)
@DirtiesContext
@ContextConfiguration(locations = { "classpath:applicationContext.xml",
		"classpath:applicationContext-cache.xml",
		"classpath:applicationContext-persistence.xml",
		"classpath:applicationContext-metadata.xml" })
public class TestUserPsnDao extends SpringContextTestCase {

	private static final String TENANTID_LOCAL_PG = "ec";

	public static String CURRENT_TENANTID = TENANTID_LOCAL_PG;

	public static ApplicationContext context;

	@Autowired
	private UserPsnService userPsnService;

	@Before
	public void setUp() throws Exception {

		InvocationInfoProxy.setTenantid(CURRENT_TENANTID);

		context = new ClassPathXmlApplicationContext(new String[] {
				"classpath:applicationContext.xml",
				"classpath:applicationContext-cache.xml",
				"classpath:applicationContext-persistence.xml",
				"classpath:applicationContext-metadata.xml" });
		ContextHolder.setContext(context);

	}

	public UserPsnService getUserPsnService() {
		return userPsnService;
	}

	public void setUserPsnService(UserPsnService userPsnService) {
		this.userPsnService = userPsnService;
	}

	@Test
	public void testfindUserByUserMobile() throws DAOException {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		PageRequest pageRequest = new PageRequest(1,10);
		Page<UserPsnVO> result = userPsnService.selectAllByPage(searchParams, pageRequest);
		List<UserPsnVO> listuser = result.getContent();
	}
	
	@Test
	public void testSaveUser() throws DAOException {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		PageRequest pageRequest = new PageRequest(1,10);
		UserPsnVO entity = new UserPsnVO();
		entity.setUsername("测试用户");
		entity.setSex("0");
		entity.setIdcard("xxxxxxxxxxxxxxxxxxxxx");
		entity.setEdution("大学");
		entity.setEmail("fanchuanjun2008@163.com");
		List<UserDeptVO> id_userdept = new ArrayList<UserDeptVO>();
		for(int i = 0; i<5; i++){
			UserDeptVO usrrole = new UserDeptVO();
			usrrole.setDeptname("test"+i);
			usrrole.setDeptcode("dept"+i);
			id_userdept.add(usrrole);
		}
		entity.setId_userdept(id_userdept);
		List<UserRoleVO> id_userrole = new ArrayList<UserRoleVO>();
		for(int i = 0; i<5; i++){
			UserRoleVO usrrole = new UserRoleVO();
			usrrole.setRolecode("role"+i);
			usrrole.setRolename("test"+i);
			usrrole.setRoletype("测试");
			id_userrole.add(usrrole);
		}
		entity.setId_userrole(id_userrole);
		UserPsnVO result = userPsnService.merge(entity);
		result.getPk_user();
	}

}
