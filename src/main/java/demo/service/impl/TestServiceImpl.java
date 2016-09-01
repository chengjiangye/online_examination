package demo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import demo.dao.GenericDao;
import demo.model.Test;
import demo.service.TestService;

@Service
public class TestServiceImpl extends GenericServiceImpl<Test, Integer> implements TestService {

    @Autowired
    public TestServiceImpl(GenericDao<Test, Integer> genericDao) {
        super(genericDao);
    }
}