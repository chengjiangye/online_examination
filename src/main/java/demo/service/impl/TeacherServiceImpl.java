package demo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import demo.dao.GenericDao;
import demo.model.Teacher;
import demo.service.TeacherService;

@Service
public class TeacherServiceImpl extends GenericServiceImpl<Teacher, Integer> implements TeacherService {

    @Autowired
    public TeacherServiceImpl(GenericDao<Teacher, Integer> genericDao) {
        super(genericDao);
    }
}