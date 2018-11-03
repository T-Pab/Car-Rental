function addEmployee () {
    var FIELDSET = document.querySelectorAll(".leftThird fieldset")[0];
    var IRS_Number = FIELDSET.querySelectorAll("input")[0].value;
    var SSN = FIELDSET.querySelectorAll("input")[1].value;
    var Driver_License = FIELDSET.querySelectorAll("input")[2].value;
    var First_Name = FIELDSET.querySelectorAll("input")[3].value;
    var Last_Name = FIELDSET.querySelectorAll("input")[4].value;
    var Street = FIELDSET.querySelectorAll("input")[5].value;
    var Street_Number = FIELDSET.querySelectorAll("input")[6].value;
    var Postal_Code = FIELDSET.querySelectorAll("input")[7].value;
    var City = FIELDSET.querySelectorAll("input")[8].value;
    var Store_ID = FIELDSET.querySelectorAll("input")[9].value;
    var Start_Date = FIELDSET.querySelectorAll("input")[10].value;
    var Finish_Date = FIELDSET.querySelectorAll("input")[11].value;
    var Job = FIELDSET.querySelectorAll("input")[12].value;
    $.post ("php/employees/addEmployee.php", {
        "IRS_Number": IRS_Number,
        "SSN": SSN,
        "Driver_License": Driver_License,
        "First_Name": First_Name,
        "Last_Name": Last_Name,
        "Street": Street,
        "Street_Number": Street_Number,
        "Postal_Code": Postal_Code,
        "City": City,
        "Store_ID": Store_ID,
        "Start_Date": Start_Date,
        "Finish_Date": Finish_Date,
        "Job": Job
    }, function (str) {
        print (str);
    });
}

function deleteEmployee () {
    var FIELDSET = document.querySelectorAll(".leftThird fieldset")[1];
    var IRS_Number = FIELDSET.querySelectorAll("input")[0].value;
    $.post ("php/employees/deleteEmployee.php", {
        "IRS_Number": IRS_Number
    }, function (str) {
        print (str);
    });
}

function updateEmployeeInfo () {
    var FIELDSET = document.querySelectorAll(".midThird fieldset")[0];
    var IRS_Number = FIELDSET.querySelectorAll("input")[0].value;
    var Driver_License = FIELDSET.querySelectorAll("input")[1].value;
    var Street = FIELDSET.querySelectorAll("input")[2].value;
    var Street_Number = FIELDSET.querySelectorAll("input")[3].value;
    var Postal_Code = FIELDSET.querySelectorAll("input")[4].value;
    var City = FIELDSET.querySelectorAll("input")[5].value;
    $.post ("php/employees/updateEmployeeInfo.php", {
        "IRS_Number": IRS_Number,
        "Driver_License": Driver_License,
        "Street": Street,
        "Street_Number": Street_Number,
        "Postal_Code": Postal_Code,
        "City": City
    }, function (str) {
        print (str);
    });
}

function updateEmployeeWork () {
    var FIELDSET = document.querySelectorAll(".midThird fieldset")[1];
    var IRS_Number = FIELDSET.querySelectorAll("input")[0].value;
    var Store_ID = FIELDSET.querySelectorAll("input")[1].value;
    var Start_Date = FIELDSET.querySelectorAll("input")[2].value;
    var Finish_Date = FIELDSET.querySelectorAll("input")[3].value;
    $.post ("php/employees/updateEmployeeWork.php", {
        "IRS_Number": IRS_Number,
        "Store_ID": Store_ID,
        "Start_Date": Start_Date,
        "Finish_Date": Finish_Date
    }, function (str) {
        print (str);
    });
}

function addEmployeeWork () {
    var FIELDSET = document.querySelectorAll(".midThird fieldset")[2];
    var IRS_Number = FIELDSET.querySelectorAll("input")[0].value;
    var Store_ID = FIELDSET.querySelectorAll("input")[1].value;
    var Start_Date = FIELDSET.querySelectorAll("input")[2].value;
    var Finish_Date = FIELDSET.querySelectorAll("input")[3].value;
    var Job = FIELDSET.querySelectorAll("input")[4].value;
    $.post ("php/employees/addEmployeeWork.php", {
        "IRS_Number": IRS_Number,
        "Store_ID": Store_ID,
        "Start_Date": Start_Date,
        "Finish_Date": Finish_Date,
        "Job": Job
    }, function (str) {
        print (str);
    });
}

function viewAllEmployees () {
    $.post ("php/employees/viewAllEmployees.php", {}, function (str) {
        print (str);
    });
}

function viewActiveEmployees () {
    $.post ("php/employees/viewActiveEmployees.php", {}, function (str) {
        print (str);
    });
}

function viewPastEmployees () {
    $.post ("php/employees/viewPastEmployees.php", {}, function (str) {
        print (str);
    });
}

function viewJobsOfEmployee () {
    var FIELDSET = document.querySelectorAll(".rightThird fieldset")[0];
    var IRS_Number = FIELDSET.querySelectorAll("input")[0].value;
    $.post ("php/employees/viewJobsOfEmployee.php", {
        "IRS_Number": IRS_Number
    }, function (str) {
        print (str);
    });
}

function searchEmployee () {
    var FIELDSET = document.querySelectorAll(".rightThird fieldset")[0];
    var search = FIELDSET.querySelectorAll("input")[1].value;
    $.post ("php/employees/searchEmployee.php", {
        "search": search
    }, function (str) {
        print (str);
    });
}
