package Evaluare;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DBUtilis {
    public DBUtilis() {
    }


    public static List<Employee> echipa(Connection conn,String np1_email) throws SQLException {
        String sql = "SELECT a.code, a.last_name,a.first_name, a.email,a.unit,a.superior_full_name ,b.q1,b.q2,b.q3,b.q4, b.q_an,b.poza, c.nota_discernamant,c.nota_integritate,c.nota_pasiune, c.nota_invatare,c.nota_colaborare,c.nota_simplitate,c.nota_respect FROM  employee_all a  LEFT JOIN employee_superior_all d ON a.code = d.code  LEFT JOIN rezultate b ON a.code = b.marca  LEFT JOIN valori c ON a.code = c.employee_pk  WHERE  np1_email = ? ORDER BY a.last_name  ";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, np1_email);
        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while(rs.next()) {
            String last_name = rs.getString("last_name");
            String first_name = rs.getString("first_name");
            String email = rs.getString("email");

            String unit= rs.getString("unit");
            String code = rs.getString("code");
            String superior_full_name = rs.getString("superior_full_name");

            String q1 = rs.getString("q1");
            String q2 = rs.getString("q2");
            String q3 = rs.getString("q3");
            String q4 = rs.getString("q4");
            String q_an = rs.getString("q_an");
            String poza = rs.getString("poza");
            Integer nota_integritate = rs.getInt("nota_integritate");
            Integer nota_discernamant = rs.getInt("nota_discernamant");
            Integer nota_pasiune = rs.getInt("nota_pasiune");
            Integer nota_respect = rs.getInt("nota_respect");
            Integer nota_simplitate = rs.getInt("nota_simplitate");
            Integer nota_colaborare = rs.getInt("nota_colaborare");
            Integer nota_invatare = rs.getInt("nota_invatare");

            echipaDetalii echipaDetalii = new echipaDetalii();
            echipaDetalii.setEmail(email);
            echipaDetalii.setFirst_name(first_name);
            echipaDetalii.setLast_name(last_name);
            echipaDetalii.setUnit(unit);
            echipaDetalii.setQ1(q1);
            echipaDetalii.setQ2(q2);
            echipaDetalii.setQ3(q3);
            echipaDetalii.setQ4(q4);
            echipaDetalii.setQ_an(q_an);
            echipaDetalii.setPoza(poza);
            echipaDetalii.setNota_colaborare(nota_colaborare);
            echipaDetalii.setNota_discernamant(nota_discernamant);
            echipaDetalii.setNota_integritate(nota_integritate);
            echipaDetalii.setNota_invatare(nota_invatare);
            echipaDetalii.setNota_pasiune(nota_pasiune);
            echipaDetalii.setNota_simplitate(nota_simplitate);
            echipaDetalii.setNota_respect(nota_respect);
            echipaDetalii.setCode(code);
            echipaDetalii.setSuperior_full_name(superior_full_name);


            list.add(echipaDetalii);
        }

        return list;
    }



