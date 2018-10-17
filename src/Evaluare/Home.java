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
        urlPatterns = {"/home"}
)
public class Home extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Home() {
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
                System.out.println(var235);
            }





            try {
                HttpSession session = request.getSession(true);
                //testare deblocheaza
                String email = (String)session.getAttribute("email");

               // String email = "bogdan.pipernea@raiffeisen.ro";

               // String email = "raluca.corpacescu@raiffeisen.ro";

               // String email = "daniel.grosu@raiffeisen.ro";
                String Name = (String)session.getAttribute("Name");
                String poza =  "https://imagini.teotrandafir.com/2016/05/poza-de-profil-1024x1024.jpg";

                System.out.println("poza" + poza);





                Integer employee_pk = null;





                String last_name_echipa = request.getParameter("last_name");
                String first_name_echipa = request.getParameter("first_name");
                String superior_full_name = request.getParameter("superior_full_name");


                System.out.println("sup");
                System.out.println(superior_full_name);
               // String email;


               /* if (last_name_echipa != null) {
                     email = (String) session.getAttribute("adresa");
                }
                else{
                    email = request.getParameter("adresa");


                }
                session.setAttribute("adresa",email);
                System.out.println("email");
                System.out.println(email);

                */
                //testare
                 //String email = "bogdan.pipernea@raiffeisen.ro";
              //  String email = "andreea.todirica@raiffeisen.ro";


                employee_pk = DBUtilis.findempecode(conn,email);


                String superior_full_name_user_logat = DBUtilis.superioremail(conn,email);

                String emailtest;

                // delega- verifica daca persoana logata are pe cineva delegat
                String delega = DBUtilis.verificaredelegat(conn,email);

                session.setAttribute("delega",delega);


                System.out.println("verificare delegat 1");
                System.out.println(delega);
                if (delega == null){
                    emailtest = email;
                }else{
                    emailtest = delega;
                }



                System.out.println("verificare delegat");
                System.out.println(emailtest);

                // verifechipa arata daca exista echipa pt persoana logata ; poate avea echipa pt ca este n+1 sau pt ca este delegat






                System.out.println(last_name_echipa);
                System.out.println(first_name_echipa);

                String verifechipa;


                String emailechipa;

                System.out.println("last_name");
                System.out.println(last_name_echipa);
                //aici
                verifechipa = DBUtilis.verififsuperior(conn,emailtest);
                if (delega != null){
                    verifechipa = "Da";

                }

                if (last_name_echipa == null){
                    last_name_echipa = (String)session.getAttribute("lnechipa");
                    System.out.println("last_name");
                    System.out.println(last_name_echipa);
                    first_name_echipa = (String)session.getAttribute("fnameechipa");
                    superior_full_name = (String)session.getAttribute("sfullname");
                   // verifechipa = (String) session.getAttribute("verifechipa");
                    emailechipa = (String) session.getAttribute("emailechipa");
                 //   System.out.println("verifechipa");
                   // System.out.println(verifechipa);

                }

                else{
                    emailechipa = request.getParameter("emailechipa");

                    session.setAttribute("emailechipa",emailechipa);

                    //aici

                    System.out.println("delega");
                    System.out.println(delega);
                    System.out.println("verifec");
                    System.out.println(verifechipa);


                }



                session.setAttribute("lnechipa",last_name_echipa);
                session.setAttribute("sfullname",superior_full_name);
                session.setAttribute("fnameechipa",first_name_echipa);
                session.setAttribute("verifechipa",verifechipa);


                System.out.println("emailechipa");
                System.out.println(emailechipa);

                Integer marca2 = 0;

                if (emailechipa == null){
                    //marca n
                    marca2= DBUtilis.findempecode(conn,email);
                    // marcas = marca.toString();

                }
                else {
                    //marca subordonat
                    marca2 = DBUtilis.findempecode(conn,emailechipa);

                }

                String npoza = "https://imagini.teotrandafir.com/2016/05/poza-de-profil-1024x1024.jpg";
             /*   String npoza = DBUtilis.findpoza(conn,marca2);
                if (npoza == null) {
                   npoza = "https://imagini.teotrandafir.com/2016/05/poza-de-profil-1024x1024.jpg";

                }
                session.setAttribute("npoza","npoza");
*/
               // System.out.println("npoza");
               // System.out.println(npoza);

                Integer verificare = DBUtilis.findemployee(conn,marca2);
                Integer verificarecompetente = DBUtilis.findemployeecompetente(conn,marca2);
                Integer verificarerezultate = DBUtilis.findemployeerezultate(conn,marca2);
                Integer verificarefinanciar = DBUtilis.findemployeefinanciar(conn,marca2);
                Integer verificareclienti = DBUtilis.findemployeeclienti(conn,marca2);
                Integer verificareprocese = DBUtilis.findemployeeprocese(conn,marca2);
                Integer verificareoameni = DBUtilis.findemployeeoameni(conn,marca2);
                Integer verificareinvatare = DBUtilis.findemployeeinvatare(conn,marca2);

                if (verificare == null) {






                    Integer marca = null;

                    if (emailechipa == null){
                        //marca n
                        marca = DBUtilis.findempecode(conn,email);
                       // marcas = marca.toString();

                    }
                    else {
                        //marca subordonat
                        marca = DBUtilis.findempecode(conn,emailechipa);

                    }


                    String integritate = "";
                    String pasiune = "";
                    String invatare = "";
                    String simplitate = "";
                    String colaborare = "";
                    String respect = "";
                    String discernamant = "";
                    Integer nota_integritate = 5;
                    Integer nota_pasiune = 5;
                    Integer nota_invatare = 5;
                    Integer nota_simplitate = 5;
                    Integer nota_colaborare = 5;
                    Integer nota_respect = 5;
                    Integer nota_discernamant = 5;
                    String nintegritate = "";
                    String npasiune = "";
                    String ninvatare = "";
                    String nsimplitate = "";
                    String ncolaborare = "";
                    String nrespect = "";
                    String ndiscernamant = "";
                    Integer nnota_integritate = 5;
                    Integer nnota_pasiune = 5;
                    Integer nnota_invatare = 5;
                    Integer nnota_simplitate = 5;
                    Integer nnota_colaborare = 5;
                    Integer nnota_respect = 5;
                    Integer nnota_discernamant = 5;

                    ValoriServlet valoriServlet = new ValoriServlet(marca, integritate, pasiune, invatare, simplitate, colaborare, respect, discernamant, nota_integritate, nota_pasiune, nota_invatare, nota_simplitate, nota_colaborare, nota_respect, nota_discernamant,nintegritate, npasiune, ninvatare, nsimplitate, ncolaborare, nrespect, ndiscernamant, nnota_integritate, nnota_pasiune, nnota_invatare, nnota_simplitate, nnota_colaborare, nnota_respect, nnota_discernamant);
                    String errorString = null;


                    try {
                        DBUtilis.insertValori(conn, valoriServlet);
                        System.out.print("s-a intregistrat cu succes");
                    } catch (SQLException var95) {
                        var95.printStackTrace();
                        errorString = var95.getMessage();
                        System.out.println(errorString);
                    }

                }


                if (verificarecompetente == null){




                    Integer marca = 0;

                    if (emailechipa == null){
                        //marca n
                      marca = DBUtilis.findempecode(conn,email);


                    }
                    else {
                        //marca subordonat
                        marca = DBUtilis.findempecode(conn,emailechipa);

                    }

                    String abilitati = "";
                    String subactivitati = "";
                    String voi_continua = "";
                    String voi_lua_in_considerare = "";
                    String pilon = "Financiar";
                    String pilon2 = "Clienti";
                    String pilon3 = "Procese";
                    String pilon4 = "Invatare si dezvoltare";
                    String pilon5 = "Oameni";

                    Competente competente = new Competente(abilitati,subactivitati,voi_continua,voi_lua_in_considerare,marca,pilon);
                    Competente competente2 = new Competente(abilitati,subactivitati,voi_continua,voi_lua_in_considerare,marca,pilon2);
                    Competente competente3 = new Competente(abilitati,subactivitati,voi_continua,voi_lua_in_considerare,marca,pilon3);
                    Competente competente4 = new Competente(abilitati,subactivitati,voi_continua,voi_lua_in_considerare,marca,pilon4);
                    Competente competente5 = new Competente(abilitati,subactivitati,voi_continua,voi_lua_in_considerare,marca,pilon5);

                    String errorString = null;


                    try {
                        DBUtilis.insertCompetente(conn, competente);
                        DBUtilis.insertCompetente(conn, competente2);
                        DBUtilis.insertCompetente(conn, competente3);
                        DBUtilis.insertCompetente(conn, competente4);
                        DBUtilis.insertCompetente(conn, competente5);
                        System.out.print("s-a intregistrat cu succes");
                    } catch (SQLException var95) {
                        var95.printStackTrace();
                        errorString = var95.getMessage();
                        System.out.println(errorString);
                    }




                }

                if (verificarerezultate ==null){



                    Integer marca = null;

                    if (emailechipa == null){
                        //marca n
                        marca = DBUtilis.findempecode(conn,email);

                    }
                    else {
                        marca = DBUtilis.findempecode(conn,emailechipa);

                    }

                    Integer financiar_procent = 20;
                    Integer clienti_procent = 20;
                    Integer procese_procent = 20;
                    Integer invatare_procent = 20;
                    Integer oameni_procent = 20;
                    String termen_scurt = "";
                    String termen_lung = "";
                    String q1 = "";
                    String q2 = "";
                    String q3 = "";
                    String q4 = "";
                    String q_an = "";

                    String nq1 = "";
                    String nq2 = "";
                    String nq3 = "";
                    String nq4 = "";
                    String nq_an = "";



                    Rezultate rezultate = new Rezultate(financiar_procent,clienti_procent,invatare_procent,procese_procent,oameni_procent,termen_scurt,termen_lung,marca,q1,q2,q3,q4,q_an,nq1,nq2,nq3,nq4,nq_an,poza,npoza);
                    String errorString = null;


                    try {
                        DBUtilis.insertRezultate(conn, rezultate);


                        System.out.print("s-a intregistrat cu succes rezultate");
                    } catch (SQLException var95) {
                        var95.printStackTrace();
                        errorString = var95.getMessage();
                        System.out.println(errorString);
                    }




                }

                if(verificarefinanciar == null){




                    String marcas = null;

                    if (emailechipa == null){
                        //marca n
                        Integer marca = DBUtilis.findempecode(conn,email);
                        marcas = marca.toString();

                    }
                    else {
                        //marca subordonat
                        Integer marca = DBUtilis.findempecode(conn,emailechipa);
                        marcas = marca.toString();
                    }


                    int quarter = 1;
                    int quarter2 = 2;
                    int quarter3 = 3;
                    int quarter4 = 4;
                    int year = 2018;
                    String objectivezone = "Financiara";
                    double SATISFACTIONRATE = 0.0;
                    double RUNRATE = 0.0;



                    String OBJECTIVE_NAME= "Obiectiv";
                    String objective_description= "";
                    String objective_target= "";
                    double preconizat = 0;

                    String rezult_value= "";
                    double realizat = 0;

                    ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala(realizat,SATISFACTIONRATE,RUNRATE,quarter,year,marcas,OBJECTIVE_NAME,objective_description,objectivezone,preconizat);
                    ObiectiveCentrala obiectiveCentrala2 = new ObiectiveCentrala(realizat,SATISFACTIONRATE,RUNRATE,quarter2,year,marcas,OBJECTIVE_NAME,objective_description,objectivezone,preconizat);
                    ObiectiveCentrala obiectiveCentrala3 = new ObiectiveCentrala(realizat,SATISFACTIONRATE,RUNRATE,quarter3,year,marcas,OBJECTIVE_NAME,objective_description,objectivezone,preconizat);
                    ObiectiveCentrala obiectiveCentrala4 = new ObiectiveCentrala(realizat,SATISFACTIONRATE,RUNRATE,quarter4,year,marcas,OBJECTIVE_NAME,objective_description,objectivezone,preconizat);

                    String errorString = null;


                    try {
                        DBUtilis.insertObiectiv(conn,obiectiveCentrala);
                        DBUtilis.insertObiectiv(conn,obiectiveCentrala2);
                        DBUtilis.insertObiectiv(conn,obiectiveCentrala3);
                        DBUtilis.insertObiectiv(conn,obiectiveCentrala4);
                    } catch (SQLException var95) {
                        var95.printStackTrace();
                        errorString = var95.getMessage();
                        System.out.println(errorString);
                    }

                }


                if(verificareinvatare == null){




                    String marcas = null;

                    if (emailechipa == null){
                        //marca n
                        Integer marca = DBUtilis.findempecode(conn,email);
                        marcas = marca.toString();

                    }
                    else {
                        //marca subordonat
                        Integer marca = DBUtilis.findempecode(conn,emailechipa);
                        marcas = marca.toString();
                    }


                    int quarter = 1;
                    int quarter2 = 2;
                    int quarter3 = 3;
                    int quarter4 = 4;
                    int year = 2018;
                    String objectivezone = "Invatare";
                    double SATISFACTIONRATE = 0.0;
                    double RUNRATE = 0.0;



                    String OBJECTIVE_NAME= "Obiectiv";
                    String objective_description= "";
                    String objective_target= "";
                    double preconizat = 0;

                    String rezult_value= "";
                    double realizat = 0;

                    ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala(realizat,SATISFACTIONRATE,RUNRATE,quarter,year,marcas,OBJECTIVE_NAME,objective_description,objectivezone,preconizat);
                    ObiectiveCentrala obiectiveCentrala2 = new ObiectiveCentrala(realizat,SATISFACTIONRATE,RUNRATE,quarter2,year,marcas,OBJECTIVE_NAME,objective_description,objectivezone,preconizat);
                    ObiectiveCentrala obiectiveCentrala3 = new ObiectiveCentrala(realizat,SATISFACTIONRATE,RUNRATE,quarter3,year,marcas,OBJECTIVE_NAME,objective_description,objectivezone,preconizat);
                    ObiectiveCentrala obiectiveCentrala4 = new ObiectiveCentrala(realizat,SATISFACTIONRATE,RUNRATE,quarter4,year,marcas,OBJECTIVE_NAME,objective_description,objectivezone,preconizat);

                    String errorString = null;


                    try {
                        DBUtilis.insertObiectiv(conn,obiectiveCentrala);
                        DBUtilis.insertObiectiv(conn,obiectiveCentrala2);
                        DBUtilis.insertObiectiv(conn,obiectiveCentrala3);
                        DBUtilis.insertObiectiv(conn,obiectiveCentrala4);
                    } catch (SQLException var95) {
                        var95.printStackTrace();
                        errorString = var95.getMessage();
                        System.out.println(errorString);
                    }

                }


                if(verificareclienti == null){



                    String marcas = null;

                    if (emailechipa == null){
                        //marca n
                        Integer marca = DBUtilis.findempecode(conn,email);
                        marcas = marca.toString();

                    }
                    else {
                        //marca subordonat
                        Integer marca = DBUtilis.findempecode(conn,emailechipa);
                        marcas = marca.toString();
                    }

                    int quarter = 1;
                    int quarter2 = 2;
                    int quarter3 = 3;
                    int quarter4 = 4;
                    int year = 2018;
                    String objectivezone = "Clienti";
                    double SATISFACTIONRATE = 0.0;
                    double RUNRATE = 0.0;



                    String OBJECTIVE_NAME= "Obiectiv";
                    String objective_description= "";
                    String objective_target= "";
                    double preconizat = 0;

                    String rezult_value= "";
                    double realizat = 0;

                    ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala(realizat,SATISFACTIONRATE,RUNRATE,quarter,year,marcas,OBJECTIVE_NAME,objective_description,objectivezone,preconizat);
                    ObiectiveCentrala obiectiveCentrala2 = new ObiectiveCentrala(realizat,SATISFACTIONRATE,RUNRATE,quarter2,year,marcas,OBJECTIVE_NAME,objective_description,objectivezone,preconizat);
                    ObiectiveCentrala obiectiveCentrala3 = new ObiectiveCentrala(realizat,SATISFACTIONRATE,RUNRATE,quarter3,year,marcas,OBJECTIVE_NAME,objective_description,objectivezone,preconizat);
                    ObiectiveCentrala obiectiveCentrala4 = new ObiectiveCentrala(realizat,SATISFACTIONRATE,RUNRATE,quarter4,year,marcas,OBJECTIVE_NAME,objective_description,objectivezone,preconizat);

                    String errorString = null;


                    try {
                        DBUtilis.insertObiectiv(conn,obiectiveCentrala);
                        DBUtilis.insertObiectiv(conn,obiectiveCentrala2);
                        DBUtilis.insertObiectiv(conn,obiectiveCentrala3);
                        DBUtilis.insertObiectiv(conn,obiectiveCentrala4);
                    } catch (SQLException var95) {
                        var95.printStackTrace();
                        errorString = var95.getMessage();
                        System.out.println(errorString);
                    }

                }


                if(verificareprocese == null){


                    int quarter = 1;
                    int quarter2 = 2;
                    int quarter3 = 3;
                    int quarter4 = 4;


                    int year = 2018;
                    String objectivezone = "Procese";
                    double SATISFACTIONRATE = 0.0;
                    double RUNRATE = 0.0;




                    String marcas = null;

                    if (emailechipa == null){
                        //marca n
                        Integer marca = DBUtilis.findempecode(conn,email);
                        marcas = marca.toString();

                    }
                    else {
                        //marca subordonat
                        Integer marca = DBUtilis.findempecode(conn,emailechipa);
                        marcas = marca.toString();
                    }


                    String OBJECTIVE_NAME= "Procese";
                    String objective_description= "";
                    String objective_target= "";
                    double preconizat = 0;

                    String rezult_value= "";
                    double realizat = 0;

                    ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala(realizat,SATISFACTIONRATE,RUNRATE,quarter,year,marcas,OBJECTIVE_NAME,objective_description,objectivezone,preconizat);
                    ObiectiveCentrala obiectiveCentrala2 = new ObiectiveCentrala(realizat,SATISFACTIONRATE,RUNRATE,quarter2,year,marcas,OBJECTIVE_NAME,objective_description,objectivezone,preconizat);
                    ObiectiveCentrala obiectiveCentrala3 = new ObiectiveCentrala(realizat,SATISFACTIONRATE,RUNRATE,quarter3,year,marcas,OBJECTIVE_NAME,objective_description,objectivezone,preconizat);
                    ObiectiveCentrala obiectiveCentrala4 = new ObiectiveCentrala(realizat,SATISFACTIONRATE,RUNRATE,quarter4,year,marcas,OBJECTIVE_NAME,objective_description,objectivezone,preconizat);

                    String errorString = null;


                    try {
                        DBUtilis.insertObiectiv(conn,obiectiveCentrala);
                        DBUtilis.insertObiectiv(conn,obiectiveCentrala2);
                        DBUtilis.insertObiectiv(conn,obiectiveCentrala3);
                        DBUtilis.insertObiectiv(conn,obiectiveCentrala4);
                    } catch (SQLException var95) {
                        var95.printStackTrace();
                        errorString = var95.getMessage();
                        System.out.println(errorString);
                    }

                }

                if(verificareoameni == null){

                    String marcas = null;

                    if (emailechipa == null){
                        //marca n
                        Integer marca = DBUtilis.findempecode(conn,email);
                        marcas = marca.toString();

                    }
                    else {
                        //marca subordonat
                        Integer marca = DBUtilis.findempecode(conn,emailechipa);
                        marcas = marca.toString();
                    }

                    int quarter = 1;
                    int quarter2 = 2;
                    int quarter3 = 3;
                    int quarter4 = 4;
                    int year = 2018;
                    String objectivezone = "Oameni";
                    double SATISFACTIONRATE = 0.0;
                    double RUNRATE = 0.0;



                    String OBJECTIVE_NAME= "Obiectiv";
                    String objective_description= "";
                    String objective_target= "";
                    double preconizat = 0;

                    String rezult_value= "";
                    double realizat = 0;

                    ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala(realizat,SATISFACTIONRATE,RUNRATE,quarter,year,marcas,OBJECTIVE_NAME,objective_description,objectivezone,preconizat);
                    ObiectiveCentrala obiectiveCentrala2 = new ObiectiveCentrala(realizat,SATISFACTIONRATE,RUNRATE,quarter2,year,marcas,OBJECTIVE_NAME,objective_description,objectivezone,preconizat);
                    ObiectiveCentrala obiectiveCentrala3 = new ObiectiveCentrala(realizat,SATISFACTIONRATE,RUNRATE,quarter3,year,marcas,OBJECTIVE_NAME,objective_description,objectivezone,preconizat);
                    ObiectiveCentrala obiectiveCentrala4 = new ObiectiveCentrala(realizat,SATISFACTIONRATE,RUNRATE,quarter4,year,marcas,OBJECTIVE_NAME,objective_description,objectivezone,preconizat);

                    String errorString = null;


                    try {
                        DBUtilis.insertObiectiv(conn,obiectiveCentrala);
                        DBUtilis.insertObiectiv(conn,obiectiveCentrala2);
                        DBUtilis.insertObiectiv(conn,obiectiveCentrala3);
                        DBUtilis.insertObiectiv(conn,obiectiveCentrala4);
                    } catch (SQLException var95) {
                        var95.printStackTrace();
                        errorString = var95.getMessage();
                        System.out.println(errorString);
                    }

                }
                //afisare rezultate
                List nrfinanciar = null;
                List nrfinanciarq2 = null;
                List nrfinanciarq3 = null;
                List nrfinanciarq4 = null;
                List nrclienti = null;
                List nrclientiq2 = null;
                List nrclientiq3 = null;
                List nrclientiq4 = null;
                List nrprocese = null;
                List nrproceseq2 = null;
                List nrproceseq3 = null;
                List nrproceseq4 = null;
                List nroameni = null;
                List nroameniq2 = null;
                List nroameniq3 = null;
                List nroameniq4 = null;
                List nrinvatare = null;
                List nrinvatareq2 = null;
                List nrinvatareq3 = null;
                List nrinvatareq4 = null;
                String errorString = null;
                List rezultate = null;
                List valori = null;
                Integer ID = 0;
                Integer IDC = 0;
                Integer IDP = 0;
                Integer IDO = 0;
                Integer IDI = 0;
               // List obiectivefinanciar = null;
                try {
                    if (emailechipa == null) {


                        Integer marca = DBUtilis.findempecode(conn,email);
                        nrfinanciar = DBUtilis.obiectivefinanciar(conn,marca);
                        nrfinanciarq2 = DBUtilis.obiectivefinanciarq2(conn,marca);
                        nrfinanciarq3 = DBUtilis.obiectivefinanciarq3(conn,marca);
                        nrfinanciarq4 = DBUtilis.obiectivefinanciarq4(conn,marca);
                        nrclienti = DBUtilis.obiectiveclienti(conn,marca);
                        nrclientiq2 = DBUtilis.obiectiveclientiq2(conn,marca);
                        nrclientiq3 = DBUtilis.obiectiveclientiq3(conn,marca);
                        nrclientiq4 = DBUtilis.obiectiveclientiq4(conn,marca);
                        nrprocese = DBUtilis.obiectiveprocese(conn,marca);
                        nrproceseq2 = DBUtilis.obiectiveproceseq2(conn,marca);
                        nrproceseq3 = DBUtilis.obiectiveproceseq3(conn,marca);
                        nrproceseq4 = DBUtilis.obiectiveproceseq4(conn,marca);
                        nroameni = DBUtilis.obiectiveoameni(conn,marca);
                        nroameniq2 = DBUtilis.obiectiveoameniq2(conn,marca);
                        nroameniq3 = DBUtilis.obiectiveoameniq3(conn,marca);
                        nroameniq4 = DBUtilis.obiectiveoameniq4(conn,marca);
                        nrinvatare = DBUtilis.obiectiveinvatare(conn,marca);
                        nrinvatareq2 = DBUtilis.obiectiveinvatareq2(conn,marca);
                        nrinvatareq3 = DBUtilis.obiectiveinvatareq3(conn,marca);
                        nrinvatareq4 = DBUtilis.obiectiveinvatareq4(conn,marca);
                        valori = DBUtilis.valori(conn,email);
                        rezultate = DBUtilis.rezultate(conn,email);
                        ID = DBUtilis.idFinanciar(conn,marca);
                        IDC = DBUtilis.idClienti(conn,marca);
                        IDP = DBUtilis.idProcese(conn,marca);
                        IDI = DBUtilis.idInvatare(conn,marca);
                        IDO = DBUtilis.idOameni(conn,marca);
                        System.out.println(ID);
                        System.out.println(IDC);
                        System.out.println(IDP);
                        System.out.println(IDI);
                        System.out.println(IDO);
                    }
                    else{
                        rezultate = DBUtilis.rezultate(conn,emailechipa);
                        Integer marca = DBUtilis.findempecode(conn,emailechipa);
                        nrfinanciar = DBUtilis.obiectivefinanciar(conn,marca);
                        nrfinanciarq2 = DBUtilis.obiectivefinanciarq2(conn,marca);
                        nrfinanciarq3 = DBUtilis.obiectivefinanciarq3(conn,marca);
                        nrfinanciarq4 = DBUtilis.obiectivefinanciarq4(conn,marca);
                        nrclienti = DBUtilis.obiectiveclienti(conn,marca);
                        nrclientiq2 = DBUtilis.obiectiveclientiq2(conn,marca);
                        nrclientiq3 = DBUtilis.obiectiveclientiq3(conn,marca);
                        nrclientiq4 = DBUtilis.obiectiveclientiq4(conn,marca);
                        nrprocese = DBUtilis.obiectiveprocese(conn,marca);
                        nrproceseq2 = DBUtilis.obiectiveproceseq2(conn,marca);
                        nrproceseq3 = DBUtilis.obiectiveproceseq3(conn,marca);
                        nrproceseq4 = DBUtilis.obiectiveproceseq4(conn,marca);
                        nroameni = DBUtilis.obiectiveoameni(conn,marca);
                        nroameniq2 = DBUtilis.obiectiveoameniq2(conn,marca);
                        nroameniq3 = DBUtilis.obiectiveoameniq3(conn,marca);
                        nroameniq4 = DBUtilis.obiectiveoameniq4(conn,marca);
                        nrinvatare = DBUtilis.obiectiveinvatare(conn,marca);
                        nrinvatareq2 = DBUtilis.obiectiveinvatareq2(conn,marca);
                        nrinvatareq3 = DBUtilis.obiectiveinvatareq3(conn,marca);
                        nrinvatareq4 = DBUtilis.obiectiveinvatareq4(conn,marca);
                        valori = DBUtilis.valori(conn,emailechipa);

                        ID = DBUtilis.idFinanciar(conn,marca);
                        IDC = DBUtilis.idClienti(conn,marca);
                        IDP = DBUtilis.idProcese(conn,marca);
                        IDI = DBUtilis.idInvatare(conn,marca);
                        IDO = DBUtilis.idOameni(conn,marca);
                        System.out.println(ID);
                        System.out.println(IDC);
                        System.out.println(IDP);
                        System.out.println(IDI);
                        System.out.println(IDO);

                    }
                } catch (SQLException var233) {
                    var233.printStackTrace();
                    errorString = var233.getMessage();
                    System.out.println(errorString);
                }


                session.setAttribute("ID",ID);
                session.setAttribute("IDC",IDC);
                session.setAttribute("IDP",IDP);
                session.setAttribute("IDI",IDI);
                session.setAttribute("IDO",IDO);




                request.setAttribute("valori",valori);
                request.setAttribute("nrfinanciar",nrfinanciar);
                request.setAttribute("nrfinanciarq2",nrfinanciarq2);
                request.setAttribute("nrfinanciarq3",nrfinanciarq3);
                request.setAttribute("nrfinanciarq4",nrfinanciarq4);



                request.setAttribute("nrclienti",nrclienti);
                request.setAttribute("nrclientiq2",nrclientiq2);
                request.setAttribute("nrclientiq3",nrclientiq3);
                request.setAttribute("nrclientiq4",nrclientiq4);


                request.setAttribute("nrprocese",nrprocese);
                request.setAttribute("nrproceseq2",nrproceseq2);
                request.setAttribute("nrproceseq3",nrproceseq3);
                request.setAttribute("nrproceseq4",nrproceseq4);

                request.setAttribute("nroameni",nroameni);
                request.setAttribute("nroameniq2",nroameniq2);
                request.setAttribute("nroameniq3",nroameniq3);
                request.setAttribute("nroameniq4",nroameniq4);

                request.setAttribute("nrinvatare",nrinvatare);
                request.setAttribute("nrinvatareq2",nrinvatareq2);
                request.setAttribute("nrinvatareq3",nrinvatareq3);
                request.setAttribute("nrinvatareq4",nrinvatareq4);

                request.setAttribute("rezultate",rezultate);
                request.setAttribute("verifechipa",verifechipa);
                request.setAttribute("emailechipa",emailechipa);
               // request.setAttribute("npoza",npoza);


                request.setAttribute("last_name_echipa",last_name_echipa);
                request.setAttribute("first_name_echipa",first_name_echipa);
                request.setAttribute("superior_full_name",superior_full_name);
                request.setAttribute("superior_full_name_user_logat",superior_full_name_user_logat);


                RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
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

