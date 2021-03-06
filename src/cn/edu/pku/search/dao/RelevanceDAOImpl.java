package cn.edu.pku.search.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import cn.edu.pku.search.domain.Relevance;
import cn.edu.pku.user.domain.EmployeeTag;
import cn.edu.pku.util.SystemContext;

@Repository
public class RelevanceDAOImpl extends HibernateDaoSupport implements
		RelevanceDAO {

	@Resource
	public void setSuperSessionFactory(SessionFactory sessionFactory) {
		this.setSessionFactory(sessionFactory);
	}

	@Override
	public void update(Relevance relevance) {
		this.getHibernateTemplate().saveOrUpdate(relevance);
	}

	@Override
	public long getPositionNumber(long employeeId) {
		Query query = this.getSession().createQuery(
				"select count(*) from Relevance where employeeId=?");
		query.setParameter(0, employeeId);
		return ((Number) query.uniqueResult()).longValue();
	}

	@Override
	public long getResumeNumber(long positionId) {
		Query query = this.getSession().createQuery(
				"select count(*) from Relevance where positionId=?");
		query.setParameter(0, positionId);
		return ((Number) query.uniqueResult()).longValue();
	}

	@Override
	public List<Relevance> listRelevanceForEmployer(long positionId,
			int offset) {
		Query query = this.getSession().createQuery(
				"from Relevance where positionId=? order by relevance desc");
		query.setParameter(0, positionId);
		query.setFirstResult(offset);
		query.setMaxResults(SystemContext.getSize());
		return query.list();
	}

	@Override
	public List<Relevance> listRelevanceForEmployee(long employeeId, int offset) {
		Query query = this.getSession().createQuery(
				"from Relevance where employeeId=? order by relevance desc");
		query.setParameter(0, employeeId);
		query.setFirstResult(offset);
		query.setMaxResults(SystemContext.getSize());
		return query.list();
	}

	@Override
	public List<Relevance> listRelevanceForEmployee(long employeeId) {
		Query query = this.getSession().createQuery(
				"from Relevance where employeeId=? order by relevance desc");
		query.setParameter(0, employeeId);
		query.setFirstResult(0);
		return query.list();
	}

	@Override
	public void deleteRelevanceByEmployeeId(Long employeeId) {
		// TODO Auto-generated method stub
		List<Relevance> list = this.listRelevanceForEmployee(employeeId);
		for (Relevance rel : list) {
			this.delete(rel);
		}
	}

	@Override
	public void delete(Relevance relevance) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().delete(relevance);
	}
}