//


    public static List<Employee> echipadelegati(Connection conn,String np1_email) throws SQLException {
        String sql = "SELECT a.code, a.last_name,a.first_name, a.email,a.unit,a.superior_full_name ,b.q1,b.q2,b.q3,b.q4, b.q_an,b.poza, c.nota_discernamant,c.nota_integritate,c.nota_pasiune, c.nota_invatare,c.nota_colaborare,c.nota_simplitate,c.nota_respect FROM  employee_all a JOIN rezultate b JOIN valori c JOIN delegati d ON (a.code = b.marca) AND (b.marca = c.employee_pk"
                +") AND (c.employee_pk = d.code) WHERE d.np1_email = ? ORDER BY a.last_name";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, np1_email);
        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while(rs.next()) {
            String last_name = rs.getString("last_name");
            String first_name = rs.getString("first_name");
            String email = rs.getString("email");

            String unit= rs.getString("unit");
            String code = rs.getString("code");
            String superior_full_name = rs.getString("superior_full_name");

            String q1 = rs.getString("q1");
            String q2 = rs.getString("q2");
            String q3 = rs.getString("q3");
            String q4 = rs.getString("q4");
            String q_an = rs.getString("q_an");
            String poza = rs.getString("poza");
            Integer nota_integritate = rs.getInt("nota_integritate");
            Integer nota_discernamant = rs.getInt("nota_discernamant");
            Integer nota_pasiune = rs.getInt("nota_pasiune");
            Integer nota_respect = rs.getInt("nota_respect");
            Integer nota_simplitate = rs.getInt("nota_simplitate");
            Integer nota_colaborare = rs.getInt("nota_colaborare");
            Integer nota_invatare = rs.getInt("nota_invatare");

            echipaDetalii echipaDetalii = new echipaDetalii();
            echipaDetalii.setEmail(email);
            echipaDetalii.setFirst_name(first_name);
            echipaDetalii.setLast_name(last_name);
            echipaDetalii.setUnit(unit);
            echipaDetalii.setQ1(q1);
            echipaDetalii.setQ2(q2);
            echipaDetalii.setQ3(q3);
            echipaDetalii.setQ4(q4);
            echipaDetalii.setQ_an(q_an);
            echipaDetalii.setPoza(poza);
            echipaDetalii.setNota_colaborare(nota_colaborare);
            echipaDetalii.setNota_discernamant(nota_discernamant);
            echipaDetalii.setNota_integritate(nota_integritate);
            echipaDetalii.setNota_invatare(nota_invatare);
            echipaDetalii.setNota_pasiune(nota_pasiune);
            echipaDetalii.setNota_simplitate(nota_simplitate);
            echipaDetalii.setNota_respect(nota_respect);
            echipaDetalii.setCode(code);
            echipaDetalii.setSuperior_full_name(superior_full_name);


            list.add(echipaDetalii);
        }

        return list;
    }


    public  static  List<EmployeeSuperior> infoangajat (Connection conn, String email2) throws  SQLException{
        String sql = "Select code,last_name,first_name,email,np1_code,np1_last_name,np1_first_name,np1_email,np2_code, np2_last_name, np2_first_name, np2_email, np3_code, np3_last_name, np3_first_name, np3_email," +
                " np4_code,np4_last_name,np4_first_name, np4_email,np5_code, np5_last_name, np5_first_name, np5_email from employee_superior_all where email = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, email2);
        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();
        while(rs.next()) {

            String code = rs.getString("code");
            String last_name = rs.getString("last_name");
            String first_name = rs.getString("first_name");
            String email = rs.getString("email");

            String np1_code = rs.getString("np1_code");
            String np1_last_name = rs.getString("np1_last_name");
            String np1_first_name = rs.getString("np1_first_name");
            String np1_email = rs.getString("np1_email");


            String np2_code = rs.getString("np2_code");
            String np2_last_name = rs.getString("np2_last_name");
            String np2_first_name = rs.getString("np2_first_name");
            String np2_email = rs.getString("np2_email");


            String np3_code = rs.getString("np3_code");
            String np3_last_name = rs.getString("np3_last_name");
            String np3_first_name = rs.getString("np3_first_name");
            String np3_email = rs.getString("np3_email");

            String np4_code = rs.getString("np4_code");
            String np4_last_name = rs.getString("np4_last_name");
            String np4_first_name = rs.getString("np4_first_name");
            String np4_email = rs.getString("np4_email");

            String np5_code = rs.getString("np5_code");
            String np5_last_name = rs.getString("np5_last_name");
            String np5_first_name = rs.getString("np5_first_name");
            String np5_email = rs.getString("np5_email");

            EmployeeSuperior employeeSuperior = new EmployeeSuperior();

            employeeSuperior.setEmail(email);
            employeeSuperior.setLast_name(last_name);
            employeeSuperior.setFirst_name(first_name);
            employeeSuperior.setCode(code);
            employeeSuperior.setNp1_code(np1_code);
            employeeSuperior.setNp1_email(np1_email);
            employeeSuperior.setNp1_last_name(np1_last_name);
            employeeSuperior.setNp1_first_name(np1_first_name);
            employeeSuperior.setNp2_code(np2_code);
            employeeSuperior.setNp2_first_name(np2_first_name);
            employeeSuperior.setNp2_last_name(np2_last_name);
            employeeSuperior.setNp2_email(np2_email);
            employeeSuperior.setNp3_code(np3_code);
            employeeSuperior.setNp3_first_name(np3_first_name);
            employeeSuperior.setNp3_last_name(np3_last_name);
            employeeSuperior.setNp3_email(np3_email);
            employeeSuperior.setNp4_code(np4_code);
            employeeSuperior.setNp4_first_name(np4_first_name);
            employeeSuperior.setNp4_last_name(np4_last_name);
            employeeSuperior.setNp4_email(np4_email);
            employeeSuperior.setNp5_code(np5_code);
            employeeSuperior.setNp5_first_name(np5_first_name);
            employeeSuperior.setNp5_last_name(np5_last_name);
            employeeSuperior.setNp5_email(np5_email);

            list.add(employeeSuperior);

        }

        return list;
    }


    public static List<ValoriServlet> valori (Connection conn, String email) throws SQLException{
        String sql = "Select a.integritate, a.discernamant, a.pasiune, a.respect, a.simplitate, a.invatare, a.colaborare," +
                " a.nota_integritate, a.nota_discernamant, a.nota_pasiune, a.nota_respect, a.nota_invatare, a.nota_colaborare, a.nota_simplitate," +

                " a.nintegritate,a.ndiscernamant,a.npasiune,a.nrespect,a.nsimplitate, a.ninvatare,a.ncolaborare,a.nnota_integritate,a.nnota_discernamant,"
         +" a.nnota_pasiune,a.nnota_respect,a.nnota_invatare,a.nnota_colaborare,a.nnota_simplitate from valori a join employee_all e on a.employee_pk  = e.code where e.email = ?" ;
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, email);
        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while(rs.next()) {
            String integritate = rs.getString("integritate");
            String discernamant = rs.getString("discernamant");
            String pasiune = rs.getString("pasiune");
            String respect = rs.getString("respect");
            String simplitate = rs.getString("simplitate");
            String colaborare = rs.getString("colaborare");
            String invatare = rs.getString("invatare");

            Integer nota_integritate = rs.getInt("nota_integritate");
            Integer nota_discernamant = rs.getInt("nota_discernamant");
            Integer nota_pasiune = rs.getInt("nota_pasiune");
            Integer nota_respect = rs.getInt("nota_respect");
            Integer nota_simplitate = rs.getInt("nota_simplitate");
            Integer nota_colaborare = rs.getInt("nota_colaborare");
            Integer nota_invatare = rs.getInt("nota_invatare");

            String nintegritate = rs.getString("nintegritate");
            String ndiscernamant = rs.getString("ndiscernamant");
            String npasiune = rs.getString("npasiune");
            String nrespect = rs.getString("nrespect");
            String nsimplitate = rs.getString("nsimplitate");
            String ncolaborare = rs.getString("ncolaborare");
            String ninvatare = rs.getString("ninvatare");

            Integer nnota_integritate = rs.getInt("nnota_integritate");
            Integer nnota_discernamant = rs.getInt("nnota_discernamant");
            Integer nnota_pasiune = rs.getInt("nnota_pasiune");
            Integer nnota_respect = rs.getInt("nnota_respect");
            Integer nnota_simplitate = rs.getInt("nnota_simplitate");
            Integer nnota_colaborare = rs.getInt("nnota_colaborare");
            Integer nnota_invatare = rs.getInt("nnota_invatare");

            ValoriServlet valoriServlet = new ValoriServlet();

            valoriServlet.setColaborare(colaborare);
            valoriServlet.setDiscernamant(discernamant);
            valoriServlet.setIntegritate(integritate);
            valoriServlet.setInvatare(invatare);
            valoriServlet.setSimplitate(simplitate);
            valoriServlet.setPasiune(pasiune);
            valoriServlet.setRespect(respect);
            valoriServlet.setNota_colaborare(nota_colaborare);
            valoriServlet.setNota_discernamant(nota_discernamant);
            valoriServlet.setNota_integritate(nota_integritate);
            valoriServlet.setNota_invatare(nota_invatare);
            valoriServlet.setNota_pasiune(nota_pasiune);
            valoriServlet.setNota_respect(nota_respect);
            valoriServlet.setNota_simplitate(nota_simplitate);

            valoriServlet.setNcolaborare(ncolaborare);
            valoriServlet.setNdiscernamant(ndiscernamant);
            valoriServlet.setNintegritate(nintegritate);
            valoriServlet.setNinvatare(ninvatare);
            valoriServlet.setNsimplitate(nsimplitate);
            valoriServlet.setNpasiune(npasiune);
            valoriServlet.setNrespect(nrespect);
            valoriServlet.setNsimplitate(nsimplitate);

            valoriServlet.setNnota_colaborare(nnota_colaborare);
            valoriServlet.setNnota_discernamant(nnota_discernamant);
            valoriServlet.setNnota_integritate(nnota_integritate);
            valoriServlet.setNnota_invatare(nnota_invatare);
            valoriServlet.setNnota_pasiune(nnota_pasiune);
            valoriServlet.setNnota_respect(nnota_respect);
            valoriServlet.setNnota_simplitate(nnota_simplitate);
            list.add(valoriServlet);
        }

        return list;

    }





    public static List<ValoriServlet> competente (Connection conn, String email, String pilon) throws SQLException{
        String sql = "Select a.abilitati, a.subactivitati, a.voi_continua, a.voi_lua_in_considerare, a.pilon from competente a join employee_all e on a.marca  = e.code where e.email = ? and a.pilon =?" ;
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, email);
        pstm.setString(2,pilon);
        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while(rs.next()) {
            String abilitati = rs.getString("abilitati");
            String subactivitati = rs.getString("subactivitati");
            String voi_continua = rs.getString("voi_continua");
            String voi_lua_in_considerare = rs.getString("voi_lua_in_considerare");


            Competente competente = new Competente();
            competente.setAbilitati(abilitati);
            competente.setSubactivitati(subactivitati);
            competente.setVoi_continua(voi_continua);
            competente.setVoi_lua_in_considerare(voi_lua_in_considerare);
            competente.setPilon(pilon);


            System.out.println("abilitati");
            System.out.println(abilitati);
            System.out.println("pilon");
            System.out.println(pilon);
            list.add(competente);
        }

        return list;

    }

    public static List<Rezultate> rezultate (Connection conn, String email) throws SQLException{
        String sql = "Select a.financiar_procent, a.clienti_procent, a.procese_procent, a.invatare_procent,a.oameni_procent, a.termen_scurt, a.termen_lung,a.q1,a.q2,a.q3,a.q4,a.q_an,a.nq1,a.nq2,a.nq3,a.nq4,a.nq_an,a.poza,a.npoza from rezultate a join employee_all e on a.marca = e.code where e.email = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, email);
        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while (rs.next()){
            Double financiar_procent = rs.getDouble("financiar_procent");
            Double clienti_procent = rs.getDouble("clienti_procent");
            Double procese_procent = rs.getDouble("procese_procent");
            Double invatare_procent = rs.getDouble("invatare_procent");
            Double oameni_procent = rs.getDouble("oameni_procent");
            String termen_lung = rs.getString("termen_lung");
            String termen_scurt = rs.getString("termen_scurt");
            String q1 = rs.getString("q1");
            String q2 = rs.getString("q2");
            String q3 = rs.getString("q3");
            String q4 = rs.getString("q4");
            String q_an = rs.getString("q_an");

            String nq1 = rs.getString("nq1");
            String nq2 = rs.getString("nq2");
            String nq3 = rs.getString("nq3");
            String nq4 = rs.getString("nq4");
            String nq_an = rs.getString("nq_an");
            String poza = rs.getString("poza");
            String npoza = rs.getString("npoza");

            Rezultate rezultate = new Rezultate();
            rezultate.setFinanciar_procent(financiar_procent);
            rezultate.setClienti_procent(clienti_procent);
            rezultate.setInvatare_procent(invatare_procent);
            rezultate.setProcese_procent(procese_procent);
            rezultate.setOameni_procent(oameni_procent);
            rezultate.setTermen_lung(termen_lung);
            rezultate.setTermen_scurt(termen_scurt);
            rezultate.setQ1(q1);
            rezultate.setQ2(q2);
            rezultate.setQ3(q3);
            rezultate.setQ4(q4);
            rezultate.setQ_an(q_an);
            rezultate.setNq1(nq1);
            rezultate.setNq2(nq2);
            rezultate.setNq3(nq3);
            rezultate.setNq4(nq4);
            rezultate.setNq_an(nq_an);
            rezultate.setPoza(poza);
            rezultate.setNpoza(npoza);
            list.add(rezultate);

        }


        return list;
    }

    public static void insertValori(Connection conn, ValoriServlet valori) throws SQLException {

        String sql = "Insert into valori(employee_pk,integritate,pasiune,invatare,simplitate,colaborare,respect,discernamant," +
                "nota_integritate,nota_pasiune,nota_invatare,nota_simplitate,nota_colaborare,nota_respect,nota_discernamant, " +
                "nintegritate,npasiune,ninvatare,nsimplitate,ncolaborare,nrespect,ndiscernamant,"+
                "nnota_integritate,nnota_pasiune,nnota_invatare,nnota_simplitate,nnota_colaborare,nnota_respect,nnota_discernamant) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement pstm = conn.prepareStatement(sql);

        pstm.setInt(1, valori.getEmployee_pk());
        pstm.setString(2,valori.getIntegritate());
        pstm.setString(3,valori.getPasiune());
        pstm.setString(4,valori.getInvatare());
        pstm.setString(5,valori.getSimplitate());

        pstm.setString(6,valori.getColaborare());
        pstm.setString(7,valori.getRespect());
        pstm.setString(8,valori.getDiscernamant());

        pstm.setInt(9, valori.getNota_pasiune());
        pstm.setInt(10, valori.getNota_invatare());
        pstm.setInt(11, valori.getNota_simplitate());
        pstm.setInt(12, valori.getNota_colaborare());
        pstm.setInt(13, valori.getNota_respect());
        pstm.setInt(14, valori.getNota_discernamant());
        pstm.setInt(15, valori.getNota_integritate());

        pstm.setString(16,valori.getNintegritate());
        pstm.setString(17,valori.getNpasiune());
        pstm.setString(18,valori.getNinvatare());
        pstm.setString(19,valori.getNsimplitate());

        pstm.setString(20,valori.getNcolaborare());
        pstm.setString(21,valori.getNrespect());
        pstm.setString(22,valori.getNdiscernamant());

        pstm.setInt(23, valori.getNnota_pasiune());
        pstm.setInt(24, valori.getNnota_invatare());
        pstm.setInt(25, valori.getNnota_simplitate());
        pstm.setInt(26, valori.getNnota_colaborare());
        pstm.setInt(27, valori.getNnota_respect());
        pstm.setInt(28, valori.getNnota_discernamant());
        pstm.setInt(29, valori.getNnota_integritate());
        pstm.executeUpdate();
    }



    public static void insertCompetente(Connection conn, Competente competente) throws SQLException {

        String sql = "Insert into competente(abilitati,subactivitati,voi_continua,voi_lua_in_considerare,marca,pilon) values (?,?,?,?,?,?)";
        PreparedStatement pstm = conn.prepareStatement(sql);

        pstm.setString(1,competente.getAbilitati());
        pstm.setString(2,competente.getSubactivitati());
        pstm.setString(3,competente.getVoi_continua());
        pstm.setString(4,competente.getVoi_lua_in_considerare());
        pstm.setInt(5,competente.getMarca());
        pstm.setString(6,competente.getPilon());

        pstm.executeUpdate();
    }

    public static void insertEmployeeRam(Connection conn, Employee employee) throws SQLException{

        String sql = "insert into employee_ram(pk_employee,status,code,last_name,first_name,position,unit,ccc,cost_center,superior_full_name,superior_position,email) values (?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1,employee.getPk_employee());
        pstm.setInt(2,employee.getStatus());
        pstm.setString(3,employee.getCode());
        pstm.setString(4,employee.getLast_name());
        pstm.setString(5,employee.getFirst_name());
        pstm.setString(6,employee.getPosition());
        pstm.setString(7,employee.getUnit());
        pstm.setString(8,employee.getCcc());
        pstm.setString(9,employee.getCost_center());
        pstm.setString(10,employee.getSuperior_full_name());
        pstm.setString(11,employee.getSuperior_position());
        pstm.setString(12,employee.getEmail());

        pstm.executeUpdate();


    }

    public static void insertRezultate(Connection conn, Rezultate rezultate) throws SQLException {

        String sql = "Insert into rezultate(financiar_procent,clienti_procent,invatare_procent,procese_procent,oameni_procent,termen_scurt,termen_lung,marca,q1,q2,q3,q4,q_an,nq1,nq2,nq3,nq4,nq_an,poza,npoza) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setDouble(1,rezultate.getFinanciar_procent());
        pstm.setDouble(2,rezultate.getClienti_procent());
        pstm.setDouble(3,rezultate.getInvatare_procent());
        pstm.setDouble(4,rezultate.getProcese_procent());
        pstm.setDouble(5,rezultate.getOameni_procent());
        pstm.setString(6,rezultate.getTermen_scurt());
        pstm.setString(7,rezultate.getTermen_lung());
        pstm.setInt(8,rezultate.getMarca());
        pstm.setString(9,rezultate.getQ1());
        pstm.setString(10,rezultate.getQ2());
        pstm.setString(11,rezultate.getQ3());
        pstm.setString(12,rezultate.getQ4());
        pstm.setString(13,rezultate.getQ_an());

        pstm.setString(14,rezultate.getNq1());
        pstm.setString(15,rezultate.getNq2());
        pstm.setString(16,rezultate.getNq3());
        pstm.setString(17,rezultate.getNq4());
        pstm.setString(18,rezultate.getNq_an());
        pstm.setString(19,rezultate.getPoza());
        pstm.setString(20,rezultate.getNpoza());


        pstm.executeUpdate();


    }

    public static void insertdelegat (Connection conn,Delegati delegati) throws  SQLException{
        String sql = "Insert into delegati (code,last_name,first_name,email,np1_code," +
                " np1_last_name, np1_first_name, np1_email,  np2_code,  np2_last_name," +
                " np2_first_name, np2_email,np3_code, np3_last_name, np3_first_name," +
                " np3_email, np4_code,  np4_last_name,  np4_first_name,  np4_email, np5_code," +
                " np5_last_name, np5_first_name, np5_email) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement pstm = conn.prepareStatement(sql);

        pstm.setString(1,delegati.getCode());
        pstm.setString(2,delegati.getLast_name());
        pstm.setString(3,delegati.getFirst_name());
        pstm.setString(4,delegati.getEmail());
        pstm.setString(5,delegati.getNp1_code());
        pstm.setString(6,delegati.getNp1_last_name());
        pstm.setString(7,delegati.getNp1_first_name());
        pstm.setString(8,delegati.getNp1_email());
        pstm.setString(9,delegati.getNp2_code());
        pstm.setString(10,delegati.getNp2_last_name());
        pstm.setString(11,delegati.getNp2_first_name());
        pstm.setString(12,delegati.getNp2_email());
        pstm.setString(13,delegati.getNp3_code());
        pstm.setString(14,delegati.getNp3_last_name());
        pstm.setString(15,delegati.getNp3_first_name());
        pstm.setString(16,delegati.getNp3_email());
        pstm.setString(17,delegati.getNp4_code());
        pstm.setString(18,delegati.getNp4_last_name());
        pstm.setString(19,delegati.getNp4_first_name());
        pstm.setString(20,delegati.getNp4_email());
        pstm.setString(21,delegati.getNp5_code());
        pstm.setString(22,delegati.getNp5_last_name());
        pstm.setString(23,delegati.getNp5_first_name());
        pstm.setString(24,delegati.getNp5_email());
        pstm.executeUpdate();

    }

    public static void updateValori(Connection conn,ValoriServlet valori,Integer employee_pk) throws SQLException{
        String sql = "Update valori set integritate = ?, pasiune = ? , discernamant = ?, invatare = ?, respect = ?,colaborare = ?, " +
                "simplitate = ? , nota_integritate = ?, nota_pasiune = ?, nota_discernamant = ?, nota_invatare = ?," +
                "nota_respect = ?,nota_simplitate =?, nota_colaborare = ?," +
                "nintegritate = ?, npasiune = ? , ndiscernamant = ?, ninvatare = ?, nrespect = ?,ncolaborare = ?," +
                "nsimplitate = ? , nnota_integritate = ?, nnota_pasiune = ?, nnota_discernamant = ?, nnota_invatare = ?," +
                "nnota_respect = ?,nnota_simplitate =?, nnota_colaborare = ? where employee_pk = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);


        pstm.setString(1,valori.getIntegritate());
        pstm.setString(2,valori.getPasiune());

        pstm.setString(3,valori.getDiscernamant());

        pstm.setString(4,valori.getInvatare());
        pstm.setString(5,valori.getRespect());
        pstm.setString(6,valori.getColaborare());
        pstm.setString(7,valori.getSimplitate());

        pstm.setInt(8, valori.getNota_integritate());

        pstm.setInt(9, valori.getNota_pasiune());
        pstm.setInt(10, valori.getNota_discernamant());
        pstm.setInt(11, valori.getNota_invatare());
        pstm.setInt(12, valori.getNota_respect());
        pstm.setInt(13, valori.getNota_simplitate());
        pstm.setInt(14, valori.getNota_colaborare());


        pstm.setString(15,valori.getNintegritate());
        pstm.setString(16,valori.getNpasiune());

        pstm.setString(17,valori.getNdiscernamant());

        pstm.setString(18,valori.getNinvatare());
        pstm.setString(19,valori.getNrespect());
        pstm.setString(20,valori.getNcolaborare());
        pstm.setString(21,valori.getNsimplitate());

        pstm.setInt(22, valori.getNnota_integritate());

        pstm.setInt(23, valori.getNnota_pasiune());
        pstm.setInt(24, valori.getNnota_discernamant());
        pstm.setInt(25, valori.getNnota_invatare());
        pstm.setInt(26, valori.getNnota_respect());
        pstm.setInt(27, valori.getNnota_simplitate());
        pstm.setInt(28, valori.getNnota_colaborare());
        pstm.setInt(29, employee_pk);

        System.out.println("employee_pk");
        System.out.println(employee_pk);


        pstm.executeUpdate();


    }

    public static void updateCompetente (Connection conn, Competente competente,Integer marca, String pilon) throws  SQLException{

        String sql = "Update competente set abilitati = ?,subactivitati = ?,voi_continua =?, voi_lua_in_considerare=? where marca =? and pilon =?";
        PreparedStatement pstm = conn.prepareStatement(sql);

        pstm.setString(1,competente.getAbilitati());
        pstm.setString(2,competente.getSubactivitati());
        pstm.setString(3,competente.getVoi_continua());
        pstm.setString(4,competente.getVoi_lua_in_considerare());
        pstm.setInt(5,marca);
        pstm.setString(6,pilon);
        pstm.executeUpdate();
    }

    public static void updateRezultate(Connection conn, Rezultate rezultate,Integer marca) throws SQLException{
        String sql = "Update rezultate set q1 =?,q2 =?, q3=?, q4 =?, q_an = ?,termen_scurt=?, termen_lung=?,nq1=?,nq2 = ?, nq3 = ?,nq4 = ?, nq_an = ?,financiar_procent =?,clienti_procent =?,invatare_procent =?,procese_procent =?,oameni_procent=? ,poza =?,npoza = ? where marca =?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1,rezultate.getQ1());
        pstm.setString(2,rezultate.getQ2());
        pstm.setString(3,rezultate.getQ3());
        pstm.setString(4,rezultate.getQ4());
        pstm.setString(5,rezultate.getQ_an());
        pstm.setString(6,rezultate.getTermen_scurt());
        pstm.setString(7,rezultate.getTermen_lung());
        pstm.setString(8,rezultate.getNq1());
        pstm.setString(9,rezultate.getNq2());
        pstm.setString(10,rezultate.getNq3());
        pstm.setString(11,rezultate.getNq4());
        pstm.setString(12,rezultate.getNq_an());
        pstm.setDouble(13,rezultate.getFinanciar_procent());
        pstm.setDouble(14,rezultate.getClienti_procent());
        pstm.setDouble(15,rezultate.getInvatare_procent());
        pstm.setDouble(16,rezultate.getProcese_procent());
        pstm.setDouble(17,rezultate.getOameni_procent());
        pstm.setString(18,rezultate.getPoza());
        pstm.setString(19,rezultate.getNpoza());
        pstm.setInt(20,marca);
        pstm.executeUpdate();

    }
