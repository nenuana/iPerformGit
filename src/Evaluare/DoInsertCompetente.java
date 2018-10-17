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
        urlPatterns = {"/doInsertCompetente"}
)
public class DoInsertCompetente extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DoInsertCompetente() {
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


                String abilitati = request.getParameter("abilitati");

                String subactivitati =  request.getParameter("subactivitati");


                String voi_continua =  request.getParameter("voi_continua");

                String voi_lua_in_considerare = request.getParameter("voi_lua_in_considerare");

                String abilitati2 = request.getParameter("abilitati2");

                String subactivitati2 =  request.getParameter("subactivitati2");


                String voi_continua2 =  request.getParameter("voi_continua2");

                String voi_lua_in_considerare2 = request.getParameter("voi_lua_in_considerare2");

                String abilitati3 = request.getParameter("abilitati3");

                String subactivitati3 =  request.getParameter("subactivitati3");


                String voi_continua3 =  request.getParameter("voi_continua3");

                String voi_lua_in_considerare3 = request.getParameter("voi_lua_in_considerare3");

                String abilitati4 = request.getParameter("abilitati4");

                String subactivitati4 =  request.getParameter("subactivitati4");


                String voi_continua4 =  request.getParameter("voi_continua4");

                String voi_lua_in_considerare4 = request.getParameter("voi_lua_in_considerare4");


                String abilitati5 = request.getParameter("abilitati5");

                String subactivitati5 =  request.getParameter("subactivitati5");


                String voi_continua5 =  request.getParameter("voi_continua5");

                String voi_lua_in_considerare5 = request.getParameter("voi_lua_in_considerare5");

                String diversepilon =  request.getParameter("diversepilon");
                String w = "#home";

                String pilon = "Financiar";
                String pilon2 = "Clienti";
                String pilon3 = "Procese";
                String pilon4 = "Invatare si dezvoltare";
                String pilon5 = "Oameni";

                String parametru = null;

                Integer marca = 0;
                String emailechipa = (String) session.getAttribute("emailechipa");
                if (emailechipa == null){
                    //marca n
                    marca = DBUtilis.findempecode(conn,email);


                }
                else {
                    //marca subordonat
                    marca = DBUtilis.findempecode(conn,emailechipa);

                }


                if (diversepilon.equals("Financiar")){
                    Competente competente = new Competente(abilitati,subactivitati,voi_continua,voi_lua_in_considerare,marca,pilon);

                    String errorString = null;
                    w = "#home";
                    parametru = request.getParameter("parametrufinanciar");

                    try {
                        DBUtilis.updateCompetente(conn,competente,marca,pilon);
                        System.out.println("s-a intregistrat");
                    } catch (SQLException var95) {
                        var95.printStackTrace();
                        errorString = var95.getMessage();
                        System.out.println(errorString);
                    }


                }

                    if (diversepilon.equals("Clienti")){


                        w = "#menu1";


                        Competente competente = new Competente(abilitati2,subactivitati2,voi_continua2,voi_lua_in_considerare2,marca,pilon2);

                        String errorString = null;

                         parametru = request.getParameter("parametruclienti");


                        try {

                            DBUtilis.updateCompetente(conn,competente,marca,pilon2);
                            System.out.println("s-a intregistrat clienti");

                        } catch (SQLException var95) {
                            System.out.println("eroaree");
                            var95.printStackTrace();
                            errorString = var95.getMessage();
                            System.out.println(errorString);
                        }
                    }
                    else{

                        System.out.println("nu compara bine");
                    }


                if (diversepilon.equals("Procese")){

                    w = "#menu2";
                    Competente competente = new Competente(abilitati3,subactivitati3,voi_continua3,voi_lua_in_considerare3,marca,pilon3);

                    String errorString = null;
                    parametru = request.getParameter("parametruprocese");

                    try {
                        DBUtilis.updateCompetente(conn,competente,marca,pilon3);
                        System.out.println("s-a intregistrat procese");
                    } catch (SQLException var95) {
                        var95.printStackTrace();
                        errorString = var95.getMessage();
                        System.out.println(errorString);
                    }
                }

                if (diversepilon.equals("Invatare")){

                     parametru = request.getParameter("parametruinvatare");
                    w = "#menu3";
                    Competente competente = new Competente(abilitati4,subactivitati4,voi_continua4,voi_lua_in_considerare4,marca,pilon4);

                    String errorString = null;


                    try {
                        DBUtilis.updateCompetente(conn,competente,marca,pilon4);
                        System.out.println("s-a intregistrat invatare");
                    } catch (SQLException var95) {
                        var95.printStackTrace();
                        errorString = var95.getMessage();
                        System.out.println(errorString);
                    }
                }

                if (diversepilon.equals("Oameni")){

                    parametru = request.getParameter("parametruoameni");
                    w = "#menu4";
                    Competente competente = new Competente(abilitati5,subactivitati5,voi_continua5,voi_lua_in_considerare5,marca,pilon5);

                    String errorString = null;


                    try {
                        DBUtilis.updateCompetente(conn,competente,marca,pilon5);
                        System.out.println("s-a intregistrat oameni");
                    } catch (SQLException var95) {
                        var95.printStackTrace();
                        errorString = var95.getMessage();
                        System.out.println(errorString);
                    }
                }



                session.setAttribute("parametru",parametru);

                response.sendRedirect(request.getContextPath() + "/perspective" + w);
               // RequestDispatcher dispatcher = request.getRequestDispatcher("/perspective");
              //  dispatcher.forward(request, response);


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
