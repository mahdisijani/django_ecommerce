$("#submit").on('click', function () {

    data = $("#change_password_form").serialize()
    // send ajax
    $.ajax({
        url: change_password_url, // url where to submit the request
        type: "POST", // type of action POST || GET
        dataType: 'json', // data type
        data: data, // post data || get data
        success: function (result) {
            // you can see the result from the console
            // tab of the developer tools
            alert(change_password_text)
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
});