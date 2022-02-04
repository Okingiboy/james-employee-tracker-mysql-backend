DROP DATABASE IF EXISTS employees;
CREATE DATABASE employees;
USE employees;
CREATE TABLE department (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30) UNIQUE NOT NULL
);
CREATE TABLE role (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(30) UNIQUE NOT NULL,
  salary DECIMAL UNSIGNED NOT NULL,
  department_id INT UNSIGNED NOT NULL,
  INDEX dep_ind (department_id),
  CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES department(id) ON DELETE CASCADE
);
CREATE TABLE employee (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  role_id INT UNSIGNED NOT NULL,
  INDEX role_ind (role_id),
  CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE,
  manager_id INT UNSIGNED,
  INDEX man_ind (manager_id),
  CONSTRAINT fk_manager FOREIGN KEY (manager_id) REFERENCES employee(id) ON DELETE SET NULL
);
use employees;
INSERT INTO department
    (name)
VALUES
    ('Engineering'),
    ('Supervisor'),
    ('Accountant'),
    ('Management');
INSERT INTO role
    (title, salary, department_id)
VALUES
    ('Personel Manager', 11000000, 1),
    ('Trainer', 4000000, 1),
    ('Lead Engineer', 15000000, 2),
    ('System Analyst', 8000000, 2),
    ('Project Manager', 7000000, 3),
    ('Media Specialist', 3000000, 3),
    ('MD', 65000000, 4),
    ('MD Assistant', 35000000, 4);
INSERT INTO employee
    (first_name, last_name, role_id, manager_id)
VALUES
    ('Mark', 'Njoku', 1, NULL),
    ('Chris', 'Okoba', 2, 1),
    ('Sampson', 'Magu', 3, NULL),
    ('Jerry', 'Bloza', 4, 3),
    ('Brown', 'Jeffta', 5, NULL),
    ('Melau', 'Gubo', 6, 5),
    ('Mercy', 'Pope', 7, NULL),
    ('Sydney', 'Cook', 8, 7);
    
