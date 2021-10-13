function add_coupon() {
    // send ajax
    $.ajax({
        url: coupon_url, // url where to submit the request
        type: "POST", // type of action POST || GET
        dataType: 'json', // data type
        data: $("#coupon_form").serialize(), // post data || get data
        success: function (result) {
            alert(coupon_msg)
            // you can see the result from the console
            // tab of the developer tools
            console.log(result);
            $("#total_price").text(result)
        },
        error: function (xhr, resp, text) {
            alert(coupon_err_msg)
            console.log(xhr, resp, text);
        }
    })
};


function add_address() {
    console.log("RUN");
    console.log($("#add_address_form").serialize());
    // send ajax
    $.ajax({
        url: add_address_url , // url where to submit the request
        type: "POST", // type of action POST || GET
        dataType: 'json', // data type
        data: $("#add_address_form").serialize(), // post data || get data
        success: function (result) {
            console.log("success");
            alert(new_address_text)
            // you can see the result from the console
            // tab of the developer tools
            location.reload();
        },
        error: function (xhr, resp, text) {
            console.log(xhr, resp, text);
        }
    })
};


function payment() {
    $("#address_form").submit()
};