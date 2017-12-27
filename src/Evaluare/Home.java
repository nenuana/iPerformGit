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

@WebServlet(
        urlPatterns = {"/home"}
)
public class Home extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Home() {
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
                System.out.println(var235);
            }





            try {
                HttpSession session = request.getSession(true);
                String email = (String)session.getAttribute("email");

                String Name = (String)session.getAttribute("Name");
                String poza = (String)session.getAttribute("poza");
                String emailechipa = (String) session.getAttribute("emailechipa");
                System.out.println("email");
                System.out.println(email);
                Integer employee_pk = null;

                employee_pk = DBUtilis.findempecode(conn,email);

                Integer verificare = DBUtilis.findemployee(conn,employee_pk);

                //testare
                String emailtest = "bogdan.hotea@raiffeisen.ro";
                String verifechipa = DBUtilis.verififsuperior(conn,emailtest);



                if (verificare == null) {

                    String integritate = "";
                    String pasiune = "";
                    String invatare = "";
                    String simplitate = "";
                    String colaborare = "";
                    String respect = "";
                    String discernamant = "";
                    Integer nota_integritate = 5;
                    Integer nota_pasiune = 5;
                    Integer nota_invatare = 5;
                    Integer nota_simplitate = 5;
                    Integer nota_colaborare = 5;
                    Integer nota_respect = 5;
                    Integer nota_discernamant = 5;


                    ValoriServlet valoriServlet = new ValoriServlet(employee_pk, integritate, pasiune, invatare, simplitate, colaborare, respect, discernamant, nota_integritate, nota_pasiune, nota_invatare, nota_simplitate, nota_colaborare, nota_respect, nota_discernamant);
                    String errorString = null;


                    try {
                        DBUtilis.insertValori(conn, valoriServlet);
                        System.out.print("s-a intregistrat cu succes");
                    } catch (SQLException var95) {
                        var95.printStackTrace();
                        errorString = var95.getMessage();
                        System.out.println(errorString);
                    }

                }
                request.setAttribute("verifechipa",verifechipa);
                request.setAttribute("emailechipa",emailechipa);

                RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
                dispatcher.forward(request, response);


                conn.close();
            } catch (Exception var234) {
                response.sendRedirect("/picturefail.jsp");
                throw new RuntimeException(var234);
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}

