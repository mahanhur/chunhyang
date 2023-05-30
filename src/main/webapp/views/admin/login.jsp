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

<main>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-4">
                <div class="card shadow-lg border-0 rounded-lg mt-5">
                    <div class="card-header"><h3 class="text-center font-weight-light my-4">로그인</h3></div>
                    <div class="card-body">
                        <div id="container">
                <form id="login_form" >

                    <div class="row mb-3">
                        <div class="col-md-12">
                            <div class="form-floating mb-3 mb-md-0">
                                <input class="form-control" id="admin_id" type="text" name="admin_id" placeholder="사번을 입력하세요" />
                                <label for="admin_id">사원번호</label>
                            </div>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-12">
                            <div class="form-floating mb-3 mb-md-0">
                                <input class="form-control" id="admin_pwd" type="password" name="admin_pwd" placeholder="비밀번호를 입력하세요" />
                                <label for="admin_pwd">비밀번호</label>
                            </div>
                        </div>
                    </div>

                    <div class="mt-1 mb-1">
                        <div class="d-grid">
                            <button type="button" class="btn btn-primary btn-block" id="login_btn">로그인</button>
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