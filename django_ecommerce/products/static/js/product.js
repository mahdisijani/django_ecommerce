function add_item(productId,action) {
    data=`csrfmiddlewaretoken=${csrf_token}&productId=${productId}&action=${action}` //Serialized Data
    $.ajax({

        url: '/api/orders/update_item/', // url where to submit the request
        type: "POST", // type of action POST || GET
        dataType: 'json', // data type
        data: data,
        success: function (result) {
            $("#quantity").val(0)
            alert(add_to_cart_text)
            // you can see the result from the console
            // tab of the developer tools
            console.log(result);
        },
        error: function (xhr, resp, text) {
            console.log(xhr, resp, text);
        }
    })

}