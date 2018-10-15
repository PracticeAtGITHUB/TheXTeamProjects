package com.development.hibernate.city;

import java.util.HashSet;
import java.util.Set;

public class State  implements java.io.Serializable {
     private Integer statecode;
     private Country country;
     private String statename;
     private Set<City> cities = new HashSet<City>(0);

    public State() {
    }

    public State(Country country, String statename, Set<City> cities) {
       this.country = country;
       this.statename = statename;
       this.cities = cities;
    }
   
    public Integer getStatecode() {
        return this.statecode;
    }    
    public void setStatecode(Integer statecode) {
        this.statecode = statecode;
    }
    public Country getCountry() {
        return this.country;
    }    
    public void setCountry(Country country) {
        this.country = country;
    }

    public String getStatename() {
        return this.statename;
    }    
    public void setStatename(String statename) {
        this.statename = statename;
    }

    public Set<City> getCities() {
        return this.cities;
    }    
    public void setCities(Set<City> cities) {
        this.cities = cities;
    }
}


