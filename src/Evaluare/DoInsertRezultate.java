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
        urlPatterns = {"/doInsertRezultate"}
)
public class DoInsertRezultate extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DoInsertRezultate() {
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

                //merge si in cazul lui n + 1


                String email = (String)session.getAttribute("email");



                String emailechipa = (String) session.getAttribute("emailechipa");


                Integer marca = null;

                if (emailechipa == null){
                    //marca n
                  marca = DBUtilis.findempecode(conn,email);


                }
                else {
                    //marca subordonat
                   marca = DBUtilis.findempecode(conn,emailechipa);

                }


                String termen_lung = request.getParameter("termen_lung");

                String termen_scurt =  request.getParameter("termen_scurt");


                String q1 =  request.getParameter("q1");
                String q2 =  request.getParameter("q2");
                String q3 =  request.getParameter("q3");
                String q4 =  request.getParameter("q4");
                String q_an =  request.getParameter("q_an");

                String nq1 =  request.getParameter("nq1");
                String nq2 =  request.getParameter("nq2");
                String nq3 =  request.getParameter("nq3");
                String nq4 =  request.getParameter("nq4");
                String nq_an =  request.getParameter("nq_an");

                // caut in bd dupa marca poza

                String poza = DBUtilis.findpoza(conn,marca);
                String npoza = "";

                System.out.println("q1");
                System.out.println(q1);


                System.out.println("q2");
                System.out.println(q2);

                System.out.println("q3");
                System.out.println(q3);


                System.out.println("q4");
                System.out.println(q4);


                System.out.println("q_an");
                System.out.println(q_an);

                System.out.println("nq1");
                System.out.println(nq1);


                System.out.println("nq2");
                System.out.println(nq2);

                System.out.println("nq3");
                System.out.println(nq3);


                System.out.println("nq4");
                System.out.println(nq4);


                System.out.println("nq_an");
                System.out.println(nq_an);


                String financiar_procent_string = request.getParameter("financiar");
                Double financiar_procent = 0.0;
                try{
                    financiar_procent = Double.parseDouble(financiar_procent_string);
                }catch (Exception e){
                    System.out.println(e);
                }
                String clienti_procent_string = request.getParameter("clienti");
                Double clienti_procent = 0.0;
                try{
                    clienti_procent = Double.parseDouble(clienti_procent_string);
                }catch (Exception e){
                    System.out.println(e);
                }
                String procese_procent_string = request.getParameter("procese");
                Double procese_procent = 0.0;
                try{
                    procese_procent = Double.parseDouble(procese_procent_string);
                }catch (Exception e){
                    System.out.println(e);
                }
                String invatare_procent_string = request.getParameter("invatare");
                Double invatare_procent = 0.0;
                try{
                    invatare_procent = Double.parseDouble(invatare_procent_string);
                }catch (Exception e){
                    System.out.println(e);
                }
                String oameni_procent_string = request.getParameter("oameni");
                Double oameni_procent = 0.0;
                try{
                    oameni_procent = Double.parseDouble(oameni_procent_string);
                }catch (Exception e){
                    System.out.println(e);
                }
                System.out.println("fin");
                System.out.println(financiar_procent);
                System.out.println("cli");
                System.out.println(clienti_procent);
                System.out.println("pro");
                System.out.println(procese_procent);
                System.out.println("inv");
                System.out.println(invatare_procent);
                System.out.println("oameni");
                System.out.println(oameni_procent);

               Rezultate rezultate = new Rezultate(financiar_procent,clienti_procent,invatare_procent,procese_procent,oameni_procent,termen_scurt,termen_lung,marca,q1,q2,q3,q4,q_an,nq1,nq2,nq3,nq4,nq_an,poza,npoza);

                    String errorString = null;


                    try {
                        DBUtilis.updateRezultate(conn,rezultate,marca);
                        System.out.println("s-a intregistrat");
                    } catch (SQLException var95) {
                        var95.printStackTrace();
                        errorString = var95.getMessage();
                        System.out.println(errorString);
                    }



                RequestDispatcher dispatcher = request.getRequestDispatcher("/home");
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
