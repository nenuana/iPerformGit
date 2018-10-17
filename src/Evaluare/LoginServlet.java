
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
        urlPatterns = {"/login"}
)
public class LoginServlet extends HttpServlet {
    public LoginServlet() {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

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
                String idToken = request.getParameter("id_token");
                String email = request.getParameter("email");
                String Name = request.getParameter("Name");
                String poza = request.getParameter("poza");

                Integer marca = DBUtilis.findempecode(conn, email);
                Rezultate rezultate = new Rezultate();
                rezultate.setPoza(poza);

                try {
                    DBUtilis.updatePoza(conn, rezultate, marca);
                }
                catch (SQLException var4){
                    var4.printStackTrace();
                    this.log("nu s-a updatat poza");
                    System.out.println(var4);
                }
                System.out.println("User email: " + email);
                HttpSession session = request.getSession(true);
                session.setAttribute("email", email);
                session.setAttribute("Name", Name);
                session.setAttribute("poza", poza);

                request.getRequestDispatcher("/home").forward(request, response);


            } catch (Exception var8) {
                throw new RuntimeException(var8);
            }
        }
    }
}
