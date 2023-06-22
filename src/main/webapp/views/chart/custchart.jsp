<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>
</script>

<main>


    <div class="container-fluid">
        <h3 class="mt-4 alert alert-success"><strong>춘향 매출분석 통계</strong></h3>
        <div class="row">

<%--            구독상품판매량 top10--%>
            <div class="col-lg-6">
                <div class="card mb-4">
                    <!-- Card contents -->
                    <div class="card-header">
                        👍 구독상품 판매금액 <strong>TOP 10</strong>
                    </div>
                    <div class="card-body">
                        <table class="table table-sm table-hover">
                            <thead style="background-color: #F5F6CE">
                            <tr>
                                <th>순위</th>
                                <th>상품번호</th>
                                <th>상품이름</th>
                                <th>총 판매금액</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${subsamount}" var="saobj">
                            <tr>
                                <td>${saobj.rownum}</td>
                                <td>${saobj.subsitem_id}</td>
                                <td>${saobj.subsitem_name}</td>
                                <td>${saobj.subs_amount}</td>
                            </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
<%--구독상품 판매량top10 end--%>

<%--    일반상품 판매량top10--%>
            <div class="col-lg-6">
                <div class="card mb-4">
                    <!-- Card contents -->
                    <div class="card-header">
                        👍 일반상품 판매금액 <strong>TOP 10</strong>
                    </div>
                    <div class="card-body">
                        <table class="table table-sm table-hover">
                            <thead style="background-color: #F5F6CE">
                            <tr>
                                <th>순위</th>
                                <th>상품번호</th>
                                <th>상품이름</th>
                                <th>총 판매금액</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${itemamount}" var="iaobj">
                            <tr>
                                <td>${iaobj.rownum}</td>
                                <td>${iaobj.item_id}</td>
                                <td>${iaobj.item_name}</td>
                                <td>${iaobj.item_amount}</td>
                            </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
<%--일반상품판매량 top10 end--%>

<%--    구독상품 판매량worst10--%>
            <div class="col-lg-6">
                <div class="card mb-4">
                    <!-- Card contents -->
                    <div class="card-header">
                        👎 구독상품 판매금액 <strong>WORST 10</strong>
                    </div>
                    <div class="card-body">
                        <table class="table table-sm table-hover">
                            <thead style="background-color: #F5F6CE">
                            <tr>
                                <th>순위</th>
                                <th>상품번호</th>
                                <th>상품이름</th>
                                <th>총 판매금액</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${subsamount2}" var="sobj">
                            <tr>
                                <td>${sobj.rownum}</td>
                                <td>${sobj.subsitem_id}</td>
                                <td>${sobj.subsitem_name}</td>
                                <td>${sobj.subs_amount}</td>
                            </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
<%--일반상품판매량 top10 end--%>

<%--    일반상품 판매량top10--%>
            <div class="col-lg-6">
                <div class="card mb-4">
                    <!-- Card contents -->
                    <div class="card-header">
                        👎 일반상품 판매금액 <strong>WORST 10</strong>
                    </div>
                    <div class="card-body">
                        <table class="table table-sm table-hover">
                            <thead style="background-color: #F5F6CE">
                            <tr>
                                <th>순위</th>
                                <th>상품번호</th>
                                <th>상품이름</th>
                                <th>총 판매금액</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${itemamount2}" var="iobj">
                            <tr>
                                <td>${iobj.rownum}</td>
                                <td>${iobj.item_id}</td>
                                <td>${iobj.item_name}</td>
                                <td>${iobj.item_amount}</td>
                            </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
<%--일반상품판매량 top10 end--%>

            <div class="col-lg-6">
                <div class="card mb-4">
                    <!-- Card contents -->
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i>
                        DataTable Example
                    </div>
                    <div class="card-body">
                        <table class="table table-sm table-striped table-hover">
                            <thead>
                            <tr>
                                <th>Name</th>
                                <th>Position</th>
                                <th>Office</th>
                                <th>Age</th>
                                <th>Start date</th>
                                <th>Salary</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>Tiger Nixon</td>
                                <td>System Architect</td>
                                <td>Edinburgh</td>
                                <td>61</td>
                                <td>2011/04/25</td>
                                <td>$320,800</td>
                            </tr>
                            <tr>
                                <td>Tiger Nixon</td>
                                <td>System Architect</td>
                                <td>Edinburgh</td>
                                <td>61</td>
                                <td>2011/04/25</td>
                                <td>$320,800</td>
                            </tr>
                            <tr>
                                <td>Tiger Nixon</td>
                                <td>System Architect</td>
                                <td>Edinburgh</td>
                                <td>61</td>
                                <td>2011/04/25</td>
                                <td>$320,800</td>
                            </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                DataTable Example
            </div>
            <div class="card-body">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Position</th>
                        <th>Office</th>
                        <th>Age</th>
                        <th>Start date</th>
                        <th>Salary</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>Tiger Nixon</td>
                        <td>System Architect</td>
                        <td>Edinburgh</td>
                        <td>61</td>
                        <td>2011/04/25</td>
                        <td>$320,800</td>
                    </tr>

                    </tbody>
                </table>
            </div>
        </div>

        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                DataTable Example
            </div>
            <div class="card-body">
                <table id="datatablesSimple2">
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Position</th>
                        <th>Office</th>
                        <th>Age</th>
                        <th>Start date</th>
                        <th>Salary</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>Tiger Nixon</td>
                        <td>System Architect</td>
                        <td>Edinburgh</td>
                        <td>61</td>
                        <td>2011/04/25</td>
                        <td>$320,800</td>
                    </tr>

                    </tbody>
                </table>
            </div>
        </div>


    </div>


</main>