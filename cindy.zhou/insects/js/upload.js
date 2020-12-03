function upload(obj) {
    if( obj.value == "" ) {
        return;
    }
    var formdata = new FormData();
    formdata.append("img" , $(obj)[0].files[0]);//获取文件法二
    $.ajax({
        type : 'post',
        url : 'upload.php', //接口
        data : formdata,
        cache : false,
        processData : false, // 不处理发送的数据，因为data值是Formdata对象，不需要对数据做处理
        contentType : false, // 不设置Content-type请求头
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