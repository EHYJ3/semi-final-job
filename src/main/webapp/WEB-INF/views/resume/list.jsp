<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Resume List</title>
    
    <style>

header {
   background-color: #333;
   color: white;
   padding: 1em;
   display: flex;
   justify-content: space-between;
   align-items: center;
}

header .logo {
   display: flex;
   align-items: center;
}

header .logo h1 {
   margin: 0;
   margin-right: 1em;
}

header nav ul {
   list-style: none;
   margin: 0;
   padding: 0;
   display: flex;
}

header nav ul li {
   margin-left: 1em;
}

header nav ul li a {
   color: white;
   text-decoration: none;
   padding: 0.5em 1em;
   border-radius: 4px;
   transition: background-color 0.3s, color 0.3s;
}

header nav ul li a:hover {
   background-color: #555;
   color: #fff;
}
footer {
    background-color: #f9f9f9;
    color: black;
    text-align: center;
    padding: 1em;
    bottom: 0;
    width: 100%;
    z-index: 1000; /* 다른 요소 위에 위치하도록 설정 */
}

.footer-info {
    display: flex;
    justify-content: space-around;
    margin-bottom: 1em;
}

.footer-btn {
    background-color: #f9f9f9;
    color: black;
    border: none;
    padding: 0.5em 1em;
    cursor: pointer;
    border-radius: 4px;
    transition: background-color 0.3s, transform 0.3s;
}

.footer-btn:hover {
    background-color: #555;
    color: white;
    transform: scale(1.05);
}

.footer-details {
    margin: 0 auto;
    color: #333;
}

footer .sns {
    margin-top: 30px;
}

footer .sns i {
    font-size: 24px;
    margin-right: 20px;
}
    </style>
    </head>
    
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<body>
	<header>
        <div class="logo">
            <h1>DelTopia</h1>
            <span>개발자들의 천국으로 가다!</span>
        </div>
        <nav>
            <ul>
                <li><a href="/">Home</a></li>
                <li><a href="<c:url value='/jobSeeker/create'/>">Sign-up</a></li>
                <li><a href="/">Company-Service</a></li>
            </ul>
        </nav>
  </header>
  
<div class="container">
    <h1 class="mt-5">이력서 목록</h1>
    <div class="mb-3">
        <a href="/resumes/new" class="btn btn-primary">이력서 작성</a>
    </div>
    <table class="table table-striped mt-3">
        <thead>
            <tr>
                <th>번호</th>
                <th>이름</th>
                <th>제목</th>
                <th>이메일</th>
                <th>연락처</th>
                <th>학력</th>
                <th>경력</th>
                <th>자세히 보기</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="resume" items="${resumes}" varStatus="idx"> 
                <tr>
                    <td>${resume.resumeId}</td>
                    <td>${jobSeekerVo.name}</td>
                    <td>${resume.title}</td>
                    <td>${jobSeekerVo.email}</td>
                    <td>${jobSeekerVo.tel}</td>
                    <td>${resume.education}</td>
                    <td>${resume.experience}</td>
                    <td>
                        <a href="/resumes/${resume.resumeId}" class="btn btn-info">보기</a>
                        <a href="/resumes/${resume.resumeId}/edit" class="btn btn-warning">수정</a>
                        <form action="/resumes/${resume.resumeId}/delete" method="post" style="display:inline;">
                            <button type="submit" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?')">삭제</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
	</div>

 <footer>
        <div class="footer-info">
            <button class="footer-btn" onclick="location.href='#'">회사소개</button>
            <button class="footer-btn" onclick="location.href='#'">인재채용</button>
            <button class="footer-btn" onclick="location.href='#'">회원약관</button>
            <button class="footer-btn" onclick="location.href='#'">개인정보처리방침</button>
            <button class="footer-btn" onclick="location.href='#'">제휴문의</button>
            <button class="footer-btn" onclick="location.href='#'">고객센터</button>
        </div>

        <div class="footer-details">
            <p>(주)DelTopia</p>
            <h5>기업번호: 123-45-67890</h5>
            <h5>우편번호 : 12345, 구로구 디지털로 77길 88, 60층, 대표 : EHYJ</h5>
            <h5>사업자등록 : 222-33-6666, 직업정보제공사업 : 서울 관악 제 800-9호, 통신판매업 : 제 6006-98564호</h5>
            <h5>고객센터: 1234-5678</h5>
        </div>

        <div class="sns">
            <i class="fab fa-twitter"></i>
            <i class="fab fa-facebook-square"></i>
            <i class="fab fa-instagram"></i>
            <i class="fab fa-github"></i>
        </div>
    </footer>
  
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>
