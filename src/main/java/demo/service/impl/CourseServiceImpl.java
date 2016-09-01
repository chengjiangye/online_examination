package demo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import demo.dao.GenericDao;
import demo.model.Course;
import demo.service.CourseService;

@Service
public class CourseServiceImpl extends GenericServiceImpl<Course, Integer> implements CourseService {

    @Autowired
    public CourseServiceImpl(GenericDao<Course, Integer> genericDao) {
        super(genericDao);
    }
}