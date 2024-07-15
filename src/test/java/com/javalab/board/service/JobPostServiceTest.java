package com.javalab.board.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.javalab.board.vo.JobPostVo;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@Slf4j
public class JobPostServiceTest {

	@Autowired
	private JobPostService jobPostService;

	/**
	 * JobPostService 빈이 제대로 주입되었는지 확인하는 테스트 이 테스트는 Spring 컨텍스트가 올바르게 구성되었고
	 * JobPostService 빈이 생성되었는지 확인합니다.
	 */
	@Test
	@Ignore
	public void testJobPostService() {
		assertNotNull(jobPostService);
		log.info("jobPostService 인터페이스 : " + jobPostService);
	}

	/**
	 * 모든 채용 공고를 조회하는 기능을 테스트 이 테스트는 데이터베이스에 채용 공고가 존재하는지 확인하고, 조회된 공고의 수를 로그로
	 * 출력합니다.
	 */
	@Test
	@Ignore
	public void testGetAllJobPosts() {
		List<JobPostVo> jobPosts = jobPostService.getAllJobPosts();
		assertNotNull("채용 공고 목록이 null입니다.", jobPosts);
		assertTrue("채용 공고가 하나도 없습니다.", jobPosts.size() > 0);
		log.info("조회된 채용 공고 수: " + jobPosts.size());
	}

	/**
	 * 특정 ID의 채용 공고를 조회하는 기능을 테스트 이 테스트는 주어진 ID의 채용 공고가 존재하는지 확인하고, 조회된 공고의 정보를
	 * 검증합니다.
	 */
	@Test
	@Ignore
	public void testGetJobPostById() {
		String jobPostId = "JP001";
		JobPostVo jobPost = jobPostService.getJobPostById(jobPostId);
		assertNotNull("해당 ID의 채용 공고가 없습니다.", jobPost);
		assertEquals("ID가 일치하지 않습니다.", jobPostId, jobPost.getJobPostId());
		log.info("조회된 채용 공고: " + jobPost);
	}

	/**
	 * 새로운 채용 공고를 등록하는 기능을 테스트 이 테스트는 새로운 채용 공고 객체를 생성하고 데이터베이스에 삽입한 후, 삽입 결과를
	 * 확인합니다.
	 */
	@Test
	@Ignore
	public void testInsertJobPost() {
		JobPostVo jobPost = new JobPostVo();
		jobPost.setJobPostId("JP999");
		jobPost.setCompId("COMP001");
		jobPost.setTitle("테스트 채용 공고");
		jobPost.setContent("이것은 테스트 채용 공고입니다.");
		jobPost.setPosition("개발자");
		jobPost.setSalary("4000만원");
		jobPost.setExperience("신입");
		jobPost.setEducation("대졸");
		jobPost.setAddress("서울시");
		jobPost.setEndDate(new Timestamp(System.currentTimeMillis() + 86400000)); // 내일
		jobPost.setCreated(new Timestamp(System.currentTimeMillis())); // 현재 시간
		jobPost.setHomePage("test999@naver.com");

		int result = jobPostService.insertJobPost(jobPost);
		assertEquals("채용 공고 삽입 실패", 1, result);
		log.info("삽입된 채용 공고 ID: " + jobPost.getJobPostId());
	}

	/**
	 * 기존 채용 공고를 수정하는 기능을 테스트 이 테스트는 특정 ID의 채용 공고 정보를 수정하고, 수정된 정보가 올바르게 저장되었는지
	 * 확인합니다.
	 */
	@Test
	@Ignore
	public void testUpdateJobPost() {
		JobPostVo jobPost = new JobPostVo();
		jobPost.setJobPostId("JP999");
		jobPost.setTitle("수정된 채용 공고 제목");
		jobPost.setSalary("5000만원");

		int result = jobPostService.updateJobPost(jobPost);
		assertEquals("채용 공고 수정 실패", 1, result);

		JobPostVo updatedJobPost = jobPostService.getJobPostById("JP999");
		assertEquals("제목이 수정되지 않았습니다.", "수정된 채용 공고 제목", updatedJobPost.getTitle());
		assertEquals("급여가 수정되지 않았습니다.", "5000만원", updatedJobPost.getSalary());
		log.info("수정된 채용 공고: " + updatedJobPost);
	}

