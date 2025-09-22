package model;

import java.util.Date;

public class EmployeeTrainingDetails {

    private int employeeId;
    private String employeeName;
    private String trainingName;
    private Date trainingDate;

    public EmployeeTrainingDetails(int employeeId, String employeeName, String trainingName, Date trainingDate) {
        this.employeeId = employeeId;
        this.employeeName = employeeName;
        this.trainingName = trainingName;
        this.trainingDate = trainingDate;
    }

    // Getters
    public int getEmployeeId() {
        return employeeId;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public String getTrainingName() {
        return trainingName;
    }

    public Date getTrainingDate() {
        return trainingDate;
    }
}
