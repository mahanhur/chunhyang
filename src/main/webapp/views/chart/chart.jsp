<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>
    let center_chart1 = {
        init: function () {
            $.ajax({
                url: '/custchartimpl2',
                success: function (data) {
                    center_chart1.display(data);
                }
            });
        },
        display: function (data) {
            // Custom template helper
            Highcharts.Templating.helpers.abs = value => Math.abs(value);

            // Age categories
            const categories = [
                '10대', '20대', '30대', '40대', '50대'
            ];
            Highcharts.chart('container2', {
                chart: {
                    type: 'bar'
                }, title: {
                    text: '차트제목',
                    align: 'left'
                },
                accessibility: {
                    point: {
                        valueDescriptionFormat: '{index}. Age {xDescription}, {value}%.'
                    }
                },
                xAxis: [{
                    categories: categories,
                    reversed: false,
                    labels: {
                        step: 1
                    },
                    accessibility: {
                        description: '(남자)'
                    }
                }, { // mirror axis on right side
                    opposite: true,
                    reversed: false,
                    categories: categories,
                    linkedTo: 0,
                    labels: {
                        step: 1
                    },
                    accessibility: {
                        description: '(여자)'
                    }
                }],
                yAxis: {

                    labels: {
                        format: '{abs value}%'
                    },
                    accessibility: {
                        description: 'Ratio',
                        rangeDescription: 'Range: 0 to 100%'
                    }
                },

                plotOptions: {
                    series: {
                        stacking: 'normal',
                        borderRadius: '50%'
                    }
                },

                tooltip: {
                    format: '<b>{series.name}, {point.category}</b><br/>' +
                        'sales: {(abs point.y):.2f}%'
                },
                series: data
            });
        }
    }


    let center_chart2 = {
        init: function () {
            $.ajax({
                url: '/custchartimpl',
                success: function (data) {
                    center_chart2.display(data);
                }
            });
        },
        display: function (data) {
            Highcharts.chart('container1', {
                chart: {
                    type: 'column'
                },
                title: {
                    text: '고객성별에 따른 월별 판매금액'
                },

                xAxis: {
                    categories: [
                        'Jan',
                        'Feb',
                        'Mar',
                        'Apr',
                        'May',
                        'Jun',
                        'Jul',
                        'Aug',
                        'Sep',
                        'Oct',
                        'Nov',
                        'Dec'
                    ],
                    crosshair: true
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: '판매금액(백만원)'
                    }
                },
                tooltip: {
                    headerFormat: '<span style="font-size:15px;"><b>{point.key}</b></span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0;font-size: 0.8em;">{series.name}: </td>' +
                        '<td style="padding:0; font-size: 0.8em;"><b>₩{point.y:.f}</b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true
                },
                plotOptions: {
                    column: {
                        pointPadding: 0.2,
                        borderWidth: 0
                    }
                },
                series: data
            });
        }
    }

    let center_chart3 = {
        init: function () {
            // $.ajax({
            //     url: '/custchartimpl2',
            //    success: function (data) {
            center_chart3.display();
            //    }
            // });
        },
        display: function () {
            const colors = Highcharts.getOptions().colors.map((c, i) =>
                Highcharts.color(Highcharts.getOptions().colors[0])
                    .brighten((i - 3) / 7)
                    .get()
            );


        }
    }
    $(function () {
        center_chart2.init();
        center_chart1.init();


        setInterval(center_chart1.init, 5000);
        setInterval(center_chart2.init, 5000);

    });
</script>

<main>


    <div class="container-fluid"><br/>
        <p class="page_header_item"><strong>매출/고객 분석 및 통계</strong></p>
        <div class="card mb-4">
            <div class="card-body">
                <p>ㅇ 춘향전의 매출/고객 데이터를 분석한 통계 및 차트자료입니다.
            </div>
        </div>
        <div class="row">
<%--매출chart--%>
            <div class="col-lg-12">
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-chart-area me-1"></i>
                        Area Chart Example
                    </div>
                    <div class="card-body">
                        <div class="chart-area" id="container1" width="100%" height="30"></div>
                    </div>
                    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                </div>
            </div>

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
                                <th>총 판매량</th>
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
                                <td><fmt:formatNumber value="${iaobj.item_amount}" pattern="###,###원"/></td>
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
                                <th>총 판매량</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${subsamount2}" var="sobj">
                            <tr>
                                <td>${sobj.rownum}</td>
                                <td>${sobj.subsitem_id}</td>
                                <td>${sobj.subsitem_name}</td>
                                <td>${sobj.subs_cnt}</td>
                            </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
<%--구독 worst10 end--%>

<%--    일반상품 판매량worst10--%>
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
                                <td><fmt:formatNumber value="${iobj.item_amount}" pattern="###,###원"/></td>
                            </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
<%--일반상품판매량 worst10 end--%>
        </div>

        <div class="row">


                <div class="col-lg-6">
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-chart-bar me-1"></i>
                            Bar Chart Example
                        </div>
                        <div class="card-body">
                            <div class="chart-area" id="container2" width="100%" height="50"></div>
                        </div>
                        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <%--                매출액비중 차트--%>
                    <div class="card mb-1" >
                        <div class="card-header" style="font-weight: bold; background-color: #E0ECF8" >
                            매출액 비중 차트
                        </div>
                        <div class="card-body">
                            <figure class="highcharts-figure">
                                <div id="container3"></div>
                            </figure>
                        </div>
                    </div>
                </div>






        </div>


    </div>


</main>