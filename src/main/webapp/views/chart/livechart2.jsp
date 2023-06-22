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
    .rate-item+.rate-item{margin-left:1rem}.rating{display:inline-flex;margin-bottom:0}.rating:not([data-value]) .rating-item,.rating[data-value="1"] .rating-item:nth-child(n+2),.rating[data-value="2"] .rating-item:nth-child(n+3),.rating[data-value="3"] .rating-item:nth-child(n+4),.rating[data-value="4"] .rating-item:nth-child(n+5),.rating[data-value="5"] .rating-item:nth-child(n+6){color:#ccc}.rating-form{display:inline-flex;position:relative}.rating-input{cursor:pointer;height:100%;opacity:0;position:absolute;width:100%}
</style>


<script>
    let substotal = 0;
    let itemtotal = 0;
    let totals = 0;
    let delfincount = 0;
    let reviewcount = 0;
    let reviewscore = 0;
    let ja;
    let chartData;
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
                            substotal = data.substotal;
                            let substotalwon = substotal.toLocaleString();

                            if(data.itemtotal == null) {
                                data.itemtotal = 0;
                            }
                            itemtotal = data.itemtotal;
                            let itemtotalwon = itemtotal.toLocaleString();

                            if(data.custcount == null) {
                                data.custcount = 0;
                            }
                            custcount = data.custcount;

                            if(data.delfincount == null) {
                                data.delfincount = 0;
                            }
                            delfincount = data.delfincount;
                            
                            if(data.reviewcount == null) {
                                data.reviewcount = 0;
                            }
                            reviewcount = data.reviewcount;
                            
                            if(data.reviewscore == null) {
                                data.reviewscore = 0;
                            }
                            reviewscore = data.reviewscore;
                            


                            
                            
                            totals = (substotal+itemtotal).toLocaleString();
                            $('.totals').html(totals + '원');
                            $('.substotal').html(substotalwon +'원');
                            $('.itemtotal').html(itemtotalwon +'원');
                            $('.custcount').html(custcount +'명');
                            $('.delfincount').html(delfincount +'건');
                            $('.reviewcount').html(reviewcount +'건');
                            $('.reviewscore').html('(' + reviewscore +'점)');
                            $('.stars').attr('data-value', Math.round(reviewscore));


                            ja = data.ja
                            chartData = ja.map(item => [item.name, item.amount]);
                            chart2.chart1(chartData);
                        }
                    });
            })
        },
        stars: function() {
        },
        chart1: function(ja) {
            Highcharts.chart('container1', {
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false,
                    type: 'pie'
                },
                title: {
                    text: '해당기간 판매금액 비중',
                    align: 'center'
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                accessibility: {
                    point: {
                        valueSuffix: '%'
                    }
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                        }
                    }
                },
                series: [{
                    name: '비중',
                    colorByPoint: true,
                    data: [{
                        name: '구독상품',
                        y: substotal / (substotal+itemtotal) * 100
                    },  {
                        name: '일반상품',
                        y: itemtotal / (substotal+itemtotal) * 100
                    }]
                }]
            });

            Highcharts.chart('container2', {
                chart: {
                    type: 'column'
                },
                title: {
                    text: '해당기간 일반상품 TOP 10의 판매금액 추이'
                },
                xAxis: {
                    type: 'category',
                    labels: {
                        rotation: -45,
                        style: {
                            fontSize: '13px',
                            fontFamily: 'Verdana, sans-serif'
                        }
                    }
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: '금액 (원)'
                    }
                },
                legend: {
                    enabled: false
                },
                tooltip: {
                    pointFormat: '판매금액: <b>{point.y:.1f} 원</b>'
                },
                series: [{
                    name: 'Population',
                    colors: [
                        '#808080', '#8C8C8C', '#999999', '#A5A5A5', '#B2B2B2',
                        '#BFBFBF', '#CCCCCC', '#D8D8D8', '#E5E5E5', '#F2F2F2'
                    ],
                    colorByPoint: true,
                    groupPadding: 0,
                    data: chartData,
                    dataLabels: {
                        enabled: true,
                        rotation: -90,
                        format: '{point.y:#,###} 원', // 판매금액 포맷 변경
                        color: '#FFFFFF',
                        align: 'right',
                        format: '{point.y:.1f}', // one decimal
                        y: 10, // 10 pixels down from the top
                        style: {
                            fontSize: '10px',
                            fontFamily: 'Verdana, sans-serif'
                        }
                    }
                }]
            });
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
        chart2.chart1();


    })
    <%--// 숫자카운트1--%>
    <%--const $counter1 = document.querySelector("#all");--%>
    <%--const max1 = ${count.totalcount};--%>
    <%--counter($counter1, max1);--%>
    <%--function counter($counter1, max1) {--%>
    <%--    let now = max1;--%>
    <%--    const handle = setInterval(() => {--%>
    <%--        $counter1.innerHTML = Math.ceil(max1 - now);--%>
    <%--        if (now < 1) {clearInterval(handle);        }--%>
    <%--        const step = now / 10;--%>
    <%--        now -= step;--%>
    <%--    }, 50);--%>
    <%--}--%>
</script>

