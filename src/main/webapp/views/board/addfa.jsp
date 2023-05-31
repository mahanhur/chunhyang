<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script>
    let addfa = {
        init:function (){
            $('#registerfa_btn').click(function (){
                addfa.send(); //아이템_애드 라는 객체에 센드가 호출
            });
        },
        send:function(){
            $('#fa_form').attr({
                method:'post',
                action:'/board/addfaimpl',
                enctype:'multipart/form-data'
            });
            $('#fa_form').submit();
        }
    };
    $(function (){
        addfa.init();
    })
</script>

    <div class="container-fluid col-lg-8 px-4"></br>
        <div class="card">
            <div class="card-header">
                <h3 class="card-title" style="text-align: center">FAQ 등록</h3>
            </div>
            <form id="fa_form">
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
            </div>
                <div class="card-footer">
                    <div class="float-right">
                        <button type="button" class="btn btn-success modBtn" id="registerfa_btn"><i class="fa fa-add"></i> 등록</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
