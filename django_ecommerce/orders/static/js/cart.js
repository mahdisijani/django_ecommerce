function update_item(productId,action) {
    data=`csrfmiddlewaretoken=${csrf_token}&productId=${productId}&action=${action}` // Serialized Data
    $.ajax({
        url: '/api/orders/update_item/', // url where to submit the request
        type: "POST", // type of action POST || GET
        dataType: 'json', // data type
        data: data,
        success: function (result) {
            // you can see the result from the console
            // tab of the developer tools
            update_data()

        },
        error: function (xhr, resp, text) {
            console.log(xhr, resp, text);
        }
    })

}


function update_data() {
    $.ajax({

        url: '/orders/cart/', // url where to submit the request
        type: "GET", // type of action POST || GET
        success: function (result) {
            console.log("success");
            // you can see the result from the console
            // tab of the developer tools
            location.reload();
        },
        error: function (xhr, resp, text) {
            console.log("error");
            console.log(xhr, resp, text);
        }
    })

}