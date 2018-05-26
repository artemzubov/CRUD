package ru.spb.zubov.dao;

import java.util.List;
import ru.spb.zubov.model.Employee;

public interface EmployeeDAO {

	void addEmployee(Employee employee);

	List<Employee> getAllEmployees();

	void deleteEmployee(Integer employeeId);

	Employee updateEmployee(Employee employee);

	Employee getEmployee(int employeeid);
}
