package ${package}.controller;

import ${package}.model.${model};
import ${package}.service.${model}Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("${model?lower_case}")
public class ${model}Controller extends BaseController {

    @Autowired
    private ${model}Service ${model?lower_case}Service;

    @RequestMapping("create")
    private String create(${model} ${model?lower_case}) {
        ${model?lower_case}Service.create(${model?lower_case});
        return "redirect:list";
    }

    @RequestMapping("list")
    private String list() {
        session.setAttribute("list", ${model?lower_case}Service.list());
        return "redirect:/${model?lower_case}/list.jsp";
    }

    @RequestMapping("queryById/{id}")
    private String search(@PathVariable("id") ${PK} id) {
        session.setAttribute("${model?lower_case}", ${model?lower_case}Service.queryById(id));
        return "redirect:/${model?lower_case}/edit.jsp";
    }

    @RequestMapping("modify")
    private String modify(${model} ${model?lower_case}) {
        ${model?lower_case}Service.modify(${model?lower_case});
        return "redirect:list";
    }

    @RequestMapping("remove/{id}")
    private String remove(@PathVariable("id") ${PK} id) {
        ${model?lower_case}Service.remove(id);
        return "redirect:/${model?lower_case}/list";
    }
}