//aflu employee_fk

    public static Integer findempecode (Connection conn, String email) throws SQLException {
        String sql = "Select code  AS cod from employee_all where email = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, email);

        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            Integer cod = rs.getInt("cod");
            return cod;
        } else {
            return null;
        }
    }

    // aflu poza

    public  static String findpoza(Connection conn, Integer marca) throws SQLException{
        String sql = "Select poza AS poza from rezultate where marca = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1,marca);

        ResultSet rs = pstm.executeQuery();
        if(rs.next()){
            String poza = rs.getString("poza");
            return  poza;
        }
        else
        {
            return  null;
        }

    }

    // info n+1


    public static String verififsuperior (Connection conn, String email) throws SQLException {
        String sql = "SELECT email AS info FROM employee_superior_all WHERE np1_email  = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, email);

        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {

        String info = rs.getString("info");
        return info;
        }
        else{return  null;}
    }


    // aflu departamenul user-ului logat

    public static String departament(Connection conn, String email) throws SQLException {
        String sql = "SELECT unit AS info FROM employee_all WHERE email  = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, email);

        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {

            String info = rs.getString("info");
            return info;
        }
        else{return  null;}
    }
//pentru delegare; verific daca are drepturi pentru a delega


    public static String verifnp2 (Connection conn, String email) throws SQLException {
        String sql = "SELECT email AS info FROM employee_superior_all WHERE np2_email  = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, email);

        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {

            String info = rs.getString("info");
            return info;
        }
        else{return  null;}
    }

    //verfic daca este delegat

    public static String verificaredelegat (Connection conn, String email) throws  SQLException {
        String sql = "SELECT np1_email AS info FROM delegati where np1_email = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1,email);

        ResultSet rs = pstm.executeQuery();

        if (rs.next()){
            String info = rs.getString("info");
            return info;
        }
        else {return  null;}


    }


  // aflu n+1 al user-ului logat

    public static String superioremail (Connection conn, String email) throws SQLException{
        String sql = "Select superior_full_name AS superior FROM employee_all where email = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1,email);

        ResultSet rs = pstm.executeQuery();
        if (rs.next()){
            String superior = rs.getString("superior");
            return superior;
        }
        else {return  null;}

    }


// verific daca am inserat valorile pt angajatul logat

    public static Integer findemployee (Connection conn, Integer employee_pk) throws SQLException {
        String sql = "Select employee_pk  AS cod from valori where employee_pk = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, employee_pk);

        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            Integer cod = rs.getInt("cod");
            return cod;
        } else {
            return null;
        }
    }

