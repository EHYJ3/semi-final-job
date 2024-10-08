<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
<script src="/resources/assets/js/color-modes.js"></script>

   
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
   content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.122.0">


<title>Album list · Bootstrap v5.3</title>

<link rel="canonical"
   href="https://getbootstrap.com/docs/5.3/examples/album/">
   
   


<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

<link href="/resources/assets/dist/css/bootstrap.min.css"
   rel="stylesheet">
<style>
 body {
   font-family: Arial, sans-serif;
   margin: 0;
   padding: 0;
   box-sizing: border-box;
}

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

.bd-placeholder-img {
   font-size: 1.125rem;
   text-anchor: middle;
   -webkit-user-select: none;
   -moz-user-select: none;
   user-select: none;
}

@media ( min-width : 768px) {
   .bd-placeholder-img-lg {
      font-size: 3.5rem;
   }
}

.b-example-divider {
   width: 100%;
   height: 3rem;
   background-color: rgba(0, 0, 0, .1);
   border: solid rgba(0, 0, 0, .15);
   border-width: 1px 0;
   box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
      rgba(0, 0, 0, .15);
}

.b-example-vr {
   flex-shrink: 0;
   width: 1.5rem;
   height: 100vh;
}

.bi {
   vertical-align: -.125em;
   fill: currentColor;
}

.nav-scroller {
   position: relative;
   z-index: 2;
   height: 2.75rem;
   overflow-y: hidden;
}

.nav-scroller .nav {
   display: flex;
   flex-wrap: nowrap;
   padding-bottom: 1rem;
   margin-top: -1px;
   overflow-x: auto;
   text-align: center;
   white-space: nowrap;
   -webkit-overflow-scrolling: touch;
}

.btn-bd-primary { -
   -bd-violet-bg: #712cf9; -
   -bd-violet-rgb: 112.520718, 44.062154, 249.437846; -
   -bs-btn-font-weight: 600; -
   -bs-btn-color: var(- -bs-white); -
   -bs-btn-bg: var(- -bd-violet-bg); -
   -bs-btn-border-color: var(- -bd-violet-bg); -
   -bs-btn-hover-color: var(- -bs-white); -
   -bs-btn-hover-bg: #6528e0; -
   -bs-btn-hover-border-color: #6528e0; -
   -bs-btn-focus-shadow-rgb: var(- -bd-violet-rgb); -
   -bs-btn-active-color: var(- -bs-btn-hover-color); -
   -bs-btn-active-bg: #5a23c8; -
   -bs-btn-active-border-color: #5a23c8;
}

.bd-mode-toggle {
   z-index: 1500;
}

.bd-mode-toggle .dropdown-menu .active .bi {
   display: block !important;
}
 body {
        font-family: 'Noto Sans KR', Arial, sans-serif;
        background-color: #f5f5f5;
        color: #333;
    }

    .filter-container {
        background-color: #ffffff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        margin-bottom: 20px;
    }

    .filter-buttons {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
        margin-bottom: 15px;
    }

    .filter-buttons button {
        padding: 10px 20px;
        font-size: 14px;
        font-weight: 600;
        border: 2px solid #3498db;
        background-color: #ffffff;
        color: #3498db;
        border-radius: 25px;
        transition: all 0.3s ease;
        cursor: pointer;
    }

    .filter-buttons button:hover,
    .filter-buttons button.active {
        background-color: #3498db;
        color: #ffffff;
    }
    .filter-options {
        display: flex;
        flex-wrap: wrap;
        gap: 8px;
        margin-top: 10px;
    }

    .filter-options button {
        padding: 6px 12px;
        font-size: 13px;
        border: 1px solid #bdc3c7;
        background-color: #ffffff;
        color: #34495e;
        border-radius: 20px;
        transition: all 0.3s ease;
        cursor: pointer;
    }

    .filter-options button:hover,
    .filter-options button.btn-success {
        background-color: #2ecc71;
        color: #ffffff;
        border-color: #2ecc71;
    }
     @keyframes pulse {
        0% {
            box-shadow: 0 0 0 0 rgba(52, 152, 219, 0.4);
        }
        70% {
            box-shadow: 0 0 0 10px rgba(52, 152, 219, 0);
        }
        100% {
            box-shadow: 0 0 0 0 rgba(52, 152, 219, 0);
        }
    }

    .filter-buttons button:focus {
        animation: pulse 1.5s infinite;
    }
    
    @keyframes gradientBG {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}

