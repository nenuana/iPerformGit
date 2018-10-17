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
        urlPatterns = {"/perspective"}
)
public class Perspective extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Perspective() {
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
                String email = (String)session.getAttribute("email");
                String Name = (String)session.getAttribute("Name");
                String poza = (String)session.getAttribute("poza");
                String emailechipa = (String) session.getAttribute("emailechipa");


                String verifechipa = (String) session.getAttribute("verifechipa");

                System.out.println("verifechipa");
                System.out.println(verifechipa);

              //  String emailtest = "bogdan.hotea@raiffeisen.ro";

                System.out.println("email");
                System.out.println(email);
                String last_name_echipa = (String)session.getAttribute("lnechipa");
                String first_name_echipa = (String)session.getAttribute("fnameechipa");

                String pilon = "Financiar";
                String pilon2 = "Clienti";
                String pilon3 = "Procese";
                String pilon4 = "Invatare si dezvoltare";
                String pilon5 = "Oameni";


                String errorString = null;
                List competente = null;
                List competentec = null;
                List competentep = null;
                List competenteid = null;
                List competenteo = null;
                List rezultate = null;


           /*     String objective_name = request.getParameter("OBJECTIVE_NAME");

                String objective_name_clienti = request.getParameter("OBJECTIVE_NAME_CLIENTI");

                String objective_name_procese = request.getParameter("OBJECTIVE_NAME_PROCESE");

                String objective_name_oameni = request.getParameter("OBJECTIVE_NAME_OAMENI");

                */

                String objective_name = (String) session.getAttribute("objective_name");
                Integer ID = (Integer) session.getAttribute("ID");
                Integer IDO = (Integer) session.getAttribute("IDO");
                Integer IDP = (Integer) session.getAttribute("IDP");
                Integer IDI = (Integer) session.getAttribute("IDI");
                Integer IDC = (Integer) session.getAttribute("IDC");

                System.out.println("IDc");
                System.out.println(IDC);

                String objective_name_clienti = (String) session.getAttribute("objective_name_clienti");
                String objective_name_procese = (String) session.getAttribute("objective_name_procese");
                String objective_name_oameni = (String) session.getAttribute("objective_name_oameni");
                String objective_name_invatare = (String) session.getAttribute("objective_name_invatare");



                List nrfinanciar = null;
                List obiectivefinanciar = null;

                List nrclienti = null;
                List obiectiveclienti = null;

                List nrprocese = null;
                List obiectiveprocese = null;

                List nroameni = null;
                List obiectiveoameni = null;

                List nrinvatare = null;
                List obiectiveinvatare = null;

                Integer nr = 0;
                Integer nrc = 0;
                Integer nrp = 0;
                Integer nro = 0;
                Integer nri = 0;

                Integer marca = null;

