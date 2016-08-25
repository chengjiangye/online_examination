package demo.dao.impl;

import org.springframework.stereotype.Repository;

import demo.dao.TeacherDao;
import demo.model.Teacher;

@Repository
public class TeacherDaoImpl extends GenericDaoImpl<Teacher, Integer> implements TeacherDao {
}