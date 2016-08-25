package demo.dao.impl;

import demo.dao.GenericDao;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

/**
 * Created by mingfei.net@gmail.com
 * 2016-08-23 09:40
 */
class GenericDaoImpl<T extends Serializable, ID extends Number> implements GenericDao<T, ID> {

    private String namespace;

    @Autowired
    private SqlSession sqlSession;

    @SuppressWarnings("unchecked")
    GenericDaoImpl() {
        Class<T> clazz = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
        namespace = clazz.getSimpleName().toLowerCase().concat(".");
    }

    @Override
    public void create(T model) {
        sqlSession.insert(namespace.concat("create"), model);
    }

    @Override
    public void remove(ID id) {
        sqlSession.delete(namespace.concat("remove"), id);
    }

    @Override
    public void modify(T model) {
        sqlSession.update(namespace.concat("modify"), model);
    }

    @Override
    public T queryById(ID id) {
        return sqlSession.selectOne(namespace.concat("queryById"), id);
    }

    @Override
    public List<T> list() {
        return sqlSession.selectList(namespace.concat("list"));
    }

    @Override
    public T query(String statement, Object parameter) {
        return sqlSession.selectOne(statement, parameter);
    }

    @Override
    public List<T> queryList(String statement, Object parameter) {
        return sqlSession.selectList(statement, parameter);
    }
}
