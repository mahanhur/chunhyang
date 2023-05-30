<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <div class="container-fluid px-4">
        <h1 class="mt-4">판매상품 카테고리</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="/">관직자 메인페이지로 </a></li>
        </ol>
        <div class="card mb-4">
            <div class="card-body">
                <button type="button" class="btn btn-outline-primary"
                        data-toggle="modal" data-target="#addmodal">카테고리 추가</button>
                <button type="button" class="btn btn-outline-danger">카테고리 삭제</button>
            </div>
        </div>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                데이터테이블 : Category
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                    <tr>
                        <th>상위카테고리 코드</th>
                        <th>상위카테고리 이름</th>
                        <th>카테고리 코드</th>
                        <th>카테고리 이름</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach var="obj" items="${catelist}">
                        <tr>
                            <td>${obj.topcategory_id}</td>
                            <td>${obj.top_name}</td>
                            <td>${obj.category_id}</td>
                            <td>${obj.category_name}</td>
                        </tr>

                    </c:forEach>


                     </tbody>
                </table>
            </div>
        </div>
    </div>