	/**
	 * 채용 공고를 삭제하는 기능을 테스트 이 테스트는 특정 ID의 채용 공고를 삭제하고, 해당 공고가 실제로 삭제되었는지 확인합니다.
	 */
	@Test
	@Ignore
	public void testDeleteJobPost() {
		String jobPostId = "JP002"; // 삭제할 채용 공고 ID (테스트용으로 미리 생성해야 함)

		// 삭제 전 채용 공고 존재 여부 확인
		JobPostVo beforeDelete = jobPostService.getJobPostById(jobPostId);
		if (beforeDelete == null) {
			log.info("테스트할 채용 공고(ID: {})가 존재하지 않습니다. 테스트를 중단합니다.", jobPostId);
			return;
		}

		log.info("채용 공고 삭제 시도 (ID: {})", jobPostId);

		int result = jobPostService.deleteJobPost(jobPostId);
		log.info("삭제 결과: {} 행이 영향을 받았습니다.", result);

		assertEquals("채용 공고 삭제 실패", 1, result);

		JobPostVo deletedJobPost = jobPostService.getJobPostById(jobPostId);

		if (deletedJobPost == null) {
			log.info("채용 공고(ID: {})가 성공적으로 삭제되었습니다.", jobPostId);
		} else {
			log.error("채용 공고(ID: {})가 삭제되지 않았습니다.", jobPostId);
		}

		assertNull("채용 공고가 삭제되지 않았습니다.", deletedJobPost);
	}

	/**
	 * 필터링된 채용 공고 목록을 조회하는 기능을 테스트 이 테스트는 특정 조건(직무, 급여 등)으로 채용 공고를 필터링하고, 결과가 조건과
	 * 일치하는지 확인합니다.
	 */
	@Test
	@Ignore
	public void testGetFilteredJobPosts() {
		Map<String, Object> filters = new HashMap<>();
		filters.put("position", "주니어 개발자");
		filters.put("salary", "3000만원");

		List<JobPostVo> filteredPosts = jobPostService.getFilteredJobPosts(filters);
		assertNotNull("필터링된 채용 공고 목록이 null입니다.", filteredPosts);
		for (JobPostVo post : filteredPosts) {
			assertEquals("직무가 일치하지 않습니다.", "주니어 개발자", post.getPosition());
			assertEquals("급여가 일치하지 않습니다.", "3000만원", post.getSalary());
		}
		log.info("필터링된 채용 공고 수: " + filteredPosts.size());
	}

	/**
	 * 채용 공고의 조회수를 증가시키는 기능을 테스트 이 테스트는 특정 채용 공고의 조회수를 증가시키고, 실제로 조회수가 1 증가했는지
	 * 확인합니다.
	 */
	@Test
	@Ignore
	public void testIncrementHitCount() {
		String jobPostId = "JP001";
		JobPostVo jobPost = jobPostService.getJobPostById(jobPostId);
		int initialHitCount = jobPost.getHitNO();

		int result = jobPostService.incrementHitCount(jobPostId);
		assertEquals("조회수 증가 실패", 1, result);

		JobPostVo updatedJobPost = jobPostService.getJobPostById(jobPostId);
		assertEquals("조회수가 1 증가하지 않았습니다.", initialHitCount + 1, updatedJobPost.getHitNO());
		log.info("증가된 조회수: " + updatedJobPost.getHitNO());
	}

	/**
	 * 채용 공고의 상세 정보를 조회하는 기능을 테스트 이 테스트는 특정 ID의 채용 공고 상세 정보를 조회하고, 필요한 정보가 모두 포함되어
	 * 있는지 확인합니다.
	 */
	@Test
	@Ignore
	public void testGetJobPostDetail() {
		String jobPostId = "JP001";
		JobPostVo jobPostDetail = jobPostService.getJobPostDetail(jobPostId);
		assertNotNull("채용 공고 상세 정보가 null입니다.", jobPostDetail);
		assertEquals("ID가 일치하지 않습니다.", jobPostId, jobPostDetail.getJobPostId());
		assertNotNull("회사 정보가 null입니다.", jobPostDetail.getCompId());
		log.info("조회된 채용 공고 상세 정보: " + jobPostDetail);
	}
}