//cate obiective exista pentru pilonul financiar

     public static Integer countfinanciar(Connection conn, Integer ENTITY_ID_OR_MARCA) throws SQLException{
        String sql = "Select count(ID) AS numar from obiectivecentrala where OBJECTIVE_ZONE = 'Financiara' and ENTITY_ID_OR_MARCA = ?";
         PreparedStatement pstm = conn.prepareStatement(sql);
         pstm.setInt(1, ENTITY_ID_OR_MARCA);
         ResultSet rs = pstm.executeQuery();

         if (rs.next()) {
             Integer numar = rs.getInt("numar");
             return numar;
         } else {
             return null;
         }
     }

    public static List<ObiectiveCentrala> obiectivefinanciarnume(Connection conn,Integer ENTITY_ID_OR_MARCA,String objective_name) throws SQLException {
        String sql = "Select ID,RESULT_VALUE,OBJECTIVE_TARGET,OBJECTIVE_DESCRIPTION,OBJECTIVE_NAME,SATISFACTION_RATE from obiectivecentrala where OBJECTIVE_ZONE = 'Financiara'  and ENTITY_ID_OR_MARCA = ? and objective_name  = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        pstm.setString(2, objective_name);

        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while(rs.next()) {
            String OBJECTIVE_DESCRIPTION = rs.getString("OBJECTIVE_DESCRIPTION");
            double OBJECTIVE_TARGET = rs.getDouble("OBJECTIVE_TARGET");
            double RESULT_VALUE = rs.getDouble("RESULT_VALUE");
            double SATISFACTION_RATE = rs.getDouble("SATISFACTION_RATE");
            String OBJECTIVE_NAME = rs.getString("OBJECTIVE_NAME");
            int ID = rs.getInt("ID");

            ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala();
            obiectiveCentrala.setOBJECTIVE_DESCRIPTION(OBJECTIVE_DESCRIPTION);
            obiectiveCentrala.setRESULT_VALUE(RESULT_VALUE);
            obiectiveCentrala.setSATISFACTION_RATE(SATISFACTION_RATE);
            obiectiveCentrala.setOBJECTIVE_TARGET(OBJECTIVE_TARGET);
            obiectiveCentrala.setOBJECTIVE_NAME(OBJECTIVE_NAME);
            obiectiveCentrala.setID(ID);


            list.add(obiectiveCentrala);
        }

        return list;
    }



    public static void deleteObiectivFinanciar(Connection conn, Integer ENTITY_ID_OR_MARCA, int ID) throws  SQLException{

        String sql = "Delete  from obiectivecentrala where OBJECTIVE_ZONE = 'Financiara'  and ENTITY_ID_OR_MARCA = ? and ID = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        pstm.setInt(2, ID);
        pstm.executeUpdate();
    }



    public static void updateFinanciar(Connection conn, ObiectiveCentrala obiectiveCentrala,Integer ENTITY_ID_OR_MARCA, int ID) throws SQLException{
        String sql = "Update obiectivecentrala set  RESULT_VALUE =?,OBJECTIVE_TARGET = ?,OBJECTIVE_DESCRIPTION =?,SATISFACTION_RATE=? where OBJECTIVE_ZONE = 'Financiara'  and ENTITY_ID_OR_MARCA = ? and ID = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setDouble(1,obiectiveCentrala.getRESULT_VALUE());
        pstm.setDouble(2,obiectiveCentrala.getOBJECTIVE_TARGET());
        pstm.setString(3,obiectiveCentrala.getOBJECTIVE_DESCRIPTION());
        pstm.setDouble(4,obiectiveCentrala.getSATISFACTION_RATE());
        pstm.setInt(5, ENTITY_ID_OR_MARCA);
        pstm.setInt(6,ID);


        pstm.executeUpdate();

    }



    // insert obiectv nou IN QUARTER SI Q CURENT

    public static void insertObiectiv(Connection conn, ObiectiveCentrala obiectiveCentrala) throws SQLException{
        String sql = "Insert into obiectivecentrala(RESULT_VALUE,SATISFACTION_RATE,RUN_RATE,QUARTER,YEAR,ENTITY_ID_OR_MARCA,OBJECTIVE_NAME,OBJECTIVE_DESCRIPTION,OBJECTIVE_ZONE,OBJECTIVE_TARGET)"+
                "values(?,?,?,?,?,?,?,?,?,?)";

        PreparedStatement pstm = conn.prepareStatement(sql);

        pstm.setDouble(1,obiectiveCentrala.getRESULT_VALUE());
        pstm.setDouble(2,obiectiveCentrala.getSATISFACTION_RATE());
        pstm.setDouble(3,obiectiveCentrala.getRUN_RATE());
        pstm.setInt(4,obiectiveCentrala.getQUARTER());
        pstm.setInt(5,obiectiveCentrala.getYEAR());
        pstm.setString(6,obiectiveCentrala.getENTITY_ID_OR_MARCA());
        pstm.setString(7,obiectiveCentrala.getOBJECTIVE_NAME());
        pstm.setString(8,obiectiveCentrala.getOBJECTIVE_DESCRIPTION());
        pstm.setString(9,obiectiveCentrala.getOBJECTIVE_ZONE());
        pstm.setDouble(10,obiectiveCentrala.getOBJECTIVE_TARGET());

        pstm.executeUpdate();

    }


    // invatare si dezv


    public static Integer countinvatare(Connection conn, Integer ENTITY_ID_OR_MARCA) throws SQLException{
        String sql = "Select count(ID) AS numar from obiectivecentrala where OBJECTIVE_ZONE = 'Invatare' and ENTITY_ID_OR_MARCA = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {
            Integer numar = rs.getInt("numar");
            return numar;
        } else {
            return null;
        }
    }

    public static List<ObiectiveCentrala> obiectiveinvatarenume(Connection conn,Integer ENTITY_ID_OR_MARCA,String objective_name) throws SQLException {
        String sql = "Select ID, RESULT_VALUE,OBJECTIVE_TARGET,OBJECTIVE_DESCRIPTION,OBJECTIVE_NAME,SATISFACTION_RATE from obiectivecentrala where OBJECTIVE_ZONE = 'Invatare'  and ENTITY_ID_OR_MARCA = ? and objective_name = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        pstm.setString(2, objective_name);

        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while(rs.next()) {
            String OBJECTIVE_DESCRIPTION = rs.getString("OBJECTIVE_DESCRIPTION");
            double OBJECTIVE_TARGET = rs.getDouble("OBJECTIVE_TARGET");
            double RESULT_VALUE = rs.getDouble("RESULT_VALUE");
            double SATISFACTION_RATE = rs.getDouble("SATISFACTION_RATE");
            String OBJECTIVE_NAME = rs.getString("OBJECTIVE_NAME");
            int ID = rs.getInt("ID");
            ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala();
            obiectiveCentrala.setOBJECTIVE_DESCRIPTION(OBJECTIVE_DESCRIPTION);
            obiectiveCentrala.setRESULT_VALUE(RESULT_VALUE);
            obiectiveCentrala.setOBJECTIVE_TARGET(OBJECTIVE_TARGET);
            obiectiveCentrala.setOBJECTIVE_NAME(OBJECTIVE_NAME);
            obiectiveCentrala.setSATISFACTION_RATE(SATISFACTION_RATE);
            obiectiveCentrala.setID(ID);

            list.add(obiectiveCentrala);
        }

        return list;
    }


    public static void deleteObiectivInvatare(Connection conn, Integer ENTITY_ID_OR_MARCA, int ID) throws  SQLException{

        String sql = "Delete  from obiectivecentrala where OBJECTIVE_ZONE = 'Invatare'  and ENTITY_ID_OR_MARCA = ? and ID = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        pstm.setInt(2, ID);
        pstm.executeUpdate();
    }



    public static void updateInvatare(Connection conn, ObiectiveCentrala obiectiveCentrala,Integer ENTITY_ID_OR_MARCA, int ID) throws SQLException{
        String sql = "Update obiectivecentrala set  RESULT_VALUE =?,OBJECTIVE_TARGET = ?,OBJECTIVE_DESCRIPTION =? ,SATISFACTION_RATE=? where OBJECTIVE_ZONE = 'Invatare'  and ENTITY_ID_OR_MARCA = ? and ID = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setDouble(1,obiectiveCentrala.getRESULT_VALUE());
        pstm.setDouble(2,obiectiveCentrala.getOBJECTIVE_TARGET());
        pstm.setString(3,obiectiveCentrala.getOBJECTIVE_DESCRIPTION());
        pstm.setDouble(4,obiectiveCentrala.getSATISFACTION_RATE());
        pstm.setInt(5, ENTITY_ID_OR_MARCA);
        pstm.setInt(6,ID);


        pstm.executeUpdate();


    }




    //clienti

    public static List<ObiectiveCentrala> obiectiveclientinume(Connection conn,Integer ENTITY_ID_OR_MARCA,String objective_name) throws SQLException {
        String sql = "Select ID,RESULT_VALUE,SATISFACTION_RATE,OBJECTIVE_TARGET,OBJECTIVE_DESCRIPTION,OBJECTIVE_NAME from obiectivecentrala where OBJECTIVE_ZONE = 'Clienti'  and ENTITY_ID_OR_MARCA = ? and objective_name = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        pstm.setString(2, objective_name);

        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while(rs.next()) {
            String OBJECTIVE_DESCRIPTION = rs.getString("OBJECTIVE_DESCRIPTION");
            double OBJECTIVE_TARGET = rs.getDouble("OBJECTIVE_TARGET");
            double RESULT_VALUE = rs.getDouble("RESULT_VALUE");
            double SATISFACTION_RATE = rs.getDouble("SATISFACTION_RATE");
            String OBJECTIVE_NAME = rs.getString("OBJECTIVE_NAME");
            int ID = rs.getInt("ID");
            ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala();
            obiectiveCentrala.setOBJECTIVE_DESCRIPTION(OBJECTIVE_DESCRIPTION);
            obiectiveCentrala.setRESULT_VALUE(RESULT_VALUE);
            obiectiveCentrala.setSATISFACTION_RATE(SATISFACTION_RATE);
            obiectiveCentrala.setOBJECTIVE_TARGET(OBJECTIVE_TARGET);
            obiectiveCentrala.setOBJECTIVE_NAME(OBJECTIVE_NAME);
            obiectiveCentrala.setID(ID);

            list.add(obiectiveCentrala);
        }

        return list;
    }




    public static Integer countclienti(Connection conn, Integer ENTITY_ID_OR_MARCA) throws SQLException{
        String sql = "Select count(ID) AS numar from obiectivecentrala where OBJECTIVE_ZONE = 'Clienti' and ENTITY_ID_OR_MARCA = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {
            Integer numar = rs.getInt("numar");
            return numar;
        } else {
            return null;
        }
    }

    public static void deleteObiectivClienti(Connection conn, Integer ENTITY_ID_OR_MARCA, int ID) throws  SQLException{

        String sql = "Delete  from obiectivecentrala where OBJECTIVE_ZONE = 'Clienti'  and ENTITY_ID_OR_MARCA = ? and ID = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        pstm.setInt(2, ID);
        pstm.executeUpdate();
    }



    public static void updateClienti(Connection conn, ObiectiveCentrala obiectiveCentrala,Integer ENTITY_ID_OR_MARCA, int ID) throws SQLException{
        String sql = "Update obiectivecentrala set  RESULT_VALUE =?,OBJECTIVE_TARGET = ?,OBJECTIVE_DESCRIPTION =?, SATISFACTION_RATE=? where OBJECTIVE_ZONE = 'Clienti'  and ENTITY_ID_OR_MARCA = ? and ID = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setDouble(1,obiectiveCentrala.getRESULT_VALUE());
        pstm.setDouble(2,obiectiveCentrala.getOBJECTIVE_TARGET());
        pstm.setString(3,obiectiveCentrala.getOBJECTIVE_DESCRIPTION());
        pstm.setDouble(4,obiectiveCentrala.getSATISFACTION_RATE());
        pstm.setInt(5, ENTITY_ID_OR_MARCA);

        pstm.setInt(6,ID);


        pstm.executeUpdate();

    }

    public static void updatePoza(Connection conn, Rezultate rezultate,Integer marca)  throws SQLException{
        String sql  = "Update rezultate set Poza =? where marca=? ";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1,rezultate.getPoza());
        pstm.setInt(2,marca);
        pstm.executeUpdate();

    }



