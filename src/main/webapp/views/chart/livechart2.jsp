<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/datepick.css" />
<style>
    .datepickcard {
        border: solid 0.2px lightgray;
    }
</style>


<script>
    let chart2 = {
        init: function() {
                $('.datepicker').datepicker();
                $('.chart_btn').click( function() {
                    let date1 = $('.datepicker1').val();
                    let date2 = $('.datepicker2').val();
                    $.ajax({
                        url:'/chartimpl',
                        method:'post',
                        data: {
                            date1:date1,
                            date2:date2
                        },
                        success: function(data) {
                            if(data.substotal == null) {
                                data.substotal = 0;
                            }
                            let substotal = data.substotal.toLocaleString();
                            if(data.itemtotal == null) {
                                data.itemtotal = 0;
                            }
                            let itemtotal = data.itemtotal.toLocaleString();
                            $('.totals').html(substotal + itemtotal + '원');
                            $('.substotal').html(substotal +'원');
                            $('.itemtotal').html(itemtotal +'원');
                        }
                    });
            })
        }

    }

    $(function () {
        $.datepicker.setDefaults({
            dateFormat: 'yy-mm-dd',
            prevText: '이전 달',
            nextText: '다음 달',
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            showMonthAfterYear: true,
            yearSuffix: '년'
        });
        chart2.init();
    })

</script>

<main>
    <div class="container-fluid">
        <h3 class="mt-4 alert alert-success"><strong>춘향 매출분석 통계</strong></h3>
            <input type="text" class="datepicker datepicker1 form-control form-control-underline" name="date1" value="<fmt:formatDate  value="" pattern="yyyy-MM-dd" />" placeholder="시작일 선택"/>
            <input type="text" class="datepicker datepicker2 form-control form-control-underline" name="date2" value="<fmt:formatDate  value="" pattern="yyyy-MM-dd" />" placeholder="마지막일 선택"/>
            <button type="button" class="chart_btn">조회</button>
        <br/>
        <div class="row">
            <%--            매출액--%>
            <div class="col-lg-6">
                <div class="card mb-2">
                    <!-- Card contents -->
                    <div class="card-header">
                        전체 매출액
                    </div>
                    <div class="card-body totals" style="font-size: 400%; text-align: center">
                        0 원
                    </div>
                </div>
            </div>
            <%--매출액end--%>
        </div>



        <div class="row">
            <%--            매출액--%>
            <div class="col-lg-3">
                <div class="card mb-1">
                    <!-- Card contents -->
                    <div class="card-header">
                        구독상품 매출액
                    </div>
                    <div class="card-body substotal" style="font-size: 200%; text-align: center">
                        0 원
                    </div>
                </div>
            </div>
            <%--매출액end--%>

            <%--            매출액--%>
            <div class="col-lg-3">
                <div class="card mb-1">
                    <!-- Card contents -->
                    <div class="card-header">
                        일반상품 매출액
                    </div>
                    <div class="card-body itemtotal" style="font-size: 200%; text-align: center">
                        0 원
                    </div>
                </div>
            </div>
            <%--매출액end--%>
        </div>




    </div>
</main>