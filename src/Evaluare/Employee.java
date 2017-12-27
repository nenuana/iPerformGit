package Evaluare;

public class Employee {
    private int pk_employee;
    private int pk_structure;
    private int status;
    private String code;
    private String last_name;
    private String first_name;
    private String position;
    private String unit;
    private String ccc;
    private String cost_center;
    private String location_code;
    private String location;
    private String county;
    private String agency;
    private String structure;
    private String division;
    private String area_region;
    private String area_region_id;
    private String direction;
    private String department;
    private String collective;
    private String group;
    private String superior_full_name;
    private String superior_code;
    private String superior_position;
    private String phone;
    private String mobile_phone;
    private String email;

    public Employee(){

    }



    public Employee (int pk_structure, int pk_employee, int status, String code, String last_name, String first_name, String position, String unit, String ccc, String cost_center, String location_code, String location, String county, String agency, String structure, String division, String area_region, String area_region_id, String direction, String department, String collective, String group, String superior_full_name, String superior_code, String superior_position, String phone, String mobile_phone, String email ){
        this.pk_structure = pk_structure;
        this.pk_employee = pk_employee;
        this.status = status;
        this.code = code;
        this.last_name = last_name;
        this.first_name = first_name;
        this.position = position;
        this.unit = unit;
        this.ccc = ccc;
        this.cost_center = cost_center;
        this.location_code = location_code;
        this.location = location;
        this.county = county;
        this.agency = agency;
        this.structure = structure;
        this.division = division;
        this.area_region = area_region;
        this.area_region_id = area_region_id;
        this.direction = direction;
        this.department = department;
        this.collective = collective;
        this.group = group;
        this.superior_full_name = superior_full_name;
        this.superior_code = superior_code;
        this.phone = phone;
        this.mobile_phone = mobile_phone;
        this.email = email;

    }
    public int getPk_employee() {
        return pk_employee;
    }

    public void setPk_employee(int pk_employee) {
        this.pk_employee = pk_employee;
    }

    public int getPk_structure() {
        return pk_structure;
    }

    public void setPk_structure(int pk_structure) {
        this.pk_structure = pk_structure;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
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

    public String getCcc() {
        return ccc;
    }

    public void setCcc(String ccc) {
        this.ccc = ccc;
    }

    public String getCost_center() {
        return cost_center;
    }

    public void setCost_center(String cost_center) {
        this.cost_center = cost_center;
    }

    public String getLocation_code() {
        return location_code;
    }

    public void setLocation_code(String location_code) {
        this.location_code = location_code;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getCounty() {
        return county;
    }

    public void setCounty(String county) {
        this.county = county;
    }

    public String getAgency() {
        return agency;
    }

    public void setAgency(String agency) {
        this.agency = agency;
    }

    public String getStructure() {
        return structure;
    }

    public void setStructure(String structure) {
        this.structure = structure;
    }

    public String getDivision() {
        return division;
    }

    public void setDivision(String division) {
        this.division = division;
    }

    public String getArea_region() {
        return area_region;
    }

    public void setArea_region(String area_region) {
        this.area_region = area_region;
    }

    public String getArea_region_id() {
        return area_region_id;
    }

    public void setArea_region_id(String area_region_id) {
        this.area_region_id = area_region_id;
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getCollective() {
        return collective;
    }

    public void setCollective(String collective) {
        this.collective = collective;
    }

    public String getGroup() {
        return group;
    }

    public void setGroup(String group) {
        this.group = group;
    }

    public String getSuperior_full_name() {
        return superior_full_name;
    }

    public void setSuperior_full_name(String superior_full_name) {
        this.superior_full_name = superior_full_name;
    }

    public String getSuperior_code() {
        return superior_code;
    }

    public void setSuperior_code(String superior_code) {
        this.superior_code = superior_code;
    }

    public String getSuperior_position() {
        return superior_position;
    }

    public void setSuperior_position(String superior_position) {
        this.superior_position = superior_position;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMobile_phone() {
        return mobile_phone;
    }

    public void setMobile_phone(String mobile_phone) {
        this.mobile_phone = mobile_phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
