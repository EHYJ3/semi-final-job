package com.javalab.board.controller;

// Mockito의 정적 메소드들을 바로 사용할 수 있게 해주는 정적 임포트
import static org.mockito.Mockito.*;
// Spring MVC 테스트를 위한 요청 빌더 메소드들을 바로 사용할 수 있게 해주는 정적 임포트
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
// Spring MVC 테스트 결과를 검증하는 메소드들을 바로 사용할 수 있게 해주는 정적 임포트
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import java.util.Arrays;
import java.util.List;

import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.javalab.board.service.JobPostService;
import com.javalab.board.vo.JobPostVo;
import com.javalab.board.vo.MemberVo;

// JUnit 테스트를 Spring의 테스트 컨텍스트 프레임워크와 통합하여 실행
@RunWith(SpringJUnit4ClassRunner.class)
// 애플리케이션의 설정 파일 위치를 지정. 여기서는 root-context.xml과 servlet-context.xml을 사용
@ContextConfiguration(locations = { 
    "file:src/main/webapp/WEB-INF/spring/root-context.xml",
    "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" 
})
// 웹 애플리케이션 컨텍스트를 생성하도록 지시. 이는 웹 관련 빈들을 설정하는 데 사용됨
@WebAppConfiguration
public class JobPostControllerTest {

    // JobPostService 인터페이스의 모의 객체를 생성
    @Mock
    private JobPostService jobPostService;

    // 테스트 대상인 JobPostController에 모의 객체를 주입
    @InjectMocks
    private JobPostController jobPostController;

    // Spring MVC 테스트를 위한 MockMvc 객체 선언
    private MockMvc mockMvc;

    // 각 테스트 메소드 실행 전에 실행되는 설정 메소드
    @Before
    public void setup() {
        // 모의 객체 초기화
        MockitoAnnotations.initMocks(this);
        // MockMvc 객체 생성. 여기서는 JobPostController만을 대상으로 하는 독립 설정 사용
        mockMvc = MockMvcBuilders.standaloneSetup(jobPostController).build();
    }

    // 채용 공고 목록 조회 테스트
    @Test
    @Ignore // 이 테스트를 임시로 무시
    public void testListJobPosts() throws Exception {
        // 테스트용 채용 공고 목록 생성
        List<JobPostVo> jobPosts = Arrays.asList(new JobPostVo(), new JobPostVo());
        // jobPostService.getAllJobPosts() 호출 시 위에서 생성한 목록을 반환하도록 설정
        when(jobPostService.getAllJobPosts()).thenReturn(jobPosts);

        // GET 요청 수행 및 결과 검증
        mockMvc.perform(get("/jobpost/list")) // "/jobpost/list" 경로로 GET 요청 수행
               .andExpect(status().isOk()) // HTTP 상태코드가 200(OK)인지 확인
               .andExpect(view().name("jobpost/list")) // 반환되는 뷰 이름이 "jobpost/list"인지 확인
               .andExpect(model().attribute("jobPosts", jobPosts)); // 모델에 "jobPosts" 속성이 있고, 그 값이 위에서 생성한 목록과 같은지 확인
    }

    // 특정 채용 공고 상세 조회 테스트
    @Test
    @Ignore
    public void testGetJobPostDetail() throws Exception {
        // 테스트용 채용 공고 ID와 객체 생성
        String jobPostId = "1";
        JobPostVo jobPost = new JobPostVo();
        jobPost.setJobPostId(jobPostId);
        // jobPostService.getJobPostById() 호출 시 위에서 생성한 채용 공고 객체를 반환하도록 설정
        when(jobPostService.getJobPostById(jobPostId)).thenReturn(jobPost);

        // GET 요청 수행 및 결과 검증
        mockMvc.perform(get("/jobpost/detail/{id}", jobPostId)) // "/jobpost/detail/1" 경로로 GET 요청 수행
               .andExpect(status().isOk()) // HTTP 상태코드가 200(OK)인지 확인
               .andExpect(view().name("jobpost/detail")) // 반환되는 뷰 이름이 "jobpost/detail"인지 확인
               .andExpect(model().attribute("jobPost", jobPost)); // 모델에 "jobPost" 속성이 있고, 그 값이 위에서 생성한 객체와 같은지 확인

        // jobPostService.incrementHitCount() 메소드가 한 번 호출되었는지 확인
        verify(jobPostService).incrementHitCount(jobPostId);
    }

    // 채용 공고 작성 폼 조회 테스트
    @Test
    @Ignore
    public void testCreateJobPostForm() throws Exception {
        // 테스트용 회원 객체 생성
        MemberVo memberVo = new MemberVo();
        memberVo.setMemberId("testMember");

        // GET 요청 수행 및 결과 검증
        mockMvc.perform(get("/jobpost/create").sessionAttr("memberVo", memberVo)) // "/jobpost/create" 경로로 GET 요청 수행, 세션에 회원 정보 추가
               .andExpect(status().isOk()) // HTTP 상태코드가 200(OK)인지 확인
               .andExpect(view().name("jobpost/form")) // 반환되는 뷰 이름이 "jobpost/form"인지 확인
               .andExpect(model().attributeExists("jobPost")); // 모델에 "jobPost" 속성이 존재하는지 확인
    }

