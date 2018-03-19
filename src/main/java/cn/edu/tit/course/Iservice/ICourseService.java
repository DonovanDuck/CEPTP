package cn.edu.tit.course.Iservice;

import java.util.List;

import cn.edu.tit.course.bean.Accessory;
import cn.edu.tit.course.bean.Course;
import cn.edu.tit.course.bean.Depart;
import cn.edu.tit.course.bean.Task;
import cn.edu.tit.pager.PagerBean;

public interface ICourseService {
	/**
	 * 创建课程
	 * @param course
	 * 创建课程名称-、状态-、介绍、教材、封面图片-、所属学校-
	 * 分类（标签）-、适合专业
	 */
	public void createCourse(Course course);
	
	/**
	 * 加入课程
	 * @param user_id
	 * 用户id
	 * @param course_id
	 * 课程id
	 * @param verify
	 * 加入课程的验证： 邀请码
	 * @return
	 * 返回状态代码
	 */
	public String joinCourse(String verify,String user_id);
	
	/**
	 * 为发布的课程添加任务
	 * @param task
	 * 任务名、任务描述、附件、评价类型、评价人、所属课程id、创建者
	 * @return
	 * 状态码
	 */
	public String addTask(Task task);
	
	/**
	 * 提交任务
	 * @param task
	 * 提交内容描述、附件、提交者id、成绩、任务id
	 */
	public void uploadTask(Task task);
	
	
	/**
	 * 根据条件查找课程
	 * @param kind
	 * 查询的方式
	 * @param condition
	 * 查询的条件
	 * @return
	 */
	public Course secCourseByid(String course_id);
	
	/**
	 * 根据条件查找任务
	 * @param kind
	 * 查询的方式
	 * @param condition
	 * 查询的条件
	 * @return
	 */
	public Task secTaskBycon(String kind,String condition);
	
	/**
	 * 根据id查询task
	 * @param task_id
	 * @return
	 */
	public Task secTaskByid(String task_id);
	
	/**
	 * 根据id查找附件路径
	 * @param acc_id
	 * @return
	 */
	public String getaccPath(String acc_id);
	
	/**
	 * 根据task_id查询附件
	 * @param task_id
	 * @return
	 */
	public List<Accessory> getAccs(String task_id,int kind);
	
	/**
	 * 根据id查询提交任务
	 * @param task_id
	 * @return
	 */
	public List<Task> getUploadByid(String task_id);
	
	/**
	 * 根据userid和taskid查找提交任务
	 * @param task_id
	 * @param user_id
	 * @return
	 */
	public Task getUpload(String task_id,String user_id);
	/**
	 * 根据taskid查状态
	 * @param task_id
	 * @return
	 */
	public int getTaskStatus(String task_id);
	
	/**
	 * 根据taskid查成绩
	 * @param task_id
	 * @return
	 */
	public int getTaskGrade(String task_id,String user_id);
	
	/**
	 * 评分
	 * @param grade
	 * @param task_id
	 * @param user_id
	 */
	public void setgrade(int grade,String task_id,String user_id);
	
	/**
	 * 分页查询课程
	 * @param pc
	 * @param course_label
	 * @return
	 */
	public PagerBean<Course> getCPage(int pc,String course_label);
	
	/**
	 * 根据userid查找课程
	 * @return
	 */
	public List<Course> findCByuserid(String user_id);
	
	/**
	 * 获得加入的课程
	 * @param user_id
	 * @return
	 */
	public List<Course> getjoinCourse(String user_id);
	
	/**
	 * 根据courseid查任务
	 * @param course_id
	 * @return
	 */
	public List<Task> getTaskBycid(String course_id);
	
	/**
	 * 获得所有depart
	 * @return
	 */
	public List<Depart> getdepart();
}
