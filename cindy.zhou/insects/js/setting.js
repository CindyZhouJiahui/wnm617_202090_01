$("#edit_info form").submit(function(e){
    var data = {};
    data.head = $("input[name='head']").val();
    data.nickname = $("input[name='nickname']").val();
    data.sex = $("input[name='sex']").val();
    data.age = $("input[name='age']").val();
    data.email = $("input[name='email']").val();
    data.location = $("input[name='location']").val();
    data.status = $("input[name='status']").val();
    data.type = "edit_info";

    $.ajax({
        url: "api.php",
        type: "post",
        data: data,
        success: function (response) {
            var res = JSON.parse(response);
            if(res.code == 1){
                alert("success");
                history.go(-1);
            }else if(res.code == 0){
                alert(res.msg);
            }else if(res.code == -1){
                window.location.replace("sign_in.html")
            }else {
                alert("error");
            }
        }
    })
    return false;
});

$("#edit_pass form").submit(function(e){
    var old_password = $("input[name='old_password']").val().trim();
    var password = $("input[name='password']").val().trim();
    var new_password = $("input[name='new_password']").val().trim();

    if(!old_password || !new_password || !password){
        alert("Type your password");
        return false;
    }

    if(password !== new_password){
        alert("Password inconsistency");
        return false;
    }

    $.ajax({
        url: "api.php",
        type: "post",
        data: {
            type: "edit_pass",
            old_password: old_password,
            new_password: new_password
        },
        success: function (response) {
            var res = JSON.parse(response);
            if(res.code == 1){
                alert("success");
                history.go(-1);
            }else if(res.code == 0){
                alert(res.msg);
            }else if(res.code == -1){
                window.location.replace("sign_in.html")
            }else {
                alert("error");
            }
        }
    })
    return false;
});