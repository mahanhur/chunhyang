<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--구글캘린더 가져오는 링크 및 스크립트!--%>
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>

<script>

  $(document).ready(function () {
    $.ajax({
      url: '/getdata',
      success: function (count) {
        $('#all').html(count.totalcount);
        $('#readytoshipping').html(count.count1);
        $('#onshipping').html(count.count2);
        $('#completetoshipping').html(count.count3);
      }
    });
    setInterval(function () {
      $.ajax({
        url: '/getdata',
        success: function (count) {
          $('#all').html(count.totalcount);
          $('#readytoshipping').html(count.count1);
          $('#onshipping').html(count.count2);
          $('#completetoshipping').html(count.count3);
        }
      })
    }, 3000)
  });


  var calFunc ={

    calcDate: function(arg,calendar){
      var rObj = new Object();
      var start  = null;
      var end    = null;
      var allDay = arg.allDay;
      var startDisp =null;
      var endDisp = null;
      var id = null;
      var xcontent = null;
      var title = null;
      //============================== date get / set ======================================

      if(arg.id!=""&& arg.id!=null && arg.id!=undefined) id=arg.id;
      if(arg.title!=""&& arg.title!=null && arg.title!=undefined) title=arg.title;
      if(arg.extendedProps!=undefined){
        if(arg._def.extendedProps.xcontent!=""&& arg._def.extendedProps.xcontent!=null && arg._def.extendedProps.xcontent!=undefined){
          xcontent=arg._def.extendedProps.xcontent;
        }
      }

      if(allDay){//하루종일이면
        var start  = arg.start.toISOString().slice(0,10); //returnCdate(calendar,arg.start);
        var end=null;
        if(arg.end!=""&& arg.end!=null && arg.end!=undefined){
          end    = arg.end.toISOString().slice(0,10);  //실제 데이터는 날짜를 하루 빼지 않는다
        }
        if(start==end) end=null;  //같은날이면 end날짜 없음

        startDisp = start;
        if(end!=null) endDisp = calFunc.dateRel(arg.end.toISOString().slice(0,10)); //알릴때만 날짜 하루 빼기
      }else{//시간이 같이 들어오면
        start = arg.start.toISOString();
        if(arg.end!=""&& arg.end!=null && arg.end!=undefined){
          end   = arg.end.toISOString();
        }
        startDisp = calFunc.returnCdate(calendar,arg.start);
        if(end!=null) endDisp = calFunc.returnCdate(calendar,arg.end);
      }
      rObj.start=start;
      rObj.end=end;

      rObj.startDisp=startDisp;
      rObj.endDisp=endDisp;
      rObj.id=id;
      rObj.xcontent=xcontent;
      rObj.title=title;
      //============================== date get / set ======================================
      return rObj;
    },
    dateRel:function(date){
      var selectDate = date.split("-");
      var changeDate = new Date();
      changeDate.setFullYear(selectDate[0], selectDate[1]-1, selectDate[2]-1);

      var y = changeDate.getFullYear();
      var m = changeDate.getMonth() + 1;
      var d = changeDate.getDate();

      if(m < 10) {
        m = "0" + m;
      }

      if(d < 10) {
        d = "0" + d;
      }
      var resultDate = y + "-" + m + "-" + d;
      return resultDate;
    },
    returnCdate:function(cal,time){
      return cal.formatDate(time,{month: 'long',year: 'numeric',day: 'numeric', hour:'numeric',minute:'numeric', timeZone: 'Asia/Seoul',locale: 'ko'});
    }



  };

  function set_time(time){
    $('#ttime').text(time+':00');
    $('#next_btn').fadeIn();

  };

  $(function(){
    $('#next_btn').hide();
    $('#select_time').hide();


    var calendar = new FullCalendar.Calendar($('#calendar')[0], {

      googleCalendarApiKey : 'AIzaSyBnIBQx51YvOL0_B_Op_LpR5tn_lC1HePE',
      eventSources :[
        {
          googleCalendarId : 'ko.south_korea.official#holiday@group.v.calendar.google.com'
          , color: 'yellow'   // an option!
          , textColor: 'red' // an option!
        }
      ],

      locale:'ko',
      timeZone: 'Asia/Seoul',
      height: '580px', // calendar 높이 설정
      //expandColumns: true,
      expandRows: true, // 화면에 맞게 높이 재설정
      // 해더에 표시할 툴바
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth'
      },
      initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
      //initialDate: '2022-11-01', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
      //navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
      editable: true, // 수정 가능
      selectable: true, // 달력 일자 드래그 설정가능
      nowIndicator: true, // 현재 시간 마크
      // dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
      select: function(arg) {
        var xObj = calFunc.calcDate(arg,calendar);

        const date = new Date();

        const year = date.getFullYear();
        const month = ('0' + (date.getMonth() + 1)).slice(-2);
        const day = ('0' + date.getDate()).slice(-2);
        const dateStr = year + '-' + month + '-' + day;

        if(new Date(xObj.startDisp) < new Date(dateStr)){
          alert('Fail');
          return;
        }

        $('#tdate').text(xObj.startDisp);


        $('#ttime').text('');
        $.ajax({
          url:'/gettime',
          data:{tdate:xObj.startDisp}
        }).done(function(data){
          var arr = data;
          var html = '';
          $(arr).each(function(index,item){
            tt = item.substr(0,item.indexOf(':'));

            html += '<div><a href="#" class="btn btn-sm btn-outline-primary ml-lg-4" onclick="set_time('+tt+')">'+item+'</a></div>';
          });
          $('#select_time').show();

          $('#stime').html(html);
        });
      },
      events:  function(info, successCallback, failureCallback){
        var start= info.start.toISOString().slice(0, 7);
        var end = info.end.toISOString().slice(0, 7);
        var param = "";
        param+="start="+start;
        param+="&end="+end;
        //alert(param);
        $.ajax({
          url: "/getcal3",
          type: "get",
          data:param
        }).done(function(data) {
          successCallback(data);
        }).fail(function(e) {
          alert("실패하였습니다."+e);
        }).always(function() {

        });
      }

    });


    calendar.render();

    $('#next_btn').click(function(){
      var c  = confirm('예약하시겠습니까');
      if(c == true){
        var day = $('#tdate').text();
        var time = $('#ttime').text();
        location.href='/reservation?id=${logincust.id}&day='+day+'&time='+time;
      }

    });


  });
