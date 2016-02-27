package cn.edu.pku.search.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import cn.edu.pku.search.domain.MatchRecruitment;
import cn.edu.pku.search.domain.Relevance;
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
	public long getRecruitmentNumber(long employeeId) {
		Query query = this.getSession().createQuery(
				"select count(*) from Relevance where employeeId=?");
		query.setParameter(0, employeeId);
		return ((Number)query.uniqueResult()).longValue();
	}

	@Override
	public List<MatchRecruitment> listMatchRecruitment(long employeeId,
			int offset) {
		Query query = this.getSession().createQuery(
						"select new cn.edu.pku.search.domain.MatchRecruitment (rel.employeeId,rel.relevance,rec) "
								+ "from Relevance rel, RecruitmentBBS rec where employeeId=? and rel.recruitmentId = rec.id order by relevance desc");
		query.setParameter(0, employeeId);
		query.setFirstResult(offset);
		query.setMaxResults(SystemContext.getSize());
		return query.list();
	}

}
