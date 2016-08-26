package demo.dao.impl;

import org.springframework.stereotype.Repository;

import demo.dao.StudentDao;
import demo.model.Student;

@Repository
public class StudentDaoImpl extends GenericDaoImpl<Student, Integer> implements StudentDao {
}