</script>

<div class="container-fluid px-4">
  <h1 class="mt-4">춘향 ADMIN SYSTEM</h1>
  <ol class="breadcrumb mb-4">
    <li class="breadcrumb-item active">오늘도 당신을 응원합니다! </li>
  </ol>
  <div class="row">
    <div class="col-xl-2 col-md-6">
      <div class="card bg text-black mb-4">
        <div class="card-body"><i class="fas fa-shop"></i> 전체</div>
        <div class="card-footer d-flex align-items-center justify-content-between">
          <a class="small text-black stretched-link" href="/delivery"><span id="all"></span></a>
          <div class="small text-black"><i class="fas fa-angle-right"></i></div>
        </div>
      </div>
    </div>
    <div class="col-xl-2 col-md-6">
      <div class="card bg text-black mb-4">
        <div class="card-body"><i class="fas fa-person"></i> 배송대기</div>
        <div class="card-footer d-flex align-items-center justify-content-between">
          <a class="small text-black stretched-link" href="/delivery?del_state=배송대기"><span id="readytoshipping"></span></a>
          <div class="small text-black"><i class="fas fa-angle-right"></i></div>
        </div>
      </div>
    </div>
    <div class="col-xl-2 col-md-6">
      <div class="card bg text-black mb-4">
        <div class="card-body"><i class="fas fa-truck-fast"></i> 배송중</div>
        <div class="card-footer d-flex align-items-center justify-content-between">
          <a class="small text-black stretched-link" href="/delivery?del_state=배송중"><span id="onshipping"></span></a>
          <div class="small text-black"><i class="fas fa-angle-right"></i></div>
        </div>
      </div>
    </div>
    <div class="col-xl-2 col-md-6">
      <div class="card bg text-black mb-4">
        <div class="card-body"><i class="fas fa-box"></i> 배송완료</div>
        <div class="card-footer d-flex align-items-center justify-content-between">
          <a class="small text-black stretched-link" href="/delivery?del_state=배송완료"><span id="completetoshipping"></span></a>
          <div class="small text-black"><i class="fas fa-angle-right"></i></div>
        </div>
      </div>
    </div>
    <div class="col-xl-2 col-md-6">
      <div class="card bg text-black mb-4">
        <div class="card-body"><i class="fas fa-right-to-bracket"></i> 반품요청</div>
        <div class="card-footer d-flex align-items-center justify-content-between">
          <a class="small text-black stretched-link" href="#"><span id="refund">13</span></a>
          <div class="small text-black"><i class="fas fa-angle-right"></i></div>
        </div>
      </div>
    </div>
    <div class="col-xl-2 col-md-6">
      <div class="card bg text-black mb-4">
        <div class="card-body"><i class="fas fa-guitar"></i> 기타</div>
        <div class="card-footer d-flex align-items-center justify-content-between">
          <a class="small text-black stretched-link" href="/delivery?del_state=기타"><span id="etc">13</span></a>
          <div class="small text-black"><i class="fas fa-angle-right"></i></div>
        </div>
      </div>
    </div>
  </div>
  <hr></br>

  <div>
    <div class="col-xl-12">
      <div class="container">
        <div>
          <div>
            <div id="reservation" class="row content col-sm-12" >
              <h6 class="col-sm-2">일자: <span id="tdate"></span></h6>
              <h6 class="col-sm-2">시간: <span id="ttime"></span></h6>
              <h6 class="col-sm-2" id="select_time">시간선택:<span id="stime"></span></h6>
              <h6 class="col-sm-2" id="next_btn"><a href="#" class="btn btn-sm btn-primary ml-lg-4">예약</a></h6>
            </div>
          </div>
          <div class="col-sm-10  text-center ">
            <div id='calendar-container'>
              <div id='calendar'></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

