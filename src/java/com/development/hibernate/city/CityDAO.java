package com.development.hibernate.city;

import com.development.utils.BaseDAO;
import java.util.List;

public class CityDAO extends BaseDAO {
     public void save(City city) {
        try {
            beginTransaction();
            getSession().save(city);
            commitTransaction();
        }
        catch (RuntimeException re) {
            re.printStackTrace();
            throw re;
        }
    }

    public List<City> findAll() {
        beginTransaction();
        List<City> list = getSession().createQuery("from City").list();
        commitTransaction();
        return list;
    }

    public List<City> findByStateCode(Integer stateCode) {
        beginTransaction();
        List<City> list = getSession().createQuery("select c from City c where c.state.statecode = :stateCode")
                .setParameter("stateCode", stateCode)
                .list();
        commitTransaction();
        return list;
    }
}