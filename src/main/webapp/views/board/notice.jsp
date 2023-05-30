<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">공지 사항</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="/">관직자 메인페이지로</a></li>
        </ol>
        <div class="card mb-4">
            <div class="card-body">
                <button type="button" class="btn btn-outline-primary"
                        onclick="location.href='#'">공지 등록</button>
            </div>
        </div>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                데이터테이블 : board
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                        <tr>
                            <th>글 번 호</th>
                            <th>공지 제목</th>
                            <th>작성자 사번</th>
                            <th>등록 일자</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="obj" items="${noticelist}">
                        <tr>
                            <td>${obj.noti_id}</td>
                            <td>${obj.noti_title}</td>
                            <td>${obj.admin_id}</td>
                            <td>${obj.noti_wdate}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>