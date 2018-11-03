function addCustomer () {
    var IRS_Number = document.querySelectorAll(".leftThird input")[0].value;
    var SSN = document.querySelectorAll(".leftThird input")[1].value;
    var Last_Name = document.querySelectorAll(".leftThird input")[2].value;
    var First_Name = document.querySelectorAll(".leftThird input")[3].value;
    var Driver_License = document.querySelectorAll(".leftThird input")[4].value;
    var First_Registration = document.querySelectorAll(".leftThird input")[5].value;
    var City = document.querySelectorAll(".leftThird input")[6].value;
    var Postal_Code = document.querySelectorAll(".leftThird input")[7].value;
    var Street = document.querySelectorAll(".leftThird input")[8].value;
    var Street_Number = document.querySelectorAll(".leftThird input")[9].value;
    $.post("php/customers/addCustomer.php", {
        "IRS_Number": IRS_Number,
        "SSN": SSN,
        "Last_Name": Last_Name,
        "First_Name": First_Name,
        "Driver_License": Driver_License,
        "First_Registration": First_Registration,
        "City": City,
        "Postal_Code": Postal_Code,
        "Street": Street,
        "Street_Number": Street_Number
    }, function(str) {
        print (str);
    });
}

function updateCustomer () {
    var FIELDSET = document.querySelectorAll(".midThird fieldset")[0];
    var Customer_ID = FIELDSET.querySelectorAll("input")[0].value;
    var City = FIELDSET.querySelectorAll("input")[1].value;
    var Postal_Code = FIELDSET.querySelectorAll("input")[2].value;
    var Street = FIELDSET.querySelectorAll("input")[3].value;
    var Street_Number = FIELDSET.querySelectorAll("input")[4].value;
    $.post("php/customers/updateCustomer.php", {
        "Customer_ID": Customer_ID,
        "City": City,
        "Postal_Code": Postal_Code,
        "Street": Street,
        "Street_Number": Street_Number
    }, function(str) {
        print (str);
    });
}

function deleteCustomer () {
    var FIELDSET = document.querySelectorAll(".midThird fieldset")[1];
    var Customer_ID = FIELDSET.querySelectorAll("input")[0].value;
    $.post("php/customers/deleteCustomer.php", {
    "Customer_ID": Customer_ID
    }, function(str) {
        print (str);
    });
}

function viewAllCustomers() {
    print ("Quering...");
    $.post("php/customers/viewAllCustomers.php", {}, function(str) {
        print (str);
    });
}

function searchCustomer() {
    var FIELDSET = document.querySelectorAll(".rightThird fieldset")[0];
    var search = FIELDSET.querySelectorAll("input")[0].value;
    $.post("php/customers/searchCustomer.php", {
        "search": search
    }, function(str) {
        print (str);
    });
}

function viewCustomersActiveRentals() {
    print ("Quering...");
    $.post("php/customers/viewCustomersActiveRentals.php", {}, function(str) {
        print (str);
    });
}

function viewCustomersNoReservations() {
    print ("Quering...");
    $.post("php/customers/viewCustomersNoReservations.php", {}, function(str) {
        print (str);
    });
}

function viewCustomersUnpaidFinishedReservations() {
    print ("Quering...");
    $.post("php/customers/viewCustomersUnpaidFinishedReservations.php", {}, function(str) {
        print (str);
    });
}
