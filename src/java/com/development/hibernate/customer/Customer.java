package com.development.hibernate.customer;

import java.util.HashSet;
import java.util.Set;

public class Customer implements java.io.Serializable {
    private Integer customerid;
    private String customername;
    private String customeraddress;
    private String customercity;
    private String customerstate;
    private String customercountry;
    private String customermobile;
    private String customertelephone;
    private String customerfax;
    private Set<Email> emails = new HashSet<Email>(0);

    public Customer() {
    }

    public Customer(String customername, String customeraddress, String customercity, String customerstate, String customercountry, String customermobile, String customertelephone, String customerfax, Set<Email> emails) {
       this.customername = customername;
       this.customeraddress = customeraddress;
       this.customercity = customercity;
       this.customerstate = customerstate;
       this.customercountry = customercountry;
       this.customermobile = customermobile;
       this.customertelephone = customertelephone;
       this.customerfax = customerfax;
       this.emails = emails;
    }
   
    public Integer getCustomerid() {
        return this.customerid;
    }
    public void setCustomerid(Integer customerid) {
        this.customerid = customerid;
    }

    public String getCustomername() {
        return this.customername;
    }
    public void setCustomername(String customername) {
        this.customername = customername;
    }

    public String getCustomeraddress() {
        return this.customeraddress;
    }
    public void setCustomeraddress(String customeraddress) {
        this.customeraddress = customeraddress;
    }

    public String getCustomercity() {
        return this.customercity;
    }
    public void setCustomercity(String customercity) {
        this.customercity = customercity;
    }

    public String getCustomerstate() {
        return this.customerstate;
    }
    public void setCustomerstate(String customerstate) {
        this.customerstate = customerstate;
    }

    public String getCustomercountry() {
        return this.customercountry;
    }
    public void setCustomercountry(String customercountry) {
        this.customercountry = customercountry;
    }

    public String getCustomermobile() {
        return this.customermobile;
    }
    public void setCustomermobile(String customermobile) {
        this.customermobile = customermobile;
    }

    public String getCustomertelephone() {
        return this.customertelephone;
    }
    public void setCustomertelephone(String customertelephone) {
        this.customertelephone = customertelephone;
    }

    public String getCustomerfax() {
        return this.customerfax;
    }
    public void setCustomerfax(String customerfax) {
        this.customerfax = customerfax;
    }

    public Set<Email> getEmails() {
        return this.emails;
    }
    public void setEmails(Set<Email> emails) {
        this.emails = emails;
    }
}