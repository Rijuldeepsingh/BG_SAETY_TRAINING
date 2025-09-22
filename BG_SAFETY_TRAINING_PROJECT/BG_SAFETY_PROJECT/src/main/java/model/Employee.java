package model;

public class Employee {
    private int id;
    private String employeeCode;
    private String name;
    private String department;
    private String status;

    public Employee() {}

    public Employee(int id, String employeeCode, String name, String department, String status) {
        this.id = id;
        this.employeeCode = employeeCode;
        this.name = name;
        this.department = department;
        this.status = status;
    }

    // Getters & Setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getEmployeeCode() {
        return employeeCode;
    }
    public void setEmployeeCode(String employeeCode) {
        this.employeeCode = employeeCode;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getDepartment() {
        return department;
    }
    public void setDepartment(String department) {
        this.department = department;
    }

    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
}
