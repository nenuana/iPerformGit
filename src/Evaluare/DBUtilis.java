package Evaluare;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DBUtilis {
    public DBUtilis() {
    }
    public static List<Employee> echipa(Connection conn,String np1_email) throws SQLException {
        String sql = "Select   a.last_name, a.first_name,a.email, a.unit  from employee a join employee_superior b on a.pk_employee = b.pk_employee where b.np1_email =?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, np1_email);
        ResultSet rs = pstm.executeQuery();
        ArrayList list = new ArrayList();

        while(rs.next()) {
            String last_name = rs.getString("last_name");
            String first_name = rs.getString("first_name");
            String email = rs.getString("email");

            String unit= rs.getString("unit");
            Employee Employee = new Employee();
            Employee.setLast_name(last_name);
            Employee.setFirst_name(first_name);
            Employee.setEmail(email);
            Employee.setUnit(unit);
            list.add(Employee);
        }

        return list;
    }


    public  static  List<EmployeeSuperior> infoangajat (Connection conn, String email2) throws  SQLException{
        String sql = "Select code,last_name,first_name,email,np1_code,np1_last_name,np1_first_name,np1_email,np2_code, np2_last_name, np2_first_name, np2_email, np3_code, np3_last_name, np3_first_name, np3_email," +
                " np4_code,np4_last_name,np4_first_name, np4_email,np5_code, np5_last_name, np5_first_name, np5_email from employee_superior where email = ?";
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
                " a.nota_integritate, a.nota_discernamant, a.nota_pasiune, a.nota_respect, a.nota_invatare, a.nota_colaborare, a.nota_simplitate from valori a join employee e on a.employee_pk  = e.code where e.email = ?" ;
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
            list.add(valoriServlet);
        }

        return list;

    }


    public static void insertValori(Connection conn, ValoriServlet valori) throws SQLException {

        String sql = "Insert into valori(employee_pk,integritate,pasiune,invatare,simplitate,colaborare,respect,discernamant," +
                "nota_integritate,nota_pasiune,nota_invatare,nota_simplitate,nota_colaborare,nota_respect,nota_discernamant) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
        String sql = "Update valori set integritate = ?, pasiune = ? , disernamant = ?, invatare = ?, respect = ?,colaborare = ?, " +
                "simplitate = ? , nota_integritate = ?, nota_pasiune = ?, nota_discernamant = ?, nota_invatare = ?," +
                " nota_respect = ?,nota_simplitate =?, nota_colaborare = ? where employee_pk = ?";
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
        pstm.setInt(15, employee_pk);

        System.out.println("employee_pk");
        System.out.println(employee_pk);


        pstm.executeUpdate();



    }
//aflu employee_fk

    public static Integer findempecode (Connection conn, String email) throws SQLException {
        String sql = "Select code  AS cod from employee where email = ?";
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


    public static String verififsuperior (Connection conn, String email) throws SQLException {
        String sql = "SELECT email AS info FROM employee_superior WHERE np1_email  = ?";
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
        String sql = "SELECT email AS info FROM employee_superior WHERE np2_email  = ?";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, email);

        ResultSet rs = pstm.executeQuery();

        if (rs.next()) {

            String info = rs.getString("info");
            return info;
        }
        else{return  null;}
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
}


