function back() {
    window.location.href="list.html";
}

function add_prod() {
    if(!getQueryVariable("lat") || !getQueryVariable("lng")){
        window.location.replace("user.html");
        return false;
    }
    var img = $("input[name='img']").val();
    var title = $("input[name='title']").val();
    var characters = $("input[name='characters']").val();
    var des = $("#des").val();
    var coordinate = getQueryVariable("lat")+","+getQueryVariable("lng");

    var arry = new Array();
    $('input[name="types"]:checked').each(function(index, element) {
        arry.push($(this).val());
    });
    var types = arry.join(',');


    if(!img){
        alert("Please upload the picture")
        return false;
    }

    if(!title){
        alert("Please enter a name")
        return false;
    }

    if(!characters){
        alert("Please enter a characters")
        return false;
    }

    if(!des){
        alert("Please enter a des")
        return false;
    }

    if(!coordinate){
        alert("Please enter a longitude and latitude")
        return false;
    }

    $.ajax({
        url: "api.php",
        type: "post",
        data: {
            img: img,
            title: title,
            des: des,
            coordinate: coordinate,
            types: types,
            characters: characters,
            type: "addEif"
        },
        success: function (res) {
            var res = JSON.parse(res);
            if(res.code == 1){
                alert(res.msg)
                setTimeout(function () {
                    history.go(-2)
                },1000)
            } else if(res.code == -1){
                window.location.href = "sign_in.html";
            }else{
                alert(res.msg)
            }
        }
    })

}

function getQueryVariable(variable)
{
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i=0;i<vars.length;i++) {
        var pair = vars[i].split("=");
        if(pair[0] == variable){return pair[1];}
    }
    return(false);
}


function edit() {
    var img = $("input[name='img']").val();
    var title = $("input[name='title']").val();
    var des = $("#des").val();
    var coordinate = $("input[name='coordinate']").val();
    var types = $("#types").val();
    var id = $("input[name='id']").val();

    if(!id){
        window.location.href="list.html";
        return false;
    }

    if(!img){
        alert("Please upload the picture")
        return false;
    }

    if(!title){
        alert("Please enter a name")
        return false;
    }

    if(!des){
        alert("Please enter a des")
        return false;
    }

    if(!coordinate){
        alert("Please enter a longitude and latitude")
        return false;
    }

    $.ajax({
        url: "",
        type: "post",
        data: {
            img: img,
            title: title,
            des: des,
            coordinate: coordinate,
            types: types,
            id: id
        },
        success: function (res) {
            var res = JSON.parse(res);
            if(res.code == 1){
                alert(res.msg)
                setTimeout(function () {
                    window.location.href="list.html";
                },1000)
            }else{
                alert(res.msg)
            }
        }
    })

}