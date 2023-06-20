<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script>
    let addevent = {
        init:function (){
            $('#registerevent_btn').click(function (){
                addevent.send(); //아이템_애드 라는 객체에 센드가 호출
            });
        },
        send:function(){
            $('#event_form').attr({
                method:'post',
                action:'/board/addeventimpl',
                enctype:'multipart/form-data'
            });
            $('#event_form').submit();
        }
    };
    $(function (){
        addevent.init();
    })
</script>
<div class="container-fluid px-4">
    <p class="page_header_board"><strong>이벤트</strong></p>
<%--    <div class="container-fluid col-lg-8 px-4"></br>--%>
        <div class="card">
            <div class="card-header">
                <h3 class="card-title" style="text-align: center">이벤트 등록</h3>
            </div>
            <form id="event_form">
                <input type="hidden" name="admin_id" value="${loginadmin.admin_id}">
                <div class="card-body">
                    <div class="form-group">
                        <label for="noti_title">제목</label>
                        <input class="form-control" id="noti_title" name="noti_title" placeholder="제목을 입력해주세요">
                    </div>
                    <div class="form-group">
                        <label for="noti_contents">내용</label>
                        <textarea class="form-control" id="noti_contents" name="noti_contents" rows="5"
                                  placeholder="내용을 입력해주세요" style="resize: none;"></textarea>
                    </div>
                    </br>
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
                    <div class="float-right">
                        <button type="button" class="btn btn-success modBtn" id="registerevent_btn"><i class="fa fa-add"></i> 등록</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
