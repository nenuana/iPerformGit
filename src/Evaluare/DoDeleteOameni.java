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
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@WebServlet(
        urlPatterns = {"/doDeleteOameni"}
)
public class DoDeleteOameni extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DoDeleteOameni() {
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

                //merge doar in cazul lui n


                String email = (String)session.getAttribute("email");



                Integer employee_pk = null;

                employee_pk = DBUtilis.findempecode(conn,email);
                System.out.println("employee_pk");
                System.out.println(employee_pk);
                String objective_name_oameni = request.getParameter("objective_name_oameni");
                String marcastring = request.getParameter("marca");
                Integer marca = Integer.parseInt(marcastring);

                String errorString = null;

                List<ObiectiveCentrala> id = null;
                ArrayList iduri = new ArrayList();
                try {
                    id =  DBUtilis.obiectiveoameninume(conn,marca,objective_name_oameni);
                    Iterator<ObiectiveCentrala> j = id.iterator();
                    while (j.hasNext()) {
                        ObiectiveCentrala jj = (ObiectiveCentrala) (j.next());
                        String ID = String.valueOf(jj.getID());
                        iduri.add(ID);
                        System.out.println("last_name" + ID);

                    }

                } catch (SQLException e) {
                    e.printStackTrace();
                }
                String idp = iduri.get(0).toString();
                String idp2 = iduri.get(1).toString();

                String idp3 = iduri.get(2).toString();
                String idp4 = iduri.get(3).toString();
                System.out.println("cod" + idp);
                System.out.println("cod2" + idp2);
                int IDP = Integer.parseInt(idp);
                int IDP2 = Integer.parseInt(idp2);

                System.out.println("cod3" + idp3);
                System.out.println("cod4" + idp4);
                int IDP3 = Integer.parseInt(idp3);
                int IDP4 = Integer.parseInt(idp4);


                try {
                    DBUtilis.deleteObiectivOameni(conn, marca, IDP);
                    DBUtilis.deleteObiectivOameni(conn, marca, IDP2);
                    DBUtilis.deleteObiectivOameni(conn, marca, IDP3);
                    DBUtilis.deleteObiectivOameni(conn, marca, IDP4);
                    System.out.println("s-a intregistrat");
                } catch (SQLException var95) {
                    var95.printStackTrace();
                    errorString = var95.getMessage();
                    System.out.println(errorString);
                }
                List lista =  DBUtilis.numeoamenir(conn,marca);
                Integer nr = lista.size();
                Object ob = lista.get(nr-1);
                System.out.println("obiect");
                System.out.println(ob);


                String ob_name = ((ObiectiveCentrala) ob).getOBJECTIVE_NAME();

                String w = request.getParameter("w");
                session.setAttribute("w",w);
                session.setAttribute("objective_name_oameni",ob_name);
                System.out.println(w);

                response.sendRedirect(request.getContextPath() + "/perspective" + w);

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
