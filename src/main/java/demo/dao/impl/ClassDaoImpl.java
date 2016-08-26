package demo.dao.impl;

import org.springframework.stereotype.Repository;

import demo.dao.ClassDao;
import demo.model.Class;

@Repository
public class ClassDaoImpl extends GenericDaoImpl<Class, Integer> implements ClassDao {
}