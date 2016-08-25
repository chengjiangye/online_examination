package demo.dao.impl;

import org.springframework.stereotype.Repository;

import demo.dao.AdminDao;
import demo.model.Admin;

@Repository
public class AdminDaoImpl extends GenericDaoImpl<Admin, Integer> implements AdminDao {
}