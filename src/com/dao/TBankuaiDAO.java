package com.dao;

import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TBankuai;

/**
 * Data access object (DAO) for domain model class TBankuai.
 * 
 * @see com.model.TBankuai
 * @author MyEclipse Persistence Tools
 */

public class TBankuaiDAO extends HibernateDaoSupport
{
	private static final Log log = LogFactory.getLog(TBankuaiDAO.class);

	// property constants
	public static final String NAME = "name";


	public static final String DEL = "del";

	protected void initDao()
	{
		// do nothing
	}

	public void save(TBankuai transientInstance)
	{
		log.debug("saving TBankuai instance");
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

	public void delete(TBankuai persistentInstance)
	{
		log.debug("deleting TBankuai instance");
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

	public TBankuai findById(java.lang.Integer id)
	{
		log.debug("getting TBankuai instance with id: " + id);
		try
		{
			TBankuai instance = (TBankuai) getHibernateTemplate().get(
					"com.model.TBankuai", id);
			return instance;
		} catch (RuntimeException re)
		{
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(TBankuai instance)
	{
		log.debug("finding TBankuai instance by example");
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
		log.debug("finding TBankuai instance with property: " + propertyName
				+ ", value: " + value);
		try
		{
			String queryString = "from TBankuai as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re)
		{
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByName(Object name)
	{
		return findByProperty(NAME, name);
	}


	public List findByDel(Object del)
	{
		return findByProperty(DEL, del);
	}

	public List findAll()
	{
		log.debug("finding all TBankuai instances");
		try
		{
			String queryString = "from TBankuai";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re)
		{
			log.error("find all failed", re);
			throw re;
		}
	}

	public TBankuai merge(TBankuai detachedInstance)
	{
		log.debug("merging TBankuai instance");
		try
		{
			TBankuai result = (TBankuai) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re)
		{
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(TBankuai instance)
	{
		log.debug("attaching dirty TBankuai instance");
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

	public void attachClean(TBankuai instance)
	{
		log.debug("attaching clean TBankuai instance");
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

	public static TBankuaiDAO getFromApplicationContext(ApplicationContext ctx)
	{
		return (TBankuaiDAO) ctx.getBean("TBankuaiDAO");
	}
}