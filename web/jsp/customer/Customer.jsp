<%@ page contentType="text/html; charset=UTF-8" import="java.util.*, com.development.hibernate.city.*, com.development.hibernate.customer.*" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>

<%!
    private Customer customer = new Customer();
    private String emailone, emailtwo, emailthree;
    private CustomerDAO customerDao = new CustomerDAO();
    private EmailDAO emailDao = new EmailDAO();
    private List<Customer> customerList = new ArrayList<Customer>();
%>

<%
    customerList = customerDao.findAll();
    request.getSession().setAttribute("list", customerList);

    String editFlag = request.getParameter("editFlag");
    String deleteFlag = request.getParameter("deleteFlag");
    String submit = (request.getParameter("btnSubmit")!= null ? request.getParameter("btnSubmit") : "");

    if(submit.equals("Save")){
        Customer customerForSave = new Customer();

        if(editFlag!= null && editFlag.equals("Y")){
            customerForSave.setCustomerid(Integer.parseInt(request.getParameter("customerid")));
        }
        customerForSave.setCustomername(request.getParameter("customername"));
        customerForSave.setCustomeraddress(request.getParameter("customeraddress"));
        customerForSave.setCustomercity(request.getParameter("customercity"));
        customerForSave.setCustomercountry(request.getParameter("customercountry"));
        customerForSave.setCustomerfax(request.getParameter("customerfax"));
        customerForSave.setCustomermobile(request.getParameter("customermobile"));
        customerForSave.setCustomerstate(request.getParameter("customerstate"));
        customerForSave.setCustomertelephone(request.getParameter("customertelephone"));
        customerForSave.getEmails().add(new Email(customerForSave, request.getParameter("emailone")));
        customerForSave.getEmails().add(new Email(customerForSave, request.getParameter("emailtwo")));
        customerForSave.getEmails().add(new Email(customerForSave, request.getParameter("emailthree")));

        if (editFlag != null && editFlag.equals("Y")) {
            emailDao.deleteAll(Integer.parseInt(request.getParameter("customerid")));
            customerDao.update(customerForSave);
        }
        else {
            customerDao.save(customerForSave);
        }

        editFlag = "";

        response.sendRedirect("Customer.jsp");
    }

    if(editFlag!= null && editFlag.equals("Y")){
        customer = new Customer();
        customer = customerDao.findByCustomerCode(Integer.parseInt(request.getParameter("customerid")));

        Set<Email> emails = customer.getEmails();
        String[] mailArray = new String[3];
        int count = 0;

        if (!emails.isEmpty()) {
            for (Email mail : emails) {
                if (mail.getEmail() != null && !mail.getEmail().equals("")) {
                    mailArray[count] = mail.getEmail();
                }
                else {
                    mailArray[count] = "";
                }
                count++;
            }
        }
        emailone = mailArray[0];
        emailtwo = mailArray[1];
        emailthree = mailArray[2];
    }

    if(deleteFlag!= null && deleteFlag.equals("Y")){
        Customer customerForDelete = customerDao.findByCustomerCode(Integer.parseInt(request.getParameter("customerid")));
        customerDao.delete(customerForDelete);

        response.sendRedirect("Customer.jsp");
    }
