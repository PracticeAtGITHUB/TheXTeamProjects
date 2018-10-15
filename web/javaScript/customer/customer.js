function getStateList() {
    var searchValue = document.getElementById("SaveCustomer_customer_customercountry").value;

    if (searchValue != "") {
        var msg = $.ajax({
            url:"/CustomerDatabase_Chap23/stateList?searchValue=" + searchValue,
            async:false
        }).responseText;
        var listText = unescape(msg);
        var TypeArray = new Array();
        var TypeArrayInfo = new Array();
        TypeArray = listText.split(",");
        document.getElementById("SaveCustomer_customer_customerstate").options.length = 0;
        document.getElementById("SaveCustomer_customer_customerstate").options.add(new Option("-- Please Select --", ""));

        for (i = 0; i < TypeArray.length; i++) {
            TypeArrayInfo = TypeArray[i].split("|");
            document.getElementById("SaveCustomer_customer_customerstate").options.add(new Option(TypeArrayInfo[1], TypeArrayInfo[0]));
        }
    }
    else{
        document.getElementById("SaveCustomer_customer_customerstate").options.length = 0;
        document.getElementById("SaveCustomer_customer_customerstate").options.add(new Option("-- Please Select --", ""));
        document.getElementById("SaveCustomer_customer_customercity").options.length = 0;
        document.getElementById("SaveCustomer_customer_customercity").options.add(new Option("-- Please Select --", ""));
    }
}

function getCityList() {
    var searchValue = document.getElementById("SaveCustomer_customer_customerstate").value;

    if (searchValue != "") {
        var msg = $.ajax({
            url:"/CustomerDatabase_Chap23/cityList?searchValue=" + searchValue,
            async:false
        }).responseText;
        var listText = unescape(msg);
        var TypeArray = new Array();
        var TypeArrayInfo = new Array();
        TypeArray = listText.split(",");
        document.getElementById("SaveCustomer_customer_customercity").options.length = 0;
        document.getElementById("SaveCustomer_customer_customercity").options.add(new Option("-- Please Select --", ""));

        for (i = 0; i < TypeArray.length; i++) {
            TypeArrayInfo = TypeArray[i].split("|");
            document.getElementById("SaveCustomer_customer_customercity").options.add(new Option(TypeArrayInfo[1], TypeArrayInfo[0]));
        }
    }
    else{
        document.getElementById("SaveCustomer_customer_customercity").options.length = 0;
        document.getElementById("SaveCustomer_customer_customercity").options.add(new Option("-- Please Select --", ""));
    }
}