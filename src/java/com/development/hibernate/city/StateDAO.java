package com.development.hibernate.city;

import com.development.utils.BaseDAO;
import java.util.List;

public class StateDAO extends BaseDAO {
    public void save(State state) {
        try {
            beginTransaction();
            getSession().save(state);
            commitTransaction();
        }
        catch (RuntimeException re) {
            re.printStackTrace();
            throw re;
        }
    }

    public List<State> findAll() {
        beginTransaction();
        List<State> list = getSession().createQuery("from State").list();
        commitTransaction();
        return list;
    }

    public List<State> findByCountryCode(Integer countryCode) {
        beginTransaction();
        List<State> list = getSession().createQuery("select s from State s where s.country.countrycode = :countryCode")
                .setParameter("countryCode", countryCode)
                .list();
        commitTransaction();
        return list;
    }
}