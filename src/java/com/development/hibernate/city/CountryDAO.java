package com.development.hibernate.city;

import com.development.utils.BaseDAO;
import java.util.List;

public class CountryDAO extends BaseDAO {
    public void save(Country country) {
        try {
            beginTransaction();
            getSession().save(country);
            commitTransaction();
        }
        catch (RuntimeException re) {
            re.printStackTrace();
            throw re;
        }
    }

    public List<Country> findAll() {
        beginTransaction();
        List<Country> list = getSession().createQuery("from Country").list();
        commitTransaction();
        return list;
    }
}