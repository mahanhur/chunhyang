<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<main>
    <div class="container-fluid px-4"><br/>
        <p class="page_header_cust"><strong>회원 리스트</strong></p>
        <div class="card mb-4">
            <div class="card-body">
                <p>ㅇ 회원 관리 화면입니다.</p>
                <p>ㅇ 당사의 회원분들은 독립유동자 분들이시니 응대시 친절하게 하시기 바랍니다.</p>
                <hr/>
                <button type="button" class="btn btn-outline-primary" onclick="location.href='/cust/register'">회원 추가</button>
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
                            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${obj.cust_rdate}" /></td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${obj.cust_del_date}" /></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>