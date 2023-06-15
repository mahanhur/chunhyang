<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let pic = {
        myVideoStream:null,
        init:function(){
            $('#myCanvas').hide();
            this.myVideoStream = document.querySelector('#myVideo');
            this.getVideo();
        },
        getVideo:function(){
            navigator.getMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia;
            navigator.getMedia(
                {video: true, audio: false},
                function(stream) {
                    pic.myVideoStream.srcObject = stream
                    pic.myVideoStream.play();
                },
                function(error) {
                    alert('webcam not working');
                });
        },
        takeSnapshot:function(){
            var myCanvasElement = document.querySelector('#myCanvas');
            var myCTX = myCanvasElement.getContext('2d');
            myCTX.drawImage(this.myVideoStream, 0, 0, myCanvasElement.width, myCanvasElement.height);
            this.send();
        },
        send:function(){
            const canvas = document.querySelector('#myCanvas');
            const imgBase64 = canvas.toDataURL('image/jpeg', 'image/octet-stream');
            const decodImg = atob(imgBase64.split(',')[1]);
            let array = [];
            for (let i = 0; i < decodImg .length; i++) {
                array.push(decodImg .charCodeAt(i));
            }
            const file = new Blob([new Uint8Array(array)], {type: 'image/jpeg'});
            const fileName = 'snapshot_' + new Date().getMilliseconds() + '.jpg';
            let formData = new FormData();
            formData.append('file', file, fileName);
            $.ajax({
                type: 'post',
                url: '/saveimg/',
                enctype: 'multipart/form-data',
                cache: false,
                data: formData,
                processData: false,
                contentType: false,
                success: function (data) {
                    // $('#imgname').val(data);
                    $('#imgname').val('ma.jpg');
                    let imgname = 'ma.jpg'
                    // let imgname = data
                    $.ajax({
                        type:'post',
                        url:'/faceloginimpl',
                        data: {imgname: imgname},
                        success: function(){
                            location.href="/";
                        }
                    });
                }
            });
        }
    };
    $(function(){
        pic.init();
    });

</script>

<main>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-4">
                <div class="card shadow-lg border-0 rounded-lg mt-5">
                    <div class="card-header"><h3 class="text-center font-weight-light my-4">얼굴로 로그인</h3></div>
                    <div class="card-body">
                        <div id="container">
                            <form id="login_form" >

                                <div class="col-sm-8 text-left">
                                    <video  id="myVideo" width="300" height="300" style="border: 1px solid #ddd;"></video>
                                    <canvas id="myCanvas" width="160" height="140" style="border: 1px solid #ddd;"></canvas><br>
                                    <form id="cfr_form" action="/mycfr" method="get">
                                        <input type="hidden" name="imgname" id="imgname" ><br>
                                    </form>
                                </div>


                                <div class="mt-1 mb-1">
                                    <div class="d-grid">
                                        <input type="button" class="btn btn-success btn-block" value="로그인" onclick="pic.takeSnapshot();"/>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>