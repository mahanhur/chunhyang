<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script>
    let fa_detail = {
        init:function (){
            $('#updatefa_btn').click(function (){
                fa_detail.send(); //아이템_애드 라는 객체에 센드가 호출
            });
            $('#deletefa_btn').click(function (){
                var c = confirm("정말 삭제하겠습니까?");
                if(c == true){
                    location.href="/board/deletefaimpl?noti_id=${gfa.noti_id}";
                }
            });
        },
        send:function(){
            $('#fa_form').attr({
                method:'post',
                action:'/board/updatefaimpl',
                enctype:'multipart/form-data'
            });
            $('#fa_form').submit();
        }
    };

    $(function (){
        fa_detail.init();
    })
</script>

    <div class="container-fluid col-lg-8 px-4" style="padding: 10px"></br>
        <div class="card">
            <div class="card-header">
                <h3 class="card-title" style="text-align: center">FAQ 수정/삭제</h3>
            </div>
            <div class="card-body col-lg-6">
                <div>최종등록자: ${gfa.admin_id}</div>
                <div>최초게시일: <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${gfa.noti_wdate}" /></div>
                <div>최종수정일: <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${gfa.noti_udate}" /></div>
            </div>
            <form id="fa_form">
                <input type="hidden" name="noti_id" value="${gfa.noti_id}">
                <input type="hidden" name="admin_id" value="${loginadmin_id}">
            <div class="card-body">
                <div class="form-group">
                    <label for="noti_title">질문</label>
                    <input class="form-control" id="noti_title" name="noti_title" placeholder="질문을 입력해주세요" value="${gfa.noti_title}">
                </div>
                <div class="form-group">
                    <label for="noti_contents">답변</label>
                    <textarea class="form-control" id="noti_contents" name="noti_contents" rows="5"
                              placeholder="답변을 입력해주세요" style="resize: none;">${gfa.noti_contents}</textarea>
                </div>
                </br>
            </div>
                <div class="card-footer">
                    <div class="col-sm-12 row">
                    <div class="col-sm-2 float-left">
                        <button type="button" class="btn btn-outline-primary modBtn" onclick="location.href='/board/fa'"><i class="fa fa-list"></i> 목록</button>
                    </div>
                    <div class="col-sm-6"></div>
                    <div class="col-sm-4 float-right" style="margin:0px; align-content: center">
                        <button type="button" class="btn btn-success modBtn" id="updatefa_btn"><i class="fa fa-save"></i> 수정</button>
                        <button type="button" class="btn btn-danger modBtn" id="deletefa_btn"><i class="fa fa-trash"></i> 삭제</button>
                    </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
