package cn.edu.tit.course.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import cn.edu.tit.course.Iservice.ICourseService;
import cn.edu.tit.course.bean.Accessory;
import cn.edu.tit.course.bean.Course;
import cn.edu.tit.course.bean.Depart;
import cn.edu.tit.course.bean.Task;
import cn.edu.tit.pager.PagerBean;
import cn.edu.tit.user.Iservice.IUserService;
import cn.edu.tit.user.bean.User;
import cn.edu.tit.util.FileUtil;
import cn.itcast.commons.CommonUtils;

@Controller
@RequestMapping("/course")
public class CourseController {
	@Autowired
	private ICourseService courseService;
	@Autowired
	private IUserService userService;
	@Autowired
	private FileUtil fileUtil;
	
	/**
	 * 获取到当前页页码
	 */
	private int getPc(int rpc){
		int pc = 1;
		int param = rpc;
		
		if(rpc != 0){
			 pc = rpc;
			
		}
		return pc;
	}
	
	private String getUrl(HttpServletRequest req){
		String url = req.getRequestURI();
		int index = url.lastIndexOf("/");
		url = url.substring(0, index);
		return url;
	}
	
	/**
	 * 分页查找课程
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/findCouByPage/{course_label}/{page}")
	public String findCouByPage(HttpServletRequest request ,@PathVariable String course_label,@PathVariable int page){
		//获取当前页码
		int pc = getPc(page);
		//获取课程相应pagebean
		PagerBean<Course> pcourse = courseService.getCPage(pc, course_label);
		pcourse.setUrl(getUrl(request));
		List<String> usernames = new ArrayList<>();
		for(Course c:pcourse.getBeanList()){
			usernames.add(userService.findUserById(c.getCreate_user()).getUser_name());
		}
		request.setAttribute("courseList", pcourse.getBeanList());
		request.setAttribute("usernames", usernames);
		request.setAttribute("pb", pcourse);
		return "jsp/dep_course";
	}
	

	/**
	 * 添加课程
	 * 
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value = "/addCourse")
	public String addCourse(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		// 获取课程相关信息
		 User user = (User)request.getSession().getAttribute("user");
//		String create_user = "1520561";
		String publisher = "xx";
		String course_id = user.getUser_id() + "_" + System.currentTimeMillis(); // 课程id
		String college = request.getParameter("school");// 学校
		String course_name = request.getParameter("course_name"); // 课程名
		// String course_name = "comp";
		int course_lable = 2; // 类型
		int course_flag = 1; // 状态
		String course_notes = request.getParameter("course_notes"); // 简介
		String application_pro = request.getParameter("application_pro"); // 适合专业
		// 测试数据
		// String course_notes = "xx";
		// String application_pro = "yy";
		String invitation_code = UUID.randomUUID().toString().replace("-", "").toUpperCase().substring(0,6); // 邀请码
		byte[] course_img = request.getParameter("course_img").getBytes(); // 图片
		// 封装课程对象
		Course course = new Course(course_id, course_name, course_lable, course_img, course_notes, college,
				application_pro, course_flag, invitation_code, user.getUser_id(),user.getUser_name());
		// 存储课程信息
		courseService.createCourse(course);
		return tomain(request);
	}

	@RequestMapping(value="/tomain")
	public String tomain(HttpServletRequest request){
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		List<Course> courses = courseService.findCByuserid(user.getUser_id());
		List<Course> mycourses = new ArrayList<>();
		if(courses.size()>4){
			for(int i =0;i<4;i++){
				mycourses.add(courses.get(i));
			}
		}else{mycourses = courses;}
		courses = courseService.getjoinCourse(user.getUser_id());
		List<Course> joincourses = new ArrayList<>();
		if(courses.size()>4){
			for(int i =0;i<4;i++){
				joincourses.add(courses.get(i));
			}
		}else{joincourses=courses;}
		request.setAttribute("mycourses", mycourses);
		request.setAttribute("joincourses", joincourses);
		request.setAttribute("username", user.getUser_name());
		return "jsp/main";
	}
	
	/**
	 * 加入课程
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/joinCourse")
	public String joinCourse(HttpServletRequest request) {
		// 获取加入者id和邀请码
		User user = (User) request.getSession().getAttribute("user");
		String invitation_code = request.getParameter("invitation_code");
		// 调用业务逻辑
		courseService.joinCourse(invitation_code, user.getUser_id());
		return tomain(request);
	}

	/**
	 * 发布任务
	 * 
	 * @param request
	 */
	@RequestMapping(value = "/publishTask")
	public String publishTask(HttpServletRequest request, HttpServletResponse response) {
		
		 User user = (User)
		 request.getSession().getAttribute("user");
//		String username = "1520561";

		try {
			String path = "D:\\accessory\\";
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setSizeMax(4194304); // 设置最大文件尺寸，这里是4MB
			List<Accessory> accList = new ArrayList<>();
			List<FileItem> items = upload.parseRequest(request);// 得到所有的文件
			Map<String, Object> formdata = new HashMap<String, Object>();
			String name = "";
			for (FileItem fi : items) {
				Accessory acc = new Accessory();
				if (!fi.isFormField()) {
					String fileName = fi.getName();
					if (fileName != null) {
						File fullFile = new File(new String(fi.getName().getBytes(), "utf-8")); // 解决文件名乱码问题
						File savedFile = new File(path, fullFile.getName());
						fi.write(savedFile);
						if (!fullFile.getName().equals(name)) {
							acc.setAccessory_name(fullFile.getName());
							acc.setAccessory_id(user.getUser_name() + System.currentTimeMillis());
							acc.setAccessory_kind(1);
							acc.setAccessory_path(path + acc.getAccessory_name());
							acc.setCreate_user(user.getUser_name());
							accList.add(acc);
							name = fullFile.getName();
						}

					}
				} else {
					formdata.put(fi.getFieldName(), fi.getString("UTF-8"));
				}
			}
			Task task = CommonUtils.toBean(formdata, Task.class);
			String task_id = task.getCourse_id() + System.currentTimeMillis();
			for(Accessory a:accList){
				a.setTask_id(task_id);
			}
			task.setTask_id(task_id);
			task.setStatus(1);
			task.setPubAccs(accList);
			task.setEvaluate_kind("教师评价");
			task.setEvaluate_id("1520561");
			task.setCreate_user(user.getUser_id());
			// 调用service方法
			courseService.addTask(task);
			List<Task> taskList = new ArrayList<>();
			taskList = courseService.getTaskBycid(task.getCourse_id());
			request.setAttribute("course_id", task.getCourse_id());
			request.setAttribute("taskList", taskList);
			return "jsp/intoCourse";
		} catch (Exception e) {
			e.getMessage();
			return null;
		}
		
	}