                try {
                    if (emailechipa == null) {
                        marca = DBUtilis.findempecode(conn,email);
                        List lista =  DBUtilis.numefinanciar(conn,marca);
                        List listac = DBUtilis.numeclienti(conn,marca);
                        List listap = DBUtilis.numeprocese(conn,marca);
                        List listao = DBUtilis.numeoamenir(conn,marca);
                        List listai = DBUtilis.numeinvatare(conn,marca);

                        nr = lista.size();
                        nrc = listac.size();
                        nrp = listap.size();
                        nro =listao.size();
                        nri = listai.size();


                        nrfinanciar = DBUtilis.obiectivefinanciar(conn,marca);
                        nrclienti = DBUtilis.obiectiveclienti(conn,marca);
                        nrprocese = DBUtilis.obiectiveprocese(conn,marca);
                        nroameni = DBUtilis.obiectiveoameni(conn,marca);
                        nrinvatare = DBUtilis.obiectiveinvatare(conn,marca);


                        System.out.println("objective_name_clienti");
                        System.out.println(objective_name_clienti);

                        System.out.println("objective_name_procese");
                        System.out.println(objective_name_procese);


                       /* if (IDC != null){

                            obiectiveclienti = DBUtilis.obiectiveclientinume(conn, marca, IDC);
                        }
                        else{

                            if(objective_name_clienti != null) {
                                IDC = DBUtilis.findIdClienti(conn, objective_name_clienti);
                                obiectiveclienti = DBUtilis.obiectiveclientinume(conn, marca, IDC);
                            }

                        }

                        */
                        if(objective_name_clienti != null) {

                            obiectiveclienti = DBUtilis.obiectiveclientinume(conn, marca, objective_name_clienti);
                        }


                     /*   if (IDP != null) {
                            obiectiveprocese = DBUtilis.obiectiveprocesenume(conn, marca, IDP);
                        }
                        else{

                            if(objective_name_procese != null) {
                                IDP = DBUtilis.findIdProcese(conn, objective_name_procese);
                                obiectiveprocese = DBUtilis.obiectiveprocesenume(conn, marca, IDP);
                            }

                        }

                       */
                        if(objective_name_procese != null) {

                            obiectiveprocese = DBUtilis.obiectiveprocesenume(conn, marca, objective_name_procese);
                        }

/*
                        if (IDO != null) {
                            obiectiveoameni = DBUtilis.obiectiveoameninume(conn, marca, IDO);
                        }
                        else{

                            if (objective_name_oameni != null) {
                                IDO = DBUtilis.findIdOameni(conn, objective_name_oameni);
                                obiectiveoameni = DBUtilis.obiectiveoameninume(conn, marca, IDO);
                            }

                        }

                        */

                        if (objective_name_oameni != null) {

                            obiectiveoameni = DBUtilis.obiectiveoameninume(conn, marca, objective_name_oameni);
                        }


                        /*
                        if (IDI != null) {
                            obiectiveinvatare = DBUtilis.obiectiveinvatarenume(conn, marca, IDI);
                        }
                        else{

                            if(objective_name_invatare !=null) {
                                IDI = DBUtilis.findIdInvatare(conn, objective_name_invatare);
                                obiectiveinvatare = DBUtilis.obiectiveinvatarenume(conn, marca, IDI);
                            }

                        }

                        */

                        if(objective_name_invatare !=null) {

                            obiectiveinvatare = DBUtilis.obiectiveinvatarenume(conn, marca, objective_name_invatare);
                        }


                        /*
                        if (ID != null) {
                            obiectivefinanciar = DBUtilis.obiectivefinanciarnume(conn, marca, ID);
                        }
                        else{

                            if (objective_name != null) {
                                ID = DBUtilis.findIdFinanciar(conn, objective_name);
                                obiectivefinanciar = DBUtilis.obiectivefinanciarnume(conn, marca, ID);
                            }

                        }

                        */

                        if (objective_name != null) {

                            obiectivefinanciar = DBUtilis.obiectivefinanciarnume(conn, marca, objective_name);
                        }

                        nrfinanciar = DBUtilis.obiectivefinanciar(conn,marca);

                        nrclienti = DBUtilis.obiectiveclienti(conn,marca);

                        nrprocese = DBUtilis.obiectiveprocese(conn,marca);

                        nroameni = DBUtilis.obiectiveoameni(conn,marca);

                        nrinvatare = DBUtilis.obiectiveinvatare(conn,marca);




                        competente = DBUtilis.competente(conn, email,pilon);
                        competentec = DBUtilis.competente(conn, email,pilon2);
                        competentep = DBUtilis.competente(conn, email,pilon3);
                        competenteid = DBUtilis.competente(conn, email,pilon4);
                        competenteo = DBUtilis.competente(conn,email,pilon5);
                        rezultate = DBUtilis.rezultate(conn,email);


                        if (IDC != null) {

                            obiectiveclienti = DBUtilis.obiectiveclientinume(conn, marca, objective_name_clienti);
                        }
                        //aici
                        if (IDP != null) {
                            obiectiveprocese = DBUtilis.obiectiveprocesenume(conn, marca, objective_name_procese);
                        }
                        System.out.println(obiectiveprocese);

                        if (IDO != null) {
                            obiectiveoameni = DBUtilis.obiectiveoameninume(conn, marca, objective_name_oameni);
                        }

                        System.out.println(obiectiveoameni);

                        if (IDI != null) {
                            obiectiveinvatare = DBUtilis.obiectiveinvatarenume(conn, marca, objective_name_invatare);
                        }
                        System.out.println(obiectiveinvatare);
                        if (ID != null) {
                            obiectivefinanciar = DBUtilis.obiectivefinanciarnume(conn, marca, objective_name);
                        }




                    }
                    else{

                        marca = DBUtilis.findempecode(conn,emailechipa);
                        List lista =  DBUtilis.numefinanciar(conn,marca);
                        List listac = DBUtilis.numeclienti(conn,marca);
                        List listap = DBUtilis.numeprocese(conn,marca);
                        List listao = DBUtilis.numeoamenir(conn,marca);
                        List listai = DBUtilis.numeinvatare(conn,marca);

                        nr = lista.size();
                        nrc = listac.size();
                        nrp = listap.size();
                        nro =listao.size();
                        nri = listai.size();


                        nrfinanciar = DBUtilis.obiectivefinanciar(conn,marca);
                        nrclienti = DBUtilis.obiectiveclienti(conn,marca);
                        nrprocese = DBUtilis.obiectiveprocese(conn,marca);
                        nroameni = DBUtilis.obiectiveoameni(conn,marca);
                        nrinvatare = DBUtilis.obiectiveinvatare(conn,marca);

                     /*   if (IDC != null){

                            obiectiveclienti = DBUtilis.obiectiveclientinume(conn, marca, IDC);
                        }
                        else{

                            if(objective_name_clienti != null) {
                                IDC = DBUtilis.findIdClienti(conn, objective_name_clienti);
                                obiectiveclienti = DBUtilis.obiectiveclientinume(conn, marca, IDC);
                            }

                        }

                        */

                        if(objective_name_clienti != null) {

                            obiectiveclienti = DBUtilis.obiectiveclientinume(conn, marca, objective_name_clienti);
                        }

                     /*   if (IDP != null) {
                            obiectiveprocese = DBUtilis.obiectiveprocesenume(conn, marca, IDP);
                        }
                        else{

                            if(objective_name_procese != null) {
                                IDP = DBUtilis.findIdProcese(conn, objective_name_procese);
                                obiectiveprocese = DBUtilis.obiectiveprocesenume(conn, marca, IDP);
                            }

                        }

                        */
                        if(objective_name_procese != null) {

                            obiectiveprocese = DBUtilis.obiectiveprocesenume(conn, marca, objective_name_procese);
                        }



                       /* if (IDO != null) {
                            obiectiveoameni = DBUtilis.obiectiveoameninume(conn, marca, IDO);
                        }
                        else{

                            if (objective_name_oameni != null) {
                                IDO = DBUtilis.findIdOameni(conn, objective_name_oameni);
                                obiectiveoameni = DBUtilis.obiectiveoameninume(conn, marca, IDO);
                            }

                        }

                        */

                        if (objective_name_oameni != null) {

                            obiectiveoameni = DBUtilis.obiectiveoameninume(conn, marca, objective_name_oameni);
                        }

                        /*
                        if (IDI != null) {
                            obiectiveinvatare = DBUtilis.obiectiveinvatarenume(conn, marca, IDI);
                        }
                        else{

                            if(objective_name_invatare !=null) {
                                IDI = DBUtilis.findIdInvatare(conn, objective_name_invatare);
                                obiectiveinvatare = DBUtilis.obiectiveinvatarenume(conn, marca, IDI);
                            }

                        }


*/

                        if(objective_name_invatare !=null) {

                            obiectiveinvatare = DBUtilis.obiectiveinvatarenume(conn, marca, objective_name_invatare);
                        }


                        /*
                        if (ID != null) {
                            obiectivefinanciar = DBUtilis.obiectivefinanciarnume(conn, marca, ID);
                        }
                        else{

                            if (objective_name != null) {
                                ID = DBUtilis.findIdFinanciar(conn, objective_name);
                                obiectivefinanciar = DBUtilis.obiectivefinanciarnume(conn, marca, ID);
                            }

                        }


*/
                        if (objective_name != null) {

                            obiectivefinanciar = DBUtilis.obiectivefinanciarnume(conn, marca, objective_name);
                        }

                        nrfinanciar = DBUtilis.obiectivefinanciar(conn,marca);

                        nrclienti = DBUtilis.obiectiveclienti(conn,marca);

                        nrprocese = DBUtilis.obiectiveprocese(conn,marca);

                        nroameni = DBUtilis.obiectiveoameni(conn,marca);

                        nrinvatare = DBUtilis.obiectiveinvatare(conn,marca);




                        competente = DBUtilis.competente(conn, emailechipa,pilon);
                        competentec = DBUtilis.competente(conn, emailechipa,pilon2);
                        competentep = DBUtilis.competente(conn, emailechipa,pilon3);
                        competenteid = DBUtilis.competente(conn, emailechipa,pilon4);
                        competenteo = DBUtilis.competente(conn,emailechipa,pilon5);
                        rezultate = DBUtilis.rezultate(conn,emailechipa);


                        if (IDC != null) {

                            obiectiveclienti = DBUtilis.obiectiveclientinume(conn, marca, objective_name_clienti);
                        }
                        System.out.println("objectiveclienti" + obiectiveclienti);
                        //aici
                        if (IDP != null) {
                            obiectiveprocese = DBUtilis.obiectiveprocesenume(conn, marca, objective_name_procese);
                        }
                        System.out.println(obiectiveprocese);

                        if (IDO != null) {
                            obiectiveoameni = DBUtilis.obiectiveoameninume(conn, marca, objective_name_oameni);
                        }

                        System.out.println(obiectiveoameni);

                        if (IDI != null) {
                            obiectiveinvatare = DBUtilis.obiectiveinvatarenume(conn, marca, objective_name_invatare);
                        }
                        System.out.println(obiectiveinvatare);
                        if (ID != null) {
                            obiectivefinanciar = DBUtilis.obiectivefinanciarnume(conn, marca, objective_name);
                        }




                    }
                } catch (SQLException var233) {
                    var233.printStackTrace();
                    errorString = var233.getMessage();
                    System.out.println(errorString);
                }


