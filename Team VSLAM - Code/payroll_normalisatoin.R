# BACxDeloitte Hackathon 2022 - Vinay Payroll Dataset
# Cleaning of Payroll Dataset - Employee Sheet 
# and forming normalized database for SQL Upload

library(readxl)
library(data.table)
emp_mas = read_excel("/Users/vinay/Documents/Y2 Semester 2/BACxDeloitte Hackathon/Payroll Data.xlsx")
View(emp_mas)
dim(emp_mas)

summary(emp_mas)

##Splitting of columns to normalised database formation - ER Diagram
employee_rows<-c("Employee_Master", "Job Desc", "Adm Plan", "BU Division", "BU Desc", "Date Join", "Bank Acct")
contract_rows<-c("Employee_Master", "Date Term", "Source System", "Contractual", "Contract Start", "Contract End", "Co")
employeepoc_rows<-c("Employee_Master", "Country", "Address", "Home Phone", "Mobile Phone", "Gender")

employee<-emp_mas[,employee_rows]
contract<-emp_mas[,contract_rows]
employeepoc<-emp_mas[,employeepoc_rows]

# Cleaning of Payroll Dataset - Income Sheet 
# and forming normalized database for SQL Upload

payslips = read_excel("/Users/vinay/Documents/Y2 Semester 2/BACxDeloitte Hackathon/Payslips.xlsx")
summary(payslips)

##Splitting of columns to normalised database formation - ER Diagram
income_rows<-c("Employee_ID", "Date", "Division", "Grade", "Description", "Amount", "Payment_Type", "Payment_Sub_Type", "Relevant Income", "Employee Type")
income<-payslips[,income_rows]
names(income)

#Cleaning up of column headers for easy referencing using SQL
names(employee) <- tolower(names(employee))
names(contract) <- tolower(names(contract))
names(employeepoc) <- tolower(names(employeepoc))
names(income) <- tolower(names(income))
names(employee) <- chartr(" ", "_", names(employee))
names(contract) <- chartr(" ", "_", names(contract))
names(employeepoc) <- chartr(" ", "_", names(employeepoc))
names(income) <- chartr(" ", "_", names(income))

#Write normalized tables to local folder
setwd("/Users/vinay/Documents/Y2 Semester 2/BACxDeloitte Hackathon")
write.csv(employee, "payroll_employee.csv")
write.csv(contract, "contract.csv")
write.csv(employeepoc, "employeepoc.csv")
write.csv(income, "income.csv")

#Checking of char length for each column
lapply(contract, function(x) max(nchar(x), na.rm = T))
lapply(employeepoc, function(x) max(nchar(x), na.rm = T))
lapply(employee, function(x) max(nchar(x), na.rm = T))
lapply(income, function(x) max(nchar(x), na.rm = T))
lapply(emp_mas, function(x) max(nchar(x), na.rm=T))


drop <- c("Co", "Date Term",	"Contractual", 	"Contract Start",	"Contract End", "Source System")
emp_mas_clean = emp_mas[,!(names(emp_mas) %in% drop)]
dim(emp_mas_clean)

emp_mas_clean_nas <- emp_mas_clean[rowSums(is.na(emp_mas_clean)) > 0,]
dim(emp_mas_clean_nas)
# there are 13 feature variables with 2003 records

View(emp_mas_clean_nas)
#891 records contain NA is at least 1 row

emp_mas_clean_complete <- emp_mas_clean[rowSums(is.na(emp_mas_clean)) == 0,]
dim(emp_mas_clean_complete)

#change dataset to simpler name
empdata = emp_mas_clean_complete

summary(empdata)
#Checking which columns do the NAs exist out of 891 records
sum(is.na(emp_mas_clean_nas$Employee_Master))
sum(is.na(emp_mas_clean_nas$`Job Desc`))
sum(is.na(emp_mas_clean_nas$`Adm Plan`))
sum(is.na(emp_mas_clean_nas$`BU Division`))
sum(is.na(emp_mas_clean_nas$`BU Desc`))
sum(is.na(emp_mas_clean_nas$`Date Join`))
sum(is.na(emp_mas_clean_nas$Country))
sum(is.na(emp_mas_clean_nas$Address)) # 6 missing
sum(is.na(emp_mas_clean_nas$`Home Phone`)) #596 missing
sum(is.na(emp_mas_clean_nas$`Mobile Phone`))# 299 missing
sum(is.na(emp_mas_clean_nas$`Bank Acct`))
sum(is.na(emp_mas_clean_nas$`Employment Type`))

# Non-crucial rows, with related to fraud detection, only have missing values.
# From a hackathon standpoint, these rows can be removed and the profile of all
# employees (2003 employees) can be viewed together

## Check with team: remove following rows: c("Co", "Date Term",	
  ## "Contractual", 	"Contract Start",	"Contract End", "Source System", "Address", 
  ## "Home Phone", "Mobile Phone")







