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
            alert(new_address_text)
            // you can see the result from the console
            // tab of the developer tools
            location.reload();
        },
        error: function (xhr, resp, text) {
            console.log(xhr, resp, text);
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
};

