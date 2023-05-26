<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let admindetail_form = {
        init:function () {
            $('#update_btn').click(function () {
                admindetail_form.send();
            });
        },
        send:function () {
            var pwd = $('#admin_pwd').val();
            var name = $('#admin_name').val();
            var lev = $('#admin_level').val();

            if( pwd == '' ){
                $('#admin_pwd').focus();
                alert("비밀번호를 입력하세요");
                return;
            }
            if( name == '' ){
                $('#admin_name').focus();
                alert("이름을 입력하세요");
                return;
            }
            $('#admin_form').attr({
                'action':'/admin/updateimpl',
                'method':'post'
            });
            $('#admin_form').submit();
        }
    };
    $(function (){
        admindetail_form.init();
    });
</script>

<main>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-7">
                <div class="card shadow-lg border-0 rounded-lg mt-5">
                    <div class="card-header"><h3 class="text-center font-weight-light my-4">내 정보 수정</h3></div>
                    <div class="card-body">
                        <div id="container">
                            <form id="admin_form">
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <div class="form-floating mb-3 mb-md-0">
                                            <input class="form-control" id="admin_id" type="number" name="admin_id" value="${admin.admin_id}" readonly/>
                                            <label for="admin_id">노비번호: 수정 하실수 없습니다</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating mb-3 mb-md-0">
                                            <input class="form-control" id="admin_name" type="text" name="admin_name" value="${admin.admin_name}" />
                                            <label for="admin_name">노비명</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <div class="form-floating mb-3 mb-md-0">
                                            <input class="form-control" id="admin_pwd" type="password" name="admin_pwd" />
                                            <label for="admin_pwd">비밀번호</label>
                                        </div>
                                    </div>
                                <div class="col-md-6">
                                    <select class="form-select" id="admin_level" name="admin_level">
                                        <option id="opt" vlaue="${admin.admin_level}">${admin.admin_level}</option>
                                        <option value="1">상노비</option>
                                        <option value="2">중노비</option>
                                        <option value="3">하노비</option>
                                    </select>
                                </div>
                                <div class="mt-4 mb-0">
                                    <div class="d-grid">
                                        <button type="button" class="btn btn-primary btn-block" id="update_btn">정보 수정</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="card-footer text-center py-3">
                        <div class="small"><a href="#">Link</a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>