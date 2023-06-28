<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>
    let chart = {
        init: function () {
            this.chart1();
            this.chart2();
        },
        chart1: function () {
            var defaultData = 'http://49.50.160.198:8090/logs/itemclicklog.log';
            var urlInput = document.getElementById('fetchURL3');
            var pollingCheckbox = document.getElementById('enablePolling3');
            var pollingInput = document.getElementById('pollingTime3');
            var chart;

            function createChart() {
                var dataUrl = 'http://49.50.160.198:8090/logs/itemclicklog.log';

                // 데이터 가공
                fetch(dataUrl)
                    .then(response => response.text())
                    .then(data => {
                        var lines = data.trim().split('\n');
                        var countData = {};

                        lines.forEach(line => {
                            var parts = line.split(',');
                            var timestamp = parts[0].trim();
                            var objectAndCount = parts[1].trim().split('/');
                            var objectorigin = objectAndCount[0];
                            var count = parseInt(objectAndCount[1]);

                            function names(objectorigin) {
                                let object = "";
                                switch (objectorigin){
                                    case "subs":
                                        object = "구독상품";
                                        break;
                                    case "item":
                                        object = "일반상품";
                                        break;
                                    case "bipum":
                                        object = "비품";
                                        break;
                                }
                                return object;
                            }
                            object = names(objectorigin);

                            if (!countData[object]) {
                                countData[object] = 0;
                            }


                            countData[object]++;
                        });


                        // 바 차트 데이터 구성
                        var series = [];
                        for (var object in countData) {
                            series.push({
                                name: object,
                                data: [countData[object]]
                            });
                        }

                        if (!chart) {
                            chart = Highcharts.chart('container1', {
                                chart: {
                                    type: 'column' // 바 차트로 설정 (column)
                                },
                                title: {
                                    text: '구독/일반/비품 구분 별 진입현황'
                                },
                                xAxis: {
                                    categories: ['클릭수']
                                },
                                yAxis: {
                                    title: {
                                        text: '빈도'
                                    }
                                },
                                series: series
                            });
                        } else {
                            // 기존 차트 업데이트
                            series.forEach((s, index) => {
                                chart.series[index].setData([s.data[0]]);
                            });
                        }
                    });
            }

            function setDefaultData() {
                var logFile = 'http://49.50.160.198:8090/logs/itemclickcount.log';

                fetch(logFile)
                    .then(response => response.text())
                    .then(data => {
                        var lines = data.trim().split('\n');
                        var countData = {};

                        lines.forEach(line => {
                            var parts = line.split(',');
                            var timestamp = parts[0].trim();
                            var objectAndCount = parts[1].trim().split('/');
                            var object = objectAndCount[0];
                            var count = parseInt(objectAndCount[1]);

                            if (!countData[object]) {
                                countData[object] = 0;
                            }

                            countData[object]++;
                        });

                        // 가장 많은 빈도수를 갖는 count 찾기
                        var maxCount = 0;
                        var maxCountValue = 0;
                        for (var object in countData) {
                            if (countData[object] > maxCountValue) {
                                maxCount = object;
                                maxCountValue = countData[object];
                            }
                        }

                        // defaultData 설정
                        defaultData = maxCount;
                        urlInput.value = defaultData;
                    });
            }

            // 로그 파일로부터 defaultData 설정
            setDefaultData();

            pollingCheckbox.onchange = urlInput.onchange = pollingInput.onchange = createChart;

            createChart();

            // 일정 간격마다 데이터 업데이트
            setInterval(createChart, parseInt(pollingInput.value, 10) * 500);
        },
        chart2: function() {
            var defaultData = 'http://49.50.160.198:8090/logs/subscountlog.log';
            var urlInput = document.getElementById('fetchURL1');
            var pollingCheckbox = document.getElementById('enablePolling1');
            var pollingInput = document.getElementById('pollingTime1');
            var chart;

            function createChart() {
                var dataUrl = urlInput.value;

                // 데이터 가공
                fetch(dataUrl)
                    .then(response => response.text())
                    .then(data => {
                        var lines = data.trim().split('\n');
                        var seriesData = {};

                        lines.forEach(line => {
                            var parts = line.split(',');
                            var timestamp = parts[0];
                            var idorigin = parts[1].trim().replace(/'/g, '');

                            function subsitem(idorigin) {
                                let id = "";
                                switch (idorigin){
                                    case "100":
                                        id = "6basic";
                                        break;
                                    case "101":
                                        id = "6premium";
                                        break;
                                    case "102":
                                        id = "6signature";
                                        break;
                                    case "103":
                                        id = "12basic";
                                        break;
                                    case "104":
                                        id = "12premium";
                                        break;
                                    case "105":
                                        id = "12signature";
                                        break;
                                    case "106":
                                        id = "3times";
                                        break;
                                    case "107":
                                        id = "7times";
                                        break;
                                    case "108":
                                        id = "testitem";
                                        break;
                                }
                                return id;
                            }
                            var id = subsitem(idorigin);
                            var count = parseInt(parts[2].trim());

                            if (!seriesData[id]) {
                                seriesData[id] = [];
                            }

                            // 시간 값을 Date 객체로 변환
                            var dateTimeParts = timestamp.split(' ');
                            var dateParts = dateTimeParts[0].split('-');
                            var timeParts = dateTimeParts[1].split(':');
                            var year = parseInt(dateParts[0]);
                            var month = parseInt(dateParts[1]) - 1; // 월은 0부터 시작하기 때문에 1을 뺌
                            var day = parseInt(dateParts[2]);
                            var hour = parseInt(timeParts[0]);
                            var minute = parseInt(timeParts[1]);
                            var second = parseInt(timeParts[2]);
                            var convertedTimestamp = Date.UTC(year, month, day, hour, minute, second);

                            seriesData[id].push([convertedTimestamp, count]);
                        });

                        // 차트 생성
                        var series = [];

                        for (var id in seriesData) {
                            series.push({
                                name: id,
                                data: seriesData[id]
                            });
                        }

                        if (!chart) {
                            chart = Highcharts.chart('container2', {
                                chart: {
                                    type: 'spline'
                                },
                                title: {
                                    text: '구독상품'
                                },
                                accessibility: {
                                    announceNewData: {
                                        enabled: true,
                                        minAnnounceInterval: 500,
                                        announcementFormatter: function (allSeries, newSeries, newPoint) {
                                            if (newPoint) {
                                                return 'New point added. Value: ' + newPoint.y;
                                            }
                                            return false;
                                        }
                                    }
                                },
                                xAxis: {
                                    type: 'datetime'
                                },
                                series: series
                            });
                        } else {
                            // 기존 차트 업데이트
                            series.forEach((s, index) => {
                                chart.series[index].setData(s.data);
                            });
                        }
                    });
            }

            urlInput.value = defaultData;

            pollingCheckbox.onchange = urlInput.onchange= pollingInput.onchange = createChart;

            createChart();

            // 일정 간격마다 데이터 업데이트
            setInterval(createChart, parseInt(pollingInput.value, 10) * 500);
        }
    };


    $(function() {
        chart.init();
    })
</script>



    <main>
        <div class="container-fluid"><br/>
        <p class="page_header_item"><strong>실시간 분석 및 통계</strong></p>
        <div class="card mb-4">
            <div class="card-body">
                <p>ㅇ 당일자 고객들의 클릭 현황을 실시간으로 분석한 차트입니다.
            </div>
        </div>

        <div class="card shadow mb-4">
            <div class="card-header" style="font-weight: bold; background-color: #ffecb5">
                <h6 class="m-0 font-weight-bold text-black" style="font-weight: bold;">구독/일반/비품 상품 실시간 진입 현황</h6>
            </div>
            <div class="card-body">
                <div id="container1"></div>
                <div class="ld-row">
                    <input type="hidden" checked="checked" id="enablePolling3"/>
                </div>
                <div class="ld-row">
                    <input class="ld-time-input" type="hidden" value="2" id="pollingTime3"/>
                </div>
                <div class="ld-row">
                    <input class="ld-url-input" type="hidden" id="fetchURL3"/>
                </div>
            </div>
        </div>

            <div class="card shadow mb-4">
            <div class="card-header" style="font-weight: bold; background-color: #ffecb5">
                <h6 class="m-0 font-weight-bold text-black" style="font-weight: bold;">구독상품 상품별 실시간 진입 현황</h6>
            </div>
            <div class="card-body">
                <div id="container2"></div>
                <div class="ld-row">
                    <input type="hidden" checked="checked" id="enablePolling1"/>
                </div>
                <div class="ld-row">
                    <input class="ld-time-input" type="hidden" value="2" id="pollingTime1"/>
                </div>
                <div class="ld-row">
                    <input class="ld-url-input" type="hidden" id="fetchURL1"/>
                </div>
            </div>
        </div>
    </main>
