
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
        urlPatterns = {"/doInsertValori"}
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

                //n
                    String integritate = request.getParameter("integritate");

                    String pasiune =  request.getParameter("pasiune");


                    String invatare =  request.getParameter("invatare");

                    String simplitate = request.getParameter("simplitate");

                    String colaborare =  request.getParameter("colaborare");

                    String respect =  request.getParameter("respect");

                    String discernamant =  request.getParameter("discernamant");






                    //n+1

                String nintegritate = request.getParameter("nintegritate");

                String npasiune =  request.getParameter("npasiune");


                String ninvatare =  request.getParameter("ninvatare");

                String nsimplitate = request.getParameter("nsimplitate");

                String ncolaborare =  request.getParameter("ncolaborare");

                String nrespect =  request.getParameter("nrespect");

                String ndiscernamant =  request.getParameter("ndiscernamant");

                //n
                   String n_integritate = request.getParameter("nota_integritate");
                   if (n_integritate == null){
                       n_integritate = "1";
                   }
                   System.out.println("nint");
                   System.out.println(n_integritate);
                    int nota_integritate = 0;
                    try{
                        nota_integritate = Integer.parseInt(n_integritate);
                    }catch (Exception e){
                        System.out.println(e);
                    }


                    String n_pasiune = request.getParameter("nota_pasiune");

                    if (n_pasiune == null){
                        n_pasiune ="1";
                    }
                    System.out.println("npas");
                     System.out.println(n_pasiune);
                    int nota_pasiune = 0;
                    try{
                        nota_pasiune = Integer.parseInt(n_pasiune);
                    }catch (Exception e){
                        System.out.println(e);
                    }

                    String n_invatare = request.getParameter("nota_invatare");

                    if (n_invatare == null){
                        n_invatare = "1";
                    }
                   System.out.println("ninvatare");
                   System.out.println(n_invatare);
                    int nota_invatare = 0;
                    try{
                        nota_invatare = Integer.parseInt(n_invatare);
                    }catch (Exception e){
                        System.out.println(e);
                    }

                    String n_simplitate = request.getParameter("nota_simplitate");
                    if (n_simplitate == null){
                        n_simplitate = "1";
                    }
                   System.out.println("nsimplitate");
                   System.out.println(n_simplitate);

                    int nota_simplitate = 0;
                    try{
                        nota_simplitate = Integer.parseInt(n_simplitate);
                    }catch (Exception e){
                        System.out.println(e);
                    }



                    String n_colaborare = request.getParameter("nota_colaborare");
                    if (n_colaborare == null){
                        n_colaborare = "1";
                    }
                    System.out.println("nint");

                System.out.println(n_integritate);

                    int nota_colaborare = 0;
                    try{
                        nota_colaborare = Integer.parseInt(n_colaborare);
                    }catch (Exception e){
                        System.out.println(e);
                    }

                    String n_respect = request.getParameter("nota_respect");

                    if (n_respect == null){
                        n_respect = "1";
                    }
                System.out.println("nresp");
                System.out.println(n_respect);

                    int nota_respect = 0;
                    try{
                        nota_respect = Integer.parseInt(n_respect);
                    }catch (Exception e){
                        System.out.println(e);
                    }

                    String n_discernamant = request.getParameter("nota_discernamant");

                    if (n_discernamant == null){
                        n_discernamant = "1";
                    }
                System.out.println("ndisc");
                System.out.println(n_discernamant);
                    int nota_discernamant = 0;
                    try{
                        nota_discernamant = Integer.parseInt(n_discernamant);
                    }catch (Exception e){
                        System.out.println("verif disc");
                        System.out.println(e);
                    }


                    //n+1
                String nn_integritate = request.getParameter("nnota_integritate");
                if (nn_integritate == null){
                    nn_integritate = "1";
                }
                int nnota_integritate = 0;
                try{
                    nnota_integritate = Integer.parseInt(nn_integritate);
                }catch (Exception e){
                    System.out.println(e);
                }


                String nn_pasiune = request.getParameter("nnota_pasiune");

                if (nn_pasiune == null){
                    nn_pasiune = "1";
                }
                int nnota_pasiune = 0;
                try{
                    nnota_pasiune = Integer.parseInt(nn_pasiune);
                }catch (Exception e){
                    System.out.println(e);
                }

                String nn_invatare = request.getParameter("nnota_invatare");

                if (nn_invatare == null){
                    nn_invatare = "1";
                }
                System.out.println("nota invatare n ");
                System.out.println(nn_invatare);

                int nnota_invatare = 0;
                try{
                    nnota_invatare = Integer.parseInt(nn_invatare);
                }catch (Exception e){
                    System.out.println(e);
                }

                String nn_simplitate = request.getParameter("nnota_simplitate");
                if (nn_simplitate == null){
                    nn_simplitate = "1";
                }

                int nnota_simplitate = 0;
                try{
                    nnota_simplitate = Integer.parseInt(nn_simplitate);
                }catch (Exception e){
                    System.out.println(e);
                }



                String nn_colaborare = request.getParameter("nnota_colaborare");
                if (nn_colaborare == null){
                    nn_colaborare = "1";
                }

                int nnota_colaborare = 0;
                try{
                    nnota_colaborare = Integer.parseInt(nn_colaborare);
                }catch (Exception e){
                    System.out.println(e);
                }

                String nn_respect = request.getParameter("nnota_respect");
                if (nn_respect == null){
                    nn_respect = "1";
                }

                int nnota_respect = 0;
                try{
                    nnota_respect = Integer.parseInt(nn_respect);
                }catch (Exception e){
                    System.out.println(e);
                }

                String nn_discernamant = request.getParameter("nnota_discernamant");
                if (nn_discernamant == null){
                    nn_discernamant = "1";
                }

                int nnota_discernamant = 0;
                try{
                    nnota_discernamant = Integer.parseInt(nn_discernamant);
                }catch (Exception e){
                    System.out.println("verif disc");
                    System.out.println(e);
                }

                //
                String emailechipa = (String) session.getAttribute("emailechipa");

                Integer marca = 0;

                if (emailechipa == null){
                    //marca n
                     marca = DBUtilis.findempecode(conn,email);


                }
                else {
                    //marca subordonat
                     marca = DBUtilis.findempecode(conn,emailechipa);

                }
                System.out.println("nota_integritate_n");
                System.out.println(nnota_integritate);

                System.out.println("nota_invatare_n");
                System.out.println(nnota_invatare);

                System.out.println("nota_pasiune_n");
                System.out.println(nnota_pasiune);

                System.out.println("nota_colaborare_n");
                System.out.println(nnota_colaborare);

                System.out.println("nota_discernamant_n");
                System.out.println(nnota_discernamant);

                System.out.println("nota_respect_n");
                System.out.println(nnota_respect);

                System.out.println("nota_simplitate_n");
                System.out.println(nnota_simplitate);

                ValoriServlet valoriServlet = new ValoriServlet(marca, integritate, pasiune, invatare, simplitate, colaborare, respect, discernamant, nota_integritate, nota_pasiune, nota_invatare, nota_simplitate, nota_colaborare, nota_respect, nota_discernamant,nintegritate, npasiune, ninvatare, nsimplitate, ncolaborare, nrespect, ndiscernamant, nnota_integritate, nnota_pasiune, nnota_invatare, nnota_simplitate, nnota_colaborare, nnota_respect, nnota_discernamant);

                   System.out.println(valoriServlet);
                    String errorString = null;


                    try {
                        DBUtilis.updateValori(conn,valoriServlet,marca);
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
                response.sendRedirect("index.jsp");
                throw new RuntimeException(var234);
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
