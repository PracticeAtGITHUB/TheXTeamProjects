package com.development.hibernate.customer;

import com.development.utils.BaseDAO;

public class EmailDAO extends BaseDAO {
    public void deleteAll(int customerid) {
        try {
            beginTransaction();
            getSession().createQuery("DELETE FROM Email WHERE customerid = :customerid")
                    .setInteger("customerid", customerid)
                    .executeUpdate();
            commitTransaction();
        }
        catch (RuntimeException re) {
            re.printStackTrace();
            throw re;
        }
    }
}