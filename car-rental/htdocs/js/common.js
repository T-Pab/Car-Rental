function createHeader(page) {
    document.getElementsByTagName('header')[0].innerHTML = ' \
        <center><h1><u>CAR RENTAL</u></h1></center> \
        <div class="menu" id="menu"> \
            <ul> \
            <li id="menu_home"><a href="index.html">Home</a></li> \
            <li id="menu_stores"><a href="stores.html">Stores</a></li>  \
            <li id="menu_employees"><a href="employees.html">Employees</a></li>  \
            <li id="menu_customers"><a href="customers.html">Customers</a></li>  \
            <li id="menu_vehicles"><a href="vehicles.html">Vehicles</a></li> \
            <li id="menu_book"><a href="book.html">Book Vehicle</a></li> \
            <li id="menu_report"><a href="queries.html">Queries</a></li> \
            </ul>\
        </div> \
        ';
    switch(page) {
    case 0:
        var element = document.getElementById("menu_home");
        element.classList.add("active");
        break;
    case 1:
        var element = document.getElementById("menu_stores");
        element.classList.add("active");
        break;
    case 2:
        var element = document.getElementById("menu_employees");
        element.classList.add("active");
        break;
    case 3:
        var element = document.getElementById("menu_customers");
        element.classList.add("active");
        break;
    case 4:
        var element = document.getElementById("menu_vehicles");
        element.classList.add("active");
        break;
    case 5:
        var element = document.getElementById("menu_book");
        element.classList.add("active");
        break;
    case 6:
        var element = document.getElementById("menu_report");
        element.classList.add("active");
        break;
    }
}

function createFooter () {
    document.getElementsByTagName('footer')[0].innerHTML = ' \
        <div id="textinline"> \
          <span>OUTPUT:</span> \
        </div> \
        <br/> \
        <div> \
            <center> \
                <div id="out"></div> \
            </center> \
        </div> \
        ';
}

function print (str) {
    document.querySelector("#out").innerHTML = str;
}
