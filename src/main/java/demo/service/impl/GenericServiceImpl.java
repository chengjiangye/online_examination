package demo.service.impl;

import demo.dao.GenericDao;
import demo.service.GenericService;

import java.io.Serializable;
import java.util.List;

/**
 * Created by mingfei.net@gmail.com
 * 2016-08-23 13:27
 */
public class GenericServiceImpl<T extends Serializable, ID extends Number> implements GenericService<T, ID> {

    GenericDao<T, ID> genericDao;

    public GenericServiceImpl(GenericDao<T, ID> genericDao) {
        this.genericDao = genericDao;
    }

    @Override
    public void create(T model) {
        genericDao.create(model);
    }

    @Override
    public void remove(ID id) {
        genericDao.remove(id);
    }

    @Override
    public void modify(T model) {
        genericDao.modify(model);
    }

    @Override
    public T queryById(ID id) {
        return genericDao.queryById(id);
    }

    @Override
    public List<T> list() {
        return genericDao.list();
    }

    @Override
    public T query(String statement, Object parameter) {
        return genericDao.query(statement, parameter);
    }

    @Override
    public List<T> queryList(String statement, Object parameter) {
        return genericDao.queryList(statement, parameter);
    }
}
