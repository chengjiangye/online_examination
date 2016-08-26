package demo.controller;

import demo.model.Student;
import demo.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("student")
public class StudentController extends BaseController {

    @Autowired
    private StudentService studentService;

    @RequestMapping("create")
    private String create(Student student) {
        studentService.create(student);
        return "redirect:list";
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
}