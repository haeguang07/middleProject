<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>결제하기</title>
  <!-- 1. 스크립트 추가 -->
  <script src="https://js.tosspayments.com/v1/payment"></script>
</head>
<body>
  <script>
    var clientKey = 'test_ck_Lex6BJGQOVDaE625GxOrW4w2zNbg' // 테스트용 클라이언트 키
    // 2. 결제창 SDK 초기화
    var tossPayments = TossPayments(clientKey)
	    tossPayments.requestPayment('카드', {
	  amount: 15000,
	  orderId: 'vgICm3SX7LM_towprq6tS',
	  orderName: '토스 티셔츠 외 2건',
	  customerName: '박토스',
	  successUrl: 'http://localhost:8081/main.do',
	  failUrl: 'http://localhost:8081/login.do',
	})
  </script>
</body>
</html>
