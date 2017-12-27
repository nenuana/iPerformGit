package Evaluare;

public class ValoriServlet {
    private int pk_valori;
    private int employee_pk;
    private String integritate;

    private String pasiune;
    private String invatare;
    private String simplitate;
    private String colaborare;
    private String respect;
    private String discernamant;
    private int nota_integritate;
    private int nota_pasiune;
    private int nota_invatare;
    private int nota_simplitate;
    private int nota_colaborare;
    private int nota_respect;
    private int nota_discernamant;

    public ValoriServlet(){}
    public ValoriServlet(int employee_pk, String integritate, String pasiune, String invatare, String simplitate, String colaborare, String respect, String discernamant, int nota_integritate, int nota_pasiune, int nota_invatare, int nota_simplitate, int nota_colaborare, int nota_respect, int nota_discernamant) {

        this.employee_pk = employee_pk;
        this.integritate = integritate;
        this.pasiune = pasiune;
        this.invatare = invatare;
        this.simplitate = simplitate;
        this.colaborare = colaborare;
        this.respect = respect;
        this.discernamant = discernamant;
        this.nota_integritate = nota_integritate;
        this.nota_pasiune = nota_pasiune;
        this.nota_invatare = nota_invatare;
        this.nota_simplitate = nota_simplitate;
        this.nota_colaborare = nota_colaborare;
        this.nota_respect = nota_respect;
        this.nota_discernamant = nota_discernamant;
    }


    public int getPk_valori() {
        return pk_valori;
    }

    public void setPk_valori(int pk_valori) {
        this.pk_valori = pk_valori;
    }

    public int getEmployee_pk() {
        return employee_pk;
    }

    public void setEmployee_pk(int employee_pk) {
        this.employee_pk = employee_pk;
    }

    public String getIntegritate() {
        return integritate;
    }

    public void setIntegritate(String integritate) {
        this.integritate = integritate;
    }

    public String getPasiune() {
        return pasiune;
    }

    public void setPasiune(String pasiune) {
        this.pasiune = pasiune;
    }

    public String getInvatare() {
        return invatare;
    }

    public void setInvatare(String invatare) {
        this.invatare = invatare;
    }

    public String getSimplitate() {
        return simplitate;
    }

    public void setSimplitate(String simplitate) {
        this.simplitate = simplitate;
    }

    public String getColaborare() {
        return colaborare;
    }

    public void setColaborare(String colaborare) {
        this.colaborare = colaborare;
    }

    public String getRespect() {
        return respect;
    }

    public void setRespect(String respect) {
        this.respect = respect;
    }

    public String getDiscernamant() {
        return discernamant;
    }

    public void setDiscernamant(String discernamant) {
        this.discernamant = discernamant;
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
