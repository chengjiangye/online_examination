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

    @Override
    public Class queryStudentsByClassId(int id) {
        return genericDao.query("class.queryStudentsByClassId", id);
    }
}