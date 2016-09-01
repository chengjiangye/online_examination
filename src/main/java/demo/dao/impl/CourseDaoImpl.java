package demo.dao.impl;

import org.springframework.stereotype.Repository;

import demo.dao.CourseDao;
import demo.model.Course;

@Repository
public class CourseDaoImpl extends GenericDaoImpl<Course, Integer> implements CourseDao {
}