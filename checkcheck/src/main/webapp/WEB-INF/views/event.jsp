<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <script src='/fullcal/dist/index.global.js'></script>
  <script>
    document.addEventListener('DOMContentLoaded', function () {
      var calendarEl = document.getElementById('calendar');

      //allEvents초기화
      let allEvents = [];
      fetch('event.do')
        .then(resolve => resolve.json())
        .then(result => {
          result.forEach(event => {
            let newEvent = {
              //
              start: event.eventDate.substr(0, 11),
              imageurl : "image/logo.png"
            }
            allEvents.push(newEvent);
          });
          //foreach 종료
          console.log(allEvents);

          var calendar = new FullCalendar.Calendar(calendarEl, {
            headerToolbar: {
              left: 'prev,next today',
              center: 'title',
              right: 'check'
            },
            customButtons:{
            	check:{
            		text:'출석체크',
            		click: function(){
            			alert('출석체크입니다');
            		}
            	}
            },
       	   
            initialDate: new Date(),
            navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
            editable: true, // 수정 가능?
            selectable: true, // 달력 일자 드래그 설정가능
            nowIndicator: true, // 현재 시간 마크
            dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
            locale: 'ko', // 한국어 설정
         
            events: allEvents
          });
          
          calendar.render();
        })
        .catch(error => console.log(error))
    });
  </script>
  <style>
    #calendar {
      max-width: 1100px;
      margin: 0 auto;
    }
     button{
  position: static;
  width: auto;
  height: auto;
  transform: translateY(0);
  }
  .fc-day a{
  color:#000;
  } 
  .fc-day-sun a{
  color: red;
  }
  .fc-day-sat a{
  color: blue;
  }
  a{
  text-decoration: none;
  }
  .fc-check-button{
  	font-size: 16px;
  }
  
  </style>


  <div id='calendar'></div>

