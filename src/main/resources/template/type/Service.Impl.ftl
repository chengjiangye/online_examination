package ${package}.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ${package}.dao.GenericDao;
import ${package}.model.${model};
import ${package}.service.${model}Service;

@Service
public class ${model}ServiceImpl extends GenericServiceImpl<${model}, ${PK}> implements ${model}Service {

    @Autowired
    public ${model}ServiceImpl(GenericDao<${model}, ${PK}> genericDao) {
        super(genericDao);
    }
}