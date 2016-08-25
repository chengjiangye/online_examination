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

    @RequestMapping("create")
    private String create(Assistant assistant) {
        assistantService.create(assistant);
        return "redirect:list";
    }

    @RequestMapping("list")
    private String list() {
        session.setAttribute("list", assistantService.list());
        return "redirect:/assistant/list.jsp";
    }

    @RequestMapping("queryById/{id}")
    private String search(@PathVariable("id") Integer id) {
        session.setAttribute("assistant", assistantService.queryById(id));
        return "redirect:/assistant/edit.jsp";
    }

    @RequestMapping("modify")
    private String modify(Assistant assistant) {
        assistantService.modify(assistant);
        return "redirect:list";
    }

    @RequestMapping("remove/{id}")
    private String remove(@PathVariable("id") Integer id) {
        assistantService.remove(id);
        return "redirect:/assistant/list";
    }
}