<main>
    <div class="container-fluid">
        <p class="page_header_item"><strong>기간별 분석 및 통계</strong></p>
        <div class="card mb-4">
            <div class="card-body">
                <p>ㅇ 시작일자와 종료일자를 입력하시면 <span style="font-weight: bold; color:red;">해당 기간 동안</span>의 분석 및 통계자료를 확인하실 수 있습니다.</p>
                <div style="display: flex; flex-direction: row; align-items: center;">
                    <input type="text" autocomplete='off' class="datepicker datepicker1 form-control form-control-underline" style="width: 10%" name="date1" value="<fmt:formatDate  value="" pattern="yyyy-MM-dd" />" placeholder="시작일 선택"/>
                    <span>&nbsp부터&nbsp&nbsp</span>
                    <input type="text" autocomplete='off' class="datepicker datepicker2 form-control form-control-underline" style="width: 10%" name="date2" value="<fmt:formatDate  value="" pattern="yyyy-MM-dd" />" placeholder="마지막일 선택"/>
                    <span>&nbsp까지&nbsp&nbsp</span>
                    <button type="button" class="btn btn-outline-primary chart_btn" style="width: 10%;">조회</button>
                </div>
            </div>
        </div>

        <div style="display: flex; flex-direction: row;">
            <div class="col-lg-6">
<%--                전체 매출액--%>
                <div class="row">
                    <%--            매출액--%>
                    <div class="">
                        <div class="card mb-2">
                            <!-- Card contents -->
                            <div class="card-header" style="font-weight: bold; background-color: #ffecb5">
                                전체 매출액
                            </div>
                            <div class="card-body totals" style="font-size: 400%; text-align: center">
                                0 원
                            </div>
                        </div>
                    </div>
                    <%--매출액end--%>
                </div>

<%--                구독/일반상품 매출액--%>
                <div class="row">
                    <%--            매출액--%>
                    <div class="col-lg-6">
                        <div class="card mb-1">
                            <!-- Card contents -->
                            <div class="card-header" style="font-weight: bold; background-color: #ffecb5">
                                구독상품 매출액
                            </div>
                            <div class="card-body substotal" style="font-size: 200%; text-align: center">
                                0 원
                            </div>
                        </div>
                    </div>
                    <%--매출액end--%>

                    <%--            매출액--%>
                    <div class="col-lg-6">
                        <div class="card mb-1">
                            <!-- Card contents -->
                            <div class="card-header" style="font-weight: bold; background-color: #ffecb5">
                                일반상품 매출액
                            </div>
                            <div class="card-body itemtotal" style="font-size: 200%; text-align: center">
                                0 원
                            </div>
                        </div>
                    </div>
                    <%--매출액end--%>
                </div>
    <%--                custcount--%>
                <div class="row">
                    <div class="">
                        <div class="card mb-2">
                            <!-- Card contents -->
                            <div class="card-header" style="font-weight: bold; background-color: #EFBBBB">
                                가입 고객 수
                            </div>
                            <div class="card-body custcount" style="font-size: 400%; text-align: center">
                                0 명
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-5" style="margin-left: 3%">
<%--                매출액비중 차트--%>
                <div class="card mb-1" >
                    <div class="card-header" style="font-weight: bold; background-color: #0dcaf0" >
                        매출액 비중 차트
                    </div>
                    <div class="card-body">
                        <figure class="highcharts-figure">
                            <div id="container1"></div>
                        </figure>
                    </div>
                </div>
            </div>
        </div>

        <%--                4개 카드 --%>
        <div class="row">
            <div class="col-lg-4">
                <div class="card mb-1">
                    <!-- Card contents -->
                    <div class="card-header" style="font-weight: bold; background-color: #ffecb5">
                        배송완료 건수
                    </div>
                    <div class="card-body delfincount" style="font-size: 200%; text-align: center">
                        0 건
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="card mb-1">
                    <!-- Card contents -->
                    <div class="card-header" style="font-weight: bold; background-color: #ffecb5">
                        리뷰등록 건수
                    </div>
                    <div class="card-body reviewcount" style="font-size: 200%; text-align: center">
                        0 건
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="card mb-1">
                    <!-- Card contents -->
                    <div class="card-header" style="font-weight: bold; background-color: #ffecb5">
                        등록리뷰 평점
                    </div>
                    <div class="card-body " style="font-size: 200%; text-align: center">
                        <div class="rating text-dark mb-4 mb-md-0 stars" data-value="">
                            <div class="rating-item">
                                <i class="fas fa-star"></i>
                            </div>
                            <div class="rating-item">
                                <i class="fas fa-star"></i>
                            </div>
                            <div class="rating-item">
                                <i class="fas fa-star"></i>
                            </div>
                            <div class="rating-item">
                                <i class="fas fa-star"></i>
                            </div>
                            <div class="rating-item">
                                <i class="fas fa-star"></i>
                            </div>
                        </div>
                        <span class="reviewscore"></span>
                    </div>
                </div>
            </div>

        </div>

        <hr/>


        <div class="col-lg-12">
            <%--                top10 매출액 차트--%>
            <div class="card mb-12" >
                <div class="card-header" style="font-weight: bold;" >
                    판매금액 추이 차트
                </div>
                <div class="card-body">
                    <figure class="highcharts-figure">
                        <div id="container2"></div>
                    </figure>
                </div>
            </div>
        </div>

        <div class="col-lg-12">
            <%--                top10 매출액 데이터--%>
            <div class="card mb-12" >
                <div class="card-header" style="font-weight: bold;" >
                    판매금액 추이 차트
                </div>
                <div class="card-body">
                    <table class="table table-sm table-hover">
                        <thead style="background-color: #F5F6CE">
                        <tr>
                            <th>순위</th>
                            <th>상품이름</th>
                            <th>상품가격</th>
                            <th>총 판매량</th>
                            <th>총 판매금액</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${subsamount}" var="saobj">
                            <tr>
                                <td>${saobj.rownum}</td>
                                <td>${saobj.subsitem_id}</td>
                                <td>${saobj.subsitem_name}</td>
                                <td>${saobj.subs_cnt}</td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
</main>