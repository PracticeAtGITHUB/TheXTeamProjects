package com.development.hibernate.customer;

import com.development.utils.BaseDAO;
import java.util.List;

public class CustomerDAO extends BaseDAO {
    public void save(Customer customer) {
        try {
            beginTransaction();
            getSession().save(customer);
            commitTransaction();
        }
        catch (RuntimeException re) {
            re.printStackTrace();
            throw re;
        }
    }

    public void update(Customer customer) {
        try {
            beginTransaction();
            getSession().update(customer);
            commitTransaction();
        }
        catch (RuntimeException re) {
            re.printStackTrace();
            throw re;
        }
    }

    public void delete(Customer customer) {
        try {
            beginTransaction();
            getSession().delete(customer);
            commitTransaction();
        }
        catch (RuntimeException re) {
            re.printStackTrace();
            throw re;
        }
    }

    public List<Customer> findAll() {
        beginTransaction();
        List<Customer> list = getSession().createQuery("select c from Customer c").list();
        commitTransaction();
        return list;
    }

    public Customer findByCustomerCode(Integer customerCode) {
        beginTransaction();
        Customer customer = new Customer();
        customer = (Customer) getSession().load(Customer.class, customerCode);
        commitTransaction();
        return customer;
    }
}