$('#sing_up').submit(function(e) {
    var username = $("input[name='username']").val();
    var email = $("input[name='email']").val();
    var password = $("input[name='password']").val();
    var passwords = $("input[name='passwords']").val();

    if(!username.trim()){
        alert("Please enter your username")
        return false;
    }

    var pattern = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
    if(!pattern.test(email.trim())){
        alert("Please enter your email")
        return false;
    }

    if(!password.trim()){
        alert("Please enter your password")
        return false;
    }

    if(!passwords.trim()){
        alert("Please enter the password again")
        return false;
    }

    if(password.trim() !== passwords.trim()){
        alert("Inconsistent password input")
        return false;
    }

    $.ajax({
        url: "reg.php",
        type: "post",
        data: {
            username: username,
            email: email,
            password: password
        },
        success: function (res) {
            var res = JSON.parse(res);
            if(res.code == 1){
                alert(res.msg)
                setTimeout(function () {
                    window.location.href="sign_in.html";
                },1000)
            }else{
                alert(res.msg)
            }
        }
    })

    return false;
});