%>
<html>
    <head>
        <title>Customer Database</title>
        <script language="JavaScript" type="text/JavaScript" src="../../javaScript/ajax/jquery2.js"></script>
        <script language="JavaScript" type="text/JavaScript" src="../../javaScript/customer/customer.js"></script>
        <link href="../../css/stylesheet.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <div id="header"></div>
        <form name="frmCustomerDatabase" method="post">
            <input type="hidden" name="customerid" value="<%=(customer.getCustomerid() != null ? customer.getCustomerid() : "")%>" />
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td valign="top" align="left" class="spanHeader">
                                    <span>Customer Database</span>
                                </td>
                                <td class="treb13blacknormal" valign="top" align="right">
                                    It is mandatory to enter information in all information <br>capture boxes which have a <span class="mandatory">*</span> adjacent
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr align="left" valign="top">
                    <td height="20" style="background:url('../../images/hr.jpg') repeat-x;">&nbsp;</td>
                </tr>
                <tr align="left" valign="top">
                    <td>
                        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="Arial13BrownB" colspan="2" align="left">
                                                <br />Name<br /><br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Customer Name<span class="mandatory">*</span>:
                                            </td>
                                            <td>
                                                <input type="text" name="customername" value="<%=(customer.getCustomername() != null ? customer.getCustomername() : "")%>" title="Enter the customer name" maxLength="48" size="55"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Arial13BrownB" colspan="2" align="left">
                                                <br />Mailing Address<br /><br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Address:
                                            </td>
                                            <td>
                                                <input type="text" name="customeraddress" value="<%=(customer.getCustomeraddress() != null ? customer.getCustomeraddress() : "")%>" title="Enter the street address" maxLength="148" size="55"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Country:
                                            </td>
                                            <td>
                                                <select id="SaveCustomer_customer_customercountry" name="customercountry" onchange="getStateList()">
                                                    <option value="">-- Please Select --</option>
                                                        <%
                                                            String code = "";
                                                            String name = "";
                                                            CountryDAO countryDao = new CountryDAO();
                                                            List<Country> countryList = countryDao.findAll();
                                                            for (Country country : countryList) {
                                                                code = country.getCountrycode().toString();
                                                                name = country.getCountryname();
                                                        %>
                                                    <option value="<%=code%>"><%=name%></option>
                                                        <%
                                                            }
                                                        %>
                                                </select>
                                                <script>
                                                    document.frmCustomerDatabase.customercountry.value = "<%=(customer.getCustomercountry() != null ? customer.getCustomercountry() : "")%>";
                                                </script>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                State:
                                            </td>
                                            <td>
                                                <select id="SaveCustomer_customer_customerstate" name="customerstate" onchange="getCityList()">
                                                    <option value="">-- Please Select --</option>
                                                </select>
                                                <script>
                                                    <%
                                                        if(customer.getCustomerstate() != null) {
                                                    %>
                                                            getStateList();
                                                    <%
                                                        }
                                                    %>
                                                    document.frmCustomerDatabase.customerstate.value = "<%=(customer.getCustomerstate() != null ? customer.getCustomerstate() : "")%>";
                                                </script>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                City:
                                            </td>
                                            <td>
                                                <select id="SaveCustomer_customer_customercity" name="customercity" >
                                                    <option value="">-- Please Select --</option>
                                                </select>
                                                <script>
                                                    <%
                                                      if(customer.getCustomerstate() != null) {
                                                    %>
                                                        getCityList();
                                                    <%
                                                      }
                                                    %>
                                                    document.frmCustomerDatabase.customercity.value = "<%=(customer.getCustomercity() != null ? customer.getCustomercity() : "")%>";
                                                </script>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Arial13BrownB" colspan="2" align="left">
                                                <br />Contact Details<br /><br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Mobile Number:
                                            </td>
                                            <td>
                                                <input type="text" name="customermobile" value="<%=(customer.getCustomermobile() != null ? customer.getCustomermobile() : "")%>" title="Enter the mobile number" maxlength="9" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Telephone Number<span class="mandatory">*</span>:
                                            </td>
                                            <td>
                                                <input type="text" name="customertelephone" value="<%=(customer.getCustomertelephone() != null ? customer.getCustomertelephone() : "")%>" title="Enter the telephone number" maxlength="14" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Fax Number:
                                            </td>
                                            <td>
                                                <input type="text" name="customerfax" value="<%=(customer.getCustomerfax() != null ? customer.getCustomerfax() : "")%>" title="Enter the fax number" maxlength="14" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Arial13BrownB" colspan="2" align="left">
                                                <br />Email<br /><br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                First Email Address<span class="mandatory">*</span>:
                                            </td>
                                            <td>
                                                <input type="text" name="emailone" value="<%=(emailone != null ? emailone : "")%>" title="Enter the first email address" maxlength="73"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Second Email Address:
                                            </td>
                                            <td>
                                                <input type="text" name="emailtwo" value="<%=(emailtwo != null ? emailtwo : "")%>" title="Enter the second email address" maxlength="73"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Third Email Address:
                                            </td>
                                            <td>
                                                <input type="text" name="emailthree" value="<%=(emailthree != null ? emailthree : "")%>" title="Enter the third email address" maxlength="73"/>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="submit" style="background:url(../../images/submit_bg.gif) no-repeat scroll 37px 0px;" class="buttonText" name="btnSubmit" value="Save" />
                                </td>
                                <td>
                                    <input type="reset" style="background:url(../../images/submit_bg.gif) no-repeat scroll 37px 0px;" class="buttonText" name="btnReset" value="Clear" onclick="javascript:document.location.href='Customer.jsp'" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr align="left" valign="top">
                    <td height="20" style="background:url('../../images/hr.jpg') repeat-x;">&nbsp;</td>
                </tr>
            </table>

            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <display:table name="sessionScope.list" pagesize="5"
                               excludedParams="*" export="true" cellpadding="0"
                               cellspacing="0"
                               requestURI="">
                    <display:column property="customername" title="Customer Name" maxLength="35" headerClass="gridheader" class="griddata" style="width:30%" sortable="true"/>
                    <display:column property="customeraddress" title="Address" maxLength="35" headerClass="gridheader" class="griddata" style="width:50%"/>
                    <display:column property="customermobile" title="Mobile" headerClass="gridheader" class="griddata" style="width:15%"/>
                    <display:column paramId="customerid" paramProperty="customerid" href="../../jsp/customer/Customer.jsp?editFlag=Y" headerClass="gridheader" class="griddata" media="html">
                        <img align="right" src="../../images/edit.jpg" border="0" alt="Edit" style="cursor:pointer;"/>
                    </display:column>
                    <display:column paramId="customerid" paramProperty="customerid" href="../../jsp/customer/Customer.jsp?deleteFlag=Y" headerClass="gridheader" class="griddata" media="html">
                        <img align="left" src="../../images/TrashIcon.png" border="0" alt="Delete" style="cursor:pointer;"/>
                    </display:column>
                </display:table>
            </table>
        </form>
        <jsp:include page="../../jsp/footer.jsp" />
        <%
            customer = new Customer();
            emailone = "";
            emailtwo = "";
            emailthree = "";
        %>
    </body>
</html>