package demo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import demo.dao.GenericDao;
import demo.model.ClassPaper;
import demo.service.ClassPaperService;

@Service
public class ClassPaperServiceImpl extends GenericServiceImpl<ClassPaper, Integer> implements ClassPaperService {

    @Autowired
    public ClassPaperServiceImpl(GenericDao<ClassPaper, Integer> genericDao) {
        super(genericDao);
    }
}