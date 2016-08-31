package demo.controller;

import demo.model.Assistant;
import demo.model.Class;
import demo.service.AssistantService;
import demo.service.ClassService;
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
        System.out.println(id);
        session.setAttribute("clazz", classService.queryStudentsByClassId(id));
        return "redirect:/assistant/students.jsp";
    }
}