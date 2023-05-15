<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script src='fullcal/dist/index.global.js'></script>
  <script>
    document.addEventListener('DOMContentLoaded', function () {
	  let todayC = false;
	  let date = new Date();
		let year = date.getFullYear();
		let month = date.getMonth() + 1;
		let day = date.getDate();
		let eventDate = year+ "-"+ (month >= 10 ? month : '0' + month)+"-" +(day >= 10 ? day : '0' + day); 
		
      var calendarEl = document.getElementById('calendar');
      //allEvents초기화
      let allEvents = [];
      fetch('event.do')
        .then(resolve => resolve.json())
        .then(result => {
          result.forEach(event => {
        	  let start =event.eventDate.substr(0, 10);
        	  if(start== eventDate) todayC =true;
            let newEvent = {
              title:'출석',
              start: event.eventDate.substr(0, 10),
              imageurl : "image/logo.png"
            }
            allEvents.push(newEvent);
          });
          //foreach 종료

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
            			if(todayC) {
            				alert('오늘 출석을 했습니다');
            				return;
             			}
            			fetch('addEvent.do?date='+eventDate)
            			.then(resolve=> resolve.json())
            			.then(result=>{
            				console.log(result);
            				if(result.retCode==='Success'){
            					alert('출석체크에 성공했습니다');
            					if(result.coupon=='Success')
            						alert('1%쿠폰이 추가되었습니다')
            					location.reload();
            				}else if(result.retCode=='Fail')
            					alert('출석체크에 실패했습니다');
            				else alert('알수 없는 오류');
            			})
            		}
            	}
            },
       	   
            initialDate: new Date(),
            navLinks: false, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
            editable: false, // 수정 가능?
            selectable: false, // 달력 일자 드래그 설정가능
            nowIndicator: true, // 현재 시간 마크
            dayMaxEvents: false, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
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