//home clienti

    public static List<ObiectiveCentrala> obiectiveclienti(Connection conn,Integer ENTITY_ID_OR_MARCA) throws SQLException {
        String sql = "Select ID,OBJECTIVE_NAME,RESULT_VALUE,OBJECTIVE_TARGET,OBJECTIVE_DESCRIPTION,SATISFACTION_RATE from obiectivecentrala where OBJECTIVE_ZONE = 'Clienti' and quarter = '1'  and ENTITY_ID_OR_MARCA = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while(rs.next()) {
            int ID = rs.getInt("ID");
            String OBJECTIVE_NAME = rs.getString("OBJECTIVE_NAME");
            String OBJECTIVE_DESCRIPTION = rs.getString("OBJECTIVE_DESCRIPTION");
            double OBJECTIVE_TARGET = rs.getDouble("OBJECTIVE_TARGET");
            double RESULT_VALUE = rs.getDouble("RESULT_VALUE");
            double SATISFACTION_RATE = rs.getDouble("SATISFACTION_RATE");


            ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala();
            obiectiveCentrala.setOBJECTIVE_NAME(OBJECTIVE_NAME);
            obiectiveCentrala.setOBJECTIVE_DESCRIPTION(OBJECTIVE_DESCRIPTION);
            obiectiveCentrala.setRESULT_VALUE(RESULT_VALUE);
            obiectiveCentrala.setOBJECTIVE_TARGET(OBJECTIVE_TARGET);
            obiectiveCentrala.setSATISFACTION_RATE(SATISFACTION_RATE);
            obiectiveCentrala.setID(ID);



            list.add(obiectiveCentrala);
        }

        return list;
    }


    public static List<ObiectiveCentrala> obiectiveclientiq2(Connection conn,Integer ENTITY_ID_OR_MARCA) throws SQLException {
        String sql = "Select ID,OBJECTIVE_NAME,RESULT_VALUE,OBJECTIVE_TARGET,OBJECTIVE_DESCRIPTION,SATISFACTION_RATE from obiectivecentrala where OBJECTIVE_ZONE = 'Clienti' and quarter = '2'  and ENTITY_ID_OR_MARCA = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while(rs.next()) {
            int ID = rs.getInt("ID");
            String OBJECTIVE_NAME = rs.getString("OBJECTIVE_NAME");
            String OBJECTIVE_DESCRIPTION = rs.getString("OBJECTIVE_DESCRIPTION");
            double OBJECTIVE_TARGET = rs.getDouble("OBJECTIVE_TARGET");
            double RESULT_VALUE = rs.getDouble("RESULT_VALUE");
            double SATISFACTION_RATE = rs.getDouble("SATISFACTION_RATE");


            ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala();
            obiectiveCentrala.setOBJECTIVE_NAME(OBJECTIVE_NAME);
            obiectiveCentrala.setOBJECTIVE_DESCRIPTION(OBJECTIVE_DESCRIPTION);
            obiectiveCentrala.setRESULT_VALUE(RESULT_VALUE);
            obiectiveCentrala.setOBJECTIVE_TARGET(OBJECTIVE_TARGET);
            obiectiveCentrala.setSATISFACTION_RATE(SATISFACTION_RATE);
            obiectiveCentrala.setID(ID);



            list.add(obiectiveCentrala);
        }

        return list;
    }

    public static List<ObiectiveCentrala> obiectiveclientiq3(Connection conn,Integer ENTITY_ID_OR_MARCA) throws SQLException {
        String sql = "Select ID,OBJECTIVE_NAME,RESULT_VALUE,OBJECTIVE_TARGET,OBJECTIVE_DESCRIPTION,SATISFACTION_RATE from obiectivecentrala where OBJECTIVE_ZONE = 'Clienti' and quarter = '3'  and ENTITY_ID_OR_MARCA = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while(rs.next()) {
            int ID = rs.getInt("ID");
            String OBJECTIVE_NAME = rs.getString("OBJECTIVE_NAME");
            String OBJECTIVE_DESCRIPTION = rs.getString("OBJECTIVE_DESCRIPTION");
            double OBJECTIVE_TARGET = rs.getDouble("OBJECTIVE_TARGET");
            double RESULT_VALUE = rs.getDouble("RESULT_VALUE");
            double SATISFACTION_RATE = rs.getDouble("SATISFACTION_RATE");


            ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala();
            obiectiveCentrala.setOBJECTIVE_NAME(OBJECTIVE_NAME);
            obiectiveCentrala.setOBJECTIVE_DESCRIPTION(OBJECTIVE_DESCRIPTION);
            obiectiveCentrala.setRESULT_VALUE(RESULT_VALUE);
            obiectiveCentrala.setOBJECTIVE_TARGET(OBJECTIVE_TARGET);
            obiectiveCentrala.setSATISFACTION_RATE(SATISFACTION_RATE);
            obiectiveCentrala.setID(ID);



            list.add(obiectiveCentrala);
        }

        return list;
    }

    public static List<ObiectiveCentrala> obiectiveclientiq4(Connection conn,Integer ENTITY_ID_OR_MARCA) throws SQLException {
        String sql = "Select ID,OBJECTIVE_NAME,RESULT_VALUE,OBJECTIVE_TARGET,OBJECTIVE_DESCRIPTION,SATISFACTION_RATE from obiectivecentrala where OBJECTIVE_ZONE = 'Clienti' and quarter = '4'  and ENTITY_ID_OR_MARCA = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while(rs.next()) {
            int ID = rs.getInt("ID");
            String OBJECTIVE_NAME = rs.getString("OBJECTIVE_NAME");
            String OBJECTIVE_DESCRIPTION = rs.getString("OBJECTIVE_DESCRIPTION");
            double OBJECTIVE_TARGET = rs.getDouble("OBJECTIVE_TARGET");
            double RESULT_VALUE = rs.getDouble("RESULT_VALUE");
            double SATISFACTION_RATE = rs.getDouble("SATISFACTION_RATE");


            ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala();
            obiectiveCentrala.setOBJECTIVE_NAME(OBJECTIVE_NAME);
            obiectiveCentrala.setOBJECTIVE_DESCRIPTION(OBJECTIVE_DESCRIPTION);
            obiectiveCentrala.setRESULT_VALUE(RESULT_VALUE);
            obiectiveCentrala.setOBJECTIVE_TARGET(OBJECTIVE_TARGET);
            obiectiveCentrala.setSATISFACTION_RATE(SATISFACTION_RATE);
            obiectiveCentrala.setID(ID);



            list.add(obiectiveCentrala);
        }

        return list;
    }

    // verific daca am inserat competentele pt angajatul logat


    public static Integer findemployeecompetente (Connection conn, Integer employee_pk) throws SQLException {
        String sql = "Select  marca  AS cod from competente where marca = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, employee_pk);

        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            Integer cod = rs.getInt("cod");
            return cod;
        } else {
            return null;
        }
    }


    // verific daca am inserat obiectivele financiar pt angajatul logat


    public static Integer findemployeefinanciar (Connection conn, Integer employee_pk) throws SQLException {
        String sql = "Select  ENTITY_ID_OR_MARCA  AS cod from obiectivecentrala  where OBJECTIVE_ZONE = 'Financiara'  and ENTITY_ID_OR_MARCA = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, employee_pk);

        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            Integer cod = rs.getInt("cod");
            return cod;
        } else {
            return null;
        }
    }

    // verific daca am inserat obiectivele invatare pt angajatul logat


    public static Integer findemployeeinvatare (Connection conn, Integer employee_pk) throws SQLException {
        String sql = "Select  ENTITY_ID_OR_MARCA  AS cod from obiectivecentrala  where OBJECTIVE_ZONE = 'Invatare'  and ENTITY_ID_OR_MARCA = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, employee_pk);

        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            Integer cod = rs.getInt("cod");
            return cod;
        } else {
            return null;
        }
    }

    // verific daca am inserat obiectivele clienti pt angajatul logat


    public static Integer findemployeeclienti (Connection conn, Integer employee_pk) throws SQLException {
        String sql = "Select  ENTITY_ID_OR_MARCA  AS cod from obiectivecentrala  where OBJECTIVE_ZONE = 'Clienti'  and ENTITY_ID_OR_MARCA = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, employee_pk);

        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            Integer cod = rs.getInt("cod");
            return cod;
        } else {
            return null;
        }
    }
    // verific daca am inserat obiectivele procese pt angajatul logat


    public static Integer findemployeeprocese (Connection conn, Integer employee_pk) throws SQLException {
        String sql = "Select  ENTITY_ID_OR_MARCA  AS cod from obiectivecentrala  where OBJECTIVE_ZONE = 'Procese'  and ENTITY_ID_OR_MARCA = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, employee_pk);

        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            Integer cod = rs.getInt("cod");
            return cod;
        } else {
            return null;
        }
    }
    // verific daca am inserat obiectivele oameni pt angajatul logat


    public static Integer findemployeeoameni (Connection conn, Integer employee_pk) throws SQLException {
        String sql = "Select  ENTITY_ID_OR_MARCA  AS cod from obiectivecentrala  where OBJECTIVE_ZONE = 'Oameni'  and ENTITY_ID_OR_MARCA = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, employee_pk);

        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            Integer cod = rs.getInt("cod");
            return cod;
        } else {
            return null;
        }
    }
    // verific daca am inserat rezultatele pt angajatul logat


    //aflu cod pentru obiectiv din cadrul pilonului clienti

    public static Integer findIdClienti(Connection conn, String OBJECTIVE_NAME) throws SQLException{
        String sql = "Select ID  AS numar from obiectivecentrala where OBJECTIVE_ZONE = 'Clienti'  and OBJECTIVE_NAME = ? LIMIT 1";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, OBJECTIVE_NAME);
        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {
            Integer numar = rs.getInt("numar");
            return numar;
        } else {
            return null;
        }
    }

    //aflu cod pentru obiectiv din cadrul pilonului financiar

    public static Integer findIdFinanciar(Connection conn, String OBJECTIVE_NAME) throws SQLException{
        String sql = "Select ID  AS numar from obiectivecentrala where OBJECTIVE_ZONE = 'Financiara'  and OBJECTIVE_NAME = ? LIMIT 1";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, OBJECTIVE_NAME);
        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {
            Integer numar = rs.getInt("numar");
            return numar;
        } else {
            return null;
        }
    }

    //aflu cod pentru obiectiv din cadrul pilonului procese

    public static Integer findIdProcese(Connection conn, String OBJECTIVE_NAME) throws SQLException{
        String sql = "Select ID  AS numar from obiectivecentrala where OBJECTIVE_ZONE = 'Procese'  and OBJECTIVE_NAME = ? LIMIT 1";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, OBJECTIVE_NAME);
        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {
            Integer numar = rs.getInt("numar");
            return numar;
        } else {
            return null;
        }
    }

    //aflu cod pentru obiectiv din cadrul pilonului invatare

    public static Integer findIdInvatare(Connection conn, String OBJECTIVE_NAME) throws SQLException{
        String sql = "Select ID  AS numar from obiectivecentrala where OBJECTIVE_ZONE = 'Invatare'  and OBJECTIVE_NAME = ? LIMIT 1";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, OBJECTIVE_NAME);
        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {
            Integer numar = rs.getInt("numar");
            return numar;
        } else {
            return null;
        }
    }

    //aflu cod pentru obiectiv din cadrul pilonului oameni

    public static Integer findIdOameni(Connection conn, String OBJECTIVE_NAME) throws SQLException{
        String sql = "Select ID  AS numar from obiectivecentrala where OBJECTIVE_ZONE = 'Oameni'  and OBJECTIVE_NAME = ? LIMIT 1";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, OBJECTIVE_NAME);
        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {
            Integer numar = rs.getInt("numar");
            return numar;
        } else {
            return null;
        }
    }


    public static Integer findemployeerezultate (Connection conn, Integer employee_pk) throws SQLException {
        String sql = "Select  marca  AS cod from rezultate where marca = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, employee_pk);

        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            Integer cod = rs.getInt("cod");
            return cod;
        } else {
            return null;
        }
    }

    public static List<ObiectiveCentrala> obiectivefinanciar(Connection conn,Integer ENTITY_ID_OR_MARCA) throws SQLException {
        String sql = "Select ID,OBJECTIVE_NAME,RESULT_VALUE,SATISFACTION_RATE,OBJECTIVE_TARGET,OBJECTIVE_DESCRIPTION from obiectivecentrala where OBJECTIVE_ZONE = 'Financiara' and quarter = '1' and ENTITY_ID_OR_MARCA = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while(rs.next()) {

            String OBJECTIVE_NAME = rs.getString("OBJECTIVE_NAME");
            String OBJECTIVE_DESCRIPTION = rs.getString("OBJECTIVE_DESCRIPTION");
            double OBJECTIVE_TARGET = rs.getDouble("OBJECTIVE_TARGET");
            double RESULT_VALUE = rs.getDouble("RESULT_VALUE");
            double SATISFACTION_RATE = rs.getDouble("SATISFACTION_RATE");
            int ID = rs.getInt("ID");

            ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala();
            obiectiveCentrala.setOBJECTIVE_NAME(OBJECTIVE_NAME);
            obiectiveCentrala.setOBJECTIVE_DESCRIPTION(OBJECTIVE_DESCRIPTION);
            obiectiveCentrala.setRESULT_VALUE(RESULT_VALUE);
            obiectiveCentrala.setOBJECTIVE_TARGET(OBJECTIVE_TARGET);
            obiectiveCentrala.setSATISFACTION_RATE(SATISFACTION_RATE);
            obiectiveCentrala.setID(ID);


            list.add(obiectiveCentrala);
        }

        return list;
    }

    public static List<ObiectiveCentrala> obiectivefinanciarq2(Connection conn,Integer ENTITY_ID_OR_MARCA) throws SQLException {
        String sql = "Select ID,OBJECTIVE_NAME,RESULT_VALUE,SATISFACTION_RATE,OBJECTIVE_TARGET,OBJECTIVE_DESCRIPTION from obiectivecentrala where OBJECTIVE_ZONE = 'Financiara' and quarter = '2' and ENTITY_ID_OR_MARCA = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while(rs.next()) {

            String OBJECTIVE_NAME = rs.getString("OBJECTIVE_NAME");
            String OBJECTIVE_DESCRIPTION = rs.getString("OBJECTIVE_DESCRIPTION");
            double OBJECTIVE_TARGET = rs.getDouble("OBJECTIVE_TARGET");
            double RESULT_VALUE = rs.getDouble("RESULT_VALUE");
            double SATISFACTION_RATE = rs.getDouble("SATISFACTION_RATE");
            int ID = rs.getInt("ID");

            ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala();
            obiectiveCentrala.setOBJECTIVE_NAME(OBJECTIVE_NAME);
            obiectiveCentrala.setOBJECTIVE_DESCRIPTION(OBJECTIVE_DESCRIPTION);
            obiectiveCentrala.setRESULT_VALUE(RESULT_VALUE);
            obiectiveCentrala.setOBJECTIVE_TARGET(OBJECTIVE_TARGET);
            obiectiveCentrala.setSATISFACTION_RATE(SATISFACTION_RATE);
            obiectiveCentrala.setID(ID);


            list.add(obiectiveCentrala);
        }

        return list;
    }
    public static List<ObiectiveCentrala> obiectivefinanciarq3(Connection conn,Integer ENTITY_ID_OR_MARCA) throws SQLException {
        String sql = "Select ID,OBJECTIVE_NAME,RESULT_VALUE,SATISFACTION_RATE,OBJECTIVE_TARGET,OBJECTIVE_DESCRIPTION from obiectivecentrala where OBJECTIVE_ZONE = 'Financiara' and quarter = '3' and ENTITY_ID_OR_MARCA = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while(rs.next()) {

            String OBJECTIVE_NAME = rs.getString("OBJECTIVE_NAME");
            String OBJECTIVE_DESCRIPTION = rs.getString("OBJECTIVE_DESCRIPTION");
            double OBJECTIVE_TARGET = rs.getDouble("OBJECTIVE_TARGET");
            double RESULT_VALUE = rs.getDouble("RESULT_VALUE");
            double SATISFACTION_RATE = rs.getDouble("SATISFACTION_RATE");
            int ID = rs.getInt("ID");

            ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala();
            obiectiveCentrala.setOBJECTIVE_NAME(OBJECTIVE_NAME);
            obiectiveCentrala.setOBJECTIVE_DESCRIPTION(OBJECTIVE_DESCRIPTION);
            obiectiveCentrala.setRESULT_VALUE(RESULT_VALUE);
            obiectiveCentrala.setOBJECTIVE_TARGET(OBJECTIVE_TARGET);
            obiectiveCentrala.setSATISFACTION_RATE(SATISFACTION_RATE);
            obiectiveCentrala.setID(ID);


            list.add(obiectiveCentrala);
        }

        return list;
    }

    public static List<ObiectiveCentrala> obiectivefinanciarq4(Connection conn,Integer ENTITY_ID_OR_MARCA) throws SQLException {
        String sql = "Select ID,OBJECTIVE_NAME,RESULT_VALUE,SATISFACTION_RATE,OBJECTIVE_TARGET,OBJECTIVE_DESCRIPTION from obiectivecentrala where OBJECTIVE_ZONE = 'Financiara' and quarter = '4' and ENTITY_ID_OR_MARCA = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while(rs.next()) {

            String OBJECTIVE_NAME = rs.getString("OBJECTIVE_NAME");
            String OBJECTIVE_DESCRIPTION = rs.getString("OBJECTIVE_DESCRIPTION");
            double OBJECTIVE_TARGET = rs.getDouble("OBJECTIVE_TARGET");
            double RESULT_VALUE = rs.getDouble("RESULT_VALUE");
            double SATISFACTION_RATE = rs.getDouble("SATISFACTION_RATE");
            int ID = rs.getInt("ID");

            ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala();
            obiectiveCentrala.setOBJECTIVE_NAME(OBJECTIVE_NAME);
            obiectiveCentrala.setOBJECTIVE_DESCRIPTION(OBJECTIVE_DESCRIPTION);
            obiectiveCentrala.setRESULT_VALUE(RESULT_VALUE);
            obiectiveCentrala.setOBJECTIVE_TARGET(OBJECTIVE_TARGET);
            obiectiveCentrala.setSATISFACTION_RATE(SATISFACTION_RATE);
            obiectiveCentrala.setID(ID);


            list.add(obiectiveCentrala);
        }

        return list;
    }
    public static Integer idFinanciar(Connection conn, Integer ENTITY_ID_OR_MARCA) throws SQLException{
        String sql = "Select ID  AS numar from obiectivecentrala where OBJECTIVE_ZONE = 'Financiara'  and ENTITY_ID_OR_MARCA = ? LIMIT 1";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {
            Integer numar = rs.getInt("numar");
            return numar;
        } else {
            return null;
        }
    }

    public static Integer idClienti(Connection conn, Integer ENTITY_ID_OR_MARCA) throws SQLException{
        String sql = "Select ID  AS numar2 from obiectivecentrala where OBJECTIVE_ZONE = 'Clienti'  and ENTITY_ID_OR_MARCA = ? LIMIT 1";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {
            Integer numar2 = rs.getInt("numar2");
            return numar2;
        } else {
            return null;
        }
    }

    public static Integer idProcese(Connection conn, Integer ENTITY_ID_OR_MARCA) throws SQLException{
        String sql = "Select ID  AS numar from obiectivecentrala where OBJECTIVE_ZONE = 'Procese'  and ENTITY_ID_OR_MARCA = ? LIMIT 1";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {
            Integer numar = rs.getInt("numar");
            return numar;
        } else {
            return null;
        }
    }
    public static Integer idInvatare(Connection conn, Integer ENTITY_ID_OR_MARCA) throws SQLException{
        String sql = "Select ID  AS numar from obiectivecentrala where OBJECTIVE_ZONE = 'Invatare'  and ENTITY_ID_OR_MARCA = ? LIMIT 1";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {
            Integer numar = rs.getInt("numar");
            return numar;
        } else {
            return null;
        }
    }
    public static Integer idOameni(Connection conn, Integer ENTITY_ID_OR_MARCA) throws SQLException{
        String sql = "Select ID  AS numar from obiectivecentrala where OBJECTIVE_ZONE = 'Oameni'  and ENTITY_ID_OR_MARCA = ? LIMIT 1";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {
            Integer numar = rs.getInt("numar");
            return numar;
        } else {
            return null;
        }
    }

    public static List<ObiectiveCentrala> numefinanciar(Connection conn,Integer ENTITY_ID_OR_MARCA) throws SQLException {
        String sql = "Select OBJECTIVE_NAME from obiectivecentrala where OBJECTIVE_ZONE = 'Financiara'  and ENTITY_ID_OR_MARCA = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while(rs.next()) {
            String OBJECTIVE_NAME = rs.getString("OBJECTIVE_NAME");


            ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala();
            obiectiveCentrala.setOBJECTIVE_NAME(OBJECTIVE_NAME);
            list.add(obiectiveCentrala);
        }

        return list;
    }


    //invatare


    public static List<ObiectiveCentrala> obiectiveinvatare(Connection conn,Integer ENTITY_ID_OR_MARCA) throws SQLException {
        String sql = "Select ID,OBJECTIVE_NAME,RESULT_VALUE,SATISFACTION_RATE,OBJECTIVE_TARGET,OBJECTIVE_DESCRIPTION from obiectivecentrala where OBJECTIVE_ZONE = 'Invatare'  and ENTITY_ID_OR_MARCA = ? and quarter = 1";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while(rs.next()) {
            String OBJECTIVE_NAME = rs.getString("OBJECTIVE_NAME");
            String OBJECTIVE_DESCRIPTION = rs.getString("OBJECTIVE_DESCRIPTION");
            double OBJECTIVE_TARGET = rs.getDouble("OBJECTIVE_TARGET");
            double RESULT_VALUE = rs.getDouble("RESULT_VALUE");
            double SATISFACTION_RATE = rs.getDouble("SATISFACTION_RATE");
            int ID = rs.getInt("ID");

            ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala();
            obiectiveCentrala.setOBJECTIVE_NAME(OBJECTIVE_NAME);
            obiectiveCentrala.setOBJECTIVE_DESCRIPTION(OBJECTIVE_DESCRIPTION);
            obiectiveCentrala.setRESULT_VALUE(RESULT_VALUE);
            obiectiveCentrala.setOBJECTIVE_TARGET(OBJECTIVE_TARGET);
            obiectiveCentrala.setSATISFACTION_RATE(SATISFACTION_RATE);
            obiectiveCentrala.setID(ID);



            list.add(obiectiveCentrala);
        }

        return list;
    }


    public static List<ObiectiveCentrala> obiectiveinvatareq2(Connection conn,Integer ENTITY_ID_OR_MARCA) throws SQLException {
        String sql = "Select ID,OBJECTIVE_NAME,RESULT_VALUE,SATISFACTION_RATE,OBJECTIVE_TARGET,OBJECTIVE_DESCRIPTION from obiectivecentrala where OBJECTIVE_ZONE = 'Invatare'  and ENTITY_ID_OR_MARCA = ? and quarter = 2";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while(rs.next()) {
            String OBJECTIVE_NAME = rs.getString("OBJECTIVE_NAME");
            String OBJECTIVE_DESCRIPTION = rs.getString("OBJECTIVE_DESCRIPTION");
            double OBJECTIVE_TARGET = rs.getDouble("OBJECTIVE_TARGET");
            double RESULT_VALUE = rs.getDouble("RESULT_VALUE");
            double SATISFACTION_RATE = rs.getDouble("SATISFACTION_RATE");
            int ID = rs.getInt("ID");

            ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala();
            obiectiveCentrala.setOBJECTIVE_NAME(OBJECTIVE_NAME);
            obiectiveCentrala.setOBJECTIVE_DESCRIPTION(OBJECTIVE_DESCRIPTION);
            obiectiveCentrala.setRESULT_VALUE(RESULT_VALUE);
            obiectiveCentrala.setOBJECTIVE_TARGET(OBJECTIVE_TARGET);
            obiectiveCentrala.setSATISFACTION_RATE(SATISFACTION_RATE);
            obiectiveCentrala.setID(ID);



            list.add(obiectiveCentrala);
        }

        return list;
    }


    public static List<ObiectiveCentrala> obiectiveinvatareq3(Connection conn,Integer ENTITY_ID_OR_MARCA) throws SQLException {
        String sql = "Select ID,OBJECTIVE_NAME,RESULT_VALUE,SATISFACTION_RATE,OBJECTIVE_TARGET,OBJECTIVE_DESCRIPTION from obiectivecentrala where OBJECTIVE_ZONE = 'Invatare'  and ENTITY_ID_OR_MARCA = ? and quarter = 3";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while(rs.next()) {
            String OBJECTIVE_NAME = rs.getString("OBJECTIVE_NAME");
            String OBJECTIVE_DESCRIPTION = rs.getString("OBJECTIVE_DESCRIPTION");
            double OBJECTIVE_TARGET = rs.getDouble("OBJECTIVE_TARGET");
            double RESULT_VALUE = rs.getDouble("RESULT_VALUE");
            double SATISFACTION_RATE = rs.getDouble("SATISFACTION_RATE");
            int ID = rs.getInt("ID");

            ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala();
            obiectiveCentrala.setOBJECTIVE_NAME(OBJECTIVE_NAME);
            obiectiveCentrala.setOBJECTIVE_DESCRIPTION(OBJECTIVE_DESCRIPTION);
            obiectiveCentrala.setRESULT_VALUE(RESULT_VALUE);
            obiectiveCentrala.setOBJECTIVE_TARGET(OBJECTIVE_TARGET);
            obiectiveCentrala.setSATISFACTION_RATE(SATISFACTION_RATE);
            obiectiveCentrala.setID(ID);



            list.add(obiectiveCentrala);
        }

        return list;
    }


    public static List<ObiectiveCentrala> obiectiveinvatareq4(Connection conn,Integer ENTITY_ID_OR_MARCA) throws SQLException {
        String sql = "Select ID,OBJECTIVE_NAME,RESULT_VALUE,SATISFACTION_RATE,OBJECTIVE_TARGET,OBJECTIVE_DESCRIPTION from obiectivecentrala where OBJECTIVE_ZONE = 'Invatare'  and ENTITY_ID_OR_MARCA = ? and quarter = 4";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while(rs.next()) {
            String OBJECTIVE_NAME = rs.getString("OBJECTIVE_NAME");
            String OBJECTIVE_DESCRIPTION = rs.getString("OBJECTIVE_DESCRIPTION");
            double OBJECTIVE_TARGET = rs.getDouble("OBJECTIVE_TARGET");
            double RESULT_VALUE = rs.getDouble("RESULT_VALUE");
            double SATISFACTION_RATE = rs.getDouble("SATISFACTION_RATE");
            int ID = rs.getInt("ID");

            ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala();
            obiectiveCentrala.setOBJECTIVE_NAME(OBJECTIVE_NAME);
            obiectiveCentrala.setOBJECTIVE_DESCRIPTION(OBJECTIVE_DESCRIPTION);
            obiectiveCentrala.setRESULT_VALUE(RESULT_VALUE);
            obiectiveCentrala.setOBJECTIVE_TARGET(OBJECTIVE_TARGET);
            obiectiveCentrala.setSATISFACTION_RATE(SATISFACTION_RATE);
            obiectiveCentrala.setID(ID);



            list.add(obiectiveCentrala);
        }

        return list;
    }


    public static List<ObiectiveCentrala> numeinvatare(Connection conn,Integer ENTITY_ID_OR_MARCA) throws SQLException {
        String sql = "Select OBJECTIVE_NAME from obiectivecentrala where OBJECTIVE_ZONE = 'Invatare'  and ENTITY_ID_OR_MARCA = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while(rs.next()) {
            String OBJECTIVE_NAME = rs.getString("OBJECTIVE_NAME");


            ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala();
            obiectiveCentrala.setOBJECTIVE_NAME(OBJECTIVE_NAME);
            list.add(obiectiveCentrala);
        }

        return list;
    }
    public static List<ObiectiveCentrala> numeclienti(Connection conn,Integer ENTITY_ID_OR_MARCA) throws SQLException {
        String sql = "Select OBJECTIVE_NAME from obiectivecentrala where OBJECTIVE_ZONE = 'Clienti'  and ENTITY_ID_OR_MARCA = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while(rs.next()) {
            String OBJECTIVE_NAME = rs.getString("OBJECTIVE_NAME");


            ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala();
            obiectiveCentrala.setOBJECTIVE_NAME(OBJECTIVE_NAME);
            list.add(obiectiveCentrala);
        }

        return list;
    }

    public static List<ObiectiveCentrala> numeprocese(Connection conn,Integer ENTITY_ID_OR_MARCA) throws SQLException {
        String sql = "Select OBJECTIVE_NAME from obiectivecentrala where OBJECTIVE_ZONE = 'Procese'  and ENTITY_ID_OR_MARCA = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while(rs.next()) {
            String OBJECTIVE_NAME = rs.getString("OBJECTIVE_NAME");


            ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala();
            obiectiveCentrala.setOBJECTIVE_NAME(OBJECTIVE_NAME);
            list.add(obiectiveCentrala);
        }

        return list;
    }

    public static List<ObiectiveCentrala> numeoamenir(Connection conn,Integer ENTITY_ID_OR_MARCA) throws SQLException {
        String sql = "Select OBJECTIVE_NAME from obiectivecentrala where OBJECTIVE_ZONE = 'Oameni'  and ENTITY_ID_OR_MARCA = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while(rs.next()) {
            String OBJECTIVE_NAME = rs.getString("OBJECTIVE_NAME");


            ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala();
            obiectiveCentrala.setOBJECTIVE_NAME(OBJECTIVE_NAME);
            list.add(obiectiveCentrala);
        }

        return list;
    }



    //procese

    public static List<ObiectiveCentrala> obiectiveprocesenume(Connection conn,Integer ENTITY_ID_OR_MARCA,String objective_name) throws SQLException {
        String sql = "Select ID,RESULT_VALUE,SATISFACTION_RATE,OBJECTIVE_TARGET,OBJECTIVE_DESCRIPTION,OBJECTIVE_NAME from obiectivecentrala where OBJECTIVE_ZONE = 'Procese'  and ENTITY_ID_OR_MARCA = ? and objective_name = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        pstm.setString(2, objective_name);

        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while(rs.next()) {
            String OBJECTIVE_DESCRIPTION = rs.getString("OBJECTIVE_DESCRIPTION");
            double OBJECTIVE_TARGET = rs.getDouble("OBJECTIVE_TARGET");
            double RESULT_VALUE = rs.getDouble("RESULT_VALUE");
            double SATISFACTION_RATE = rs.getDouble("SATISFACTION_RATE");
            String OBJECTIVE_NAME = rs.getString("OBJECTIVE_NAME");
            int ID = rs.getInt("ID");
            ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala();
            obiectiveCentrala.setOBJECTIVE_DESCRIPTION(OBJECTIVE_DESCRIPTION);
            obiectiveCentrala.setRESULT_VALUE(RESULT_VALUE);
            obiectiveCentrala.setOBJECTIVE_TARGET(OBJECTIVE_TARGET);
            obiectiveCentrala.setOBJECTIVE_NAME(OBJECTIVE_NAME);
            obiectiveCentrala.setSATISFACTION_RATE(SATISFACTION_RATE);
            obiectiveCentrala.setID(ID);

            list.add(obiectiveCentrala);
        }

        return list;
    }

    public static Integer countprocese(Connection conn, Integer ENTITY_ID_OR_MARCA) throws SQLException{
        String sql = "Select count(ID) AS numar from obiectivecentrala where OBJECTIVE_ZONE = 'Procese' and ENTITY_ID_OR_MARCA = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {
            Integer numar = rs.getInt("numar");
            return numar;
        } else {
            return null;
        }
    }

    public static void deleteObiectivProcese(Connection conn, Integer ENTITY_ID_OR_MARCA, int ID) throws  SQLException{

        String sql = "Delete  from obiectivecentrala where OBJECTIVE_ZONE = 'Procese'  and ENTITY_ID_OR_MARCA = ? and ID = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        pstm.setInt(2, ID);
        pstm.executeUpdate();
    }



    public static void updateProcese(Connection conn, ObiectiveCentrala obiectiveCentrala,Integer ENTITY_ID_OR_MARCA, int ID) throws SQLException{
        String sql = "Update obiectivecentrala set  RESULT_VALUE =?,OBJECTIVE_TARGET = ?,OBJECTIVE_DESCRIPTION =?,SATISFACTION_RATE=? where OBJECTIVE_ZONE = 'Procese'  and ENTITY_ID_OR_MARCA = ? and ID = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setDouble(1,obiectiveCentrala.getRESULT_VALUE());
        pstm.setDouble(2,obiectiveCentrala.getOBJECTIVE_TARGET());
        pstm.setString(3,obiectiveCentrala.getOBJECTIVE_DESCRIPTION());
        pstm.setDouble(4,obiectiveCentrala.getSATISFACTION_RATE());
        pstm.setInt(5, ENTITY_ID_OR_MARCA);
        pstm.setInt(6,ID);


        pstm.executeUpdate();


    }



