package demo.controller;

import demo.model.Test;
import demo.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("test")
public class TestController extends BaseController {

    @Autowired
    private TestService testService;

    @RequestMapping("create")
    private String create(Test test) {
        testService.create(test);
        return "redirect:/teacher/queryPaperByPaperId/".concat(String.valueOf(test.getPaperId()));
    }

    @RequestMapping("list")
    private String list() {
        session.setAttribute("list", testService.list());
        return "redirect:/test/list.jsp";
    }

    @RequestMapping("queryById/{id}")
    private String search(@PathVariable("id") Integer id) {
        session.setAttribute("test", testService.queryById(id));
        return "redirect:/test/edit.jsp";
    }

    @RequestMapping("modify")
    private String modify(Test test) {
        testService.modify(test);
        return "redirect:list";
    }

    @RequestMapping("remove/{id}")
    private String remove(@PathVariable("id") Integer id) {
        testService.remove(id);
        return "redirect:/test/list";
    }

    @RequestMapping("queryTestsByStudentIdAndPaperId/{studentId}/{paperId}")
    private String queryTestsByStudentIdAndPaperId(@PathVariable int studentId, @PathVariable int paperId) {
        Map<String, Integer> map = new HashMap<>();
        map.put("studentId", studentId);
        map.put("paperId", paperId);
        session.setAttribute("tests", testService.queryList("test.queryTestsByStudentIdAndPaperId", map));
        return "redirect:/teacher/judge.jsp";
    }

}