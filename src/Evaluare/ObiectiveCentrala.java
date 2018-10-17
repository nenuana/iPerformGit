package Evaluare;

public class ObiectiveCentrala {
    private int ID;
    private double RESULT_VALUE;
    private double SATISFACTION_RATE;
    private double RUN_RATE;
    private int QUARTER;
    private int YEAR;
    private String ENTITY_ID_OR_MARCA;
    private String OBJECTIVE_NAME;
    private String OBJECTIVE_DESCRIPTION;
    private String OBJECTIVE_ZONE;
    private double OBJECTIVE_TARGET;
    public ObiectiveCentrala(){

    }

    public ObiectiveCentrala(double RESULT_VALUE,double SATISFACTION_RATE,double RUN_RATE,int QUARTER,int YEAR, String ENTITY_ID_OR_MARCA,String OBJECTIVE_NAME, String OBJECTIVE_DESCRIPTION,String OBJECTIVE_ZONE, double OBJECTIVE_TARGET){

        this.RESULT_VALUE = RESULT_VALUE;
        this.SATISFACTION_RATE = SATISFACTION_RATE;
        this.RUN_RATE = RUN_RATE;
        this.QUARTER = QUARTER;
        this.YEAR = YEAR;
        this.ENTITY_ID_OR_MARCA =ENTITY_ID_OR_MARCA;
        this.OBJECTIVE_NAME = OBJECTIVE_NAME;
        this.OBJECTIVE_DESCRIPTION = OBJECTIVE_DESCRIPTION;
        this.OBJECTIVE_ZONE = OBJECTIVE_ZONE;
        this.OBJECTIVE_TARGET = OBJECTIVE_TARGET;

    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public void setSATISFACTION_RATE() {
        this.SATISFACTION_RATE = SATISFACTION_RATE;
    }

    public void setRUN_RATE(double RUN_RATE) {
        this.RUN_RATE = RUN_RATE;
    }

    public String getOBJECTIVE_NAME() {
        return OBJECTIVE_NAME;
    }

    public double getOBJECTIVE_TARGET() {
        return OBJECTIVE_TARGET;
    }

    public void setOBJECTIVE_TARGET(double OBJECTIVE_TARGET) {
        this.OBJECTIVE_TARGET = OBJECTIVE_TARGET;
    }

    public String getOBJECTIVE_ZONE() {
        return OBJECTIVE_ZONE;
    }

    public void setOBJECTIVE_ZONE(String OBJECTIVE_ZONE) {
        this.OBJECTIVE_ZONE = OBJECTIVE_ZONE;
    }

    public String getOBJECTIVE_DESCRIPTION() {
        return OBJECTIVE_DESCRIPTION;

    }

    public void setOBJECTIVE_DESCRIPTION(String OBJECTIVE_DESCRIPTION) {
        this.OBJECTIVE_DESCRIPTION = OBJECTIVE_DESCRIPTION;
    }

    public void setOBJECTIVE_NAME(String OBJECTIVE_NAME) {
        this.OBJECTIVE_NAME = OBJECTIVE_NAME;
    }

    public double getRESULT_VALUE() {
        return RESULT_VALUE;
    }

    public void setRESULT_VALUE(Double RESULT_VALUE) {
        this.RESULT_VALUE = RESULT_VALUE;
    }

    public double getSATISFACTION_RATE() {
        return SATISFACTION_RATE;
    }

    public void setSATISFACTION_RATE(Double SATISFACTION_RATE) {
        this.SATISFACTION_RATE = SATISFACTION_RATE;
    }

    public double getRUN_RATE() {
        return RUN_RATE;
    }

    public void setRUN_RATE(Double RUN_RATE) {
        this.RUN_RATE = RUN_RATE;
    }

    public int getQUARTER() {
        return QUARTER;
    }

    public void setQUARTER(int QUARTER) {
        this.QUARTER = QUARTER;
    }

    public int getYEAR() {
        return YEAR;
    }

    public void setYEAR(int YEAR) {
        this.YEAR = YEAR;
    }

    public String getENTITY_ID_OR_MARCA() {
        return ENTITY_ID_OR_MARCA;
    }

    public void setENTITY_ID_OR_MARCA(String ENTITY_ID_OR_MARCA) {
        this.ENTITY_ID_OR_MARCA = ENTITY_ID_OR_MARCA;
    }

    public void setRESULT_VALUE(double RESULT_VALUE) {
        this.RESULT_VALUE = RESULT_VALUE;
    }
}
