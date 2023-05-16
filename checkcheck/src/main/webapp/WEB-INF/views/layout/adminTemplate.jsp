<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>    
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>admin</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css2/styles.css" rel="stylesheet" />
        <base href="/" />
    </head>
    <body>
        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light"><img src="image/logo.png" style="width:150px;height:150px;margin-left:20px" onclick="location.href='main.do?userCategory=${sesInfo.userCategory}'"></div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="addBook.do">도서추가</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="bookStock.do">재고관리</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="announcement.do">공지작성</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="chulgo.do">출고관리</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="adminInquiryInfo.do">문의관리</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="chart.do">통계</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="logout.do">로그아웃</a>
                </div>
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Top navigation-->
                <nav style="height:70px;border-bottom:1px rgb(185, 178, 178) solid;">
                    	<p id="stockInfo" style="font-size: 24px;padding:10px;display:inline-block;">재고가 10권 이하인 책이 () 권 있습니다</p>
                    	<input type="button" value="재고패이지 이동" onclick="location.href='bookStock.do'">
                </nav>
                <!-- Page content-->
                <div class="container-fluid">
                
                    <tiles:insertAttribute name="adminbody"></tiles:insertAttribute>
                    
                </div>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script>
	fetch("getStockCount.do")
	.then(result => result.json())
	.then(resolve => {
		if(resolve.retCode == 'Success'){
			document.getElementById('stockInfo').innerText = '재고가 10권 이하인 책이 ('+resolve.data+') 권 있습니다';
		}else if (resolve.retCode == 'Fail'){
			alert('재고 데이터를 가져오는데 실패하였습니다.')
		}
	})
</script>
    </body>
</html>
