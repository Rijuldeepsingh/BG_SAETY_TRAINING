package model;

public class EmployeeTraining {
    private int id;
    private int employeeId;  // store only ID
    private int trainingId;  // store only ID
    private String status;

    public EmployeeTraining() {}

    public EmployeeTraining(int id, int employeeId, int trainingId, String status) {
        this.id = id;
        this.employeeId = employeeId;
        this.trainingId = trainingId;
        this.status = status;
    }

    // Getters & Setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public int getEmployeeId() {
        return employeeId;
    }
    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public int getTrainingId() {
        return trainingId;
    }
    public void setTrainingId(int trainingId) {
        this.trainingId = trainingId;
    }

    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
}
