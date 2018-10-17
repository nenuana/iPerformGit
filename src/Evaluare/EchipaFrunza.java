package Evaluare;

import javax.servlet.RequestDispatcher;
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
        urlPatterns = {"/echipan"}
)
public class EchipaFrunza extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public EchipaFrunza() {
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
                } catch (ClassNotFoundException var236) {
                    throw new ServletException("Error loading Google JDBC Driver", var236);
                }
            } else {
                url = System.getProperty("ae-cloudsql.local-database-url");
            }

            this.log("connecting to: " + url);
            Connection conn = null;

            try {
                conn = DriverManager.getConnection(url);
            } catch (SQLException var235) {
                var235.printStackTrace();
                this.log("nu s-a conectat");
            }





            try {
                HttpSession session = request.getSession(true);
                String email = (String) session.getAttribute("email");
                String Name = (String) session.getAttribute("Name");
                String poza = (String) session.getAttribute("poza");

                //verificare
              //  String email = "raluca.corpacescu@raiffeisen.ro";
                System.out.println("email");
                System.out.println(email);

                String unit = DBUtilis.departament(conn,email);
                //testare
                String email_np1 = request.getParameter("emailechipa");
                String verifn2 = DBUtilis.verifnp2(conn,email);
                System.out.println("email");
                System.out.println(email);
                System.out.println("verificare");
                System.out.println(verifn2);

                List<Employee> list8 = null;
                ArrayList verificareEchipa = new ArrayList();
                String errorString = null;
                try {
                    list8 = DBUtilis.echipa(conn,email_np1);
                    Iterator j = list8.iterator();

                    while (j.hasNext()) {
                        echipaDetalii jj = (echipaDetalii) (j.next());
                        String emaill = String.valueOf(jj.getEmail());

                        System.out.println("emailechipa" + emaill);
                        List<Employee> list9 = null;
                        list9 = DBUtilis.echipa(conn,emaill);


                        Iterator m = list9.iterator();
                        Integer contor = 0;
                        while (m.hasNext()) {
                            echipaDetalii mm = (echipaDetalii) (m.next());
                            String emailechipa2 = String.valueOf(mm.getEmail());
                            if (emailechipa2 != null){
                                contor =1;
                            }

                            System.out.println("emailechipa2" + emailechipa2);
                        }
                        if (contor == 0){
                            verificareEchipa.add("Nu");

                        }
                        else {verificareEchipa.add("Da");

                        }

                    }
                    System.out.println("echipa frumza" + verificareEchipa);

                } catch (SQLException var233) {
                    var233.printStackTrace();
                    errorString = var233.getMessage();
                }




                if (errorString != null && list8 == null) {
                    response.sendRedirect(request.getServletPath() + "/home");
                } else {
                    request.setAttribute("list8", list8);
                    request.setAttribute("unit",unit);
                    request.setAttribute("verificareEchipa",verificareEchipa);
                    request.setAttribute("verifn2", verifn2);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("echipamea.jsp");
                    dispatcher.forward(request, response);


                    conn.close();
                }
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