                request.setAttribute("nr",nr);
                request.setAttribute("nrc",nrc);
                request.setAttribute("nrp",nrp);
                request.setAttribute("nro",nro);
                request.setAttribute("nri",nri);
                request.setAttribute("nrfinanciar",nrfinanciar);
                request.setAttribute("obiectivefinanciar",obiectivefinanciar);
                request.setAttribute("nrinvatare",nrinvatare);
                request.setAttribute("obiectiveinvatare",obiectiveinvatare);
                request.setAttribute("nrclienti",nrclienti);
                request.setAttribute("obiectiveclienti",obiectiveclienti);
                request.setAttribute("nrprocese",nrprocese);
                request.setAttribute("obiectiveprocese",obiectiveprocese);
                request.setAttribute("nroameni",nroameni);
                request.setAttribute("obiectiveoameni",obiectiveoameni);
                request.setAttribute("rezultate", rezultate);
                request.setAttribute("competente", competente);
                request.setAttribute("competentec", competentec);
                request.setAttribute("competentep", competentep);
                request.setAttribute("competenteid", competenteid);
                request.setAttribute("competenteo", competenteo);

                request.setAttribute("verifechipa",verifechipa);
                request.setAttribute("emailechipa",emailechipa);

                request.setAttribute("last_name_echipa",last_name_echipa);
                request.setAttribute("first_name_echipa",first_name_echipa);
                request.setAttribute("objective_name",objective_name);
                request.setAttribute("ID",ID);
                request.setAttribute("IDC",IDC);
                request.setAttribute("IDO",IDO);
                request.setAttribute("IDP",IDP);
                request.setAttribute("IDI",IDI);
                request.setAttribute("objective_name_clienti",objective_name_clienti);
                request.setAttribute("objective_name_procese",objective_name_procese);
                request.setAttribute("objective_name_oameni",objective_name_oameni);
                request.setAttribute("objective_name_invatare",objective_name_invatare);
                request.setAttribute("marca",marca);



