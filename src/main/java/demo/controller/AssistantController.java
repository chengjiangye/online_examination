package demo.controller;

import demo.model.Assistant;
import demo.model.Class;
import demo.service.AssistantService;
import demo.service.ClassPaperService;
import demo.service.ClassService;
import demo.service.PaperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("assistant")
public class AssistantController extends BaseController {

    @Autowired
    private AssistantService assistantService;

    @Autowired
    private ClassService classService;

    @Autowired
    private PaperService paperService;

    @Autowired
    private ClassPaperService classPaperService;

    @RequestMapping("login")
    private String login(Assistant assistant) {
        assistant = assistantService.login(assistant);
        if (assistant != null) {
            session.setAttribute("assistant", assistant);
            return "redirect:/class/list";
        }
        request.setAttribute("message", "邮箱或密码错误");
        return "/assistant/index.jsp";
    }

    @RequestMapping("queryStudentsByClassId/{id}")
    private String queryStudentsByClassId(@PathVariable int id) {
        session.setAttribute("clazz", classService.query("class.queryStudentsByClassId", id));
        return "redirect:/assistant/students.jsp";
    }

    @RequestMapping("queryClassAndPaper")
    private String queryClassAndPaper() {
        session.setAttribute("classes", classService.list());
        session.setAttribute("papers", paperService.queryList("paper.queryPapers", null));
        session.setAttribute("classPapers", classPaperService.queryList("classpaper.classPapers", null));
        return "redirect:/assistant/examination.jsp";
    }
}