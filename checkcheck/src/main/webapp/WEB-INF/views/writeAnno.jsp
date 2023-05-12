<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//cdn.ckeditor.com/4.21.0/standard/ckeditor.js"></script>
<script>
	document.addEventListener("DOMContentLoaded", function (){
		CKEDITOR.replace('summary', {
			filebrowserUploadUrl : 'annoUpload.do'
		});
	})
</script>
<div >
<section class="py-5">
    <div class="container px-4 px-lg-5 my-5" >
        <div class="row gx-4 gx-lg-5 align-items-center" >
            <form action="addAnno.do" method="POST" style="padding:0 auto">
                <table class="table" style="width:800px;margin:0 auto">
                    <tr>
                        <th>제목</th>
                        <td colspan="3"><input type="text" name="title" placeholder="제목" style="width:500px"></td>
                        <td><input name="userId" value="${sesInfo.userId }" style="display:none"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td colspan="3"><textarea name="summary" cols="100" rows="10"></textarea></td>
                    </tr>
                    <tr>
                        <td colspan="4" align="center">
                            <input type="submit" value="등록">
                            <input type="reset" value="취소">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</section>
</div>