<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">노비 리스트</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="/">관직자 메인페이지로</a></li>
        </ol>
        <div class="card mb-4">
            <div class="card-body">
                <button type="button" class="btn btn-outline-primary"
                        onclick="location.href='/admin/register'">노비 추가</button>
            </div>
        </div>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                DataTable : admin
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                        <tr>
                            <th>노비 품번</th>
                            <th>노비 이름</th>
                            <th>노비 레벨</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="obj" items="${adminlist}">
                        <tr>
                            <td>${obj.admin_id}</td>
                            <td>${obj.admin_name}</td>
                            <td>${obj.admin_level}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>