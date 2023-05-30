<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>
    let subsdetailId;
    let subsDueDate;
    let subsdetail = {
        init: () => {
            $('.duedate_btn').click(function () {

                let row = $(this).closest('tr');
                subsdetailId = row.find('.subsdetail_id').val();
                subsDueDate = row.find('.subs_duedate').val();

                if(confirm("수정하실 배송일자가 " + subsDueDate +" 맞습니까?")) {
                    $.ajax({
                        url:'subsdetailimpl',
                        method:'post',
                        data: {
                            subsdetail_id:subsdetailId,
                            subsduedate:subsDueDate
                        },
                        success: function() {
                            window.location.href = '/subs/subsdetail'
                        },
                        error : function() {

                        }
                    })
                };
            })
        }
    }

    $(function () {
        subsdetail.init();
        $('.datePicker').datepicker( ()=> {
            format: 'yyyy-MM-dd'
        });
    });

</script>

<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">구독상품 배송관리 화면</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="/">관직자 메인페이지로</a></li>
            <li class="breadcrumb-item active">#</li>
        </ol>
        <div class="card mb-4">
            <div class="card-body">
                <p>ㅇ 구독 상품 배송현황을 관리하는 화면입니다.</p>
                <p>ㅇ 구독 상세번호 클릭시 해당 배송건에 대한 자세한 정보를 확인하실 수 있습니다.</p>
                <p>ㅇ 각 배송건의 배달예정일자를 수정하실 수 있습니다.</p>
            </div>
        </div>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                DataTable : Subscribe product delivery list
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                    <tr>
                        <th>구독상품 상세번호</th>
                        <th>구독번호</th>
                        <th>고객 아이디</th>
                        <th>배송예정일</th>
                        <th>배송상태</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="obj" items="${sdlist}" varStatus="status">
                            <tr>
                                <td><a href="#subsdetail_id_${obj.subsdetail_id}" data-toggle="modal">${obj.subsdetail_id}</a></td>
                                <td>${obj.subs_id}</td>
                                <td>${obj.cust_id}</td>
                                <td>
                                    <input type="hidden" class="subsdetail_id" value="${obj.subsdetail_id}" name="subsdetail_id">
                                    <input type="text" class="datePicker subs_duedate" name="subs_duedate" value="<fmt:formatDate  value="${obj.subs_duedate}" pattern="yyyy-MM-dd" />"/>
                                    <button type="button" class="btn btn-outline-primary duedate_btn">수정</button>
                                </td>
                                <td>쨘</td>
                            </tr>


                        <!-- details Modal -->
                        <div id="subsdetail_id_${obj.subsdetail_id}" class="modal" role="dialog">
                            <div class="modal-dialog">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title">구독 상품 배송상세</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="card mb-4">
                                            <div class="card-body" style="color:red;font-weight: bolder">[주의] 반드시 정확히 확인 후 처리하십시오.</div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-4">수령인:</label>
                                            <div>${obj.receiver}</div>
                                        </div><br/>
                                        <div class="form-group">
                                            <label class="control-label col-sm-4">수령인 연락처:</label>
                                            <c:set var="TextValue" value="${obj.receiver_phone}"/>
                                            <div>${fn:substring(TextValue,0,3)}-${fn:substring(TextValue,3,7)}-${fn:substring(TextValue,7,11)}</div>
                                        </div><br/>
                                        <div class="form-group">
                                            <label class="control-label col-sm-4">수령 기본주소:</label>
                                            <div>${obj.rec_add1}</div>
                                        </div><br/>
                                        <div class="form-group">
                                            <label class="control-label col-sm-4">수령 상세주소:</label>
                                            <div>${obj.rec_add2}</div>
                                        </div><br/>
                                        <div class="form-group">
                                            <label class="control-label col-sm-4">배송 메모:</label>
                                            <div>${obj.subs_memo}</div>
                                        </div><br/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- details Modal END-->


                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>
