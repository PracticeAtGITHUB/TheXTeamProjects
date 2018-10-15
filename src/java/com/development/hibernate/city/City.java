package com.development.hibernate.city;

public class City  implements java.io.Serializable {
     private Integer citycode;
     private State state;
     private String cityname;

    public City() {
    }

    public City(State state, String cityname) {
       this.state = state;
       this.cityname = cityname;
    }
   
    public Integer getCitycode() {
        return this.citycode;
    }    
    public void setCitycode(Integer citycode) {
        this.citycode = citycode;
    }
    public State getState() {
        return this.state;
    }    
    public void setState(State state) {
        this.state = state;
    }

    public String getCityname() {
        return this.cityname;
    }    
    public void setCityname(String cityname) {
        this.cityname = cityname;
    }
}


