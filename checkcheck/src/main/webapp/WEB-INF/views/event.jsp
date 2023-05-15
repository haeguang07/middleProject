<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <script src='fullcal/dist/index.global.js'></script>
  <script>
    document.addEventListener('DOMContentLoaded', function () {
      var calendarEl = document.getElementById('calendar');

      //allEvents�ʱ�ȭ
      let allEvents = [];
      fetch('event.do')
        .then(resolve => resolve.json())
        .then(result => {
          result.forEach(event => {
            let newEvent = {
              title:'�⼮',

              start: event.eventDate.substr(0, 10),
              imageurl : "image/logo.png"

            }
            allEvents.push(newEvent);
          });
          //foreach ����
          console.log(allEvents);

          var calendar = new FullCalendar.Calendar(calendarEl, {
            headerToolbar: {
              left: 'prev,next today',
              center: 'title',
              right: 'check'
            },
            customButtons:{
            	check:{
            		text:'�⼮üũ',
            		click: function(){
            			alert('�⼮üũ�Դϴ�');
            		}
            	}
            },
       	   
            initialDate: new Date(),
            navLinks: true, // ��¥�� �����ϸ� Day Ķ������ Week Ķ������ ��ũ
            editable: true, // ���� ����?
            selectable: true, // �޷� ���� �巡�� ��������
            nowIndicator: true, // ���� �ð� ��ũ
            dayMaxEvents: true, // �̺�Ʈ�� �����Ǹ� ���� ���� (+ �� �������� ǥ��)
            locale: 'ko', // �ѱ��� ����
         
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

