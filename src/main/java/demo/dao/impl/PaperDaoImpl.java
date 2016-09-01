package demo.dao.impl;

import org.springframework.stereotype.Repository;

import demo.dao.PaperDao;
import demo.model.Paper;

@Repository
public class PaperDaoImpl extends GenericDaoImpl<Paper, Integer> implements PaperDao {
}