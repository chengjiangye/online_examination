package demo.controller;

import demo.model.ClassPaper;
import demo.service.ClassPaperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("classpaper")
public class ClassPaperController extends BaseController {

    @Autowired
    private ClassPaperService classpaperService;

    @RequestMapping("create")
    private String create(ClassPaper classpaper) {
        classpaperService.create(classpaper);
        return "redirect:list";
    }

    @RequestMapping("list")
    private String list() {
        session.setAttribute("list", classpaperService.list());
        return "redirect:/classpaper/list.jsp";
    }

    @RequestMapping("queryById/{id}")
    private String search(@PathVariable("id") Integer id) {
        session.setAttribute("classpaper", classpaperService.queryById(id));
        return "redirect:/classpaper/edit.jsp";
    }

    @RequestMapping("modify")
    private String modify(ClassPaper classpaper) {
        classpaperService.modify(classpaper);
        return "redirect:list";
    }

    @RequestMapping("remove/{id}")
    private String remove(@PathVariable("id") Integer id) {
        classpaperService.remove(id);
        return "redirect:/classpaper/list";
    }
}