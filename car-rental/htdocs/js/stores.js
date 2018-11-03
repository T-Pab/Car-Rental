function addStore () {
    var FIELDSET = document.querySelectorAll(".leftThird fieldset")[0];
    var Street = FIELDSET.querySelectorAll("input")[0].value;
    var StreetNumber = FIELDSET.querySelectorAll("input")[1].value;
    var PostalCode = FIELDSET.querySelectorAll("input")[2].value;
    var City = FIELDSET.querySelectorAll("input")[3].value;
    $.post ("php/stores/addStore.php", {
        "Street": Street,
        "StreetNumber": StreetNumber,
        "PostalCode": PostalCode,
        "City": City
    }, function(str) {
        print(str);
    });
}

function addStorePhone () {
    var FIELDSET = document.querySelectorAll(".leftThird fieldset")[1];
    var StoreID = FIELDSET.querySelectorAll("input")[0].value;
    var PhoneNumber = FIELDSET.querySelectorAll("input")[1].value;
    $.post ("php/stores/addStorePhone.php", {
        "StoreID": StoreID,
        "PhoneNumber": PhoneNumber
    }, function(str) {
        print(str);
    });
}

function addStoreEmail () {
    var FIELDSET = document.querySelectorAll(".leftThird fieldset")[2];
    var StoreID = FIELDSET.querySelectorAll("input")[0].value;
    var EmailAddress = FIELDSET.querySelectorAll("input")[1].value;
    $.post ("php/stores/addStoreEmail.php", {
        "StoreID": StoreID,
        "EmailAddress": EmailAddress
    }, function(str) {
        print(str);
    });
}

function updateStore () {
    var FIELDSET = document.querySelectorAll(".midThird fieldset")[0];
    var StoreID = FIELDSET.querySelectorAll("input")[0].value;
    var Street = FIELDSET.querySelectorAll("input")[1].value;
    var StreetNumber = FIELDSET.querySelectorAll("input")[2].value;
    var PostalCode = FIELDSET.querySelectorAll("input")[3].value;
    var City = FIELDSET.querySelectorAll("input")[4].value;
    $.post ("php/stores/updateStore.php", {
        "StoreID": StoreID,
        "Street": Street,
        "StreetNumber": StreetNumber,
        "PostalCode": PostalCode,
        "City": City
    }, function(str) {
        print(str);
    });
}

function deleteStore() {
    var FIELDSET = document.querySelectorAll(".midThird fieldset")[0];
    var StoreID = FIELDSET.querySelectorAll("input")[0].value;
    $.post ("php/stores/deleteStore.php", {
        "StoreID": StoreID
    }, function(str) {
        print(str);
    });
}

function updateStorePhone () {
    var FIELDSET = document.querySelectorAll(".midThird fieldset")[1];
    var StoreID = FIELDSET.querySelectorAll("input")[0].value;
    var PhoneNumber = FIELDSET.querySelectorAll("input")[1].value;
    var NewPhoneNumber = FIELDSET.querySelectorAll("input")[2].value;
    $.post ("php/stores/updateStorePhone.php", {
        "StoreID": StoreID,
        "PhoneNumber": PhoneNumber,
        "NewPhoneNumber": NewPhoneNumber
    }, function(str) {
        print(str);
    });
}

function deleteStorePhone () {
    var FIELDSET = document.querySelectorAll(".midThird fieldset")[1];
    var StoreID = FIELDSET.querySelectorAll("input")[0].value;
    var PhoneNumber = FIELDSET.querySelectorAll("input")[1].value;
    $.post ("php/stores/deleteStorePhone.php", {
        "StoreID": StoreID,
        "PhoneNumber": PhoneNumber
    }, function(str) {
        print(str);
    });
}

function updateStoreEmail () {
    var FIELDSET = document.querySelectorAll(".midThird fieldset")[2];
    var StoreID = FIELDSET.querySelectorAll("input")[0].value;
    var EmailAddress = FIELDSET.querySelectorAll("input")[1].value;
    var NewEmailAddress = FIELDSET.querySelectorAll("input")[2].value;
    $.post ("php/stores/updateStoreEmail.php", {
        "StoreID": StoreID,
        "EmailAddress": EmailAddress,
        "NewEmailAddress": NewEmailAddress
    }, function(str) {
        print(str);
    });
}

function deleteStoreEmail () {
    var FIELDSET = document.querySelectorAll(".midThird fieldset")[2];
    var StoreID = FIELDSET.querySelectorAll("input")[0].value;
    var EmailAddress = FIELDSET.querySelectorAll("input")[1].value;
    $.post ("php/stores/deleteStoreEmail.php", {
        "StoreID": StoreID,
        "EmailAddress": EmailAddress
    }, function(str) {
        print(str);
    });
}

function viewAllStores () {
    $.post ("php/stores/viewAllStores.php", {}, function(str) {
        print(str);
    });
}

function viewStoreByID () {
    var FIELDSET = document.querySelectorAll(".rightThird fieldset")[0];
    var StoreID = FIELDSET.querySelectorAll("input")[0].value;
    $.post ("php/stores/viewStoreByID.php", {
        "StoreID": StoreID
    }, function(str) {
        print(str);
    });
}

function viewPhonesOfStore () {
    var FIELDSET = document.querySelectorAll(".rightThird fieldset")[0];

    var StoreID = FIELDSET.querySelectorAll("input")[1].value;
    $.post ("php/stores/viewPhonesOfStore.php", {
        "StoreID": StoreID
    }, function(str) {
        print(str);
    });
}

function viewEmailsOfStore () {
    var FIELDSET = document.querySelectorAll(".rightThird fieldset")[0];

    var StoreID = FIELDSET.querySelectorAll("input")[2].value;
    $.post ("php/stores/viewEmailsOfStore.php", {
        "StoreID": StoreID
    }, function(str) {
        print(str);
    });
}

function viewEmployeesOfStore () {
    var FIELDSET = document.querySelectorAll(".rightThird fieldset")[0];

    var StoreID = FIELDSET.querySelectorAll("input")[3].value;
    $.post ("php/stores/viewEmployeesOfStore.php", {
        "StoreID": StoreID
    }, function(str) {
        print(str);
    });
}

function viewVehiclesOfStore () {
    var FIELDSET = document.querySelectorAll(".rightThird fieldset")[0];

    var StoreID = FIELDSET.querySelectorAll("input")[4].value;
    $.post ("php/stores/viewVehiclesOfStore.php", {
        "StoreID": StoreID
    }, function(str) {
        print(str);
    });
}
