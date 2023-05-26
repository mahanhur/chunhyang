<%--jsp 작성을 위해 아래 3줄은 기입.--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--JSTL : 통화 날짜를 표현하게 해주는 문법--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--  --%>
<script>
    <%-- 로그인 기능 --%>
    // login.jsp // 로그인 기능 자바스크립트
    let login_form = {
        init:function (){ // 화면에 이벤트 처리
            $('#login_btn').click(function (){
                login_form.send();
            });
        },
        send:function () {
            $('#login_form').attr({
                'action':'/admin/loginimpl', // maincontroller 로 보낸다.
                'method':'post'
            });
            $('#login_form').submit();
        }
    };
    // 로그인 기능(스크립트)를 상단에 기입했으므로, 스크립트 끝나기 전 아래 함수 적어줘야 함.
    $(function (){
        login_form.init();
    });
</script>

<div class="container-fluid">

    <h1 class="h3 mb-2 text-gray-800">로그인</h1>
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">로그인</h6>
        </div>
        <%-- 실제 만들어지는 영역 --%>
        <div class="card-body">
            <div id="container">
                <form id="login_form" class="form-horizontal well">
                    <input type="hidden" name="requestURI" value="${requestURI}">
                    <div class="form-group">
                        <label for="admin_id">아이디</label>
                        <input type="text" class="form-control" id="admin_id" name="admin_id"/>
                    </div>
                    <div class="form-group">
                        <label for="admin_pwd">비밀번호</label>
                        <input type="password" class="form-control" id="admin_pwd" name="admin_pwd"/>
                    </div>
                    <button type="button" class="btn btn-info" id="login_btn">로그인</button>
                </form>
            </div>

        </div>
        <%--   card-body 끝 --%>
    </div>
</div>