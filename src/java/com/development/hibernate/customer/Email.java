package com.development.hibernate.customer;

public class Email  implements java.io.Serializable {
    private Integer emailid;
    private Customer customer;
    private String email;

    public Email() {
    }

    public Email(Customer customer, String email) {
       this.customer = customer;
       this.email = email;
    }
   
    public Integer getEmailid() {
        return this.emailid;
    }
    public void setEmailid(Integer emailid) {
        this.emailid = emailid;
    }

    public Customer getCustomer() {
        return this.customer;
    }
    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public String getEmail() {
        return this.email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
}