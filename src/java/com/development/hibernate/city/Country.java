package com.development.hibernate.city;

import java.util.HashSet;
import java.util.Set;

public class Country  implements java.io.Serializable {
     private Integer countrycode;
     private String countryname;
     private Set<State> states = new HashSet<State>(0);

    public Country() {
    }

    public Country(String countryname, Set<State> states) {
       this.countryname = countryname;
       this.states = states;
    }
   
    public Integer getCountrycode() {
        return this.countrycode;
    }    
    public void setCountrycode(Integer countrycode) {
        this.countrycode = countrycode;
    }
    public String getCountryname() {
        return this.countryname;
    }    
    public void setCountryname(String countryname) {
        this.countryname = countryname;
    }

    public Set<State> getStates() {
        return this.states;
    }    
    public void setStates(Set<State> states) {
        this.states = states;
    }
}


