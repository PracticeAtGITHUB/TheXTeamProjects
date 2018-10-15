package com.development.utils;

import org.hibernate.Session;

public interface IBaseHibernateDAO {
	public Session getSession();
}