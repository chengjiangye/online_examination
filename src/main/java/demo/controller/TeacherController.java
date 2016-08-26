package demo.controller;

import demo.model.Teacher;
import demo.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("teacher")
public class TeacherController extends BaseController {

    @Autowired
    private TeacherService teacherService;

    @RequestMapping("login")
    private String login(Teacher teacher) {
        teacher = teacherService.login(teacher);
        if (teacher != null) {
            session.setAttribute("teacher", teacher);
            return "redirect:/teacher/teacher.jsp";
        }
        request.setAttribute("message", "邮箱或密码错误");
        return "/teacher/index.jsp";
    }
}