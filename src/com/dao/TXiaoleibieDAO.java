package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TXiaoleibie;

/**
 * Data access object (DAO) for domain model class TXiaoleibie.
 * 
 * @see com.model.TXiaoleibie
 * @author MyEclipse Persistence Tools
 */

public class TXiaoleibieDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TXiaoleibieDAO.class);

	protected void initDao()
	{
		// do nothing
	}

	public void save(TXiaoleibie transientInstance)
	{
		log.debug("saving TXiaoleibie instance");
		try
		{
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re)
		{
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TXiaoleibie persistentInstance)
	{
		log.debug("deleting TXiaoleibie instance");
		try
		{
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re)
		{
			log.error("delete failed", re);
			throw re;
		}
	}

	public TXiaoleibie findById(java.lang.Integer id)
	{
		log.debug("getting TXiaoleibie instance with id: " + id);
		try
		{
			TXiaoleibie instance = (TXiaoleibie) getHibernateTemplate().get(
					"com.model.TXiaoleibie", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TXiaoleibie instance)
	{
		log.debug("finding TXiaoleibie instance by example");
		try
		{
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re)
		{
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value)
	{
		log.debug("finding TXiaoleibie instance with property: " + propertyName
				+ ", value: " + value);
		try
		{
			String queryString = "from TXiaoleibie as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re)
		{
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll()
	{
		log.debug("finding all TXiaoleibie instances");
		try
		{
			String queryString = "from TXiaoleibie";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TXiaoleibie merge(TXiaoleibie detachedInstance)
	{
		log.debug("merging TXiaoleibie instance");
		try
		{
			TXiaoleibie result = (TXiaoleibie) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TXiaoleibie instance)
	{
		log.debug("attaching dirty TXiaoleibie instance");
		try
		{
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re)
		{
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(TXiaoleibie instance)
	{
		log.debug("attaching clean TXiaoleibie instance");
		try
		{
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re)
		{
			log.error("attach failed", re);
			throw re;
		}
	}

	public static TXiaoleibieDAO getFromApplicationContext(
			ApplicationContext ctx)
	{
		return (TXiaoleibieDAO) ctx.getBean("TXiaoleibieDAO");
	}
}