package demo.dao.impl;

import org.springframework.stereotype.Repository;

import demo.dao.TestDao;
import demo.model.Test;

@Repository
public class TestDaoImpl extends GenericDaoImpl<Test, Integer> implements TestDao {
}