//home clienti

    public static List<ObiectiveCentrala> obiectiveprocese(Connection conn,Integer ENTITY_ID_OR_MARCA) throws SQLException {
        String sql = "Select ID,OBJECTIVE_NAME,RESULT_VALUE,SATISFACTION_RATE,OBJECTIVE_TARGET,OBJECTIVE_DESCRIPTION from obiectivecentrala where OBJECTIVE_ZONE = 'Procese'  and ENTITY_ID_OR_MARCA = ? and quarter = 1";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while(rs.next()) {
            String OBJECTIVE_NAME = rs.getString("OBJECTIVE_NAME");
            String OBJECTIVE_DESCRIPTION = rs.getString("OBJECTIVE_DESCRIPTION");
            double OBJECTIVE_TARGET = rs.getDouble("OBJECTIVE_TARGET");
            double RESULT_VALUE = rs.getDouble("RESULT_VALUE");
            double SATISFACTION_RATE = rs.getDouble("SATISFACTION_RATE");
            int ID = rs.getInt("ID");


            ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala();
            obiectiveCentrala.setOBJECTIVE_NAME(OBJECTIVE_NAME);
            obiectiveCentrala.setOBJECTIVE_DESCRIPTION(OBJECTIVE_DESCRIPTION);
            obiectiveCentrala.setRESULT_VALUE(RESULT_VALUE);
            obiectiveCentrala.setOBJECTIVE_TARGET(OBJECTIVE_TARGET);
            obiectiveCentrala.setSATISFACTION_RATE(SATISFACTION_RATE);
            obiectiveCentrala.setID(ID);



            list.add(obiectiveCentrala);
        }

        return list;
    }


    public static List<ObiectiveCentrala> obiectiveproceseq2(Connection conn,Integer ENTITY_ID_OR_MARCA) throws SQLException {
        String sql = "Select ID,OBJECTIVE_NAME,RESULT_VALUE,SATISFACTION_RATE,OBJECTIVE_TARGET,OBJECTIVE_DESCRIPTION from obiectivecentrala where OBJECTIVE_ZONE = 'Procese'  and ENTITY_ID_OR_MARCA = ? and quarter = 2";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while(rs.next()) {
            String OBJECTIVE_NAME = rs.getString("OBJECTIVE_NAME");
            String OBJECTIVE_DESCRIPTION = rs.getString("OBJECTIVE_DESCRIPTION");
            double OBJECTIVE_TARGET = rs.getDouble("OBJECTIVE_TARGET");
            double RESULT_VALUE = rs.getDouble("RESULT_VALUE");
            double SATISFACTION_RATE = rs.getDouble("SATISFACTION_RATE");
            int ID = rs.getInt("ID");


            ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala();
            obiectiveCentrala.setOBJECTIVE_NAME(OBJECTIVE_NAME);
            obiectiveCentrala.setOBJECTIVE_DESCRIPTION(OBJECTIVE_DESCRIPTION);
            obiectiveCentrala.setRESULT_VALUE(RESULT_VALUE);
            obiectiveCentrala.setOBJECTIVE_TARGET(OBJECTIVE_TARGET);
            obiectiveCentrala.setSATISFACTION_RATE(SATISFACTION_RATE);
            obiectiveCentrala.setID(ID);



            list.add(obiectiveCentrala);
        }

        return list;
    }


    public static List<ObiectiveCentrala> obiectiveproceseq3(Connection conn,Integer ENTITY_ID_OR_MARCA) throws SQLException {
        String sql = "Select ID,OBJECTIVE_NAME,RESULT_VALUE,SATISFACTION_RATE,OBJECTIVE_TARGET,OBJECTIVE_DESCRIPTION from obiectivecentrala where OBJECTIVE_ZONE = 'Procese'  and ENTITY_ID_OR_MARCA = ? and quarter = 3";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while(rs.next()) {
            String OBJECTIVE_NAME = rs.getString("OBJECTIVE_NAME");
            String OBJECTIVE_DESCRIPTION = rs.getString("OBJECTIVE_DESCRIPTION");
            double OBJECTIVE_TARGET = rs.getDouble("OBJECTIVE_TARGET");
            double RESULT_VALUE = rs.getDouble("RESULT_VALUE");
            double SATISFACTION_RATE = rs.getDouble("SATISFACTION_RATE");
            int ID = rs.getInt("ID");


            ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala();
            obiectiveCentrala.setOBJECTIVE_NAME(OBJECTIVE_NAME);
            obiectiveCentrala.setOBJECTIVE_DESCRIPTION(OBJECTIVE_DESCRIPTION);
            obiectiveCentrala.setRESULT_VALUE(RESULT_VALUE);
            obiectiveCentrala.setOBJECTIVE_TARGET(OBJECTIVE_TARGET);
            obiectiveCentrala.setSATISFACTION_RATE(SATISFACTION_RATE);
            obiectiveCentrala.setID(ID);



            list.add(obiectiveCentrala);
        }

        return list;
    }


    public static List<ObiectiveCentrala> obiectiveproceseq4(Connection conn,Integer ENTITY_ID_OR_MARCA) throws SQLException {
        String sql = "Select ID,OBJECTIVE_NAME,RESULT_VALUE,SATISFACTION_RATE,OBJECTIVE_TARGET,OBJECTIVE_DESCRIPTION from obiectivecentrala where OBJECTIVE_ZONE = 'Procese'  and ENTITY_ID_OR_MARCA = ? and quarter = 4";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while(rs.next()) {
            String OBJECTIVE_NAME = rs.getString("OBJECTIVE_NAME");
            String OBJECTIVE_DESCRIPTION = rs.getString("OBJECTIVE_DESCRIPTION");
            double OBJECTIVE_TARGET = rs.getDouble("OBJECTIVE_TARGET");
            double RESULT_VALUE = rs.getDouble("RESULT_VALUE");
            double SATISFACTION_RATE = rs.getDouble("SATISFACTION_RATE");
            int ID = rs.getInt("ID");


            ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala();
            obiectiveCentrala.setOBJECTIVE_NAME(OBJECTIVE_NAME);
            obiectiveCentrala.setOBJECTIVE_DESCRIPTION(OBJECTIVE_DESCRIPTION);
            obiectiveCentrala.setRESULT_VALUE(RESULT_VALUE);
            obiectiveCentrala.setOBJECTIVE_TARGET(OBJECTIVE_TARGET);
            obiectiveCentrala.setSATISFACTION_RATE(SATISFACTION_RATE);
            obiectiveCentrala.setID(ID);



            list.add(obiectiveCentrala);
        }

        return list;
    }


    // oameni

    public static List<ObiectiveCentrala> obiectiveoameninume(Connection conn,Integer ENTITY_ID_OR_MARCA,String objective_name) throws SQLException {
        String sql = "Select ID,RESULT_VALUE,SATISFACTION_RATE,OBJECTIVE_TARGET,OBJECTIVE_DESCRIPTION,OBJECTIVE_NAME from obiectivecentrala where OBJECTIVE_ZONE = 'Oameni'  and ENTITY_ID_OR_MARCA = ? and objective_name = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        pstm.setString(2, objective_name);

        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while(rs.next()) {
            String OBJECTIVE_DESCRIPTION = rs.getString("OBJECTIVE_DESCRIPTION");
            double OBJECTIVE_TARGET = rs.getDouble("OBJECTIVE_TARGET");
            double RESULT_VALUE = rs.getDouble("RESULT_VALUE");
            double SATISFACTION_RATE =rs.getDouble("SATISFACTION_RATE");
            String OBJECTIVE_NAME = rs.getString("OBJECTIVE_NAME");
            int ID = rs.getInt("ID");

            ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala();
            obiectiveCentrala.setOBJECTIVE_DESCRIPTION(OBJECTIVE_DESCRIPTION);
            obiectiveCentrala.setRESULT_VALUE(RESULT_VALUE);
            obiectiveCentrala.setOBJECTIVE_TARGET(OBJECTIVE_TARGET);
            obiectiveCentrala.setOBJECTIVE_NAME(OBJECTIVE_NAME);
            obiectiveCentrala.setSATISFACTION_RATE(SATISFACTION_RATE);
            obiectiveCentrala.setID(ID);

            list.add(obiectiveCentrala);
        }

        return list;
    }



    public static Integer countoameni(Connection conn, Integer ENTITY_ID_OR_MARCA) throws SQLException{
        String sql = "Select count(ID) AS numar from obiectivecentrala where OBJECTIVE_ZONE = 'Oameni' and ENTITY_ID_OR_MARCA = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {
            Integer numar = rs.getInt("numar");
            return numar;
        } else {
            return null;
        }
    }

    public static void deleteObiectivOameni(Connection conn, Integer ENTITY_ID_OR_MARCA, int ID) throws  SQLException{

        String sql = "Delete  from obiectivecentrala where OBJECTIVE_ZONE = 'Oameni'  and ENTITY_ID_OR_MARCA = ? and ID = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        pstm.setInt(2, ID);
        pstm.executeUpdate();
    }



    public static void updateOameni(Connection conn, ObiectiveCentrala obiectiveCentrala,Integer ENTITY_ID_OR_MARCA, int ID) throws SQLException{
        String sql = "Update obiectivecentrala set  RESULT_VALUE =?,OBJECTIVE_TARGET = ?,OBJECTIVE_DESCRIPTION =?,SATISFACTION_RATE=? where OBJECTIVE_ZONE = 'Oameni'  and ENTITY_ID_OR_MARCA = ? and ID = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setDouble(1,obiectiveCentrala.getRESULT_VALUE());
        pstm.setDouble(2,obiectiveCentrala.getOBJECTIVE_TARGET());
        pstm.setString(3,obiectiveCentrala.getOBJECTIVE_DESCRIPTION());
        pstm.setDouble(4,obiectiveCentrala.getSATISFACTION_RATE());
        pstm.setInt(5, ENTITY_ID_OR_MARCA);
        pstm.setInt(6 ,ID);


        pstm.executeUpdate();


    }



