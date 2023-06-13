<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script>
    let answer_detail = {
        init:function (){
            $('#answer_btn').click(function (){
                answer_detail.send(); //아이템_애드 라는 객체에 센드가 호출
            });

            /*기등록 답변이 있는경우 답변 버튼 비활성화 펑션*/
            var answer_contents = $('#answer_contents').val();
            if (answer_contents != '') {
                $('#answer_btn').addClass('disabled')
            }

            $('#update_btn').click(function (){
                var c = confirm("답변을 수정하시겠습니까??");
                if(c == true){
                answer_detail.update();
                }

            });
        },
        send:function(){
            $('#answer_form').attr({
                method:'post',
                action:'/qna/answerimpl',
                enctype:'multipart/form-data'
            });
            $('#answer_form').submit();
        },

        update:function(){
            $('#answer_form').attr({
                method:'post',
                action:'/qna/updateanswerimpl',
                enctype:'multipart/form-data'
            });
            $('#answer_form').submit();
        }
    };

    $(function (){
        answer_detail.init();
    })
</script>

    <div class="container-fluid col-lg-8 px-4" style="padding: 10px"></br>
        <div class="card">
            <div class="card-header">
                <h3 class="card-title" style="text-align: center">QnA 등록/수정</h3>
            </div>
            <form id="answer_form">
            <div class="card-body col-lg-6">
                <div name="cust_id">질문고객: ${gqna.cust_id}</div>
                <div name="cust_id">질문제목: ${gqna.qna_title}</div>
                <div>질문일자: <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${gqna.qna_wdate}" /></div>
                <div name="admin_id">답변직원: ${gqna.admin_id}</div>
                <div>답변일자: <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${gqna.answer_udate}" /></div>
            </div>
                <input type="hidden" name="qna_id" value="${gqna.qna_id}">
                <input type="hidden" name="answer_id" value="${gqna.answer_id}">
                <input type="hidden" name="admin_id" value="${loginadmin_id}">
            <div class="card-body">
                <div class="form-group">
                    <label for="noti_title">질문</label>
                    <input class="form-control" id="noti_title" name="noti_title" placeholder="질문을 입력해주세요" value="${gqna.qna_contents}">
                </div>
                <div class="form-group">
                    <label for="answer_contents">답변</label>
                    <textarea class="form-control" id="answer_contents" name="answer_contents" rows="5"
                              placeholder="답변을 입력해주세요" style="resize: none;">${gqna.answer_contents}</textarea>
                </div>
                </br>
            </div>
                <div class="card-footer">
                    <div class="col-sm-12 row">
                    <div class="col-sm-2 float-left">
                        <button type="button" class="btn btn-outline-primary modBtn" onclick="location.href='/qna/qna'"><i class="fa fa-list"></i> 목록</button>
                    </div>
                    <div class="col-sm-6"></div>
                    <div class="col-sm-4 float-right" style="margin:0px; align-content: center">
                        <button type="button" class="btn btn-success modBtn" id="answer_btn"><i class="fa fa-save"></i> 답변</button>
                        <button type="button" class="btn btn-danger modBtn" id="update_btn"><i class="fa fa-trash"></i> 수정</button>
                    </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
