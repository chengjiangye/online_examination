package demo.controller;

import demo.model.Admin;
import demo.model.Assistant;
import demo.model.Teacher;
import demo.service.AdminService;
import demo.service.AssistantService;
import demo.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class AdminController extends BaseController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private AssistantService assistantService;

    @RequestMapping("login")
    private String login(Admin admin) {
        admin = adminService.login(admin);
        if (admin != null) {
            session.setAttribute("admin", admin);
            return "redirect:/admin/index.jsp";
        }
        request.setAttribute("message", "邮箱或密码错误");
        return "/index.jsp";
    }

    @RequestMapping("create")
    private String create(Admin admin, String role) {
        if (role.equals("admin")) {
            adminService.create(admin);
        }

        if (role.equals("teacher")) {
            Teacher teacher = new Teacher();
            teacher.setEmail(admin.getEmail());
            teacher.setUsername(admin.getUsername());
            teacher.setPassword(admin.getPassword());
            teacherService.create(teacher);
        }

        if (role.equals("assistant")) {
            Assistant assistant = new Assistant();
            assistant.setEmail(admin.getEmail());
            assistant.setUsername(admin.getUsername());
            assistant.setPassword(admin.getPassword());
            assistantService.create(assistant);
        }

        return "redirect:/admin/index.jsp";
    }
}