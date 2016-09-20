package demo.controller;

import demo.model.StudentTest;
import demo.service.StudentTestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("studenttest")
public class StudentTestController extends BaseController {

    @Autowired
    private StudentTestService studenttestService;

    @RequestMapping("submit")
    private String submit(@RequestParam MultipartFile[] files) {
        studenttestService.submit(request, files);
        return "redirect:/student/student.jsp";
    }

    @RequestMapping("list")
    private String list() {
        session.setAttribute("list", studenttestService.list());
        return "redirect:/studenttest/list.jsp";
    }

    @RequestMapping("queryById/{id}")
    private String search(@PathVariable("id") Integer id) {
        session.setAttribute("studenttest", studenttestService.queryById(id));
        return "redirect:/studenttest/edit.jsp";
    }

    @RequestMapping("modify")
    private String modify(StudentTest studenttest) {
        studenttestService.modify(studenttest);
        return "redirect:list";
    }

    @RequestMapping("remove/{id}")
    private String remove(@PathVariable("id") Integer id) {
        studenttestService.remove(id);
        return "redirect:/studenttest/list";
    }
}