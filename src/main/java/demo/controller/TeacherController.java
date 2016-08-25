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

    @RequestMapping("create")
    private String create(Teacher teacher) {
        teacherService.create(teacher);
        return "redirect:list";
    }

    @RequestMapping("list")
    private String list() {
        session.setAttribute("list", teacherService.list());
        return "redirect:/teacher/list.jsp";
    }

    @RequestMapping("queryById/{id}")
    private String search(@PathVariable("id") Integer id) {
        session.setAttribute("teacher", teacherService.queryById(id));
        return "redirect:/teacher/edit.jsp";
    }

    @RequestMapping("modify")
    private String modify(Teacher teacher) {
        teacherService.modify(teacher);
        return "redirect:list";
    }

    @RequestMapping("remove/{id}")
    private String remove(@PathVariable("id") Integer id) {
        teacherService.remove(id);
        return "redirect:/teacher/list";
    }
}