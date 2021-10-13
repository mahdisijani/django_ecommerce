$("#submit").on('click', function () {
    // send ajax
    $.ajax({
        url: register_url, // url where to submit the request
        type: "POST", // type of action POST || GET
        dataType: 'json', // data type
        data: $("#register_form").serialize(), // post data || get data
        success: function (result) {
            alert(registration_msg_text)
            // you can see the result from the console
            // tab of the developer tools
            console.log(result);
        },
        error: function (xhr, resp, text) {
            json_resp = JSON.parse(xhr.responseText)
            console.log(json_resp);
            for (let x in json_resp) {
                let text = "";
                text += x;
                text += ' : ';
                text += json_resp[x];
                alert(text)
              }
        }
    })
});