function send_email() {
    console.log("RUN");
    var form = $("#password_reset_form")
    // send ajax
    $.ajax({
        // url: $("#take_courses").attr('action'), // url where to submit the request
        url: form.attr('action'), // url where to submit the request
        type: "POST", // type of action POST || GET
        dataType: 'json', // data type
        data: form.serialize(), // post data || get data
        success: function (result) {
            console.log("success");
            // you can see the result from the console
            // tab of the developer tools
            console.log(result);
            alert(token_send_text)
            $("#form_container").empty()
            $("#form_container").append(` <form id="password_reset_form" method="post" action=${reset_password_confirm_url} enctype="multipart/form-data"
            class="form-signin p-3">
            <input type="hidden" name="csrfmiddlewaretoken" value=${csrf_token}>
            <label for="token" class="my-4">${token_text}:</label><br>
            <input type="text" name="token"><br>
            <label for="password" class="my-4">${new_password_text}:</label><br>
            <input type="password" name="password"><br>
            <input type="button" id="submit" onclick="change_password()" value=${change_password_text} class="btn btn-primary my-5"
                style="font-size: 1.4vw;">
        </form>`)
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
}

function change_password() {
    console.log("RUN");
    var form = $("#password_reset_form")
    // send ajax
    $.ajax({
        url: form.attr('action'), // url where to submit the request
        type: "POST", // type of action POST || GET
        dataType: 'json', // data type
        data: form.serialize(), // post data || get data
        success: function (result) {
            // you can see the result from the console
            // tab of the developer tools
            alert(change_password_msg)
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
}
