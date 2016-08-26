package demo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import demo.dao.GenericDao;
import demo.model.Class;
import demo.service.ClassService;

@Service
public class ClassServiceImpl extends GenericServiceImpl<Class, Integer> implements ClassService {

    @Autowired
    public ClassServiceImpl(GenericDao<Class, Integer> genericDao) {
        super(genericDao);
    }
}