library(data.table)
library(readxl)

# set WD to current WD

### Import from Excel
CC_transaction.dt <- as.data.table(read_excel("Credit Card Data.xlsx",sheet = "Transaction Data"))
CC_leave.dt <- as.data.table(read_excel("Credit Card Data.xlsx",sheet = "Leave"))

getCount <- function (dt) {
  counted.dt <- dt[, .(count = .N), by = names(dt)]
  return(counted.dt)
}

CC_leave_count.dt <- getCount(CC_leave.dt)
CC_transaction_count.dt <- getCount(CC_transaction.dt)


ulst <- lapply(CC_transaction_count.dt, unique)
unique_count <- lengths(ulst)
unique_count

# Observed that columns "Company" and "Country" has 1 unique value. Drop columns
CC_transaction_count.dt <- CC_transaction_count.dt[,c("Country", "Company") := NULL]

# Make vendor table
CC_vendor.dt <- CC_transaction_count.dt[, c("Vendor Name", "Vendor Location")]
CC_vendor.dt <- CC_vendor.dt[duplicated(CC_vendor.dt) == FALSE,]

# Leave
CC_leave_count.dt$`Leave ID` <- 1:nrow(CC_leave_count.dt)

# Make employees table
CC_employees.dt <- CC_leave_count.dt[, c("Employee Number", "Dept", "Position", "BU", "BU Entry Date", "Annual Leave Entitlement", "Employee Type")]
CC_employees.dt <- CC_employees.dt[duplicated(CC_employees.dt) == FALSE,]

# Make department table
CC_department.dt <- CC_leave_count.dt[, c("Dept", "Dept Description", "Proj Division")]
CC_department.dt <- CC_department.dt[duplicated(CC_department.dt) == FALSE,]

# Make leave type table
CC_leave_type.dt <- CC_leave_count.dt[, c("Leave Code", "Leave Type", "Leave Type Description")]
CC_leave_type.dt <- CC_leave_type.dt[duplicated(CC_leave_type.dt) == FALSE,]

# Remove rows
CC_transaction_count.dt <- CC_transaction_count.dt[, "Vendor Location" := NULL] # vendors
CC_leave_count.dt <- CC_leave_count.dt[, c("Dept", "Position", "BU", "BU Entry Date", "Annual Leave Entitlement", "Employee Type") := NULL] # employees
CC_leave_count.dt <- CC_leave_count.dt[, c("Dept Description", "Proj Division") := NULL] # department
CC_leave_count.dt <- CC_leave_count.dt[, c("Leave Type", "Leave Type Description") := NULL] # leave type

# Rename columns
names(CC_transaction_count.dt) <- tolower(names(CC_transaction_count.dt))
names(CC_transaction_count.dt) <- chartr(" ", "_", names(CC_transaction_count.dt))
names(CC_leave_count.dt) <- tolower(names(CC_leave_count.dt))
names(CC_leave_count.dt) <- chartr(" ", "_", names(CC_leave_count.dt))
names(CC_department.dt) <- tolower(names(CC_department.dt))
names(CC_department.dt) <- chartr(" ", "_", names(CC_department.dt))
names(CC_employees.dt) <- tolower(names(CC_employees.dt))
names(CC_employees.dt) <- chartr(" ", "_", names(CC_employees.dt))
names(CC_leave_type.dt) <- tolower(names(CC_leave_type.dt))
names(CC_leave_type.dt) <- chartr(" ", "_", names(CC_leave_type.dt))
names(CC_vendor.dt) <- tolower(names(CC_vendor.dt))
names(CC_vendor.dt) <- chartr(" ", "_", names(CC_vendor.dt))

# Export to csv
write.csv(CC_transaction_count.dt, file = "Transaction Data.csv")
write.csv(CC_leave_count.dt, file = "Leave.csv")
write.csv(CC_department.dt, file = "Department.csv")
write.csv(CC_vendor.dt, file = "Vendor.csv")
write.csv(CC_leave_type.dt, file = "Leave Type.csv")
write.csv(CC_employees.dt, file = "Employee.csv")

max(nchar(CC_transaction.dt$`vendor_name`))
str(CC_transaction.dt$`vendor_name`)

lapply(CC_transaction_count.dt, function(x) max(nchar(x), na.rm = T))
lapply(CC_leave_count.dt, function(x) max(nchar(x), na.rm = T))
lapply(CC_department.dt, function(x) max(nchar(x), na.rm = T))
lapply(CC_vendor.dt, function(x) max(nchar(x), na.rm = T))
lapply(CC_leave_type.dt, function(x) max(nchar(x), na.rm = T))
lapply(CC_employees.dt, function(x) max(nchar(x), na.rm = T))

sum(is.na(CC_transaction_count.dt$expense_amount))
sum(is.na(CC_transaction_count.dt$net_amount))
sum(is.na(CC_transaction_count.dt$))