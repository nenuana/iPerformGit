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

@WebServlet(
        urlPatterns = {"/doInsertEmployeeRam"}
)
public class doInsertEmployeeRam extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public doInsertEmployeeRam() {
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





                String OBJECTIVE_NAME_PROCESE= request.getParameter("numeobiectivprocese");
                String objective_description= request.getParameter("descriereprocese");
                String objective_target= request.getParameter("preconizatprocese");
                double preconizat = 0;
                try{
                    preconizat = Double.parseDouble(objective_target);
                }catch (Exception e){
                    System.out.println(e);
                }

                String rezult_value= request.getParameter("realizatprocese");
                double realizat = 0;
                try{
                    realizat = Double.parseDouble(rezult_value);
                }catch (Exception e){
                    System.out.println(e);
                }


                //  String updateprocese = "updateprocese";
                //  session.setAttribute("updateprocese",updateprocese);

                session.setAttribute("objective_name_procese",OBJECTIVE_NAME_PROCESE);
            //    ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala(realizat,SATISFACTIONRATE,RUNRATE,quarter,year,marcas,OBJECTIVE_NAME_PROCESE,objective_description,objectivezone,preconizat);


                String errorString = null;


              // try {
              //      DBUtilis.insertObiectiv(conn,obiectiveCentrala);
                    System.out.println("s-a intregistrat invatare");
              //  } catch (SQLException var95) {
                  //  var95.printStackTrace();
               //     errorString = var95.getMessage();
                  //  System.out.println(errorString);
               // }


                String w = request.getParameter("w");
                session.setAttribute("w",w);
                System.out.println(w);
                //RequestDispatcher dispatcher = request.getRequestDispatcher("/perspective" + w);
                response.sendRedirect(request.getContextPath() + "/perspective" + w);


                //  RequestDispatcher dispatcher = request.getRequestDispatcher("/perspective");
                //  dispatcher.forward(request, response);


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