//home oameni

    public static List<ObiectiveCentrala> obiectiveoameni(Connection conn,Integer ENTITY_ID_OR_MARCA) throws SQLException {
        String sql = "Select ID,OBJECTIVE_NAME,RESULT_VALUE,SATISFACTION_RATE,OBJECTIVE_TARGET,OBJECTIVE_DESCRIPTION from obiectivecentrala where OBJECTIVE_ZONE = 'Oameni'  and ENTITY_ID_OR_MARCA = ? and quarter=1";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while(rs.next()) {
            String OBJECTIVE_NAME = rs.getString("OBJECTIVE_NAME");
            String OBJECTIVE_DESCRIPTION = rs.getString("OBJECTIVE_DESCRIPTION");
            double OBJECTIVE_TARGET = rs.getDouble("OBJECTIVE_TARGET");
            double RESULT_VALUE = rs.getDouble("RESULT_VALUE");
            double SATISFACTION_RATE = rs.getDouble("SATISFACTION_RATE");
            int ID = rs.getInt("ID");

            ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala();
            obiectiveCentrala.setOBJECTIVE_NAME(OBJECTIVE_NAME);
            obiectiveCentrala.setOBJECTIVE_DESCRIPTION(OBJECTIVE_DESCRIPTION);
            obiectiveCentrala.setRESULT_VALUE(RESULT_VALUE);
            obiectiveCentrala.setOBJECTIVE_TARGET(OBJECTIVE_TARGET);
            obiectiveCentrala.setSATISFACTION_RATE(SATISFACTION_RATE);
            obiectiveCentrala.setID(ID);



            list.add(obiectiveCentrala);
        }

        return list;
    }

    public static List<ObiectiveCentrala> obiectiveoameniq2(Connection conn,Integer ENTITY_ID_OR_MARCA) throws SQLException {
        String sql = "Select ID,OBJECTIVE_NAME,RESULT_VALUE,SATISFACTION_RATE,OBJECTIVE_TARGET,OBJECTIVE_DESCRIPTION from obiectivecentrala where OBJECTIVE_ZONE = 'Oameni'  and ENTITY_ID_OR_MARCA = ? and quarter=2";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while(rs.next()) {
            String OBJECTIVE_NAME = rs.getString("OBJECTIVE_NAME");
            String OBJECTIVE_DESCRIPTION = rs.getString("OBJECTIVE_DESCRIPTION");
            double OBJECTIVE_TARGET = rs.getDouble("OBJECTIVE_TARGET");
            double RESULT_VALUE = rs.getDouble("RESULT_VALUE");
            double SATISFACTION_RATE = rs.getDouble("SATISFACTION_RATE");
            int ID = rs.getInt("ID");

            ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala();
            obiectiveCentrala.setOBJECTIVE_NAME(OBJECTIVE_NAME);
            obiectiveCentrala.setOBJECTIVE_DESCRIPTION(OBJECTIVE_DESCRIPTION);
            obiectiveCentrala.setRESULT_VALUE(RESULT_VALUE);
            obiectiveCentrala.setOBJECTIVE_TARGET(OBJECTIVE_TARGET);
            obiectiveCentrala.setSATISFACTION_RATE(SATISFACTION_RATE);
            obiectiveCentrala.setID(ID);



            list.add(obiectiveCentrala);
        }

        return list;
    }

    public static List<ObiectiveCentrala> obiectiveoameniq3(Connection conn,Integer ENTITY_ID_OR_MARCA) throws SQLException {
        String sql = "Select ID,OBJECTIVE_NAME,RESULT_VALUE,SATISFACTION_RATE,OBJECTIVE_TARGET,OBJECTIVE_DESCRIPTION from obiectivecentrala where OBJECTIVE_ZONE = 'Oameni'  and ENTITY_ID_OR_MARCA = ? and quarter=3";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while(rs.next()) {
            String OBJECTIVE_NAME = rs.getString("OBJECTIVE_NAME");
            String OBJECTIVE_DESCRIPTION = rs.getString("OBJECTIVE_DESCRIPTION");
            double OBJECTIVE_TARGET = rs.getDouble("OBJECTIVE_TARGET");
            double RESULT_VALUE = rs.getDouble("RESULT_VALUE");
            double SATISFACTION_RATE = rs.getDouble("SATISFACTION_RATE");
            int ID = rs.getInt("ID");

            ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala();
            obiectiveCentrala.setOBJECTIVE_NAME(OBJECTIVE_NAME);
            obiectiveCentrala.setOBJECTIVE_DESCRIPTION(OBJECTIVE_DESCRIPTION);
            obiectiveCentrala.setRESULT_VALUE(RESULT_VALUE);
            obiectiveCentrala.setOBJECTIVE_TARGET(OBJECTIVE_TARGET);
            obiectiveCentrala.setSATISFACTION_RATE(SATISFACTION_RATE);
            obiectiveCentrala.setID(ID);



            list.add(obiectiveCentrala);
        }

        return list;
    }

    public static List<ObiectiveCentrala> obiectiveoameniq4(Connection conn,Integer ENTITY_ID_OR_MARCA) throws SQLException {
        String sql = "Select ID,OBJECTIVE_NAME,RESULT_VALUE,SATISFACTION_RATE,OBJECTIVE_TARGET,OBJECTIVE_DESCRIPTION from obiectivecentrala where OBJECTIVE_ZONE = 'Oameni'  and ENTITY_ID_OR_MARCA = ? and quarter=4";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, ENTITY_ID_OR_MARCA);
        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while(rs.next()) {
            String OBJECTIVE_NAME = rs.getString("OBJECTIVE_NAME");
            String OBJECTIVE_DESCRIPTION = rs.getString("OBJECTIVE_DESCRIPTION");
            double OBJECTIVE_TARGET = rs.getDouble("OBJECTIVE_TARGET");
            double RESULT_VALUE = rs.getDouble("RESULT_VALUE");
            double SATISFACTION_RATE = rs.getDouble("SATISFACTION_RATE");
            int ID = rs.getInt("ID");

            ObiectiveCentrala obiectiveCentrala = new ObiectiveCentrala();
            obiectiveCentrala.setOBJECTIVE_NAME(OBJECTIVE_NAME);
            obiectiveCentrala.setOBJECTIVE_DESCRIPTION(OBJECTIVE_DESCRIPTION);
            obiectiveCentrala.setRESULT_VALUE(RESULT_VALUE);
            obiectiveCentrala.setOBJECTIVE_TARGET(OBJECTIVE_TARGET);
            obiectiveCentrala.setSATISFACTION_RATE(SATISFACTION_RATE);
            obiectiveCentrala.setID(ID);



            list.add(obiectiveCentrala);
        }

        return list;
    }


}




