package com.itwillbs.Code_Green.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.itwillbs.Code_Green.service.AdminService;
import com.itwillbs.Code_Green.vo.AdminVO;

@Controller
public class LoginController {
	@Autowired
	private AdminService service3;
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

//	 "/MemberLoginForm.me" 요청에 대해 member/member_login_form.jsp 페이지 실행
//	@GetMapping(value = "/login")
//	public String login() {
//		return "member/login";
//	}


//	}
	@GetMapping(value = "/MemberLoginForm")
	public String login() {
		return "member/login";
	}
	
	@PostMapping(value = "/AdminLoginPro.me")
	public String adminloginPro(@ModelAttribute AdminVO admin, Model model, HttpSession session) {
		AdminVO adminResult = service3.loginAdmin(admin);
		
		
		if (adminResult == null) {
			model.addAttribute("msg", "관리자 로그인 실패! 힝~");
//			System.out.println(admin.getAdmin_id() + ", " + admin.getAdmin_pass());
			return "member/fail_back";
		} else {
			session.setAttribute("sId", adminResult.getAdmin_id());
			return "redirect:/";
		}

	}

//	 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {

//		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		System.out.println("네이버:" + naverAuthUrl);

//		// 네이버
		model.addAttribute("url", naverAuthUrl);

		/* 생성한 인증 URL을 View로 전달 */
		return "member/login";
	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "member/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException {
		System.out.println("여기는 callback");

		OAuth2AccessToken oauthToken;

		oauthToken = naverLoginBO.getAccessToken(session, code, state);

		System.out.println("code: " + code);
		System.out.println("oauthToken: " + oauthToken);
		
//		 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken);

		System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());

		model.addAttribute("result", apiResult);

		System.out.println("result" + apiResult);
		/* 네이버 로그인 성공 페이지 View 호출 */

		return "member/naverLogin_result";
	}

}
