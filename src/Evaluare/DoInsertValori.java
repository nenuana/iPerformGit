
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
        urlPatterns = {"/doInsert"}
)
public class DoInsertValori extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DoInsertValori() {
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
                String email = (String)session.getAttribute("email");



                Integer employee_pk = null;

                employee_pk = DBUtilis.findempecode(conn,email);
                System.out.println("employee_pk");
                System.out.println(employee_pk);
                //incercare
               /* String cerere = request.getParameter("it2pk_fk");
                int cerereint = 0;
                try{
                    cerereint = Integer.parseInt(cerere);
                }catch (Exception e){}

                  */
                    String integritate = request.getParameter("integritate");

                    String pasiune =  request.getParameter("pasiune");


                    String invatare =  request.getParameter("invatare");

                    String simplitate = request.getParameter("simplitate");

                    String colaborare =  request.getParameter("colaborare");

                    String respect =  request.getParameter("respect");

                    String discernamant =  request.getParameter("discernamant");

                    String n_integritate = request.getParameter("nota_integritate");

                    int nota_integritate = 0;
                    try{
                        nota_integritate = Integer.parseInt(n_integritate);
                    }catch (Exception e){
                        System.out.println(e);
                    }
                    System.out.println(n_integritate);
                    System.out.println("nota_int");
                    System.out.println(nota_integritate);

                    String n_pasiune = request.getParameter("nota_pasiune");

                    int nota_pasiune = 0;
                    try{
                        nota_pasiune = Integer.parseInt(n_pasiune);
                    }catch (Exception e){
                        System.out.println(e);
                    }

                    String n_invatare = request.getParameter("nota_invatare");

                    int nota_invatare = 0;
                    try{
                        nota_invatare = Integer.parseInt(n_invatare);
                    }catch (Exception e){
                        System.out.println(e);
                    }

                    String n_simplitate = request.getParameter("nota_simplitate");
                    System.out.println("simp test");
                    System.out.println(n_simplitate);
                    int nota_simplitate = 0;
                    try{
                        nota_simplitate = Integer.parseInt(n_simplitate);
                    }catch (Exception e){
                        System.out.println(e);
                    }



                    String n_colaborare = request.getParameter("nota_colaborare");

                    int nota_colaborare = 0;
                    try{
                        nota_colaborare = Integer.parseInt(n_colaborare);
                    }catch (Exception e){
                        System.out.println(e);
                    }

                    String n_respect = request.getParameter("nota_respect");

                    int nota_respect = 0;
                    try{
                        nota_respect = Integer.parseInt(n_respect);
                    }catch (Exception e){
                        System.out.println(e);
                    }

                    String n_discernamant = request.getParameter("nota_discernamant");

                    int nota_discernamant = 0;
                    try{
                        nota_discernamant = Integer.parseInt(n_discernamant);
                    }catch (Exception e){
                        System.out.println("verif disc");
                        System.out.println(e);
                    }


                    System.out.println(integritate);
                    System.out.println(pasiune);
                    System.out.println(invatare);
                    System.out.println(simplitate);
                    System.out.println(colaborare);
                    System.out.println(respect);
                    System.out.println(discernamant);

                System.out.println(nota_integritate);
                System.out.println(nota_pasiune);
                System.out.println(nota_invatare);
                System.out.println(nota_simplitate);
                System.out.println(nota_colaborare);
                System.out.println(nota_respect);
                System.out.println(nota_discernamant);

                ValoriServlet valoriServlet = new ValoriServlet(employee_pk, integritate, pasiune, invatare, simplitate, colaborare, respect, discernamant, nota_integritate, nota_pasiune, nota_invatare, nota_simplitate, nota_colaborare, nota_respect, nota_discernamant);

                   System.out.println(valoriServlet);
                    String errorString = null;


                    try {
                        DBUtilis.updateValori(conn,valoriServlet,employee_pk);
                        System.out.print("s-a intregistrat");
                    } catch (SQLException var95) {
                        var95.printStackTrace();
                        errorString = var95.getMessage();
                        System.out.println(errorString);
                    }



                RequestDispatcher dispatcher = request.getRequestDispatcher("/valori");
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
