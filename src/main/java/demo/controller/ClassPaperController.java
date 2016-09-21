package demo.controller;

import demo.model.Assistant;
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
    private ClassPaperService classPaperService;

    @RequestMapping("create")
    private String create(ClassPaper classpaper) {
        Assistant assistant = (Assistant) session.getAttribute("assistant");
        classpaper.setAssistantId(assistant.getId());
        classPaperService.create(classpaper);
        return "redirect:list";
    }

    @RequestMapping("list")
    private String list() {
        session.setAttribute("classPapers", classPaperService.queryList("classpaper.classPapers", null));
        return "redirect:/assistant/examination.jsp";
    }

    @RequestMapping("queryById/{id}")
    private String search(@PathVariable("id") Integer id) {
        session.setAttribute("classPaper", classPaperService.queryById(id));
        return "redirect:/assistant/editClassPaper.jsp";
    }

    @RequestMapping("modify")
    private String modify(ClassPaper classpaper) {
        classPaperService.modify(classpaper);
        return "redirect:list";
    }

    @RequestMapping("remove/{id}")
    private String remove(@PathVariable("id") Integer id) {
        classPaperService.remove(id);
        return "redirect:/classpaper/list";
    }
}