	/**
	 * 提交任务
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/uploadTask")
	public String uploadTask(HttpServletRequest request) {
		// 获取参数
		 User uploader = (User)
		 request.getSession().getAttribute("user");
		try {
			String path = "D:\\accessory\\";
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setSizeMax(4194304); // 设置最大文件尺寸，这里是4MB
			List<Accessory> accList = new ArrayList<>();
			List<FileItem> items = upload.parseRequest(request);// 得到所有的文件
			Map<String, Object> formdata = new HashMap<String, Object>();
			String name = "";
			for (FileItem fi : items) {
				Accessory acc = new Accessory();
				if (!fi.isFormField()) {
					String fileName = fi.getName();
					if (fileName != null) {
						File fullFile = new File(new String(fi.getName().getBytes(), "utf-8")); // 解决文件名乱码问题
						File savedFile = new File(path, fullFile.getName());
						fi.write(savedFile);
						if (!fullFile.getName().equals(name)) {
							acc.setAccessory_name(fullFile.getName());
							acc.setAccessory_id(uploader.getUser_id() + System.currentTimeMillis());
							acc.setAccessory_kind(2);
							acc.setAccessory_path(path + acc.getAccessory_name());
							acc.setCreate_user(uploader.getUser_id());
							accList.add(acc);
							name = fullFile.getName();
						}
					}
				} else {
					formdata.put(fi.getFieldName(), fi.getString("UTF-8"));
				}
			}
			Task task = CommonUtils.toBean(formdata, Task.class);
			task.setTask_id(task.getTask_id());
			for(Accessory a:accList){
				a.setTask_id(task.getTask_id());
			}
			task.setUploader(uploader.getUser_id());
			task.setPubAccs(accList);
			task.setCreate_user(uploader.getUser_id());
			// 调用service方法
			courseService.uploadTask(task);
			List<Task> taskList = new ArrayList<>();
			taskList = courseService.getTaskBycid(task.getCourse_id());
			request.setAttribute("course_id", task.getCourse_id());
			request.setAttribute("taskList", taskList);
			return "jsp/intoCourse2";
		} catch (Exception e) {
			e.getMessage();
			return null;
		}
		
	}

	@RequestMapping(value = "/showTask/{task_id}")
	public String showTask(HttpServletRequest request,@PathVariable String task_id) {
		Task task = courseService.secTaskByid(task_id);
		// 根据id查询所有附件
		List<Accessory> accList = new ArrayList<>();
		accList = courseService.getAccs(task_id, 1);
		task.setPubAccs(accList);
		request.setAttribute("task", task);
		return "jsp/uploadTask";
	}

	/**
	 * 跳转到提交列表页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/toStudentUpList/{task_id}")
	public String toStudentUpList(HttpServletRequest request, @PathVariable String task_id) {

		// 根据taskid查询提交任务
		List<Task> upload = new ArrayList<>();
		List<User> uploader = new ArrayList<>();
		upload = courseService.getUploadByid(task_id);
		Task task = courseService.secTaskByid(task_id);
		// 根据id查询所有附件
		List<Accessory> accList = new ArrayList<>();
		accList = courseService.getAccs(task_id, 1);
		task.setPubAccs(accList);
		request.setAttribute("task", task);

		for (Task up : upload) {
			User user = userService.findUserById(up.getUploader());
			uploader.add(user);
		}
		request.setAttribute("uploader", uploader);
		return "jsp/studentUpList";
	}

	/**
	 * 跳转到提交任务详细页面
	 * 
	 * @param request
	 * @param task_id
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/toStuTaskDetail/{task_id}/{user_id}")
	public String toStuTaskDetail(HttpServletRequest request, @PathVariable String task_id,
			@PathVariable String user_id) {

		// 通过taskid和user查询用户提交的任务内容
		Task uploadT = courseService.getUpload(task_id, user_id);
		// 根据id查询所有附件
		List<Accessory> accList = new ArrayList<>();
		accList = courseService.getAccs(task_id, 2);
		uploadT.setUploadAccs(accList);
		User user = userService.findUserById(user_id);
		int grade = courseService.getTaskGrade(task_id, user_id);
		int status = courseService.getTaskStatus(task_id);
		request.setAttribute("task", uploadT);
		request.setAttribute("user", user);
		request.setAttribute("grade", grade);
		request.setAttribute("status", status);
		return "jsp/studentTaskDetail";
	}

	/**
	 * 评分，并再次跳转到任务详情页
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/setGrade")
	public String setGrade(HttpServletRequest request) {
		String task_id = request.getParameter("task_id");
		String user_id = request.getParameter("user_id");
		User user = userService.findUserById(user_id);
		// 通过taskid和user查询用户提交的任务内容
		Task uploadT = courseService.getUpload(task_id, user_id);
		// 根据id查询所有附件
		List<Accessory> accList = new ArrayList<>();
		accList = courseService.getAccs(task_id, 2);
		uploadT.setUploadAccs(accList);
		int grade = 0;
		if (request.getParameter("grade") != null) {
			grade = Integer.parseInt(request.getParameter("grade"));
		} else {
			grade = -1;
		}
		int status = courseService.getTaskStatus(task_id);
		courseService.setgrade(grade, task_id, user_id);
		request.setAttribute("task", uploadT);
		request.setAttribute("grade", grade);
		request.setAttribute("status", status);
		request.setAttribute("user", user);
		return "jsp/studentTaskDetail";
	}

	/**
	 * 跳转到修改成绩
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "toupdateGrade/{task_id}/{user_id}")
	public String toupdateGrade(HttpServletRequest request, @PathVariable String task_id,
			@PathVariable String user_id) {
		// 通过taskid和user查询用户提交的任务内容
		Task uploadT = courseService.getUpload(task_id, user_id);
		// 根据id查询所有附件
		List<Accessory> accList = new ArrayList<>();
		accList = courseService.getAccs(task_id, 2);
		uploadT.setUploadAccs(accList);
		User user = userService.findUserById(user_id);
		int status = courseService.getTaskStatus(task_id);
		request.setAttribute("task", uploadT);
		request.setAttribute("user", user);
		request.setAttribute("grade", -1);
		request.setAttribute("status", status);

		return "jsp/studentTaskDetail";
	}

	/**
	 * 下载文件
	 * 
	 * @param id
	 *            appid
	 * @param response
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(value = "/download/{id}")
	public void download(@PathVariable String id, HttpServletResponse response, HttpServletRequest request)
			throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		String filepath = "";
		filepath = courseService.getaccPath(id);

		File file = new File(filepath);
		InputStream inputStream = null;
		OutputStream outputStream = null;
		byte[] b = new byte[1024];
		int len = 0;
		try {
			inputStream = new FileInputStream(file);
			outputStream = response.getOutputStream();

			response.setContentType("application/force-download");
			String filename = file.getName();
			response.addHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(filename, "UTF-8"));
			response.setContentLength((int) file.length());

			while ((len = inputStream.read(b)) != -1) {
				outputStream.write(b, 0, len);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (inputStream != null) {
				try {
					inputStream.close();
					inputStream = null;
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (outputStream != null) {
				try {
					outputStream.close();
					outputStream = null;
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	/**
	 * 跳转到添加课程页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/toAddCourse")
	private String toAddCourse(HttpServletRequest request) {
		HttpSession session = request.getSession();
		 User user1 = (User) session.getAttribute("user");
		 if(user1 == null){
			 request.setAttribute("msg", "请先登录");
			 return "jsp/user/login";
		 }
		User user = userService.findUserById(user1.getUser_id());
		List<Depart> departList = new ArrayList<>();
		departList = courseService.getdepart();
		request.setAttribute("departs", departList);
		request.setAttribute("username", user.getUser_name());
		return "jsp/addCourse";

	}

	/**
	 * 跳转到加入课程页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/toJoinCourse")
	private String toJoinCourse(HttpServletRequest request) {
		HttpSession session = request.getSession();
		 User user = (User) session.getAttribute("user");
		 if(user==null){
			 request.setAttribute("msg", "请先登录");
			 return "jsp/user/login";
		 }
//		User user = userService.findUserById("1520561");
		request.setAttribute("username", user.getUser_name());
		return "jsp/joinCourse";

	}

	/**
	 * 跳转到课程详细页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/toIntoCourse/{course_id}")
	private String toIntoCourse(HttpServletRequest request, @PathVariable String course_id) {
		HttpSession session = request.getSession();
		// String user_id = (String) session.getAttribute("user_id");
		User user = userService.findUserById("1520561");
		request.setAttribute("username", user.getUser_name());
		//根据courseid查任务
		List<Task> taskList = new ArrayList<>();
		taskList = courseService.getTaskBycid(course_id);
		request.setAttribute("course_id", course_id);
		request.setAttribute("taskList", taskList);
		return "jsp/intoCourse";

	}
	
	/**
	 * 跳转到课程详细页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/toIntoCourset/{course_id}")
	private String toIntoCourset(HttpServletRequest request, @PathVariable String course_id) {
		HttpSession session = request.getSession();
		// String user_id = (String) session.getAttribute("user_id");
		User user = userService.findUserById("1520561");
		request.setAttribute("username", user.getUser_name());
		//根据courseid查任务
		List<Task> taskList = new ArrayList<>();
		taskList = courseService.getTaskBycid(course_id);
		request.setAttribute("course_id", course_id);
		request.setAttribute("taskList", taskList);
		return "jsp/intoCourse2";

	}

	/**
	 * 跳转到添加任务页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/toAddTask/{course_id}")
	private String toAddTask(HttpServletRequest request, @PathVariable String course_id) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
//		User user = userService.findUserById("1520561");
		request.setAttribute("username", user.getUser_name());
		request.setAttribute("course_id", course_id);
		return "jsp/addTask";

	}

	@RequestMapping(value = "/Pictureshows")
	public ResponseEntity<byte[]> Pictureshow(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		User user = userService.findUserById(user_id);
		byte[] bytes = user.getFace();
		HttpHeaders headers = new HttpHeaders();
		try {
			headers.setContentType(MediaType.IMAGE_PNG);
			headers.setContentDispositionFormData("attachment", new String("face".getBytes("GBK"), "ISO8859-1"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<byte[]>(bytes, headers, HttpStatus.OK);
	}
	
	@RequestMapping(value ="/coursePictureshows/{course_id}" )
	public void coursePictureshow(HttpServletRequest request,@PathVariable String course_id,HttpServletResponse response) throws Exception {
		ServletOutputStream out = null;  
		Course course = courseService.secCourseByid(course_id);
		byte[] bytes = course.getCourse_img();
		try {  
			
//            System.out.println("内容是:"+bytes.length);  
            InputStream is = new ByteArrayInputStream(bytes);  
            out = response.getOutputStream();  
            int len=0;  
            byte[]buf=new byte[1024];  
            while((len=is.read(buf,0,1024))!=-1){  
                out.write(buf, 0, len);  
            }  

            out.flush();  
            out.close();  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
	}
	/**
	 * 查询系部
	 * @param request
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/deptype")
	public String deptype(HttpServletRequest request,HttpServletResponse rsp) throws IOException{
		List<Depart> departList = new ArrayList<>();
		departList = courseService.getdepart();
		PrintWriter out=rsp.getWriter();
		out.print(com.alibaba.fastjson.JSON.toJSONString(departList));
		return null;
	}
}
