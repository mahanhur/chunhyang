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
    let notice_detail = {
        init:function (){
            $('#updatenotice_btn').click(function (){
                notice_detail.send(); //아이템_애드 라는 객체에 센드가 호출
            });
            $('#deletenotice_btn').click(function (){
                var c = confirm("정말 삭제하겠습니까?");
                if(c == true){
                    location.href="/board/deletenoticeimpl?noti_id=${gnotice.noti_id}";

                }
            });
        },
        send:function(){
            $('#notice_form').attr({
                method:'post',
                action:'/board/updatenoticeimpl',
                enctype:'multipart/form-data'
            });
            $('#notice_form').submit();
        }
    };

    $(function (){
        notice_detail.init();
    })
</script>

<main>
    <div class="container-fluid col-lg-8 px-4">
        </br>
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">공지사항 수정/삭제</h3>
                </div>
                <div class="card-body col-lg-6">
                    <div>작성자: ${gnotice.admin_id}</div>
                    <div>최초게시일: <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${gnotice.noti_wdate}" /></div>
                    <div>최종수정일: <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${gnotice.noti_udate}" /></div>
                </div>
                <form id="notice_form">
                <div class="card-body">
                    <input type="hidden" name="noti_id" value="${gnotice.noti_id}">
                    <div class="form-group">
                        <label for="noti_title">제목</label>
                        <input class="form-control" id="noti_title" name="noti_title" placeholder="제목을 입력해주세요" value="${gnotice.noti_title}">
                    </div>
                    <div class="form-group">
                        <label for="noti_contents">내용</label>
                        <textarea class="form-control" id="noti_contents" name="noti_contents" rows="5"
                                  placeholder="내용을 입력해주세요" style="resize: none;">${gnotice.noti_contents}</textarea>
                    </div>
                    </br>
                    <div>
                    <img class="noticeimg" src="/uimg/${gnotice.noti_image1}">
                    <img class="noticeimg" src="/uimg/${gnotice.noti_image2}">
                    </div>
                </div>
                    <div class="card-footer">
                        <div class="float-right">
                            <button type="submit" class="btn btn-success modBtn" id="updatenotice_btn"><i class="fa fa-save"></i> 수정</button>
                            <button type="submit" class="btn btn-danger modBtn" id="deletenotice_btn"><i class="fa fa-trash"></i> 삭제</button>
                        </div>
                    </div>
                </form>

            </div>
    </div>
</main>
