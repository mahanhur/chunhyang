<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="shortcut icon" href="/img/logo/logo.png" type="image/x-icon" />

<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="shortcut icon" href="/img/logo/logo.png" type="image/x-icon" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>춘향 ADMIN</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

    <script src="/js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="/assets/demo/chart-area-demo.js"></script>
    <script src="/assets/demo/chart-bar-demo.js"></script>
    <%--    highcharts--%>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/series-label.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>
    <script src="https://code.highcharts.com/highcharts-3d.js"></script>
    <script src="https://code.highcharts.com/modules/bullet.js"></script>
    <script src="https://code.highcharts.com/modules/data.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
    <script src="/js/datatables-simple-demo.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <%--calender--%>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.7/index.global.min.js"></script>

    <%--datepicker--%>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
    <%--websocket--%>
    <script src="/webjars/sockjs-client/sockjs.min.js"></script>
    <script src="/webjars/stomp-websocket/stomp.min.js"></script>
    <%-- font --%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Batang:wght@400;700&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
    <%--typed 라이브러리--%>
    <script type="text/javascript" src="/js/typed.js"></script>
    <%--    toastr 라이브러리--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <%--    ------------------------------------------------------------------------------------------%>
    <style>
        * {
            font-family: 'Nanum Gothic', sans-serif;
        }
        .nav-link{
            padding: 0px;
        }
        .page_header_item{
            background: #F9F7F6;
            border-left: 0.5em solid #E6E6FA;
            padding: 0.5em;
            margin: 15px 0 5px 0;
            font-size: 1.5em;
            color: #4d5154;
        }
        .page_header_cust{
            background: #F9F7F6;
            border-left: 0.5em solid #CEF6E3;
            padding: 0.5em;
            margin: 15px 0 5px 0;
            font-size: 1.5em;
            color: #4d5154;
        }
        .page_header_board{
            background: #F9F7F6;
            border-left: 0.5em solid #EFBBBB;
            padding: 0.5em;
            margin: 15px 0 5px 0;
            font-size: 1.5em;
            color: #4d5154;
        }
    </style>

</head>

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
                    $('#imgname').val(data);
                    // $('#imgname').val('ma.jpg');
                    // let imgname = 'ma.jpg'
                    let imgname = data
                    $.ajax({
                        type:'post',
                        url:'/faceloginimpl',
                        data: {imgname: imgname},
                        success: function(){
                            location.href="/admin/loginok";
                        },
                        error: function() {
                            toastr.error("얼굴로 로그인에 실패하였습니다.");
                        }
                    });
                },
                error: function() {
                    toastr.error("얼굴로 로그인에 실패하였습니다.");
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
                            <form id="login_form" style="align-content: center">

                                <div class="col-sm-12">
                                    <video  id="myVideo" width="385" height="300" style="border: 1px solid #ddd;"></video>
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