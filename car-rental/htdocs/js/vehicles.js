function addVehicle () {
    var FIELDSET = document.querySelectorAll(".leftThird fieldset")[0];
    var License_Plate = FIELDSET.querySelectorAll("input")[0].value;
    var Model = FIELDSET.querySelectorAll("input")[1].value;
    var CType = FIELDSET.querySelectorAll("select")[0].value;
    var Make = FIELDSET.querySelectorAll("input")[2].value;
    var CYear = FIELDSET.querySelectorAll("input")[3].value;
    var Kilometers = FIELDSET.querySelectorAll("input")[4].value;
    var Cylinder_Capacity = FIELDSET.querySelectorAll("input")[5].value;
    var Horse_Power = FIELDSET.querySelectorAll("input")[6].value;
    var Damages = FIELDSET.querySelectorAll("input")[7].value;
    var Malfunctions = FIELDSET.querySelectorAll("input")[8].value;
    var Next_Service = FIELDSET.querySelectorAll("input")[9].value;
    var Insurance_Exp_Date = FIELDSET.querySelectorAll("input")[10].value;
    var Last_Service = FIELDSET.querySelectorAll("input")[11].value;
    var Store_ID = FIELDSET.querySelectorAll("input")[12].value;
    var Fuel = FIELDSET.querySelectorAll("input")[13].value;
    $.post ("php/vehicles/addVehicle.php", {
        "License_Plate": License_Plate,
        "Model": Model,
        "CType": CType,
        "Make": Make,
        "CYear": CYear,
        "Kilometers": Kilometers,
        "Cylinder_Capacity": Cylinder_Capacity,
        "Horse_Power": Horse_Power,
        "Damages": Damages,
        "Malfunctions": Malfunctions,
        "Next_Service": Next_Service,
        "Insurance_Exp_Date": Insurance_Exp_Date,
        "Last_Service": Last_Service,
        "Store_ID": Store_ID,
        "Fuel": Fuel
    }, function (str) {
        print (str);
    });
}

function updateVehicle () {
    var FIELDSET = document.querySelectorAll(".midThird fieldset")[0];
    var License_Plate = FIELDSET.querySelectorAll("input")[0].value;
    var Kilometers = FIELDSET.querySelectorAll("input")[1].value;
    var Damages = FIELDSET.querySelectorAll("input")[2].value;
    var Malfunctions = FIELDSET.querySelectorAll("input")[3].value;
    var Next_Service = FIELDSET.querySelectorAll("input")[4].value;
    var Insurance_Exp_Date = FIELDSET.querySelectorAll("input")[5].value;
    var Last_Service = FIELDSET.querySelectorAll("input")[6].value;
    var Store_ID = FIELDSET.querySelectorAll("input")[7].value;
    var Fuel = FIELDSET.querySelectorAll("input")[8].value;
    $.post ("php/vehicles/updateVehicle.php", {
        "License_Plate": License_Plate,
        "Kilometers": Kilometers,
        "Damages": Damages,
        "Malfunctions": Malfunctions,
        "Next_Service": Next_Service,
        "Insurance_Exp_Date": Insurance_Exp_Date,
        "Last_Service": Last_Service,
        "Store_ID": Store_ID,
        "Fuel": Fuel
    }, function (str) {
        print (str);
    });
}

function deleteVehicle () {
    var FIELDSET = document.querySelectorAll(".midThird fieldset")[0];
    var License_Plate = FIELDSET.querySelectorAll("input")[0].value;
    $.post ("php/vehicles/deleteVehicle.php", {}, function (str) {
        print (str);
    });
}

function viewAllVehicles () {
    $.post ("php/vehicles/viewAllVehicles.php", {}, function (str) {
        print (str);
    });
}

function searchVehicleModel () {
    var FIELDSET = document.querySelectorAll(".rightThird fieldset")[0];
    var search = FIELDSET.querySelectorAll("input")[0].value;
    $.post("php/vehicles/searchVehicleModel.php", {
        "search": search
    }, function(str) {
        print (str);
    });
}

function searchVehicleMake () {
    var FIELDSET = document.querySelectorAll(".rightThird fieldset")[0];
    var search = FIELDSET.querySelectorAll("input")[1].value;
    $.post("php/vehicles/searchVehicleMake.php", {
        "search": search
    }, function(str) {
        print (str);
    });
}

function searchVehicleLicensePlate () {
    var FIELDSET = document.querySelectorAll(".rightThird fieldset")[0];
    var search = FIELDSET.querySelectorAll("input")[2].value;
    $.post("php/vehicles/searchVehicleLicensePlate.php", {
        "search": search
    }, function(str) {
        print (str);
    });
}

function viewVehiclesByType () {
    var FIELDSET = document.querySelectorAll(".rightThird fieldset")[0];
    var CType = FIELDSET.querySelectorAll("select")[0].value;
    $.post("php/vehicles/viewVehiclesByType.php", {
        "CType": CType
    }, function(str) {
        print (str);
    });
}

function viewDamagedVehicles () {
    $.post ("php/vehicles/viewDamagedVehicles.php", {}, function (str) {
        print (str);
    });
}

function viewMalfunctionsVehicles () {
    $.post ("php/vehicles/viewMalfunctionsVehicles.php", {}, function (str) {
        print (str);
    });
}

function viewExpiredInsuranceVehicles () {
    $.post ("php/vehicles/viewExpiredInsuranceVehicles.php", {}, function (str) {
        print (str);
    });
}
