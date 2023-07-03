<%--jsp 작성을 위해 아래 3줄은 기입.--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--JSTL : 통화 날짜를 표현하게 해주는 문법--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let callcenter = {
        id:null,
        stompClient:null,
        init:function(){
            this.id = $('#adm_id').text();
            callcenter.connect();
            $("#connect").click(function() {
                callcenter.connect();
            });
            $("#disconnect").click(function() {
                callcenter.disconnect();
            });

            $("#sendto").click(function() {
                callcenter.sendTo();
            });
        },
        connect:function(){
            var sid = this.id;
            var socket = new SockJS('${adminserver}/ws');
            this.stompClient = Stomp.over(socket);

            this.stompClient.connect({}, function(frame) {
                callcenter.setConnected(true);
                console.log('Connected: ' + frame);

                this.subscribe('/send/to/'+sid, function(msg) {
                    // $('#target').val(JSON.parse(msg.body).sendid);
                    $("#to").prepend(
                        "<h4>" + JSON.parse(msg.body).sendid +":"+
                        JSON.parse(msg.body).content1
                        + "</h4>");
                });
            });
        },
        disconnect:function(){
            if (this.stompClient !== null) {
                this.stompClient.disconnect();
            }
            callcenter.setConnected(false);
            console.log("Disconnected");
        },
        setConnected:function(connected){
            if (connected) {
                $("#status").text("채팅연결중");
            } else {
                $("#status").text("연결해제");
            }
        },
        sendTo:function(){ // 특정인에게 msg
            var msg = JSON.stringify({
                'sendid' : this.id,
                'receiveid' : $('#target').val(),
                'content1' : $('#totext').val()
            });
            this.stompClient.send('/receiveto', {}, msg); //receiveto : admin의 msg컨트롤러가 처리
        }
    };
    $(function(){
        callcenter.init();
    })

</script>
<style>
    #to {
        width: 400px;
        height: 200px;
        overflow: auto;
        border-radius: 5px;
        padding: 0 10px;
        border: 1px solid #ced4da;

    }

    .card-body p {
        margin-bottom: 10px;
    }

    .card-header {
        font-size: 18px;
        font-weight: bold;
    }

    .col-sm-5 {
        margin-top: 20px;
    }

    #adm_id {
        margin-bottom: 10px;
        font-size: 20px;
        font-weight: bold;
    }

    #status {
        font-size: 16px;
        font-weight: bold;
        margin-bottom: 10px;
    }

    #connect,
    #disconnect,
    #sendto {
        margin-bottom: 10px;
        padding: 5px 10px;
        border-radius: 5px;
        background-color: transparent;
        color: #007bff;
        font-weight: bold;
        border: 2px solid #007bff;
    }

    #connect:hover,
    #disconnect:hover,
    #sendto:hover {
        background-color: transparent;
        color: #0056b3;
        cursor: pointer;
    }

    #target,
    #totext {
        margin-top: 10px;
        height: 35px;
        width: 250px;
        border-radius: 5px;
        padding: 0 10px;
        border: 1px solid #ced4da;
    }
</style>

<main>
    <div class="container-fluid px-4"><br>
        <p class="page_header_cust"><strong>[1:1 채팅상담]</strong></p>
        <div class="card mb-4">
            <div class="card-body">
                <p>ㅇ 고객만족부 담당자들은 문의사항에 대하여 정확하고 신속한 답변 바랍니다.</p>
            </div>
        </div>
        <div class="card shadow mb-4 col-lg-5 px-2" style="padding: 10px;">
            <div class="card-header">
                <i class="fas fa-user"></i>
                실시간 고객상담
            </div>
            <div class="card-body" >
                <div id="container"></div>
                <div class="col-sm-6 style="margin:auto;">
                    <h4 id="adm_id">${loginadmin.admin_name}</h4>
                    <h4 id="status">대기중</h4>
                    <button id="connect">채팅 연결</button>
                    <button id="disconnect">연결 해제</button>
                    <br>
                    고객ID: <input type="text" id="target">
                    메세지: <input type="text" id="totext">
                    <button id="sendto" style="align-items: center" >전송</button>
                    <div id="to"></div>

                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </div>
</main>
