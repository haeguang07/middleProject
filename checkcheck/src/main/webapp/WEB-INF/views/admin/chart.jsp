<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    //데이터 로드
    fetch('chartData.do')
    .then(resolve=> resolve.json())
    .then(result=>{
    	console.log(result)
    
    
    
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
		let genderCount =result.genderCount;
        var data = google.visualization.arrayToDataTable([
          ['성별', '회원수'],
          ['남성',   genderCount[0]],
          ['여성',   genderCount[1]]
          
        ]);

        var options = {
          title: '회원 남녀 분포'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
      
      
      /*                        */
      
       
      google.charts.setOnLoadCallback(drawChart2);
		let ageCount =[];
      function drawChart2() {
    	 		
    	let ageCount= result.ageCount;
        var data = google.visualization.arrayToDataTable([
          ['연령', '회원수'],
          ['10대',  ageCount[0]],
          ['20대',  ageCount[1]],
          ['30대',  ageCount[2]],
          ['40대',  ageCount[3]],
          ['50대',  ageCount[4]],
          ['60대이상',  ageCount[5]]
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
    	let category5 =result.category5;//매출 상위 5개 장르
    	let ageArr =['00대','10대','20대','30대','40대','50대','60대'];//연령 키값
    	let ageMap = result.ageMap;//ageMap<연령,<카테고리,매출>>
   		let arr =[];
    	for (let i=0; i<ageArr.length;i++){
    		let map =ageMap[ageArr[i]];
	   		age = ageArr[i]=='00대' ? '10대이하' : ageArr[i];
	   		age = ageArr[i]=='60대' ? '60대이상' : ageArr[i];
	   		let arr2=[age];
	   		for(let sales of category5){
	   			let sale = typeof map[sales]=="undefined" ? 0: map[sales];
	   			arr2.push(sale)
	   		}
	   		console.log(arr2)
	   		arr.push(arr2);
    		
    	}
   		console.log(arr);
   	 	var data = new google.visualization.DataTable();
        data.addColumn('string', '연령');
        for(let c of category5 ){
        	data.addColumn('number', c);        	
        }
        
        data.addRows(arr);
        
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
      	let category5 =result.category5;//매출 상위 5개 장르
      	let cate5Map =result.cate5Map; //상위 5개 장르 매출
		let mcMap = result.mcMap;//남성 회원의 장르 매출
		let fcMap = result.fcMap;//여성 회원의 장르 매출
		let arr =[];
		for(let i=0;i<5;i++){
			let mc= typeof mcMap[category5[i]]=="undefined" ? 0:mcMap[category5[i]] ;
			let fc= typeof fcMap[category5[i]]=="undefined" ? 0:fcMap[category5[i]] ;
			arr.push([category5[i],mc,fc]);
		}
		console.log(arr);
      function drawChart3() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', '장르');
        data.addColumn('number', '남성');
        data.addColumn('number', '여성');	
        data.addRows(arr);
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
    	  let plist=result.plist;
    	  let years =result.years;
        var data = google.visualization.arrayToDataTable([
          ['연도', '남자', '여자','총매출'],
          [''+years[0],  plist[0]['M'], plist[0]['F'], plist[0]['M']+ plist[0]['F']],
          [''+years[1],  plist[1]['M'], plist[1]['F'], plist[1]['M']+ plist[1]['F']],
          [''+years[2],  plist[2]['M'], plist[2]['F'], plist[2]['M']+ plist[2]['F']],
          [''+years[3],  plist[3]['M'], plist[3]['F'], plist[3]['M']+ plist[3]['F']],
          [''+years[4],  plist[4]['M'], plist[4]['F'], plist[4]['M']+ plist[4]['F']]
        ]);

        var options = {
          title: '매출',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    })
    .catch(err=> console.log(err));
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
