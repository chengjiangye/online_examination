package demo.controller;

import demo.model.Student;
import demo.service.ClassPaperService;
import demo.service.ClassService;
import demo.service.PaperService;
import demo.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Controller
@RequestMapping("student")
public class StudentController extends BaseController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private ClassService classService;

    @Autowired
    private ClassPaperService classPaperService;

    @Autowired
    private PaperService paperService;

    @RequestMapping("register")
    private String register(Student student, @RequestParam MultipartFile photoFile) {
        String message = studentService.register(student, request, photoFile);
        if (message == null) {
            return "redirect:/student/index.jsp";
        }
        request.setAttribute("message", message);
        return "/student/register.jsp";
    }

    @RequestMapping("list")
    private String list() {
        session.setAttribute("list", studentService.list());
        return "redirect:/student/list.jsp";
    }

    @RequestMapping("queryById/{id}")
    private String search(@PathVariable("id") Integer id) {
        session.setAttribute("student", studentService.queryById(id));
        return "redirect:/student/edit.jsp";
    }

    @RequestMapping("modify")
    private String modify(Student student) {
        studentService.modify(student);
        return "redirect:list";
    }

    @RequestMapping("remove/{id}")
    private String remove(@PathVariable("id") Integer id) {
        studentService.remove(id);
        return "redirect:/student/list";
    }

    @RequestMapping("queryAllClasses")
    private String queryAllClasses() {
        session.setAttribute("classes", classService.list());
        return "redirect:/student/register.jsp";
    }

    @RequestMapping("login")
    private String login(Student student) {
        student = studentService.login(student);
        if (student != null) {
            session.setAttribute("student", student);
            session.setAttribute("classPaper", classPaperService.query("classpaper.queryExamination", student.getClassId()));
            return "redirect:/student/student.jsp";
        }
        request.setAttribute("message", "邮箱或密码错误");
        return "/student/index.jsp";
    }

    @RequestMapping("queryPaperByPaperId/{id}")
    private String queryPaperByPaperId(@PathVariable int id) {
        session.setAttribute("paper", paperService.query("paper.queryPaperByPaperId", id));
        return "redirect:/student/examination.jsp";
    }
}