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
        urlPatterns = {"/echipamea"}
)
public class EchipaMea extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public EchipaMea() {
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

                String delega = (String) session.getAttribute("delega");


                List listValori = null;

                //testare
             //  email = (String) session.getAttribute("adresa");
              //  email = "andreea.todirica@raiffeisen.ro";
              // String email = "raluca.corpacescu@raiffeisen.ro";

               // String email_np1 = "bogdan.pipernea@raiffeisen.ro";


                // aflu unit

                String unit = DBUtilis.departament(conn,email);

                String email_np1 = null;



               // List list8 = null;

                List<Employee> list8 = null;
                ArrayList verificareEchipa = new ArrayList();
                String errorString = null;

                if (delega == null){
                    email_np1 = email;

                   // email_np1 = "bogdan.pipernea@raiffeisen.ro";


                    System.out.println("in prima");



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


                    } catch (SQLException e) {
                        e.printStackTrace();
                        System.out.println("eroare"+ e);
                    }


                }
                else{
                    System.out.println("in a doua");
                    email_np1 = delega;
                   // email_np1 = "bogdan.pipernea@raiffeisen.ro";



                    try {
                        list8 = DBUtilis.echipadelegati(conn,email_np1);


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

                    } catch (SQLException e) {
                        e.printStackTrace();
                        System.out.println("eroare"+ e);
                    }

                }



                if (errorString != null && list8 == null) {
                    response.sendRedirect(request.getServletPath() + "/home");
                } else {
                    request.setAttribute("list8", list8);
                    request.setAttribute("listValori", listValori);
                    request.setAttribute("verificareEchipa",verificareEchipa);

                    request.setAttribute("poza",poza);
                    request.setAttribute("unit",unit);
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

