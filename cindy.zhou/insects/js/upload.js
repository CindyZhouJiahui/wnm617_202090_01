function upload(obj) {
    if( obj.value == "" ) {
        return;
    }
    var formdata = new FormData();
    formdata.append("img" , $(obj)[0].files[0]);
    $.ajax({
        type : 'post',
        url : 'upload.php', 
        data : formdata,
        cache : false,
        processData : false, 
        contentType : false, 
        success : function(response){
            var res = JSON.parse(response);

            if(res.code == 1){
                $("#img").attr("src", res.data);
                $("input[name='head']").val(res.data);
                $("input[name='img']").val(res.data);
                $("#pro_img").html('<img src="'+res.data+'">');
            }else if(res.code == 0){
                alert(res.msg)
            }else {
                alert("error")
            }
        },
        error : function(){
            alert("error")
        }
    });
}