<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>

</script>

<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">고객별 포인트 관리 화면</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="/">관직자 메인페이지로</a></li>
            <li class="breadcrumb-item active">#</li>
        </ol>
        <div class="card mb-4">
            <div class="card-body">
                <p>ㅇ 고객별 포인트 이력을 조회하고 관리하실 수 있는 화면입니다.</p><hr/>
                <button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#">포인트 수정</button>
                <button type="button" class="btn btn-outline-danger">포인트 삭제</button>
            </div>
        </div>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                DataTable : point history list
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                    <tr>
                        <th>포인트 이력 관리번호</th>
                        <th>고객 아이디</th>
                        <th>가산 포인트</th>
                        <th>감산 포인트</th>
                        <th>현재 누적 포인트</th>
                        <th>등록일자</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="obj" items="${plist}" varStatus="status">
                            <tr>
                                <td>${obj.point_id}</td>
                                <td>${obj.cust_id}</td>
                                <td>${obj.plus_point}</td>
                                <td>${obj.minus_point}</td>
                                <td>${obj.point}</td>
                                <td><fmt:formatDate  value="${obj.point_rdate}" pattern="yyyy-MM-dd" /></td>
                            </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>
