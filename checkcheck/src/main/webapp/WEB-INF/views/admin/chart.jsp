<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['성별', '회원수'],
          ['남성',   ${genderCount[0]}],
          ['여성',   ${genderCount[1]}]
          
        ]);

        var options = {
          title: '회원 남녀 분포'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
      
      
      /*                        */
      
       
      google.charts.setOnLoadCallback(drawChart2);

      function drawChart2() {

        var data = google.visualization.arrayToDataTable([
          ['연령', '회원수'],
          ['10대',  ${ageCount[0]}],
          ['20대',  ${ageCount[1]}],
          ['30대',  ${ageCount[2]}],
          ['40대',  ${ageCount[3]}],
          ['50대',  ${ageCount[4]}],
          ['60대이상',  ${ageCount[5]}]
        ]);

        var options = {
          title: '회원 연령 분포'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart2'));

        chart.draw(data, options);
      }
      
      /* 연령별 장르 매출 */
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);

      function drawVisualization() {
        // Some raw data (not necessarily accurate)
        var data = google.visualization.arrayToDataTable([
          ['연령', '과학', '소설', '시', '경제경영', '철학', '매출평균'],
          ['10대',  165,      938,         522,             998,           450,      614.6],
          ['20대',  135,      1120,        599,             1268,          288,      682],
          ['30대',  157,      1167,        587,             807,           397,      623],
          ['40대',  139,      1110,        615,             968,           215,      609.4],
          ['50대',  136,      691,         629,             1026,          366,      569.6],
          ['60대이상',  136,      691,         629,             1026,          366,      569.6]
        ]);

        var options = {
          title : '연령별 선호 장르',
          vAxis: {title: '매출'},
          hAxis: {title: '연령'},
          seriesType: 'bars',
          series: {5: {type: 'line'}}
        };

        var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
      /*남여장르별  */
       google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart3);

      function drawChart3() {
        var data = google.visualization.arrayToDataTable([
          ['장르', '남성', '여성'],
          ['과학', 1000, 400],
          ['문학', 2010, 460],
          ['비문학', 660, 1120],
          ['교재', 1030, 540]
        ]);

        var options = {
          chart: {
            title: '남녀별 선호 장르',
          },
          bars: 'horizontal' // Required for Material Bar Charts.
        };

        var chart = new google.charts.Bar(document.getElementById('barchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
      /* 성별 매출 */
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart4);

      function drawChart4() {
        var data = google.visualization.arrayToDataTable([
          ['연도', '남자', '여자','총매출'],
          ['${years[0]}',  ${plist[0]['M']}, ${plist[0]['F']}, ${plist[0]['M']+ plist[0]['F']}],
          ['${years[1]}',  ${plist[1]['M']}, ${plist[1]['F']}, ${plist[1]['M']+ plist[1]['F']}],
          ['${years[2]}',  ${plist[2]['M']}, ${plist[2]['F']}, ${plist[2]['M']+ plist[2]['F']}],
          ['${years[3]}',  ${plist[3]['M']}, ${plist[3]['F']}, ${plist[3]['M']+ plist[3]['F']}],
          ['${years[4]}',  ${plist[4]['M']}, ${plist[4]['F']}, ${plist[4]['M']+ plist[4]['F']}]
        ]);

        var options = {
          title: '매출',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>
  
    <div style="display:flex;">
	    <div id="piechart" style="width: 900px; height: 500px;flex:1"></div>
		<div id="piechart2" style="width: 900px; height: 500px;flex:1"></div>
	</div>
	<div style="display:flex;padding:20px">
		<div id="curve_chart" style="width: 900px; height: 500px;flex:1.2"></div>
		<div id="barchart_material" style="width: 900px; height: 500px;flex:1"></div>
	</div>
     <div id="chart_div" style="width: 900px; height: 500px;margin:0 auto"></div>
