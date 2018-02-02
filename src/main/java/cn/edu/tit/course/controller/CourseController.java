package cn.edu.tit.course.controller;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.tit.course.bean.Course;

@Controller
@RequestMapping("/course")
public class CourseController {
	
	/**
	 * 添加课程
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/addCourse")
	public String addCourse(HttpServletRequest request){
		//获取课程相关信息
		String create_user = (String) request.getSession().getAttribute("user_id");
		String course_id = create_user+"_"+System.currentTimeMillis(); //课程id
		String college = request.getParameter("school");//学校
		String course_name = request.getParameter("course_name"); //课程名
		String course_lable = request.getParameter("course_lable"); //类型
		int course_flag = 1; //状态
		//String course_notes = request.getParameter("course_notes"); //简介
		//String application_pro = request.getParameter("application_pro"); //适合专业
		//测试数据
		String course_notes = "xx"; 
		String application_pro = "yy";
		String invitation_code = UUID.randomUUID().toString().replace("-", "").toUpperCase(); //邀请码
		byte[] course_img = request.getParameter("course_img").getBytes(); //图片
		//封装课程对象
		Course course = new Course(course_id, course_name, course_lable, course_img, course_notes, college, application_pro, course_flag, invitation_code, create_user);
		//存储课程信息
		return null;
	}
}
