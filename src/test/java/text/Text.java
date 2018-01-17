package text;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.edu.tit.role.Iservice.IRoleService;
import cn.edu.tit.role.bean.Role;
import cn.edu.tit.user.Iservice.IUserService;
import cn.edu.tit.user.bean.Teacher;

@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类  
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"}) 
public class Text {
	private static Logger logger = Logger.getLogger(Text.class);  
//  private ApplicationContext ac = null;  
    @Resource  
    private IRoleService roleService ;  
    @Resource  
    private IUserService userService ; 
    
  
//  @Before  
//  public void before() {  
//      ac = new ClassPathXmlApplicationContext("applicationContext.xml");  
//      userService = (IUserService) ac.getBean("userService");  
//  }  
  
    
    public void test1() {  
        Role role = roleService.schRoleInfo("1212");
        // System.out.println(user.getUserName());  
        // logger.info("值："+user.getUserName());  
        logger.info(role.getRole_id());  
        logger.info(role.getTeacherList());  
        for(Teacher t : role.getTeacherList()){
        	logger.info(t.getStaff_id());  
        }
    }  
    
    public void addRoletest(){
    	Role role = new Role();
    	role.setCreate_user("152056138");
    	role.setParent_role_id("C");
    	role.setRole_name("hello");
    	List<Integer> p =  new ArrayList<>();
    	p.add(1);
//    	p.add(2);
//    	p.add(3);
    	role.setPrivilegeIdList(p);
    	//roleService.addRole(role);
    }
    
    public void addRolePrivilegeText(){
    	List<Integer> privilegeIdList =  new ArrayList<>();
    	privilegeIdList.add(1);
//    	p.add(2);
    	//roleService.addRolePrivilege("Ac", "A", privilegeIdList);
    }
    
    public void getchildRid(){
    	List<Integer> privilegeIdList =  new ArrayList<>();
    	privilegeIdList.add(1);
    	//roleService.delRolePrivilege("AB", privilegeIdList);
    		
    	
    }
    
    public void editroleP(){
    	String updateUser = "152056138";
    	String RoleId = "C";
    	String rolename = "helloW";
    	List<Integer> oldP = new ArrayList<>();
    	oldP.add(1);
    	oldP.add(2);
    	oldP.add(3);
    	List<Integer> newP = new ArrayList<>();
    	newP.add(2);
    	newP.add(3);
    	newP.add(4);
    	roleService.editRole(RoleId, rolename, updateUser, oldP, newP);
    }
    @Test
    public void deluserofRole(){
    	List<String> users = new ArrayList<>();
    	users.add("152056138");
    	roleService.delUsersOfRole("AB", users);
    }
    
    @Test
	public void TOsearole() {
		String role_id = "A";
		String role_name = "";
		//List<Role> roleList = new ArrayList<Role>();
		List<Role>roleList = roleService.findRoleByCondition(role_id,role_name);
		for (Role role : roleList) {
			System.out.println(role);
		}
	}
    @Test
	public void searole() {
		String role_id = "A";
		String staff_id = "011002";
		//List<Role> roleList = new ArrayList<Role>();
		List<Teacher> list = userService.findUserByCondition(staff_id, role_id);
		for (Teacher teacher : list) {
			System.out.println(teacher);
		}
	}
    
}
