<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let allcheck = {
        init: function () {
            $("#allcheck").click(function () {
                $(".del").prop("checked", true);
            });
        }
    }
    $(function (){
        allcheck.init();
    })
</script>
<style>
    #datatablesSimple th {
        text-align: center; /* 내용 가운데 정렬 */
    }

    #datatablesSimple td {
        text-align: center; /* 내용 가운데 정렬 */
    }
</style>
<main>
    <div class="container-fluid px-4"><br>
        <p class="page_header_cust"><strong>[Q&A] 고객문의</strong></p>
        <div class="card mb-4">
            <div class="card-body">
                <p>ㅇ 고객만족부 담당자들은 문의사항에 대하여 정확하고 신속한 답변 바랍니다..</p>
                <p>ㅇ 선택삭제 기능은 작동 안합니다</p>
                <hr/>
                <button type="button" class="btn btn-outline-success" id="allcheck">일괄 선택</button>
                <button type="button" class="btn btn-outline-danger">선택 삭제</button>
            </div>
        </div>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                데이터테이블 : QnA, Answer
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                    <tr>
                        <th>질문번호</th>
                        <th>질   문</th>
                        <th>고객번호</th>
                        <th>등록일자</th>
                        <th>답변일자</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="obj" items="${qlist}">
                        <tr>
                            <td><input type="checkbox" class="del">
                                <a href ="/qna/qnadetail?qna_id=${obj.qna_id}">${obj.qna_id}</a></td>
                            <td>${obj.qna_title}</td>
                            <td>${obj.cust_id}</td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${obj.qna_wdate}" /></td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${obj.answer_udate}"/></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>