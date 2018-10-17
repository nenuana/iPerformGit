package Evaluare;

public class Rezultate {
    private int ID;
    private double financiar_procent;
    private double procese_procent;
    private double clienti_procent;
    private double invatare_procent;
    private double oameni_procent;
    private String termen_scurt;
    private String termen_lung;
    private String q1;
    private String q2;
    private String q3;
    private String q4;
    private String q_an;
    private String nq1;
    private String nq2;
    private String nq3;
    private String nq4;
    private String nq_an;
    private String poza;
    private String npoza;


    private int marca;


    public Rezultate(){

    }
    public Rezultate(double financiar_procent,double clienti_procent,double invatare_procent,double procese_procent,double oameni_procent,String termen_scurt,String termen_lung,int marca,String q1,String q2, String q3, String q4, String q_an,String nq1,String nq2, String nq3, String nq4, String nq_an,String poza,String npoza) {

        this.financiar_procent = financiar_procent;
        this.procese_procent = procese_procent;
        this.clienti_procent = clienti_procent;
        this.invatare_procent = invatare_procent;
        this.oameni_procent = oameni_procent;
        this.termen_lung = termen_lung;
        this.termen_scurt = termen_scurt;
        this.marca = marca;
        this.q1 = q1;
        this.q2 = q2;
        this.q3 = q3;
        this.q4 = q4;
        this.q_an = q_an;
        this.nq1 = nq1;
        this.nq2 = nq2;
        this.nq3 = nq3;
        this.nq4 = nq4;
        this.nq_an = nq_an;
        this.poza = poza;
        this.npoza = npoza;

    }

    public double getOameni_procent() {
        return oameni_procent;
    }

    public void setOameni_procent(double oameni_procent) {
        this.oameni_procent = oameni_procent;
    }

    public String getNpoza() {
        return npoza;
    }

    public void setNpoza(String npoza) {
        this.npoza = npoza;
    }

    public String getPoza() {
        return poza;
    }

    public void setPoza(String poza) {
        this.poza = poza;
    }

    public String getNq_an() {
        return nq_an;
    }

    public void setNq_an(String nq_an) {
        this.nq_an = nq_an;
    }

    public String getNq4() {
        return nq4;
    }

    public void setNq4(String nq4) {
        this.nq4 = nq4;
    }

    public String getNq3() {
        return nq3;
    }

    public void setNq3(String nq3) {
        this.nq3 = nq3;
    }

    public String getNq2() {
        return nq2;
    }

    public void setNq2(String nq2) {
        this.nq2 = nq2;
    }

    public String getNq1() {
        return nq1;
    }

    public void setNq1(String nq1) {
        this.nq1 = nq1;
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

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public double getFinanciar_procent() {
        return financiar_procent;
    }

    public void setFinanciar_procent(double financiar_procent) {
        this.financiar_procent = financiar_procent;
    }

    public double getProcese_procent() {
        return procese_procent;
    }

    public void setProcese_procent(double procese_procent) {
        this.procese_procent = procese_procent;
    }

    public double getClienti_procent() {
        return clienti_procent;
    }

    public void setClienti_procent(double clienti_procent) {
        this.clienti_procent = clienti_procent;
    }

    public double getInvatare_procent() {
        return invatare_procent;
    }

    public void setInvatare_procent(double invatare_procent) {
        this.invatare_procent = invatare_procent;
    }

    public String getTermen_scurt() {
        return termen_scurt;
    }

    public void setTermen_scurt(String termen_scurt) {
        this.termen_scurt = termen_scurt;
    }

    public String getTermen_lung() {
        return termen_lung;
    }

    public void setTermen_lung(String termen_lung) {
        this.termen_lung = termen_lung;
    }

    public int getMarca() {
        return marca;
    }

    public void setMarca(int marca) {
        this.marca = marca;
    }
}