section.py-5 {
    background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
    background-size: 400% 400%;
    animation: gradientBG 15s ease infinite;
    color: white;
}
footer {
    background-color: #f9f9f9;
    color: white;
    text-align: center;
    padding: 0.5em;
    
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
   color: white;
   border: none;
   padding: 0.5em 1em;
   cursor: pointer;
   border-radius: 4px;
   transition: background-color 0.3s, transform 0.3s;
}

.footer-btn:hover {
   background-color: #555;
   transform: scale(1.05);
}

.footer-details {
   margin: 0 auto;
   color: #ccc;
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
                <li><a href="#">Company-Service</a></li>
            </ul>
        </nav>
    </header>
 
    


   <svg xmlns="http://www.w3.org/2000/svg" class="d-none">
      <symbol id="check2" viewBox="0 0 16 16">
        <path
         d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z" />
      </symbol>
      <symbol id="circle-half" viewBox="0 0 16 16">
        <path
         d="M8 15A7 7 0 1 0 8 1v14zm0 1A8 8 0 1 1 8 0a8 8 0 0 1 0 16z" />
      </symbol>
      <symbol id="moon-stars-fill" viewBox="0 0 16 16">
        <path
         d="M6 .278a.768.768 0 0 1 .08.858 7.208 7.208 0 0 0-.878 3.46c0 4.021 3.278 7.277 7.318 7.277.527 0 1.04-.055 1.533-.16a.787.787 0 0 1 .81.316.733.733 0 0 1-.031.893A8.349 8.349 0 0 1 8.344 16C3.734 16 0 12.286 0 7.71 0 4.266 2.114 1.312 5.124.06A.752.752 0 0 1 6 .278z" />
        <path
         d="M10.794 3.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387a1.734 1.734 0 0 0-1.097 1.097l-.387 1.162a.217.217 0 0 1-.412 0l-.387-1.162A1.734 1.734 0 0 0 9.31 6.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387a1.734 1.734 0 0 0 1.097-1.097l.387-1.162zM13.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.156 1.156 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.156 1.156 0 0 0-.732-.732l-.774-.258a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732L13.863.1z" />
      </symbol>
      <symbol id="sun-fill" viewBox="0 0 16 16">
        <path
         d="M8 12a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z" />
      </symbol>
    </svg>

   <div
      class="dropdown position-fixed bottom-0 end-0 mb-3 me-3 bd-mode-toggle">
      <button
         class="btn btn-bd-primary py-2 dropdown-toggle d-flex align-items-center"
         id="bd-theme" type="button" aria-expanded="false"
         data-bs-toggle="dropdown" aria-label="Toggle theme (auto)">
         <svg class="bi my-1 theme-icon-active" width="1em" height="1em">
            <use href="#circle-half"></use></svg>
         <span class="visually-hidden" id="bd-theme-text">Toggle theme</span>
      </button>
      <ul class="dropdown-menu dropdown-menu-end shadow"
         aria-labelledby="bd-theme-text">
         <li>
            <button type="button"
               class="dropdown-item d-flex align-items-center"
               data-bs-theme-value="light" aria-pressed="false">
               <svg class="bi me-2 opacity-50" width="1em" height="1em">
                  <use href="#sun-fill"></use></svg>
               Light
               <svg class="bi ms-auto d-none" width="1em" height="1em">
                  <use href="#check2"></use></svg>
            </button>
         </li>
         <li>
            <button type="button"
               class="dropdown-item d-flex align-items-center"
               data-bs-theme-value="dark" aria-pressed="false">
               <svg class="bi me-2 opacity-50" width="1em" height="1em">
                  <use href="#moon-stars-fill"></use></svg>
               Dark
               <svg class="bi ms-auto d-none" width="1em" height="1em">
                  <use href="#check2"></use></svg>
            </button>
         </li>
         <li>
            <button type="button"
               class="dropdown-item d-flex align-items-center active"
               data-bs-theme-value="auto" aria-pressed="true">
               <svg class="bi me-2 opacity-50" width="1em" height="1em">
                  <use href="#circle-half"></use></svg>
               Auto
               <svg class="bi ms-auto d-none" width="1em" height="1em">
                  <use href="#check2"></use></svg>
            </button>
         </li>
      </ul>
   </div>
   <main>

      <section class="py-5 text-center container">
         <div class="row py-lg-5">
            <div class="col-lg-6 col-md-8 mx-auto">
               <h1 class="fw-light">채용 공고 목록</h1>
               <p class="lead text-body-secondary">다양한 기업의 채용 기회를 확인하세요. 여러분의
                  경력을 한 단계 발전시킬 수 있는 기회가 기다리고 있습니다.</p>
               <p>
                  <a href="/jobPost/create" class="btn btn-primary my-2">채용 공고 등록</a>   
               </p>
            </div>
         </div>
      </section>


      
      <div class="album py-5 bg-body-tertiary">
         <div class="container">
         <div class="container mb-4">
         <div class="filter-buttons">
            <button class="btn btn-outline-primary me-2"
               onclick="toggleFilterOptions('function')">기능별</button>
            <button class="btn btn-outline-primary me-2"
               onclick="toggleFilterOptions('experience')">경력별</button>
            <button class="btn btn-outline-primary me-2"
               onclick="toggleFilterOptions('job')">직업별</button>
            <button class="btn btn-outline-primary me-2"
               onclick="toggleFilterOptions('location')">지역별</button>
         </div>

         <div id="functionFilter" class="filter-options mt-2"
            style="display: none;">
            <button class="btn btn-sm btn-outline-secondary me-1">IT</button>
            <button class="btn btn-sm btn-outline-secondary me-1">마케팅</button>
            <button class="btn btn-sm btn-outline-secondary me-1">영업</button>
         </div>

         <div id="experienceFilter" class="filter-options mt-2"
            style="display: none;">
            <button class="btn btn-sm btn-outline-secondary me-1">신입</button>
            <button class="btn btn-sm btn-outline-secondary me-1">1~3년</button>
            <button class="btn btn-sm btn-outline-secondary me-1">3~5년</button>
         </div>

         <div id="jobFilter" class="filter-options mt-2"
            style="display: none;">
            <button class="btn btn-sm btn-outline-secondary me-1">프론트엔드 개발자</button>
            <button class="btn btn-sm btn-outline-secondary me-1">백엔드 개발자</button>
            <button class="btn btn-sm btn-outline-secondary me-1">풀스텍 개발자</button>
         </div>

         <div id="locationFilter" class="filter-options mt-2"
            style="display: none;">
            <button class="btn btn-sm btn-outline-secondary me-1">서울</button>
            <button class="btn btn-sm btn-outline-secondary me-1">경기</button>
            <button class="btn btn-sm btn-outline-secondary me-1">부산</button>
         </div>
      </div>
         
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3"
               id="jobPostings">
               <!-- 채용 공고 카드들이 여기에 동적으로 추가됩니다 -->
            </div>
         </div>
      </div>
   </main>
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

   <script>
var jobPostings = [
    <c:forEach items="${jobPosts}" var="post" varStatus="status">
        {
            jobPostId: "${post.jobPostId}",
            compId: "${post.compId}",
            title: "${post.title}",
            content: "${post.content}",
            address: "${post.address}",
            function: "${post.function}",
            job: "${post.job}",
            location: "${post.location}",
            experience: "${post.experience}",
            endDate: "${post.endDate}"
        }<c:if test="${!status.last}">,</c:if>
    </c:forEach>
];
</script>


   <script src="/resources/js/jobPost-list.js"></script>
</body>
</html>