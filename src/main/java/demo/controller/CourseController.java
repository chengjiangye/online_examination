package demo.controller;

import demo.model.Course;
import demo.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("course")
public class CourseController extends BaseController {

    @Autowired
    private CourseService courseService;

    @RequestMapping("create")
    private String create(Course course) {
        courseService.create(course);
        return "redirect:list";
    }

    @RequestMapping("list")
    private String list() {
        session.setAttribute("list", courseService.list());
        return "redirect:/course/list.jsp";
    }

    @RequestMapping("queryById/{id}")
    private String search(@PathVariable("id") Integer id) {
        session.setAttribute("course", courseService.queryById(id));
        return "redirect:/course/edit.jsp";
    }

    @RequestMapping("modify")
    private String modify(Course course) {
        courseService.modify(course);
        return "redirect:list";
    }

    @RequestMapping("remove/{id}")
    private String remove(@PathVariable("id") Integer id) {
        courseService.remove(id);
        return "redirect:/course/list";
    }
}