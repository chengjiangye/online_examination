package demo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import demo.dao.GenericDao;
import demo.model.Assistant;
import demo.service.AssistantService;

@Service
public class AssistantServiceImpl extends GenericServiceImpl<Assistant, Integer> implements AssistantService {

    @Autowired
    public AssistantServiceImpl(GenericDao<Assistant, Integer> genericDao) {
        super(genericDao);
    }
}