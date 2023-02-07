-- SQL file for BACxDeloitte hackathon 

-- creating the tables in SQL 

CREATE TABLE `Department_csv` (
  `dept` int DEFAULT NULL,
  `dept_description` varchar(32) DEFAULT NULL,
  `proj_division` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
CREATE TABLE `Employee_csv` (
  `employee_number` varchar(8) DEFAULT NULL,
  `dept` int DEFAULT NULL,
  `position` varchar(32) DEFAULT NULL,
  `bu` int DEFAULT NULL,
  `bu_entry_date` varchar(8) DEFAULT NULL,
  `annual_leave_entitlement` varchar(4) DEFAULT NULL,
  `employee_type` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
CREATE TABLE `Leave_Type_csv` (
  `leave_code` varchar(8) DEFAULT NULL,
  `leave_type` varchar(4) DEFAULT NULL,
  `leave_type_description` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
CREATE TABLE `Leave_csv` (
  `employee_number` varchar(8) DEFAULT NULL,
  `leave_code` varchar(8) DEFAULT NULL,
  `from` varchar(16) DEFAULT NULL,
  `to` varchar(16) DEFAULT NULL,
  `days` float DEFAULT NULL,
  `total_no_of_leave_days` varchar(4) DEFAULT NULL,
  `remarks` varchar(256) DEFAULT NULL,
  `count` int DEFAULT NULL,
  `leave_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
CREATE TABLE `Transaction_Data_csv` (
  `employee_number` varchar(16) DEFAULT NULL,
  `vendor_name` varchar(32) DEFAULT NULL,
  `custom_merchant_category` varchar(32) DEFAULT NULL,
  `creditor_merchant_category` varchar(32) DEFAULT NULL,
  `comment` varchar(32) DEFAULT NULL,
  `expense_date` date DEFAULT NULL,
  `status` varchar(16) DEFAULT NULL,
  `tax_code` varchar(2) DEFAULT NULL,
  `expense_amount` varchar(16) DEFAULT NULL,
  `net_amount` varchar(16) DEFAULT NULL,
  `tax_amount` varchar(16) DEFAULT NULL,
  `authorised_by` varchar(16) DEFAULT NULL,
  `transaction_id` varchar(32) DEFAULT NULL,
  `count` int DEFAULT NULL,
  `total_expense` decimal(20,5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
CREATE TABLE `Vendor_csv` (
  `vendor_name` varchar(32) DEFAULT NULL,
  `vendor_location` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
CREATE TABLE `accounts_payable_invoice_csv` (
  `document_type` varchar(64) DEFAULT NULL,
  `document_number` varchar(16) DEFAULT NULL,
  `vendor_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `invoice_date` varchar(16) DEFAULT NULL,
  `currency` varchar(4) DEFAULT NULL,
  `document_status` varchar(16) DEFAULT NULL,
  `payment_due_date` varchar(16) DEFAULT NULL,
  `department_name` varchar(128) DEFAULT NULL,
  `part_number` varchar(16) DEFAULT NULL,
  `product_number` varchar(128) DEFAULT NULL,
  `amount_payable_untaxed` double DEFAULT NULL,
  `amount_payable_taxed` double DEFAULT NULL,
  `line_of_payable_list` double DEFAULT NULL,
  `remarks` varchar(256) DEFAULT NULL,
  `source` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
CREATE TABLE `accounts_payable_payment_csv` (
  `payment_date` varchar(8) DEFAULT NULL,
  `remarks` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `total_amount` decimal(20,5) DEFAULT NULL,
  `bank_number` varchar(16) DEFAULT NULL,
  `vendor_id` varchar(8) DEFAULT NULL,
  `invoice_id` varchar(16) DEFAULT NULL,
  `source` varchar(16) DEFAULT NULL,
  `document_number` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
CREATE TABLE `accounts_payable_vendor_csv` (
  `vendor_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `classification` varchar(64) DEFAULT NULL,
  `purchasing_department` varchar(128) DEFAULT NULL,
  `supplier_receiving_bank_account` varchar(32) DEFAULT NULL,
  `shipping_days` int DEFAULT NULL,
  `contact_details` varchar(64) DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  `country` varchar(16) DEFAULT NULL,
  `source` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
CREATE TABLE `contract_csv` (
  `employee_master` varchar(8) DEFAULT NULL,
  `date_term` varchar(8) DEFAULT NULL,
  `source_system` varchar(16) DEFAULT NULL,
  `contractual` varchar(4) DEFAULT NULL,
  `contract_start` varchar(8) DEFAULT NULL,
  `contract_end` varchar(8) DEFAULT NULL,
  `co` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
CREATE TABLE `employeepoc_csv` (
  `employee_master` varchar(8) DEFAULT NULL,
  `country` varchar(16) DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  `home_phone` varchar(16) DEFAULT NULL,
  `mobile_phone` varchar(16) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
CREATE TABLE `income_csv` (
  `employee_master` varchar(8) DEFAULT NULL,
  `date` varchar(16) DEFAULT NULL,
  `division` varchar(8) DEFAULT NULL,
  `grade` varchar(4) DEFAULT NULL,
  `description` varchar(32) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `payment_type` varchar(16) DEFAULT NULL,
  `payment_sub_type` varchar(16) DEFAULT NULL,
  `relevant_income` varchar(4) DEFAULT NULL,
  `employee_type` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 
CREATE TABLE `nn_employee` (
  `employee_master` varchar(8) DEFAULT NULL,
  `job_desc` varchar(32) DEFAULT NULL,
  `adm_plan` varchar(4) DEFAULT NULL,
  `co` varchar(4) DEFAULT NULL,
  `bu_division` varchar(8) DEFAULT NULL,
  `bu_desc` varchar(32) DEFAULT NULL,
  `date_join` varchar(16) DEFAULT NULL,
  `date_term` varchar(16) DEFAULT NULL,
  `contractual` varchar(4) DEFAULT NULL,
  `contract_start` varchar(16) DEFAULT NULL,
  `contract_end` varchar(16) DEFAULT NULL,
  `country` varchar(16) DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  `home_phone` varchar(32) DEFAULT NULL,
  `mobile_phone` varchar(32) DEFAULT NULL,
  `bank_acct` varchar(32) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `employment_type` varchar(16) DEFAULT NULL,
  `source_system` varchar(16) DEFAULT NULL,
  `final_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- accounts_payable 
SELECT * FROM accounts_payable_payment_csv;
 
SELECT * FROM accounts_payable_vendor_csv;
 
SELECT * FROM accounts_payable_invoice_csv;
 
select vendor_id, supplier_receiving_bank_account, count(supplier_receiving_bank_account)
from accounts_payable_vendor_csv
group by supplier_receiving_bank_account
order by count(supplier_receiving_bank_account) DESC
;
 
select DISTINCT(invoice_id)
from accounts_payable_payment_csv
where vendor_id in (
    select vendor_id
    from accounts_payable_vendor_csv
    where purchasing_department LIKE '%discontinued%' OR purchasing_department LIKE '%deactivated%'
);

-- credit_card 
SELECT * FROM Transaction_Data_csv;
 
SELECT * FROM Leave_csv;
 
SELECT * FROM Vendor_csv; 
 
SELECT * FROM Department_csv; 
 
SELECT * FROM Employee_csv;
 
SELECT * FROM Leave_Type_csv; 
 
SELECT vendor_name, expense_amount FROM Transaction_Data_csv 
GROUP BY vendor_name
ORDER BY expense_amount DESC;
 
SELECT Transaction_Data_csv.*, Leave_csv.from, Leave_csv.to
FROM Leave_csv 
INNER JOIN Transaction_Data_csv
ON Leave_csv.employee_number = Transaction_Data_csv.employee_number;


-- payroll_data  

SELECT employee_master,sum(amount) as nonp_total FROM income_csv WHERE payment_sub_type NOT LIKE '%Pension%' GROUP BY employee_master, date_format(date, '%M');

SELECT employee_master, bu_division FROM nn_employee;

SELECT employee_master FROM payroll_employee_csv WHERE date_join>'30/6/2021';

select a.authorised_by, a.fraud_count, b.total_authorised from (select t2.authorised_by, COUNT(t2.authorised_by) as fraud_count from nn_employee as t1, Transaction_Data_csv as t2 where t2.expense_date > t1.final_date AND t1.final_date <= '2021-12-31' and t1.final_date >= '2021-07-01' and t1.employee_master = t2.employee_number  and t2.authorised_by NOT LIKE '%NA%' group by t2.authorised_by) a left join  (select d.authorised_by, count(d.authorised_by) as total_authorised from Transaction_Data_csv as d where authorised_by NOT LIKE '%NA%' group by authorised_by) b on a.authorised_by = b.authorised_by order by total_authorised DESC;




 