                String w = (String) session.getAttribute("w");

                System.out.println("obiective procese" + obiectiveprocese);


                String obiectivnume = null;

                if (w!= null) {
                    if (w.equals("#home")) {
                        obiectivnume = objective_name;
                    }
                    if (w.equals("#menu1")) {
                        obiectivnume = objective_name_clienti;
                    }
                    if (w.equals("#menu2")) {
                        obiectivnume = objective_name_procese;
                    }
                    if (w.equals("#menu3")) {
                        obiectivnume = objective_name_oameni;
                    }
                    if (w.equals("#menu4")) {
                        obiectivnume = objective_name_invatare;
                    }
                }

                System.out.println("objective name");
                System.out.println(obiectivnume);

                request.setAttribute("w",w);
                request.setAttribute("obiectivnume",obiectivnume);
                String parametru = (String) session.getAttribute("parametru");
                request.setAttribute("parametru",parametru);
                System.out.println("parametru");
                System.out.println(parametru);
                session.removeAttribute("w");
                session.removeAttribute("objective_name_oameni");
                session.removeAttribute("objective_name_clienti");
                session.removeAttribute("objective_name_procese");
                session.removeAttribute("objective_name_invatare");
                session.removeAttribute("objective_name");
                session.removeAttribute("ID");
                session.removeAttribute("IDC");
                session.removeAttribute("IDO");
                session.removeAttribute("IDP");
                session.removeAttribute("IDI");
                session.removeAttribute("parametru");





                RequestDispatcher dispatcher = request.getRequestDispatcher("perspective.jsp");
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

