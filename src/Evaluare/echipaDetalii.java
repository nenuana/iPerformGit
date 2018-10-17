package Evaluare;

public class echipaDetalii {
    private String q1;
    private String q2;
    private String q3;
    private String q4;
    private String q_an;
    private String poza;
    private String last_name;
    private String first_name;
    private String position;
    private String unit;
    private String email;
    private String code;


    private String superior_full_name;
    private int nota_integritate;
    private int nota_pasiune;
    private int nota_invatare;
    private int nota_simplitate;
    private int nota_colaborare;
    private int nota_respect;
    private int nota_discernamant;


    public  echipaDetalii(){

    }
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public echipaDetalii(String q1, String q2, String q3, String q4, String q_an, String poza, String last_name, String first_name, String position, String unit, String email, String code, int nota_integritate, int nota_pasiune, int nota_invatare, int nota_simplitate, int nota_colaborare, int nota_respect, int nota_discernamant,String superior_full_name) {
        this.q1 = q1;
        this.q2 = q2;
        this.q3 = q3;
        this.q4 = q4;
        this.q_an = q_an;
        this.poza = poza;
        this.last_name = last_name;
        this.first_name = first_name;
        this.position = position;
        this.unit = unit;
        this.email = email;
        this.code = code;
        this.nota_integritate = nota_integritate;
        this.nota_pasiune = nota_pasiune;
        this.nota_invatare = nota_invatare;
        this.nota_simplitate = nota_simplitate;
        this.nota_colaborare = nota_colaborare;
        this.nota_respect = nota_respect;
        this.nota_discernamant = nota_discernamant;
        this.superior_full_name = superior_full_name;
    }

    public String getSuperior_full_name() {
        return superior_full_name;
    }

    public void setSuperior_full_name(String superior_full_name) {
        this.superior_full_name = superior_full_name;
    }

    public String getQ1() {
        return q1;
    }

    public void setQ1(String q1) {
        this.q1 = q1;
    }

    public String getQ2() {
        return q2;
    }

    public void setQ2(String q2) {
        this.q2 = q2;
    }

    public String getQ3() {
        return q3;
    }

    public void setQ3(String q3) {
        this.q3 = q3;
    }

    public String getQ4() {
        return q4;
    }

    public void setQ4(String q4) {
        this.q4 = q4;
    }

    public String getQ_an() {
        return q_an;
    }

    public void setQ_an(String q_an) {
        this.q_an = q_an;
    }

    public String getPoza() {
        return poza;
    }

    public void setPoza(String poza) {
        this.poza = poza;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getNota_integritate() {
        return nota_integritate;
    }

    public void setNota_integritate(int nota_integritate) {
        this.nota_integritate = nota_integritate;
    }

    public int getNota_pasiune() {
        return nota_pasiune;
    }

    public void setNota_pasiune(int nota_pasiune) {
        this.nota_pasiune = nota_pasiune;
    }

    public int getNota_invatare() {
        return nota_invatare;
    }

    public void setNota_invatare(int nota_invatare) {
        this.nota_invatare = nota_invatare;
    }

    public int getNota_simplitate() {
        return nota_simplitate;
    }

    public void setNota_simplitate(int nota_simplitate) {
        this.nota_simplitate = nota_simplitate;
    }

    public int getNota_colaborare() {
        return nota_colaborare;
    }

    public void setNota_colaborare(int nota_colaborare) {
        this.nota_colaborare = nota_colaborare;
    }

    public int getNota_respect() {
        return nota_respect;
    }

    public void setNota_respect(int nota_respect) {
        this.nota_respect = nota_respect;
    }

    public int getNota_discernamant() {
        return nota_discernamant;
    }

    public void setNota_discernamant(int nota_discernamant) {
        this.nota_discernamant = nota_discernamant;
    }
}


