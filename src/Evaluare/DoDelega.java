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
        urlPatterns = {"/dodelega"}
)
public class DoDelega extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DoDelega() {
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
               // String emailbun = (String) session.getAttribute("email");
                String Name = (String) session.getAttribute("Name");
                String poza = (String) session.getAttribute("poza");
                String email = request.getParameter("emailechipa");
               // String email = "ana-maria.nenu@raiffeisen.ro";

                System.out.println("email");
                System.out.println(email);



                List list = null;
                String errorString = null;
                try {
                    list = DBUtilis.infoangajat(conn,email);

                    for (int i = 0;i< list.size();i++){
                            System.out.println(list.get(i));
                    }
                    String np2_email = (String) list.get(0);
                    String np2_first_name = (String) list.get(1);
                    String np2_last_name = (String) list.get(2);
                    String np2_code = (String) list.get(3);


                    String np3_email = (String) list.get(4);
                    String np3_first_name = (String) list.get(5);
                    String np3_last_name = (String) list.get(6);
                    String np3_code = (String) list.get(7);

                    String np4_email = (String) list.get(8);
                    String np4_first_name = (String) list.get(9);
                    String np4_last_name = (String) list.get(10);
                    String np4_code = (String) list.get(11);

                    String np5_email = (String) list.get(12);
                    String np5_first_name = (String) list.get(13);
                    String np5_last_name = (String) list.get(14);
                    String np5_code = (String) list.get(15);

                    String np1_email = request.getParameter("np1_email");
                    String np1_nume = request.getParameter("np1_nume");

                    String np1_prenume = request.getParameter("np1_prenume");
                    String np1_marca = request.getParameter("np1_marca");

                    String code = "";
                    String last_name =  "";
                    String first_name = "";


                    System.out.println(np1_email);
                    System.out.println(np1_nume);
                    System.out.println(np1_prenume);
                    System.out.println(np1_marca);

                    Delegati delegati = new Delegati(code,last_name,first_name,email,np1_marca,np1_nume,np1_prenume,np1_email,np2_code,np2_last_name,np2_first_name,np2_email,np3_code,np3_last_name,np3_first_name,np3_email,np4_code,np4_last_name,np4_first_name,np4_email,np5_code,np5_last_name,np5_first_name,np5_email);

                    System.out.println("suntaici1");

                    try {
                        DBUtilis.insertdelegat(conn,delegati);
                        System.out.println("s-a intregistrat");
                        System.out.println("suntaici2");
                    } catch (SQLException var95) {
                        var95.printStackTrace();
                        errorString = var95.getMessage();
                        System.out.println(errorString);
                        System.out.println("suntaici3");
                    }

                } catch (SQLException var233) {
                    var233.printStackTrace();
                    errorString = var233.getMessage();
                    System.out.println(errorString);
                }
                if (errorString != null && list == null) {
                    response.sendRedirect(request.getServletPath() + "/home");
                } else {
                    request.setAttribute("list8", list);

                    RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
                    dispatcher.forward(request, response);


                    conn.close();
                }
            } catch (Exception var234) {

                //  response.sendRedirect("/picturefail.jsp");
                throw new RuntimeException(var234);
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}

