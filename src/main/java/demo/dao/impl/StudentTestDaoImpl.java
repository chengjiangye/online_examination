package demo.dao.impl;

import org.springframework.stereotype.Repository;

import demo.dao.StudentTestDao;
import demo.model.StudentTest;

@Repository
public class StudentTestDaoImpl extends GenericDaoImpl<StudentTest, Integer> implements StudentTestDao {
}