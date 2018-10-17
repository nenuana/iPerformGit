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
        urlPatterns = {"/doUpdateFinanciar"}
)
public class DoUpdateFinanciar extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DoUpdateFinanciar() {
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
                String objective_name = request.getParameter("OBJECTIVE_NAME");


                String marcastring = request.getParameter("marca");
                Integer marca = Integer.parseInt(marcastring);

                List<ObiectiveCentrala> id = null;
                ArrayList iduri = new ArrayList();
                try {
                    id =  DBUtilis.obiectivefinanciarnume(conn,marca,objective_name);
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





                String objective_description = request.getParameter("OBJECTIVE_DESCRIPTION" + iduri.get(0).toString());
                String OBJECTIVE_TARGET_DOUBLE = request.getParameter("OBJECTIVE_TARGET"+ iduri.get(0).toString());
                System.out.println("OBJ TARGET fin" + OBJECTIVE_TARGET_DOUBLE);
                double objective_target =  Double.parseDouble(OBJECTIVE_TARGET_DOUBLE);
                System.out.println("OBJ TARGET double" + objective_target);
                String RESULT_VALUE_DOUBLE = request.getParameter("RESULT_VALUE"+ iduri.get(0).toString());
                double result_value = Double.parseDouble(RESULT_VALUE_DOUBLE);
                String SATISFACTION_RATE_DOUBLE = request.getParameter("procentq1"+ iduri.get(0).toString());
                double satisfaction_rate= Double.parseDouble(SATISFACTION_RATE_DOUBLE);
                String OBJECTIVE_NAME = request.getParameter("OBJECTIVE_NAME"+ iduri.get(0).toString());
                System.out.println("string p1"+ SATISFACTION_RATE_DOUBLE );
                System.out.println("double p1"+ satisfaction_rate );
                String errorString = null;
                ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala();
                obiectiveCentrala.setOBJECTIVE_TARGET(objective_target);

                obiectiveCentrala.setOBJECTIVE_DESCRIPTION(objective_description);
                obiectiveCentrala.setRESULT_VALUE(result_value);
                obiectiveCentrala.setSATISFACTION_RATE(satisfaction_rate);
                obiectiveCentrala.setOBJECTIVE_NAME(OBJECTIVE_NAME);


                String objective_description2 = request.getParameter("OBJECTIVE_DESCRIPTION"+ iduri.get(1).toString());
                String OBJECTIVE_TARGET_DOUBLE2 = request.getParameter("OBJECTIVE_TARGET"+ iduri.get(1).toString());
                double objective_target2 =  Double.parseDouble(OBJECTIVE_TARGET_DOUBLE2);
                String RESULT_VALUE_DOUBLE2 = request.getParameter("RESULT_VALUE"+ iduri.get(1).toString());
                double result_value2 = Double.parseDouble(RESULT_VALUE_DOUBLE2);
                String SATISFACTION_RATE_DOUBLE2 = request.getParameter("procentq1"+ iduri.get(1).toString());
                double satisfaction_rate2= Double.parseDouble(SATISFACTION_RATE_DOUBLE2);
                String OBJECTIVE_NAME2 = request.getParameter("OBJECTIVE_NAME"+ iduri.get(1).toString());

                System.out.println("string p2"+ SATISFACTION_RATE_DOUBLE2 );
                System.out.println("double p2"+ satisfaction_rate2 );
                ObiectiveCentrala obiectiveCentrala2 = new ObiectiveCentrala();
                obiectiveCentrala2.setOBJECTIVE_TARGET(objective_target2);

                obiectiveCentrala2.setOBJECTIVE_DESCRIPTION(objective_description2);
                obiectiveCentrala2.setRESULT_VALUE(result_value2);
                obiectiveCentrala2.setSATISFACTION_RATE(satisfaction_rate2);
                obiectiveCentrala2.setOBJECTIVE_NAME(OBJECTIVE_NAME2);



                String objective_description3 = request.getParameter("OBJECTIVE_DESCRIPTION" + iduri.get(2).toString());
                String OBJECTIVE_TARGET_DOUBLE3 = request.getParameter("OBJECTIVE_TARGET"+ iduri.get(2).toString());

                double objective_target3 =  Double.parseDouble(OBJECTIVE_TARGET_DOUBLE3);

                String RESULT_VALUE_DOUBLE3 = request.getParameter("RESULT_VALUE"+ iduri.get(2).toString());
                double result_value3 = Double.parseDouble(RESULT_VALUE_DOUBLE3);
                String SATISFACTION_RATE_DOUBLE3 = request.getParameter("procentq1"+ iduri.get(2).toString());
                double satisfaction_rate3= Double.parseDouble(SATISFACTION_RATE_DOUBLE3);

                System.out.println("string p3"+ SATISFACTION_RATE_DOUBLE3 );
                System.out.println("double p3"+ satisfaction_rate3 );
                String OBJECTIVE_NAME3 = request.getParameter("OBJECTIVE_NAME"+ iduri.get(2).toString());

                ObiectiveCentrala obiectiveCentrala3 = new ObiectiveCentrala();
                obiectiveCentrala3.setOBJECTIVE_TARGET(objective_target3);

                obiectiveCentrala3.setOBJECTIVE_DESCRIPTION(objective_description3);
                obiectiveCentrala3.setRESULT_VALUE(result_value3);
                obiectiveCentrala3.setSATISFACTION_RATE(satisfaction_rate3);
                obiectiveCentrala3.setOBJECTIVE_NAME(OBJECTIVE_NAME3);


                String objective_description4 = request.getParameter("OBJECTIVE_DESCRIPTION"+ iduri.get(3).toString());
                String OBJECTIVE_TARGET_DOUBLE4 = request.getParameter("OBJECTIVE_TARGET"+ iduri.get(3).toString());
                double objective_target4 =  Double.parseDouble(OBJECTIVE_TARGET_DOUBLE4);
                String RESULT_VALUE_DOUBLE4 = request.getParameter("RESULT_VALUE"+ iduri.get(3).toString());
                double result_value4 = Double.parseDouble(RESULT_VALUE_DOUBLE4);
                String SATISFACTION_RATE_DOUBLE4 = request.getParameter("procentq1"+ iduri.get(3).toString());
                double satisfaction_rate4= Double.parseDouble(SATISFACTION_RATE_DOUBLE4);
                String OBJECTIVE_NAME4 = request.getParameter("OBJECTIVE_NAME"+ iduri.get(3).toString());

                ObiectiveCentrala obiectiveCentrala4 = new ObiectiveCentrala();
                obiectiveCentrala4.setOBJECTIVE_TARGET(objective_target4);

                obiectiveCentrala4.setOBJECTIVE_DESCRIPTION(objective_description4);
                obiectiveCentrala4.setRESULT_VALUE(result_value4);
                obiectiveCentrala4.setSATISFACTION_RATE(satisfaction_rate4);
                obiectiveCentrala4.setOBJECTIVE_NAME(OBJECTIVE_NAME4);



                String idp = request.getParameter(iduri.get(0).toString());
                String idp2 = request.getParameter(iduri.get(1).toString());

                String idp3 = request.getParameter(iduri.get(2).toString());
                String idp4 = request.getParameter(iduri.get(3).toString());
                System.out.println("cod" + idp);
                System.out.println("cod2" + idp2);
                int ID = Integer.parseInt(idp);
                int ID2 = Integer.parseInt(idp2);

                System.out.println("cod3" + idp3);
                System.out.println("cod4" + idp4);
                int ID3 = Integer.parseInt(idp3);
                int ID4 = Integer.parseInt(idp4);



                try {

                    DBUtilis.updateFinanciar(conn,obiectiveCentrala,marca,ID);
                    DBUtilis.updateFinanciar(conn,obiectiveCentrala2,marca,ID2);
                    DBUtilis.updateFinanciar(conn,obiectiveCentrala3,marca,ID3);
                    DBUtilis.updateFinanciar(conn,obiectiveCentrala4,marca,ID4);
                    System.out.println("s-a intregistrat");
                } catch (SQLException var95) {
                    var95.printStackTrace();
                    errorString = var95.getMessage();
                    System.out.println(errorString);
                }


                session.setAttribute("objective_name",objective_name);
                session.setAttribute("ID",ID);
                System.out.println("ID = " );
                System.out.println(ID);





                String w = request.getParameter("w");
                session.setAttribute("w",w);
                System.out.println(w);
                //RequestDispatcher dispatcher = request.getRequestDispatcher("/perspective" + w);
                response.sendRedirect(request.getContextPath() + "/perspective" + w);

              //  RequestDispatcher dispatcher = request.getRequestDispatcher("/perspective");
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
