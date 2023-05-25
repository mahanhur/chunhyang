<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">구독상품 관리 화면</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="/">관직자 메인페이지로</a></li>
            <li class="breadcrumb-item active">#</li>
        </ol>
        <div class="card mb-4">
            <div class="card-body">
                구독상품 리스트 추가
                <button type="button" class="btn btn-outline-primary"
                        data-toggle="modal" data-target="#itemaddmodal">New Item ADD</button>
            </div>
        </div>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                DataTable : Item
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                    <tr>
                        <th>상품 표출 이미지</th>
                        <th>상품아이디</th>
                        <th>상품이름</th>
                        <th>표출 가격</th>
                        <th>상품 상세 설명</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="obj" items="${slist}">
                        <tr>
                            <td>
                                <img id="item_img" src="/uimg/${obj.subsitem_img}" alt=${obj.subsitem_img}>
                            </td>
                            <td>${obj.subsitem_id}</td>
                            <td>${obj.subsitem_name}</td>
                            <td><fmt:formatNumber value="${obj.subsitem_price}" pattern="###,###원"/></td>
                            <td>${obj.subsitem_content}</td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>