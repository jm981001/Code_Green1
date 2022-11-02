<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
       <form action="">
        <table border="1" style="border-collapse: collapse;">
            <caption>아이디 찾기</caption>
            <colgroup>
                <col style="width:20%;">
                <col style="width:80%;">
            </colgroup>
            <tr>
                <th>*<label>이름</label></th>
                <td><input id="membername" name="membername" title="필수 이름"  type="text" value="" maxlength="10"/></td>
            </tr>
            <tr>
                <th><label>이메일</label></th>
                <td>
                    <input id="emailId" name="emailId" title="이메일 아이디"  type="text" value="" maxlength="20"/> @
                    <input id="emailDomain" name="emailDomain" title="이메일 주소"  type="text" value="" maxlength="20"/>
                    <p class="email_col">※ 회원 가입 시 입력한 이메일 주소를 입력하세요.</p>
                </td>
            </tr>
        </table>
        <input type="submit" value="아이디 찾기" >
       </form>
</body>
</html>