package com.development.servlet;

import com.development.hibernate.city.State;
import com.development.hibernate.city.StateDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetStateList extends HttpServlet {
    private String outstr = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String searchValue = request.getParameter("searchValue");

        if (searchValue.length() > 0) {
            List<State> stateList = null;
            StateDAO stateDao = new StateDAO();

            try {
                stateList = stateDao.findByCountryCode(Integer.parseInt(searchValue));

                if (stateList != null && !stateList.isEmpty()) {
                    outstr = "";
                    for (State state : stateList) {
                        Integer val = state.getStatecode();
                        String str = state.getStatename();

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