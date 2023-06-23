<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let center_chart1 = {
        init: function () {
            // Custom template helper
            Highcharts.Templating.helpers.abs = value => Math.abs(value);

            // Age categories
            const categories = [
                '0-4', '5-9', '10-14', '15-19', '20-24', '25-29', '30-34', '35-40', '40-45',
                '45-49', '50-54', '55-59', '60-64', '65-69', '70-74', '75-79', '80+'
            ];
            // $.ajax({
            //     url: '/custchartimpl1',
            //     success: function (data) {
            //        center_chart1.display();
            // }
            // });
            Highcharts.chart('container2', {
                chart: {
                    type: 'bar'
                },
                title: {
                    text: 'Population pyramid for Somalia, 2021',
                    align: 'left'
                },
                subtitle: {
                    text: 'Source: <a ' +
                        'href="https://countryeconomy.com/demography/population-structure/somalia"' +
                        'target="_blank">countryeconomy.com</a>',
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
                        description: 'Age (male)'
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
                        description: 'Age (female)'
                    }
                }],
                yAxis: {
                    title: {
                        text: null
                    },
                    labels: {
                        format: '{abs value}%'
                    },
                    accessibility: {
                        description: 'Percentage population',
                        rangeDescription: 'Range: 0 to 5%'
                    }
                },

                plotOptions: {
                    series: {
                        stacking: 'normal',
                        borderRadius: '50%'
                    }
                },

                tooltip: {
                    format: '<b>{series.name}, age {point.category}</b><br/>' +
                        'Population: {(abs point.y):.1f}%'
                },

                series: [{
                    name: 'Male',
                    data: [
                        -8.98, -7.52, -6.65, -5.72, -4.85,
                        -3.71, -2.76, -2.07, -1.70, -1.47,
                        -1.22, -0.99, -0.81, -0.62, -0.41,
                        -0.23, -0.15
                    ]
                }, {
                    name: 'Female',
                    data: [
                        8.84, 7.42, 6.57, 5.68, 4.83,
                        3.74, 2.80, 2.14, 1.79, 1.59,
                        1.34, 1.06, 0.83, 0.63, 0.43,
                        0.25, 0.19
                    ]
                }]
            });

        },
        display: function () {

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

<style>
    .datepickcard {
        border: solid 0.2px lightgray;
    }
    .rate-item+.rate-item{margin-left:1rem}.rating{display:inline-flex;margin-bottom:0}.rating:not([data-value]) .rating-item,.rating[data-value="1"] .rating-item:nth-child(n+2),.rating[data-value="2"] .rating-item:nth-child(n+3),.rating[data-value="3"] .rating-item:nth-child(n+4),.rating[data-value="4"] .rating-item:nth-child(n+5),.rating[data-value="5"] .rating-item:nth-child(n+6){color:#ccc}.rating-form{display:inline-flex;position:relative}.rating-input{cursor:pointer;height:100%;opacity:0;position:absolute;width:100%}
</style>


<script>
    let mantotalsales =0;
    let womantotalsales =0;
    let totals = 0;
    let ja;
    let chartData;
    let tableData;

    function upcount(location, max, unit) {
        let $counter1 = document.querySelector(location);
        let max1 = max;
        counter($counter1, max1);

        function counter($counter1, max1) {
            let now = max1;
            const handle = setInterval(() => {
                $counter1.innerHTML = Math.ceil(max1 - now).toLocaleString() + unit
                if (now < 1) {
                    clearInterval(handle);
                }
                const step = now / 10;
                now -= step;
            }, 10);
        }
    }
    let chart2 = {
        init: function() {
            //당일자 디폴트 세팅
            var today = new Date();
            var year = today.getFullYear();
            var month = ('0' + (today.getMonth() + 1)).slice(-2);
            var day = ('0' + today.getDate()).slice(-2);
            var dateString = year + '-' + month  + '-' + day;

            chart2.dataset(dateString, dateString );
            $('.datepicker1').val(dateString);
            $('.datepicker2').val(dateString);

            //버튼클릭시 정보제공
            $('.datepicker').datepicker();
            let date1 = $('.datepicker1').val();
            let date2 = $('.datepicker2').val();
            $('.chart_btn').click( function() {
                date1 = $('.datepicker1').val();
                date2 = $('.datepicker2').val();
                chart2.dataset(date1, date2);
            })
        },
        dataset: function(date1, date2) {
            $('tbody').empty();
            $.ajax({
                url:'/chartimpl2',
                method:'post',
                data: {
                    date1:date1,
                    date2:date2
                },
                success: function(data) {
                    if(data.mantotalsales == null) {
                        data.mantotalsales = 0;
                    }
                    mantotalsales = data.mantotalsales;

                    if(data.womantotalsales == null) {
                        data.womantotalsales = 0;
                    }
                    womantotalsales = data.womantotalsales;

                    upcount('.totals', mantotalsales+womantotalsales, '원');
                    upcount('.mantotalsales', mantotalsales, '원');
                    upcount('.womantotalsales', womantotalsales, '원');

                    ja = data.ja;
                    chartData = ja.map(item => [item.name, item.amount]);
                    chart2.chart1(chartData);

                    tableData = ja.map(item => [item.rownum, item.name,  item.price, item.cnt, item.amount]);
                    chart2.table(tableData);
                }
            });

        },
        table: function(tableData) {
            let tags = "";
            for (let i = 0; i < tableData.length; i++) {
                tags = '<tr>';
                tags += '<td>';
                tags += tableData[i][0];
                tags += '</td>';
                tags += '<td>';
                tags += tableData[i][1];
                tags += '</td>';
                tags += '<td>';
                tags += tableData[i][2].toLocaleString() + '원';
                tags += '</td>';
                tags += '<td>';
                tags += tableData[i][3].toLocaleString() + '개';
                tags += '</td>';
                tags += '<td>';
                tags += tableData[i][4].toLocaleString() + '원';
                tags += '</td>';
                tags += '</tr>';
                $('tbody').append(tags);
            }
        },

        chart1: function(chartData) {
            Highcharts.chart('container3', {
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
                        name: '남자',
                        y: mantotalsales / (mantotalsales+womantotalsales) * 100
                    },  {
                        name: '여자',
                        y: womantotalsales / (mantotalsales+womantotalsales) * 100
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
</script>

<main>
    <div class="container-fluid">
        <p class="page_header_item"><strong>기간별 분석 및 통계</strong></p>
        <div class="card mb-4">
            <div class="card-body">
                <p>ㅇ 고객분석 <span style="font-weight: bold; color:red;"></span>의 분석 및 통계자료를 확인하실 수 있습니다.</p>
                <div style="display: flex; flex-direction: row; align-items: center;">

                </div>
            </div>
        </div>

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