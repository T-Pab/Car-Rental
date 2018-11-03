function available () {
    var FIELDSET = document.querySelectorAll(".leftThird fieldset")[0];
    var CType = FIELDSET.querySelectorAll("select")[0].value;
    var Start_Date = FIELDSET.querySelectorAll("input")[0].value;
    var Finish_Date = FIELDSET.querySelectorAll("input")[1].value;
    $.post ("php/book/available.php", {
        "CType": CType,
        "Start_Date": Start_Date,
        "Finish_Date": Finish_Date
    }, function(str) {
        print(str);
    });
}

function makeReservation () {
    var FIELDSET = document.querySelectorAll(".leftThird fieldset")[1];
    var License_Plate = FIELDSET.querySelectorAll("input")[0].value;
    var Start_Date = FIELDSET.querySelectorAll("input")[1].value;
    var Start_Location = FIELDSET.querySelectorAll("input")[2].value;
    var Finish_Location = FIELDSET.querySelectorAll("input")[3].value;
    var Finish_Date = FIELDSET.querySelectorAll("input")[4].value;
    var Customer_ID = FIELDSET.querySelectorAll("input")[5].value;
    $.post ("php/book/makeReservation.php", {
        "License_Plate": License_Plate,
        "Start_Date": Start_Date,
        "Start_Location": Start_Location,
        "Finish_Location": Finish_Location,
        "Finish_Date": Finish_Date,
        "Customer_ID": Customer_ID
    }, function(str) {
        print(str);
    });
}

function changeReservation () {
    var FIELDSET = document.querySelectorAll(".leftThird fieldset")[2];
    var License_Plate = FIELDSET.querySelectorAll("input")[0].value;
    var Start_Date = FIELDSET.querySelectorAll("input")[1].value;
    var Start_Location = FIELDSET.querySelectorAll("input")[2].value;
    var Finish_Location = FIELDSET.querySelectorAll("input")[3].value;
    var Finish_Date = FIELDSET.querySelectorAll("input")[4].value;
    var Customer_ID = FIELDSET.querySelectorAll("input")[5].value;
    $.post ("php/book/changeReservation.php", {
        "License_Plate": License_Plate,
        "Start_Date": Start_Date,
        "Start_Location": Start_Location,
        "Finish_Location": Finish_Location,
        "Finish_Date": Finish_Date,
        "Customer_ID": Customer_ID
    }, function(str) {
        print(str);
    });
}

function payReservation () {
    var FIELDSET = document.querySelectorAll(".midThird fieldset")[0];
    var License_Plate = FIELDSET.querySelectorAll("input")[0].value;
    var Start_Date = FIELDSET.querySelectorAll("input")[1].value;
    var Payment_Amount = FIELDSET.querySelectorAll("input")[2].value;
    var Payment_Method = FIELDSET.querySelectorAll("input")[3].value;
    var IRS_Number = FIELDSET.querySelectorAll("input")[4].value;
    $.post ("php/book/payReservation.php", {
        "License_Plate": License_Plate,
        "Start_Date": Start_Date,
        "Payment_Amount": Payment_Amount,
        "Payment_Method": Payment_Method,
        "IRS_Number": IRS_Number
    }, function(str) {
        print(str);
    });
}

function returnVehicle () {
    var FIELDSET = document.querySelectorAll(".midThird fieldset")[1];
    var License_Plate = FIELDSET.querySelectorAll("input")[0].value;
    var Start_Date = FIELDSET.querySelectorAll("input")[1].value;
    var Return_State = FIELDSET.querySelectorAll("input")[2].value;
    $.post ("php/book/returnVehicle.php", {
        "License_Plate": License_Plate,
        "Start_Date": Start_Date,
        "Return_State": Return_State
    }, function(str) {
        print(str);
    });
}

function viewAllReservations () {
    $.post ("php/book/viewAllReservations.php", {}, function(str) {
        print(str);
    });
}

function viewPastReservations () {

    $.post ("php/book/viewPastReservations.php", {

    }, function(str) {
        print(str);
    });
}

function viewUnpaidPastReservations () {

    $.post ("php/book/viewUnpaidPastReservations.php", {

    }, function(str) {
        print(str);
    });
}

function viewUnpaidFutureReservations()  {

    $.post ("php/book/viewUnpaidFutureReservations.php", {

    }, function(str) {
        print(str);
    });
}

function viewFutureReservations()  {

    $.post ("php/book/viewFutureReservations.php", {

    }, function(str) {
        print(str);
    });
}


function viewAllRentals()  {

    $.post ("php/book/viewAllRentals.php", {

    }, function(str) {
        print(str);
    });
}

function viewActiveRentals()  {

    $.post ("php/book/viewActiveRentals.php", {

    }, function(str) {
        print(str);
    });
}

function viewFutureRentals()  {

    $.post ("php/book/viewFutureRentals.php", {

    }, function(str) {
        print(str);
    });
}
