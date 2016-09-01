package demo.controller;

import demo.model.Paper;
import demo.model.Teacher;
import demo.service.PaperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("paper")
public class PaperController extends BaseController {

    @Autowired
    private PaperService paperService;

    @RequestMapping("create")
    private String create(Paper paper) {
        paperService.create(paper);
        return "redirect:list";
    }

    @RequestMapping("list")
    private String list() {
        session.setAttribute("papers", paperService.list());
        return "redirect:/teacher/teacher.jsp";
    }

    @RequestMapping("queryById/{id}")
    private String search(@PathVariable("id") Integer id) {
        session.setAttribute("paper", paperService.queryById(id));
        return "redirect:/teacher/editPaper.jsp";
    }

    @RequestMapping("modify")
    private String modify(Paper paper) {
        paperService.modify(paper);
        return "redirect:/teacher/queryPapersByTeacherId";
    }

    @RequestMapping("remove/{id}")
    private String remove(@PathVariable("id") Integer id) {
        paperService.remove(id);
        return "redirect:/teacher/queryPapersByTeacherId";
    }
}