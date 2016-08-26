package demo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import demo.dao.GenericDao;
import demo.model.Student;
import demo.service.StudentService;

@Service
public class StudentServiceImpl extends GenericServiceImpl<Student, Integer> implements StudentService {

    @Autowired
    public StudentServiceImpl(GenericDao<Student, Integer> genericDao) {
        super(genericDao);
    }
}