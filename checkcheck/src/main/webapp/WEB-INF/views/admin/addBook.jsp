<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <form style="padding:50px;">
        <div id="addBookSearch">
            <input style="width: 500px;margin-left: 200px;" type="text" value="검색"><button type="submit">검색</button>

        </div>
        <div style="padding:10px">
            <input id="selectall" type="checkbox" value="selectall" name="selectall" onclick='selectAll(this)'>
            <p style="display: inline-block;">전체선택</p>
            <input class=num type="number" value="1">
            <button type="submit">추가</button>
        </div>


        <!-- 반복시작-->
        <div id="addBookList"
            style="display:flex;text-align: center;border-bottom: 1px solid rgba(0, 0, 0, 0.13);padding:10px">
            <div style="flex:0.5"></div>
            <div style="flex:1;position: relative;">
                <input type="checkbox" value="책이름" name="addbook" style="position: absolute;top:10px;left:10px">
                <img src="image/logo.png" alt="책표지" style="width:200px;height:300px">
            </div>
            <table style="flex:1;margin:30px">
                <thead>
                    <tr>
                        <td>책이름</td>
                        <td>코스모스</td>
                    </tr>
                    <tr>
                        <td>저자</td>
                        <td>칼세이건</td>
                    </tr>
                    <tr>
                        <td>출판사</td>
                        <td>사이언스북스</td>
                    </tr>
                    <tr>
                        <td>isbn</td>
                        <td>9798989898</td>
                    </tr>
                    <tr>
                        <td>가격</td>
                        <td>17900</td>
                    </tr>
                </thead>
            </table>
            <div style="flex:2;position: relative;">
                <div style="position: absolute;bottom:10px">
                    <input class=num type="number" value="1">
                    <input type="submit" value="추가">
                </div>
            </div>
        </div>

        <!-- 반복끝 -->

    </form>
    <script>
        function selectAll(selectAll) {
            const checkboxes = document.getElementsByName('addbook');

            checkboxes.forEach((checkbox) => {
                checkbox.checked = document.querySelector('#selectall').checked;
            })
        }
        let nums = document.querySelectorAll('.num');
        nums.forEach((num) => num.addEventListener('click', function () {
            if (num.value < 1) {
                alert('1권 이하의 수량은 추가 할 수없습니다.')
                num.value = 1;
            }
        }))
    </script>