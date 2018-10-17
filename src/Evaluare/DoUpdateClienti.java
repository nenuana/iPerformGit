package Evaluare;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.Inet4Address;
import java.net.Inet6Address;
import java.net.InetAddress;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@WebServlet(
        urlPatterns = {"/doUpdateClienti"}
)
public class DoUpdateClienti extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DoUpdateClienti() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getRequestURI();
        if (!path.startsWith("/favicon.ico")) {
            String userIp = request.getRemoteAddr();
            InetAddress address = InetAddress.getByName(userIp);
            if (address instanceof Inet6Address) {
                userIp = userIp.substring(0, userIp.indexOf(":", userIp.indexOf(":") + 1)) + ":*:*:*:*:*:*";
            } else if (address instanceof Inet4Address) {
                userIp = userIp.substring(0, userIp.indexOf(".", userIp.indexOf(".") + 1)) + ".*.*";
            }

            response.setContentType("text/html");
            String url;
            if (System.getProperty("com.google.appengine.runtime.version").startsWith("Google App Engine/")) {
                url = System.getProperty("ae-cloudsql.cloudsql-database-url");

                try {
                    Class.forName("com.mysql.jdbc.GoogleDriver");
                } catch (ClassNotFoundException var99) {
                    throw new ServletException("Error loading Google JDBC Driver", var99);
                }
            } else {
                url = System.getProperty("ae-cloudsql.local-database-url");
            }

            this.log("connecting to: " + url);
            Connection conn = null;

            try {
                conn = DriverManager.getConnection(url);
            } catch (SQLException var98) {
                var98.printStackTrace();
                this.log("nu s-a conectat");
            }


            try {
                conn = DriverManager.getConnection(url);
            } catch (SQLException var235) {
                var235.printStackTrace();
                this.log("nu s-a conectat");
                System.out.println(var235);
            }





            try {
                HttpSession session = request.getSession(true);

                //merge doar in cazul lui n


                String email = (String)session.getAttribute("email");



                Integer employee_pk = null;

                employee_pk = DBUtilis.findempecode(conn,email);
                System.out.println("employee_pk");
                System.out.println(employee_pk);
                String objective_name_clienti = request.getParameter("OBJECTIVE_NAME_CLIENTI");

                System.out.println("obclienti");
                System.out.println(objective_name_clienti);

                String marcastring = request.getParameter("marca");
                Integer marca = Integer.parseInt(marcastring);
                List<ObiectiveCentrala> id = null;
                ArrayList iduri = new ArrayList();
                try {
                    id =  DBUtilis.obiectiveclientinume(conn,marca,objective_name_clienti);
                    Iterator<ObiectiveCentrala> j = id.iterator();
                    while (j.hasNext()) {
                        ObiectiveCentrala jj = (ObiectiveCentrala) (j.next());
                        String ID = String.valueOf(jj.getID());
                        iduri.add(ID);
                        System.out.println("last_name" + ID);

                    }

                } catch (SQLException e) {
                    e.printStackTrace();
                }





                String objective_description = request.getParameter("OBJECTIVE_DESCRIPTION_CLIENTI" + iduri.get(0).toString());
                String OBJECTIVE_TARGET_DOUBLE = request.getParameter("OBJECTIVE_TARGET_CLIENTI"+ iduri.get(0).toString());

                double objective_target =  Double.parseDouble(OBJECTIVE_TARGET_DOUBLE);
                System.out.println("OBJ TARGET double" + objective_target);
                String RESULT_VALUE_DOUBLE = request.getParameter("RESULT_VALUE_CLIENTI"+ iduri.get(0).toString());
                double result_value = Double.parseDouble(RESULT_VALUE_DOUBLE);
                String SATISFACTION_RATE_DOUBLE = request.getParameter("procentq1clienti"+ iduri.get(0).toString());
                double satisfaction_rate= Double.parseDouble(SATISFACTION_RATE_DOUBLE);
                String OBJECTIVE_NAME_CLIENTI = request.getParameter("OBJECTIVE_NAME_CLIENTI"+ iduri.get(0).toString());
                String errorString = null;
                ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala();
                obiectiveCentrala.setOBJECTIVE_TARGET(objective_target);

                obiectiveCentrala.setOBJECTIVE_DESCRIPTION(objective_description);
                obiectiveCentrala.setRESULT_VALUE(result_value);
                obiectiveCentrala.setOBJECTIVE_NAME(OBJECTIVE_NAME_CLIENTI);
                obiectiveCentrala.setSATISFACTION_RATE(satisfaction_rate);


                String objective_description2 = request.getParameter("OBJECTIVE_DESCRIPTION_CLIENTI"+ iduri.get(1).toString());
                String OBJECTIVE_TARGET_DOUBLE2 = request.getParameter("OBJECTIVE_TARGET_CLIENTI"+ iduri.get(1).toString());
                double objective_target2 =  Double.parseDouble(OBJECTIVE_TARGET_DOUBLE2);
                String RESULT_VALUE_DOUBLE2 = request.getParameter("RESULT_VALUE_CLIENTI"+ iduri.get(1).toString());
                double result_value2 = Double.parseDouble(RESULT_VALUE_DOUBLE2);
                String SATISFACTION_RATE_DOUBLE2 = request.getParameter("procentq1clienti"+ iduri.get(1).toString());
                double satisfaction_rate2= Double.parseDouble(SATISFACTION_RATE_DOUBLE2);
                String OBJECTIVE_NAME_CLIENTI2 = request.getParameter("OBJECTIVE_NAME_CLIENTI"+ iduri.get(1).toString());

                ObiectiveCentrala obiectiveCentrala2 = new ObiectiveCentrala();
                obiectiveCentrala2.setOBJECTIVE_TARGET(objective_target2);

                obiectiveCentrala2.setOBJECTIVE_DESCRIPTION(objective_description2);
                obiectiveCentrala2.setRESULT_VALUE(result_value2);
                obiectiveCentrala2.setSATISFACTION_RATE(satisfaction_rate2);
                obiectiveCentrala2.setOBJECTIVE_NAME(OBJECTIVE_NAME_CLIENTI2);



                String objective_description3 = request.getParameter("OBJECTIVE_DESCRIPTION_CLIENTI" + iduri.get(2).toString());
                String OBJECTIVE_TARGET_DOUBLE3 = request.getParameter("OBJECTIVE_TARGET_CLIENTI"+ iduri.get(2).toString());
                System.out.println("OBJ TARGET CLIENTI3" + OBJECTIVE_TARGET_DOUBLE3);
                double objective_target3 =  Double.parseDouble(OBJECTIVE_TARGET_DOUBLE3);
                System.out.println("OBJ TARGET double3" + objective_target3);
                String RESULT_VALUE_DOUBLE3 = request.getParameter("RESULT_VALUE_CLIENTI"+ iduri.get(2).toString());
                double result_value3 = Double.parseDouble(RESULT_VALUE_DOUBLE3);
                String OBJECTIVE_NAME_CLIENTI3 = request.getParameter("OBJECTIVE_NAME_CLIENTI"+ iduri.get(2).toString());
                String SATISFACTION_RATE_DOUBLE3 = request.getParameter("procentq1clienti"+ iduri.get(2).toString());
                double satisfaction_rate3= Double.parseDouble(SATISFACTION_RATE_DOUBLE3);

                ObiectiveCentrala obiectiveCentrala3 = new ObiectiveCentrala();
                obiectiveCentrala3.setOBJECTIVE_TARGET(objective_target3);
                obiectiveCentrala3.setSATISFACTION_RATE(satisfaction_rate3);
                obiectiveCentrala3.setOBJECTIVE_DESCRIPTION(objective_description3);
                obiectiveCentrala3.setRESULT_VALUE(result_value3);
                obiectiveCentrala3.setOBJECTIVE_NAME(OBJECTIVE_NAME_CLIENTI3);


                String objective_description4 = request.getParameter("OBJECTIVE_DESCRIPTION_CLIENTI"+ iduri.get(3).toString());
                String OBJECTIVE_TARGET_DOUBLE4 = request.getParameter("OBJECTIVE_TARGET_CLIENTI"+ iduri.get(3).toString());
                double objective_target4 =  Double.parseDouble(OBJECTIVE_TARGET_DOUBLE4);
                String RESULT_VALUE_DOUBLE4 = request.getParameter("RESULT_VALUE_CLIENTI"+ iduri.get(3).toString());
                double result_value4 = Double.parseDouble(RESULT_VALUE_DOUBLE4);
                String OBJECTIVE_NAME_CLIENTI4 = request.getParameter("OBJECTIVE_NAME_CLIENTI"+ iduri.get(3).toString());
                String SATISFACTION_RATE_DOUBLE4 = request.getParameter("procentq1clienti"+ iduri.get(3).toString());
                double satisfaction_rate4= Double.parseDouble(SATISFACTION_RATE_DOUBLE4);

                ObiectiveCentrala obiectiveCentrala4 = new ObiectiveCentrala();
                obiectiveCentrala4.setOBJECTIVE_TARGET(objective_target4);

                obiectiveCentrala4.setOBJECTIVE_DESCRIPTION(objective_description4);
                obiectiveCentrala4.setRESULT_VALUE(result_value4);
                obiectiveCentrala4.setOBJECTIVE_NAME(OBJECTIVE_NAME_CLIENTI4);
                obiectiveCentrala4.setSATISFACTION_RATE(satisfaction_rate4);



                String idp = request.getParameter(iduri.get(0).toString());
                String idp2 = request.getParameter(iduri.get(1).toString());

                String idp3 = request.getParameter(iduri.get(2).toString());
                String idp4 = request.getParameter(iduri.get(3).toString());
                System.out.println("cod" + idp);
                System.out.println("cod2" + idp2);
                int IDC = Integer.parseInt(idp);
                int IDC2 = Integer.parseInt(idp2);

                System.out.println("cod3" + idp3);
                System.out.println("cod4" + idp4);
                int IDC3 = Integer.parseInt(idp3);
                int IDC4 = Integer.parseInt(idp4);




                try {

                    DBUtilis.updateClienti(conn,obiectiveCentrala,marca,IDC);
                    DBUtilis.updateClienti(conn,obiectiveCentrala2,marca,IDC2);
                    DBUtilis.updateClienti(conn,obiectiveCentrala3,marca,IDC3);
                    DBUtilis.updateClienti(conn,obiectiveCentrala4,marca,IDC4);
                    System.out.println("s-a intregistrat");
                } catch (SQLException var95) {
                    var95.printStackTrace();
                    errorString = var95.getMessage();
                    System.out.println(errorString);
                }

                session.setAttribute("IDC",IDC);


                session.setAttribute("objective_name_clienti",objective_name_clienti);




                String w = request.getParameter("w");
                session.setAttribute("w",w);
                System.out.println(w);
                //RequestDispatcher dispatcher = request.getRequestDispatcher("/perspective" + w);
                response.sendRedirect(request.getContextPath() + "/perspective" + w);


               // RequestDispatcher dispatcher = request.getRequestDispatcher("/perspective");
               // dispatcher.forward(request, response);


                conn.close();
            } catch (Exception var234) {
                response.sendRedirect("index.jsp");
                throw new RuntimeException(var234);
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
