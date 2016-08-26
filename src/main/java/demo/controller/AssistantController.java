package demo.controller;

import demo.model.Assistant;
import demo.service.AssistantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("assistant")
public class AssistantController extends BaseController {

    @Autowired
    private AssistantService assistantService;

    @RequestMapping("login")
    private String login(Assistant assistant) {
        assistant = assistantService.login(assistant);
        if (assistant != null) {
            session.setAttribute("assistant", assistant);
            return "redirect:/assistant/assistant.jsp";
        }
        request.setAttribute("message", "邮箱或密码错误");
        return "/assistant/index.jsp";
    }
}