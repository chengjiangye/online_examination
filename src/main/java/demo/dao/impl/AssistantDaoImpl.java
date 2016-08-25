package demo.dao.impl;

import org.springframework.stereotype.Repository;

import demo.dao.AssistantDao;
import demo.model.Assistant;

@Repository
public class AssistantDaoImpl extends GenericDaoImpl<Assistant, Integer> implements AssistantDao {
}