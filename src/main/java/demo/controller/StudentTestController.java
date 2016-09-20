package demo.controller;

import demo.model.Student;
import demo.model.StudentTest;
import demo.service.StudentTestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

@Controller
@RequestMapping("studenttest")
public class StudentTestController extends BaseController {

    @Autowired
    private StudentTestService studenttestService;

    @RequestMapping("create")
    private String create(@RequestParam MultipartFile[] files) {
        for (MultipartFile file : files) {
            System.out.println(file.getOriginalFilename());
        }
//        Student student = (Student) session.getAttribute("student");
//        int studentId = student.getId();
//        Map<String, String[]> map = request.getParameterMap();
//        for (String testIdString : map.keySet()) {
//            StudentTest studentTest = new StudentTest(null, map.get(testIdString)[0], studentId, Integer.parseInt(testIdString));
//            studenttestService.create(studentTest);
//        }
//        return "redirect:/student/student.jsp";
        return null;
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