    // 새 채용 공고 생성 테스트
    @Test
    @Ignore
    public void testCreateJobPost() throws Exception {
        // 테스트용 회원 객체 생성
        MemberVo memberVo = new MemberVo();
        memberVo.setMemberId("testMember");

        // POST 요청 수행 및 결과 검증
        mockMvc.perform(post("/jobpost/create") // "/jobpost/create" 경로로 POST 요청 수행
               .sessionAttr("memberVo", memberVo) // 세션에 회원 정보 추가
               .param("title", "Test Job") // 요청 파라미터 추가
               .param("content", "Test Content"))
               .andExpect(status().is3xxRedirection()) // HTTP 상태코드가 3xx(리다이렉션)인지 확인
               .andExpect(redirectedUrl("/jobpost/list")); // 리다이렉션 URL이 "/jobpost/list"인지 확인

        // jobPostService.insertJobPost() 메소드가 한 번 호출되었는지 확인
        // any(JobPostVo.class)는 어떤 JobPostVo 객체라도 허용한다는 의미
        verify(jobPostService).insertJobPost(any(JobPostVo.class));
    }

    // 채용 공고 수정 폼 조회 테스트
    @Test
    @Ignore
    public void testEditJobPostForm() throws Exception {
        // 테스트용 데이터 준비
        String jobPostId = "1";
        MemberVo memberVo = new MemberVo();
        memberVo.setMemberId("testMember");
        JobPostVo jobPost = new JobPostVo();
        jobPost.setJobPostId(jobPostId);
        jobPost.setCompId("testMember");

        // jobPostService.getJobPostById() 호출 시 위에서 생성한 채용 공고 객체를 반환하도록 설정
        when(jobPostService.getJobPostById(jobPostId)).thenReturn(jobPost);

        // GET 요청 수행 및 결과 검증
        mockMvc.perform(get("/jobpost/edit/{id}", jobPostId) // "/jobpost/edit/1" 경로로 GET 요청 수행
               .sessionAttr("memberVo", memberVo)) // 세션에 회원 정보 추가
               .andExpect(status().isOk()) // HTTP 상태코드가 200(OK)인지 확인
               .andExpect(view().name("jobpost/form")) // 반환되는 뷰 이름이 "jobpost/form"인지 확인
               .andExpect(model().attribute("jobPost", jobPost)); // 모델에 "jobPost" 속성이 있고, 그 값이 위에서 생성한 객체와 같은지 확인
    }

    // 채용 공고 수정 테스트
    @Test
    @Ignore
    public void testUpdateJobPost() throws Exception {
        // 테스트용 데이터 준비
        MemberVo memberVo = new MemberVo();
        memberVo.setMemberId("testMember");
        JobPostVo jobPost = new JobPostVo();
        jobPost.setJobPostId("1");
        jobPost.setCompId("testMember");

        // POST 요청 수행 및 결과 검증
        mockMvc.perform(post("/jobpost/update") // "/jobpost/update" 경로로 POST 요청 수행
               .sessionAttr("memberVo", memberVo) // 세션에 회원 정보 추가
               .flashAttr("jobPost", jobPost)) // Flash 속성으로 jobPost 객체 추가
               .andExpect(status().is3xxRedirection()) // HTTP 상태코드가 3xx(리다이렉션)인지 확인
               .andExpect(redirectedUrl("/jobpost/list")); // 리다이렉션 URL이 "/jobpost/list"인지 확인

        // jobPostService.updateJobPost() 메소드가 한 번 호출되었는지 확인
        verify(jobPostService).updateJobPost(jobPost);
    }

    // 채용 공고 삭제 테스트
    @Test
    @Ignore
    public void testDeleteJobPost() throws Exception {
        // 테스트용 데이터 준비
        String jobPostId = "1";
        MemberVo memberVo = new MemberVo();
        memberVo.setMemberId("testMember");
        JobPostVo jobPost = new JobPostVo();
        jobPost.setJobPostId(jobPostId);
        jobPost.setCompId("testMember");

        // jobPostService.getJobPostById() 호출 시 위에서 생성한 채용 공고 객체를 반환하도록 설정
        when(jobPostService.getJobPostById(jobPostId)).thenReturn(jobPost);

        // POST 요청 수행 및 결과 검증
        mockMvc.perform(post("/jobpost/delete") // "/jobpost/delete" 경로로 POST 요청 수행
               .sessionAttr("memberVo", memberVo) // 세션에 회원 정보 추가
               .param("id", jobPostId)) // 요청 파라미터 추가
               .andExpect(status().is3xxRedirection()) // HTTP 상태코드가 3xx(리다이렉션)인지 확인
               .andExpect(redirectedUrl("/jobpost/list")); // 리다이렉션 URL이 "/jobpost/list"인지 확인

        // jobPostService.deleteJobPost() 메소드가 한 번 호출되었는지 확인
        verify(jobPostService).deleteJobPost(jobPostId);
    }

    // 채용 공고 스크랩 테스트
    @Test
    @Ignore
    public void testScrapJobPost() throws Exception {
        // 테스트용 데이터 준비
        String jobPostId = "1";
        MemberVo memberVo = new MemberVo();
        memberVo.setMemberId("testMember");

        // POST 요청 수행 및 결과 검증
        mockMvc.perform(post("/jobpost/scrap/{id}", jobPostId) // "/jobpost/scrap/1" 경로로 POST 요청 수행
               .sessionAttr("memberVo", memberVo)) // 세션에 회원 정보 추가
               .andExpect(status().is3xxRedirection()) // HTTP 상태코드가 3xx(리다이렉션)인지 확인
               .andExpect(redirectedUrl("/jobpost/detail/" + jobPostId)); // 리다이렉션 URL이 "/jobpost/detail/1"인지 확인

        // jobPostService.incrementHitCount() 메소드가 한 번 호출되었는지 확인
        verify(jobPostService).incrementHitCount(jobPostId);
    }
}