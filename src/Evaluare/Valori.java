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
import java.util.List;

@WebServlet(
        urlPatterns = {"/valori"}
)
public class Valori extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Valori() {
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

                // email persoana logata
                 String email = (String)session.getAttribute("email");


                //testare
              //  email = "bogdan.pipernea@raiffeisen.ro";
              //  email = "andreea.todirica@raiffeisen.ro";
                // email persoana echipa

               // String email = (String) session.getAttribute("email");
               // String email = "bogdan.pipernea@raiffeisen.ro";
               //String email = "raluca.corpacescu@raiffeisen.ro";
                String emailechipa = (String) session.getAttribute("emailechipa");

                System.out.println("emailechipa");
                System.out.println(emailechipa);

                String Name = (String)session.getAttribute("Name");
                String poza = (String)session.getAttribute("poza");

                String verifechipa= (String) session.getAttribute("verifechipa");

                String last_name_echipa = (String)session.getAttribute("lnechipa");
                String first_name_echipa = (String)session.getAttribute("fnameechipa");
                System.out.println("email");
                System.out.println(email);


                System.out.println("emailechipa");
                System.out.println(emailechipa);


                String errorString = null;
                List valori = null;
                try {
                    if (emailechipa == null) {
                        valori = DBUtilis.valori(conn, email);
                        System.out.println("Valori pentru user-ul logat");
                        System.out.println(valori);
                    }
                    else{
                        valori = DBUtilis.valori(conn,emailechipa);
                    }
                } catch (SQLException var233) {
                    var233.printStackTrace();
                    errorString = var233.getMessage();
                    System.out.println(errorString);
                }
                request.setAttribute("valori", valori);

                request.setAttribute("emailechipa",emailechipa);


                request.setAttribute("last_name_echipa",last_name_echipa);
                request.setAttribute("first_name_echipa",first_name_echipa);
                request.setAttribute("verifechipa",verifechipa);
                RequestDispatcher dispatcher = request.getRequestDispatcher("valori.jsp");
                dispatcher.forward(request, response);


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

