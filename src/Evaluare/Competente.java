package Evaluare;

public class Competente {
    private int ID;
    private String abilitati;
    private String subactivitati;
    private String voi_continua;
    private String voi_lua_in_considerare;
    private int marca;
    private String pilon;

    public Competente(){}

    public Competente(String abilitati,String subactivitati,String voi_continua,String voi_lua_in_considerare,int marca,String pilon) {
        this.abilitati = abilitati;
        this.subactivitati = subactivitati;
        this.voi_continua = voi_continua;
        this.voi_lua_in_considerare = voi_lua_in_considerare;
        this.marca = marca;
        this.pilon = pilon;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getAbilitati() {
        return abilitati;
    }

    public void setAbilitati(String abilitati) {
        this.abilitati = abilitati;
    }

    public String getSubactivitati() {
        return subactivitati;
    }

    public void setSubactivitati(String subactivitati) {
        this.subactivitati = subactivitati;
    }

    public String getVoi_continua() {
        return voi_continua;
    }

    public void setVoi_continua(String voi_continua) {
        this.voi_continua = voi_continua;
    }

    public String getVoi_lua_in_considerare() {
        return voi_lua_in_considerare;
    }

    public void setVoi_lua_in_considerare(String voi_lua_in_considerare) {
        this.voi_lua_in_considerare = voi_lua_in_considerare;
    }

    public int getMarca() {
        return marca;
    }

    public void setMarca(int marca) {
        this.marca = marca;
    }

    public String getPilon() {
        return pilon;
    }

    public void setPilon(String pilon) {
        this.pilon = pilon;
    }
}
