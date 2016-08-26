package demo.controller;

import demo.model.Class;
import demo.service.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("class")
public class ClassController extends BaseController {

    @Autowired
    private ClassService classService;

    @RequestMapping("create")
    private String create(Class clazz) {
        classService.create(clazz);
        return "redirect:list";
    }

    @RequestMapping("list")
    private String list() {
        session.setAttribute("list", classService.list());
        return "redirect:/assistant/assistant.jsp";
    }

    @RequestMapping("queryById/{id}")
    private String search(@PathVariable("id") Integer id) {
        session.setAttribute("clazz", classService.queryById(id));
        return "redirect:/assistant/editClass.jsp";
    }

    @RequestMapping("modify")
    private String modify(Class clazz) {
        classService.modify(clazz);
        return "redirect:list";
    }

    @RequestMapping("remove/{id}")
    private String remove(@PathVariable("id") Integer id) {
        classService.remove(id);
        return "redirect:/class/list";
    }
}