package demo.controller;

import demo.model.Admin;
import demo.model.Assistant;
import demo.model.Teacher;
import demo.service.AdminService;
import demo.service.AssistantService;
import demo.service.TeacherService;
import org.jasypt.util.password.StrongPasswordEncryptor;
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
            return "redirect:/admin/admin.jsp";
        }
        request.setAttribute("message", "邮箱或密码错误");
        return "/admin/index.jsp";
    }

    @RequestMapping("createTeacher")
    private String createTeacher(Teacher teacher) {
        teacher.setPassword(encryptPassword(teacher.getPassword()));
        teacherService.create(teacher);
        return "redirect:/admin/listTeacher";
    }

    @RequestMapping("createAssistant")
    private String createAssistant(Assistant assistant) {
        assistant.setPassword(encryptPassword(assistant.getPassword()));
        assistantService.create(assistant);
        return "redirect:/admin/listAssistant";
    }

    @RequestMapping("listTeacher")
    private String listTeacher() {
        session.setAttribute("teachers", teacherService.list());
        return "redirect:/admin/teacher.jsp";
    }

    @RequestMapping("listAssistant")
    private String listAssistant() {
        session.setAttribute("assistants", assistantService.list());
        return "redirect:/admin/assistant.jsp";
    }

    @RequestMapping("queryOneTeacher/{id}")
    private String queryOneTeacher(@PathVariable int id) {
        session.setAttribute("teacher", teacherService.queryById(id));
        return "redirect:/admin/editTeacher.jsp";
    }

    @RequestMapping("modifyTeacher")
    private String modifyTeacher(Teacher teacher) {
        teacherService.modify(teacher);
        return "redirect:/admin/listTeacher";
    }

    @RequestMapping("queryOneAssistant/{id}")
    private String queryOneAssistant(@PathVariable int id) {
        session.setAttribute("assistant", assistantService.queryById(id));
        return "redirect:/admin/editAssistant.jsp";
    }

    @RequestMapping("modifyAssistant")
    private String modifyAssistant(Assistant assistant) {
        assistantService.modify(assistant);
        return "redirect:/admin/listAssistant";
    }

    @RequestMapping("removeTeacher/{id}")
    private String removeTeacher(@PathVariable int id) {
        teacherService.remove(id);
        return "redirect:/admin/listTeacher";
    }

    @RequestMapping("removeAssistant/{id}")
    private String removeAssistant(@PathVariable int id) {
        assistantService.remove(id);
        return "redirect:/admin/listAssistant";
    }

    private String encryptPassword(String password) {
        StrongPasswordEncryptor encryptor = new StrongPasswordEncryptor();
        return encryptor.encryptPassword(password);
    }
}
