package cn.edu.tit.course.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import cn.edu.tit.course.Iservice.ICourseService;
import cn.edu.tit.course.bean.Accessory;
import cn.edu.tit.course.bean.Course;
import cn.edu.tit.course.bean.Task;
import cn.edu.tit.util.FileUtil;
import cn.itcast.commons.CommonUtils;

@Controller
@RequestMapping("/course")
public class CourseController {
	@Autowired
	private ICourseService courseService;
	@Autowired
	private FileUtil fileUtil;
	
	/**
	 * 添加课程
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/addCourse")
	public String addCourse(HttpServletRequest request){
		//获取课程相关信息
		//String create_user = (String) request.getSession().getAttribute("user_id");
		String create_user = "1520561";
		String course_id = create_user+"_"+System.currentTimeMillis(); //课程id
		String college = request.getParameter("school");//学校
		String course_name = request.getParameter("course_name"); //课程名
		//String course_name = "comp";
		String course_lable = request.getParameter("course_lable"); //类型
		int course_flag = 1; //状态
		String course_notes = request.getParameter("course_notes"); //简介
		String application_pro = request.getParameter("application_pro"); //适合专业
		//测试数据
//		String course_notes = "xx"; 
//		String application_pro = "yy";
		String invitation_code = UUID.randomUUID().toString().replace("-", "").toUpperCase(); //邀请码
		byte[] course_img = request.getParameter("course_img").getBytes(); //图片
		//封装课程对象
		Course course = new Course(course_id, course_name, course_lable, course_img, course_notes, college, application_pro, course_flag, invitation_code, create_user);
		//存储课程信息
		courseService.createCourse(course);
		return null;
	}
	/**
	 * 加入课程
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/joinCourse")
	public String joinCourse(HttpServletRequest request){
		//获取加入的课程号
		String course_id = request.getParameter("course_id");
		//获取加入者id和邀请码
		String user_id = (String) request.getSession().getAttribute("user_id");
		String invitation_code = request.getParameter("invitation_code");
		//调用业务逻辑
		courseService.joinCourse(invitation_code, "1520561", "1520561_1517561047582");
		return null;
	}
	
	/**
	 * 发布任务
	 * @param request
	 */
	@RequestMapping(value="/publishTask")
	public void publishTask(HttpServletRequest request,HttpServletResponse response){
//		//接收参数
//		String task_name = request.getParameter("task_name");
////		String course_id = request.getParameter("course_id");
		String task_id = "1520561_1517561047582"+System.currentTimeMillis();
//		String create_user = (String) request.getSession().getAttribute("username");
		String username = "1520561";
		
		try {  
			String path = "D:\\accessory\\";
            DiskFileItemFactory factory = new DiskFileItemFactory();  
            ServletFileUpload upload = new ServletFileUpload(factory);  
            upload.setSizeMax(4194304); // 设置最大文件尺寸，这里是4MB  
            List<Accessory> accList = new ArrayList<>();
            List<FileItem> items = upload.parseRequest(request);// 得到所有的文件  
            Map<String, Object> formdata = new HashMap<String, Object>();
            String name = "";
            for (FileItem fi:items) {
            	Accessory acc = new Accessory();
            	if(!fi.isFormField()){
            		 String fileName = fi.getName();  
                     if (fileName != null) {  
                         File fullFile = new File(new String(fi.getName().getBytes(), "utf-8")); // 解决文件名乱码问题  
                         File savedFile = new File(path, fullFile.getName());  
                         fi.write(savedFile); 
                         if(!fullFile.getName().equals(name)){
                        	 acc.setTask_id(task_id);
                             acc.setAccessory_name(fullFile.getName());
                             acc.setAccessory_id(username+System.currentTimeMillis());
                             acc.setAccessory_kind(1);
                             acc.setAccessory_path(path+acc.getAccessory_name());
                             acc.setCreate_user(username);
                             accList.add(acc);
                             name = fullFile.getName();
                         }
                         
                     }  
            	}
            	else{
            		formdata.put(fi.getFieldName(), fi.getString("UTF-8"));
            	}
            }  
            Task task =  CommonUtils.toBean(formdata, Task.class);
            task.setTask_id(task_id);
            task.setCourse_id("1520561_1517561047582");
            task.setPubAccs(accList);
            task.setEvaluate_kind("教师评价");
            task.setEvaluate_id("1520561");
            task.setCreate_user("1520561");
          //调用service方法
    		courseService.addTask(task);
        } catch (Exception e) {  
        	e.getMessage();
        }  
		
		
	}
	
