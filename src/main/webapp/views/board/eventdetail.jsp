<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<style>
    .noticeimg{
        width:300px;
        height:150px;
    }
</style>

<script>
    let event_detail = {
        init:function (){
            $('#updateevent_btn').click(function (){
                event_detail.send(); //아이템_애드 라는 객체에 센드가 호출
            });
            $('#deleteevent_btn').click(function (){
                var c = confirm("정말 삭제하겠습니까?");
                if(c == true){
                    location.href="/board/deleteeventimpl?noti_id=${gevent.noti_id}";
                }
            });
        },
        send:function(){
            $('#event_form').attr({
                method:'post',
                action:'/board/updatenoticeimpl',
                enctype:'multipart/form-data'
            });
            $('#event_form').submit();
        }
    };

    $(function (){
        event_detail.init();
    })
</script>
    <div class="container-fluid col-sm-8" style="padding: 10px"></br>
        <div class="card">
            <div class="card-header">
                <h3 class="card-title" style="text-align: center">이벤트 수정/삭제</h3>
            </div>
            <div class="card-body col-sm-6">
                <div>최종등록자: ${gevent.admin_id}</div>
                <div>최초게시일: <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${gevent.noti_wdate}" /></div>
                <div>최종수정일: <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${gevent.noti_udate}" /></div>
            </div>
            <form id="event_form">
                <input type="hidden" name="noti_id" value="${gevent.noti_id}">
                <input type="hidden" name="noti_image1" value="${gevent.noti_image1}">
                <input type="hidden" name="noti_image2" value="${gevent.noti_image2}">
                <input type="hidden" name="admin_id" value="${loginadmin_id}">
            <div class="card-body">
                <div class="form-group">
                    <label for="noti_title">제목</label>
                    <input class="form-control" id="noti_title" name="noti_title" placeholder="제목을 입력해주세요" value="${gevent.noti_title}">
                </div>
                <div class="form-group">
                    <label for="noti_contents">내용</label>
                    <textarea class="form-control" id="noti_contents" name="noti_contents" rows="5"
                              placeholder="내용을 입력해주세요" style="resize: none;">${gevent.noti_contents}</textarea>
                </div>
                </br>
                <div>
                <img class="noticeimg" src="/uimg/${gevent.noti_image1}">
                <img class="noticeimg" src="/uimg/${gevent.noti_image2}">
                </div>
                <label class="control-label" for="img1">대표이미지:</label>
                <div class="form-group">
                    <input type="file" class="form-control" id="img1" name="img1" placeholder="Input image1" >
                </div>
                <label class="control-label" for="img2">서브이미지:</label>
                <div class="form-group">
                    <input type="file" class="form-control" id="img2" name="img2" placeholder="Input image2" >
                </div>
            </div>
                <div class="card-footer">
                    <div class="col-sm-12 row">
                        <div class="col-sm-2 float-left">
                            <button type="button" class="btn btn-outline-primary modBtn" onclick="location.href='/board/event'"><i class="fa fa-list"></i> 목록</button>
                        </div>
                        <div class="col-sm-6"></div>
                        <div class="col-sm-4 float-right" style="margin:0px; align-content: center">
                            <button type="button" class="btn btn-success modBtn" id="updateevent_btn"><i class="fa fa-save"></i> 수정</button>
                            <button type="button" class="btn btn-danger modBtn" id="deleteevent_btn"><i class="fa fa-trash"></i> 삭제</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>