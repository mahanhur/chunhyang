<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">Cust 리스트</h1>

        <div class="card mb-4">
            <div class="card-body">
                <button type="button" class="btn btn-outline-primary"
                        onclick="location.href='/cust/register'">cust 추가</button>
            </div>
        </div>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                데이터테이블 : cust
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>고객명</th>
                        <th>연락처</th>
                        <th>나이</th>
                        <th>이메일</th>
                        <th>등록일</th>
                        <th>탈퇴일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="obj" items="${custlist}">
                        <tr>
                            <td><a href="/cust/custdetail?cust_id=${obj.cust_id}">${obj.cust_id}</a></td>
                            <td>${obj.cust_name}</td>
                            <td>${obj.phone}</td>
                            <td>${obj.age}</td>
                            <td>${obj.email}</td>
                            <td>${obj.cust_rdate}</td>
                            <td>${obj.cust_del_date}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>