	/**
	 * 提交任务
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/uploadTask")
	public String uploadTask(HttpServletRequest request){
		//获取参数
		//String task_id = request.getParameter("task_id");
		String task_id = "1520561_15175610475821520427995506";
		//String uploader = (String) request.getSession().getAttribute("user_id");
		String uploader = "1520561";
		try {  
			String path = "D:\\accessory\\";
            DiskFileItemFactory factory = new DiskFileItemFactory();  
            ServletFileUpload upload = new ServletFileUpload(factory);  
            upload.setSizeMax(4194304); // 设置最大文件尺寸，这里是4MB  
            List<Accessory> accList = new ArrayList<>();
            List<FileItem> items = upload.parseRequest(request);// 得到所有的文件  
            Map<String, Object> formdata = new HashMap<String, Object>();
            String name = "";
            for (FileItem fi:items) {
            	Accessory acc = new Accessory();
            	if(!fi.isFormField()){
            		 String fileName = fi.getName();  
                     if (fileName != null) {  
                         File fullFile = new File(new String(fi.getName().getBytes(), "utf-8")); // 解决文件名乱码问题  
                         File savedFile = new File(path, fullFile.getName());  
                         fi.write(savedFile);  
                         if(!fullFile.getName().equals(name)){
                        	 acc.setTask_id(task_id);
                             acc.setAccessory_name(fullFile.getName());
                             acc.setAccessory_id(uploader+System.currentTimeMillis());
                             acc.setAccessory_kind(2);
                             acc.setAccessory_path(path+acc.getAccessory_name());
                             acc.setCreate_user(uploader);
                             accList.add(acc);
                             name = fullFile.getName();
                         }
                     }  
            	}
            	else{
            		formdata.put(fi.getFieldName(), fi.getString("UTF-8"));
            	}
            }  
            Task task =  CommonUtils.toBean(formdata, Task.class);
            task.setTask_id(task_id);
            task.setPubAccs(accList);
            task.setCreate_user("1520561");
          //调用service方法
    		courseService.uploadTask(task);
        } catch (Exception e) {  
        	e.getMessage();
        }  
		return null;
	}
	

	@RequestMapping(value="/showTask")
	public String showTask(HttpServletRequest request){
		Task task = courseService.secTaskByid("1520561_15175610475821520861733883");
		//根据id查询所有附件
		List<Accessory> accList = new ArrayList<>();
		accList = courseService.getAccs("1520561_15175610475821520861733883");
		task.setPubAccs(accList);
		request.setAttribute("task", task);
		return "jsp/uploadTask";
	}
	
	/** 
     * 下载文件 
     * @param id appid 
     * @param response 
	 * @throws UnsupportedEncodingException 
     */  
    @RequestMapping(value="/download/{id}")  
    public void download(@PathVariable String id, HttpServletResponse response,HttpServletRequest request) throws UnsupportedEncodingException{
    	request.setCharacterEncoding("utf-8");
        String filepath = "";  
        filepath =  courseService.getaccPath(id);
          
        File file = new File(filepath);  
        InputStream inputStream = null;  
        OutputStream outputStream = null;  
        byte[] b= new byte[1024];  
        int len = 0;  
        try {  
            inputStream = new FileInputStream(file);  
            outputStream = response.getOutputStream();  
              
            response.setContentType("application/force-download");  
            String filename = file.getName();  
            response.addHeader("Content-Disposition","attachment; filename=" + URLEncoder.encode(filename, "UTF-8"));  
            response.setContentLength( (int) file.length( ) );  
              
            while((len = inputStream.read(b)) != -1){  
                outputStream.write(b, 0, len);  
            }  
        } catch (Exception e) {  
            e.printStackTrace();  
        }finally{  
            if(inputStream != null){  
                try {  
                    inputStream.close();  
                    inputStream = null;  
                } catch (IOException e) {  
                    e.printStackTrace();  
                }  
            }  
            if(outputStream != null){  
                try {  
                    outputStream.close();  
                    outputStream = null;  
                } catch (IOException e) {  
                    e.printStackTrace();  
                }  
            }  
        }  
    }  
}
