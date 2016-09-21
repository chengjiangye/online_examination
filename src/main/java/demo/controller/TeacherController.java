package demo.controller;

import demo.model.Paper;
import demo.model.Teacher;
import demo.service.*;
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

    @Autowired
    private ClassPaperService classPaperService;

    @Autowired
    private ClassService classService;

    @RequestMapping("login")
    private String login(Teacher teacher) {
        teacher = teacherService.login(teacher);
        if (teacher != null) {
            session.setAttribute("teacher", teacher);
            session.setAttribute("courses", courseService.list());
            session.setAttribute("papers", paperService.queryList("paper.queryPapersByTeacherId", teacher.getId()));
            session.setAttribute("classPapers", classPaperService.queryList("classpaper.queryClassPapersByStatus", "考试结束"));
            return "redirect:/teacher/teacher.jsp";
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

    @RequestMapping("queryPaperByPaperId/{id}")
    private String queryPaperByPaperId(@PathVariable int id) {
        session.setAttribute("paper", paperService.query("paper.queryPaperByPaperId", id));
        return "redirect:/teacher/paper.jsp";
    }

    @RequestMapping("queryStudentsByClassId/{classId}/{paperId}")
    private String queryStudentsByClassId(@PathVariable int classId, @PathVariable int paperId) {
        session.setAttribute("clazz", classService.query("class.queryStudentsByClassId", classId));
        session.setAttribute("paperId", paperId);
        return "redirect:/teacher/students.jsp";
    }
}