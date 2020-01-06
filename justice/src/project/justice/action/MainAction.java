package project.justice.action;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project.justice.member.MemberDAO;
import project.justice.member.MemberVO;
import project.justice.petition.PetitionDAO;
import project.justice.petition.PetitionDTO;
import project.justice.petition.PetitionData2DTO;
import project.justice.petition.PetitionDataDTO;


//test
@Controller
public class MainAction {
	@Autowired
	MemberDAO memberDAO = null;
	@Autowired
	PetitionDAO petitionDAO = null;	
	@RequestMapping("main.ju")
	public String main(Model model) {
		List<PetitionDataDTO> list=null;
		try {
			list = petitionDAO.getMain2();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("list", list);
		return "main/main2";
	}
	@RequestMapping("main2.ju")
	public String main2(Model model) {
		List<PetitionDataDTO> list=null;
		try {
			list = petitionDAO.getMain();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("list", list);
		return "main/main";
	}
	@RequestMapping("main3.ju")
	public String main4(Model model) {
		List<PetitionData2DTO> list=null;
		try {
			list = petitionDAO.getMain3();
			model.addAttribute("list", list);
			Timestamp time = new Timestamp(System.currentTimeMillis());
			model.addAttribute("Time", time);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return "main/main3";
	}
	@RequestMapping("main4.ju")
	public String main3(Model model) {
		try {
			List<PetitionDTO> list = petitionDAO.notAnswer();
			model.addAttribute("list", list);
			Timestamp time = new Timestamp(System.currentTimeMillis());
			model.addAttribute("Time", time);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return "main/main4";
	}
	
	@RequestMapping("login.ju")
	public String login() {		
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
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "member/deleteMemberPro";
	}
	@RequestMapping("adminpage.ju")
	public String adminpage(HttpSession session, Model model) {
		String admin = (String)session.getAttribute("admin");
		int check = 0;
		if(admin== null) {
			check = -1;
		}else if(admin != null){
			check = 1;
			try {
				List list = memberDAO.showMember();
				model.addAttribute("memberList",list);
			}catch (Exception e) {
				e.printStackTrace();
			}
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
