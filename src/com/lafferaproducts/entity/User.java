package com.lafferaproducts.entity;

import java.util.Date;

public class User {
	private String userName;
	private String password;
	private String firstName;
	private String middleName;
	private String lastName;
	private String address;
	private String contactNumber;
	private String email;
	private String userType;
	private String birthDate;
	private String gender;
	private String accountCreated;
	public User(String userName, String password, String firstName, String middleName, String lastName, String address,
			String contactNumber, String email, String userType, String birthDate, String gender, String accountCreated) {
		super();
		this.userName = userName;
		this.password = password;
		this.firstName = firstName;
		this.middleName = middleName;
		this.lastName = lastName;
		this.address = address;
		this.contactNumber = contactNumber;
		this.email = email;
		this.userType = userType;
		this.birthDate = birthDate;
		this.gender = gender;
		this.accountCreated = accountCreated;
	}
	public User() {}
	public User(String userName, String password) {
		this.userName = userName;
		this.password = password;
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAccountCreated() {
		return accountCreated;
	}

	public void setAccountCreated(String accountCreated) {
		this.accountCreated = accountCreated;
	}
	
}
