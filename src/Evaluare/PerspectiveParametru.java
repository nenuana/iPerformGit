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
        urlPatterns = {"/PerspectiveParametru"}
)
public class PerspectiveParametru extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public PerspectiveParametru() {
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

                Integer ID= 0;
                Integer IDO= 0;
                Integer IDC= 0;
                Integer IDI= 0;
                Integer IDP= 0;


                String email = (String)session.getAttribute("email");

                String objective_name = request.getParameter("OBJECTIVE_NAME");

                 String id = request.getParameter("ID");

                if (id == null){
                    ID = (Integer) session.getAttribute("ID");

                }else {
                    ID = Integer.parseInt(id);
                }
                System.out.println(ID);


                String ido = request.getParameter("IDO");
                if (ido == null){
                    IDO = (Integer) session.getAttribute("IDO");

                }else {
                    IDO = Integer.parseInt(ido);
                }


                String idp = request.getParameter("IDP");
                System.out.println("PRELUARE IDP");
                System.out.println(idp);
                if (idp == null){
                    IDP = (Integer) session.getAttribute("IDP");

                }else {
                    IDP = Integer.parseInt(idp);
                }


                String idc = request.getParameter("IDC");

                if (idc == null){
                    IDC = (Integer) session.getAttribute("IDC");

                }else {
                    IDC = Integer.parseInt(idc);
                }





                String idi = request.getParameter("IDI");

                if (idi == null){
                    IDI = (Integer) session.getAttribute("IDI");

                }else {
                    IDI = Integer.parseInt(idi);
                }


                String objective_name_clienti = request.getParameter("OBJECTIVE_NAME_CLIENTI");

                String objective_name_procese = request.getParameter("OBJECTIVE_NAME_PROCESE");

                String objective_name_oameni = request.getParameter("OBJECTIVE_NAME_OAMENI");

                String objective_name_invatare = request.getParameter("OBJECTIVE_NAME_INVATARE");

                session.setAttribute("objective_name_oameni",objective_name_oameni);
                session.setAttribute("objective_name_clienti",objective_name_clienti);
                session.setAttribute("objective_name_procese",objective_name_procese);
                session.setAttribute("objective_name",objective_name);
                session.setAttribute("objective_name_invatare",objective_name_invatare);
                session.setAttribute("ID",ID);
                session.setAttribute("IDC",IDC);
                session.setAttribute("IDO",IDO);
                session.setAttribute("IDP",IDP);
                session.setAttribute("IDI",IDI);
                String w = request.getParameter("w");
                session.setAttribute("w",w);
                System.out.println(w);
                //RequestDispatcher dispatcher = request.getRequestDispatcher("/perspective" + w);
                response.sendRedirect(request.getContextPath() + "/perspective" + w);
               // System.out.println(dispatcher);
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
