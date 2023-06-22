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

            Highcharts.chart('container3', {
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false,
                    type: 'pie'
                },
                title: {
                    text: 'Browser market shares in February, 2022',
                    align: 'left'
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
                        colors,
                        borderRadius: 5,
                        dataLabels: {
                            enabled: true,
                            format: '<b>{point.name}</b><br>{point.percentage:.1f} %',
                            distance: -50,
                            filter: {
                                property: 'percentage',
                                operator: '>',
                                value: 4
                            }
                        }
                    }
                },
                series: [{
                    name: 'Gender',
                    data: [
                        { name: 'Chrome', y: 74.03 },
                        { name: 'Edge', y: 12.66 },
                        { name: 'Firefox', y: 4.96 },
                        { name: 'Safari', y: 2.49 },
                        { name: 'Internet Explorer', y: 2.31 },
                        { name: 'Other', y: 3.398 }
                    ]
                }]
            });
        }
    }
    $(function () {
       center_chart2.init();
       center_chart1.init();
       center_chart3.init();

       setInterval(center_chart1.init, 5000);
       setInterval(center_chart2.init, 15000);
       setInterval(center_chart3.init, 15000);
    });
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
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-chart-pie me-1"></i>
                Pie Chart Example
            </div>
            <div class="card-body">
                <div class="chart-area" id="container3" width="100%" height="50"></div>
            </div>
            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>
    </div>
</div>
    </div>
</main>