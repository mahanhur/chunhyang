<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>
    let chart = {
        init: function(){
            this.chart1();
            this.chart2();
            this.chart3();
        },
        chart1: function() {
            var defaultData = 'http://127.0.0.1:8090/logs/subscountlog.log';
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
                            chart = Highcharts.chart('container1', {
                                chart: {
                                    type: 'spline'
                                },
                                title: {
                                    text: '구독상품'
                                },
                                accessibility: {
                                    announceNewData: {
                                        enabled: true,
                                        minAnnounceInterval: 1000,
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
            setInterval(createChart, parseInt(pollingInput.value, 10) * 1000);
        },
        chart2: function() {
            var defaultData = 'http://127.0.0.1:8090/logs/itemcountlog.log';
            var urlInput = document.getElementById('fetchURL2');
            var pollingCheckbox = document.getElementById('enablePolling2');
            var pollingInput = document.getElementById('pollingTime2');
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
                            var id = parts[1].trim().replace(/'/g, '');

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
                            // var id = subsitem(idorigin);
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
                                        minAnnounceInterval: 1000,
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
            setInterval(createChart, parseInt(pollingInput.value, 10) * 1000);
        },
        chart3: function() {
            var defaultData = 'http://127.0.0.1:8090/logs/bipumcountlog.log';
            var urlInput = document.getElementById('fetchURL3');
            var pollingCheckbox = document.getElementById('enablePolling3');
            var pollingInput = document.getElementById('pollingTime3');
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
                            var id = parts[1].trim().replace(/'/g, '');

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
                            // var id = subsitem(idorigin);
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
                            chart = Highcharts.chart('container3', {
                                chart: {
                                    type: 'spline'
                                },
                                title: {
                                    text: '구독상품'
                                },
                                accessibility: {
                                    announceNewData: {
                                        enabled: true,
                                        minAnnounceInterval: 1000,
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
            setInterval(createChart, parseInt(pollingInput.value, 10) * 1000);
        }
    };




    $(function() {
        chart.init();
    })
</script>

<main>


    <div class="container-fluid">
        <h3 class="mt-4 alert alert-success"><strong>춘향 서비스페이지 접속 분석차트</strong>: 실시간 접속로그 분석</h3>
        <div class="card mb-4">
            <div class="card-body">
                <p>ㅇ 구독/꽃/비품 각 상품별 상세페이지 접속 로그를 실시간으로 추적한 차트입니다. </p>
                <hr/>
            </div>
        </div>
        <!-- Page Heading -->
<%--        <h1 class="h3 mb-2 text-gray-800">춘향 서비스페이지 접속 분석차트</h1>--%>
        <br/>

        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">구독상품 실시간 차트</h6>
            </div>
            <div class="card-body">
                <div id="container1"></div>
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

        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">일반상품 실시간 차트</h6>
            </div>
            <div class="card-body">
                <div id="container2"></div>
                <div class="ld-row">
                    <input type="hidden" checked="checked" id="enablePolling2"/>
                </div>
                <div class="ld-row">
                    <input class="ld-time-input" type="hidden" value="2" id="pollingTime2"/>
                </div>
                <div class="ld-row">
                    <input class="ld-url-input" type="hidden" id="fetchURL2"/>
                </div>
            </div>
        </div>

        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">비품 실시간 차트</h6>
            </div>
            <div class="card-body">
                <div id="container3"></div>
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
    </div>


</main>
