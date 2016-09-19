package demo.dao.impl;

import org.springframework.stereotype.Repository;

import demo.dao.ClassPaperDao;
import demo.model.ClassPaper;

@Repository
public class ClassPaperDaoImpl extends GenericDaoImpl<ClassPaper, Integer> implements ClassPaperDao {
}