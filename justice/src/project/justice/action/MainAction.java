package project.justice.action;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import project.justice.member.MemberDAO;
import project.justice.member.MemberVO;

//test
@Controller
public class MainAction {
	@Autowired
	MemberDAO memberDAO = null;


	@RequestMapping("login.ju")
	public String login(HttpSession session,Model model) {
		String memId = (String)session.getAttribute("memId");
		if(memId!=null) {
			model.addAttribute("memId", memId);
		}
		return "member/login";
	}
	@RequestMapping("loginPro.ju")
	public String loginPro(MemberVO vo,HttpSession session,Model model) {
		try {
			int check = memberDAO.userCheck(vo);
			if(check==1) {
				session.setAttribute("memId", vo.getId());			
				int adminCheck = memberDAO.adminCheck(vo);
				if(adminCheck==1) {
					session.setAttribute("admin", vo.getId());
				}
			}
			model.addAttribute("check", check);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "member/loginPro";
	}
	@RequestMapping("registForm.ju")
	public String rigistForm() {
		return "member/registForm";
	}
	@RequestMapping("registPro.ju")
	public String registPro(MemberVO vo,Model model) {
		try {
			memberDAO.insertMember(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "member/registPro";
	}
	@RequestMapping("logout.ju")
	public String logout(HttpSession session) {
		session.invalidate();
		return "member/logout";
	}
	@RequestMapping("memberEdit.ju")
	public String memberEdit() {			
		return "member/memberEdit";
	}
	@RequestMapping("memberEdit2.ju")
	public String memberEdit2(MemberVO vo,Model model) {		
		return "member/memberEdit2";
	}
	@RequestMapping("changeMember.ju")
	public String changeMember(MemberVO vo,Model model) {

		try {
			int check = memberDAO.userCheck(vo);
			if(check==1) {
				vo = memberDAO.getMember(vo.getId());
				model.addAttribute("email", vo.getEmail());
			}
			model.addAttribute("check", check);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "member/changeMember";
	}
	@RequestMapping("changeMemberPro.ju")
	public String changeMemberPro(MemberVO vo,HttpSession session) {
		try {
			memberDAO.updateMember(vo);
			session.invalidate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "member/changeMemberPro";
	}
	@RequestMapping("deleteMember.ju")
	public String deleteMember() {			
		return "member/deleteMember";
	}
	@RequestMapping("deleteMemberPro.ju")
	public String deleteMemberPro(HttpSession session,String passwd,Model model) {		
		String id = (String)session.getAttribute("memId");
		try {
			int result = memberDAO.deleteMember(id, passwd);
			model.addAttribute("result", result);
			session.invalidate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "member/deleteMemberPro";
	}
	@RequestMapping("check.ju")
	public @ResponseBody String check(String id,Model model) {
		int check = 0;
		try {
			check = memberDAO.confirmId(id);
			model.addAttribute("id",id);
			model.addAttribute("check", check);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return check+"";
	}
	//admin page
	@RequestMapping("adminpage.ju")
	public String adminpage(@RequestParam(defaultValue="1") String pageNum,
			@RequestParam(defaultValue="id")String category,
			@RequestParam(defaultValue="")String keyword,
			HttpSession session, Model model) throws Exception {
		String admin = (String)session.getAttribute("admin");
		// check 초기값 0
		int check = 0;

		//세션이 없으면 0; 
		if(admin== null) {
			check = -1;
		}else if(admin != null){
			check = 1;

			int pageSize = 10;
			int currentPage = Integer.parseInt(pageNum);
			int start = (currentPage - 1) * pageSize + 1 ;
			int end = currentPage * pageSize;
			int count = 0;
			int number = 0;

			count = memberDAO.getmemberCount(category,keyword);
			if(count>0) {
				List list = memberDAO.showMember(start,end,category,keyword);
				model.addAttribute("memberList",list);
				int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
				int startPage = (int)(currentPage/10)*10+1;
				int pageBlock = 10;
				int endPage = startPage + pageBlock-1;
				if(endPage>pageCount) {
					endPage = pageCount;
				}
				model.addAttribute("pageCount",pageCount);
				model.addAttribute("pageCount", pageCount);
				model.addAttribute("startPage", startPage );
				model.addAttribute("endPage", endPage );
			}
			model.addAttribute("count",count);
		}

		model.addAttribute("check", check);

		return "member/adminPage";
	}

	@RequestMapping("adminUpdate.ju")
	public String adminUpdate(String id, Model model, HttpSession session) {
		String admin = (String)session.getAttribute("admin");
		int check = 0;
		if(admin == null) {
			check = -1;
		}else if(admin != null) {
			check = 1;
			try{
				MemberVO vo = memberDAO.getMember(id);
				model.addAttribute("vo", vo);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("check", check);

		return "member/adminUpdate";
	}
	@RequestMapping("adminUpdatePro.ju")
	public String adminUpdatePro(MemberVO vo, Model model, HttpSession session) {
		String admin = (String)session.getAttribute("admin");
		int check = 0;
		if(admin == null) {
			check = -1;
		}else if(admin != null) {
			check = 1;
			try {
				int updateCheck = 0;
				updateCheck= memberDAO.updateMemberByAdmin(vo);
				model.addAttribute("updateCheck", updateCheck);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("check",check);

		return "member/adminUpdatePro";
	}
	@RequestMapping("adminDeletePro.ju")
	public String adminDeletePro(HttpSession session,Model model, String id) {
		String admin = (String)session.getAttribute("admin");
		int check = 0;
		if(admin == null) {
			check = -1;
		}else if(admin != null) {
			check = 1;
			try {
				int delChk = memberDAO.deleteMemberByAdmin(id);
				model.addAttribute("delChk",delChk);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("check",check);
		return "member/adminDeletePro";
	}


}
