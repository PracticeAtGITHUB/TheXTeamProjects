package com.development.servlet;

import com.development.hibernate.city.City;
import com.development.hibernate.city.CityDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetCityList extends HttpServlet {
    private String outstr = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String searchValue = request.getParameter("searchValue");

        if (searchValue.length() > 0) {
            List<City> cityList = null;
            CityDAO cityDao = new CityDAO();

            try {
                cityList = cityDao.findByStateCode(Integer.parseInt(searchValue));

                if (cityList != null && !cityList.isEmpty()) {
                    outstr = "";
                    for (City city : cityList) {
                        Integer val = city.getCitycode();
                        String str = city.getCityname();

                        if (outstr.length() == 0) {
                            outstr = val + "|" + str;
                        }
                        else {
                            outstr += "," + val + "|" + str;
                        }
                    }
                }
            }
            catch (Exception e) {
                e.printStackTrace();
            }

            out.print(outstr);
            out.flush();
            out.close();
        }
    }
}