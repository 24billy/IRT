package com.howtodoinjava.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.howtodoinjava.dao.EmployeeDAO;
import com.howtodoinjava.entity.EmployeeEntity;

public class EmployeeManagerImpl implements EmployeeManager {
	//Employee dao injected by Spring context
    private EmployeeDAO employeeDAO;
	
	//This method will be called when a employee object is added
	@Override
	@Transactional
	public void addEmployee(EmployeeEntity employee) {
		employeeDAO.addEmployee(employee);
	}
	
	//This method return list of employees in database
	@Override
	@Transactional
	public List<EmployeeEntity> getAllEmployees() {
		return employeeDAO.getAllEmployees();
	}
	//Deletes a employee by it's id
	@Override
	@Transactional
	public void deleteEmployee(Integer employeeId) {
		employeeDAO.deleteEmployee(employeeId);
	}
	
	//This setter will be used by Spring context to inject the dao's instance
	public void setEmployeeDAO(EmployeeDAO employeeDAO) {
		this.employeeDAO = employeeDAO;
	}
}
