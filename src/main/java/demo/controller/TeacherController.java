package demo.controller;

import demo.model.Paper;
import demo.model.Teacher;
import demo.service.CourseService;
import demo.service.PaperService;
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

    @Autowired
    private CourseService courseService;

    @Autowired
    private PaperService paperService;

    @RequestMapping("login")
    private String login(Teacher teacher) {
        teacher = teacherService.login(teacher);
        if (teacher != null) {
            session.setAttribute("teacher", teacher);
            session.setAttribute("courses", courseService.list());
            return "redirect:/teacher/queryPapersByTeacherId";
        }
        request.setAttribute("message", "邮箱或密码错误");
        return "/teacher/index.jsp";
    }

    @RequestMapping("createPaper")
    private String createPaper(Paper paper) {
        Teacher teacher = (Teacher) session.getAttribute("teacher");
        paper.setTeacherId(teacher.getId());
        paperService.create(paper);
        return "redirect:/teacher/queryPapersByTeacherId";
    }

    @RequestMapping("queryPapersByTeacherId")
    private String queryPapersByTeacherId() {
        Teacher teacher = (Teacher) session.getAttribute("teacher");
        session.setAttribute("papers", paperService.queryList("paper.queryPapersByTeacherId", teacher.getId()));
        return "redirect:/teacher/teacher.jsp";
    }
}