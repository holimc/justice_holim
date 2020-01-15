package project.justice.dictionary;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/dictionary/")
public class DictionaryAction {
	
	@Autowired
	private ReportDTO rptDTO = null;
	@Autowired
	private DictionaryDAO dicDAO = null;
	@Autowired
	private DictionaryDTO dicDTO = null;
	@Autowired
	private SimpleDateFormat sdf = null;
	
	// 리스트
	@RequestMapping("list.ju")
	public String dictionaryList(@RequestParam(defaultValue="1") String pageNum,
			@RequestParam(defaultValue="wname") String category,
			@RequestParam(defaultValue="") String keyword,
			Model model,HttpSession session) {
		
		if(session.getAttribute("admin")!= null) {
			String admin = (String)session.getAttribute("admin");
			model.addAttribute("admin",admin);
		}
		
		int pageSize = 10;
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageNum", pageNum);
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage -1)* pageSize +1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		List dictionaryList = null;
		try {
			count = dicDAO.getDictionaryCount(category, keyword);
			if(count>0) {
				dictionaryList = dicDAO.getDictionary(startRow, endRow, category, keyword);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		if(count>0) {
			int pageCount = count/pageSize + (count% pageSize == 0? 0:1);
			int startPage = (int)(currentPage/10)*10+1;
			int pageBlock = 10;
			int endPage = startPage + pageBlock-1;
			if(endPage>pageCount) {
				endPage = pageCount;
			}
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("startPage", startPage );
			model.addAttribute("endPage", endPage );
		}
		number = count - (currentPage-1)*pageSize;
		model.addAttribute("count", count );
		model.addAttribute("currentPage", currentPage );
		model.addAttribute("number", number );
		model.addAttribute("dictionaryList", dictionaryList );
		
		
		return "dictionary/dictionary/dictionaryList";
	}
	
	//추가
	@RequestMapping("insertDictionary.ju")
	public String insertDictionary(HttpSession session, Model model) {
		String admin = (String)session.getAttribute("admin");
		int check = 0;
		if(admin!= null) {
			model.addAttribute("admin",admin);
			check = 1;
		}
		model.addAttribute("check", check);
		return "dictionary/dictionary/insertDictionary";
	}
	//추가
	@RequestMapping("insertDictionaryPro.ju")
	public String insertDictionaryPro(DictionaryDTO dicDTO, Model model, HttpSession session) {
		String admin = (String)session.getAttribute("admin");
		int adminChk = 0;
		if(admin!= null) {
			try {
				int check = dicDAO.insertDictionary(dicDTO);
				model.addAttribute("check", check);
				adminChk = 1;
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("adminChk",adminChk);
		return "dictionary/dictionary/insertDictionaryPro";
	}
	
	
	//수정
	@RequestMapping("updateDictionary.ju")
	public String updateDictionary(int word_no,String pageNum, Model model,HttpSession session) {
		String admin = (String)session.getAttribute("admin");
		int adminChk = 0;
		if(admin!=null) {
			try {
				DictionaryDTO dicDTO = dicDAO.getUpdateDictionary(word_no);
				model.addAttribute("dicDTO", dicDTO);
				adminChk = 1;
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("adminChk",adminChk);
		
		return "dictionary/dictionary/updateDictionary";
	}
	//수정
	
	@RequestMapping("updateDictionaryPro.ju")
	public String updateDictionaryPro(DictionaryDTO dicDTO, Model model,HttpSession session) {
		String admin = (String)session.getAttribute("admin");
		int adminChk = 0;
		if(admin!=null) {
			try {
				int check = dicDAO.updateDictionary(dicDTO);
				model.addAttribute("check", check);
				adminChk = 1;
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("adminChk",adminChk);
		return "dictionary/dictionary/updateDictionaryPro";
		
		
	}
	
	//삭제
	@RequestMapping("deleteDictionary.ju")
	public String deleteDictionary(int word_no, Model model,HttpSession session) {
		String admin = (String)session.getAttribute("admin");
		int adminChk = 0;
		
		if(admin!= null) {
			int check = 0;
			try{
				check = dicDAO.deleteDictionary(word_no);
				model.addAttribute("check",check);
				adminChk = 1;
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("adminChk",adminChk);
		
		return "dictionary/dictionary/deleteDictionaryPro";
	}
	
	
	//추천
	@RequestMapping("recommendDictionary.ju")
	public String recommendDictionary(Model model, String pageNum, int word_no,HttpSession session) {
		// 매개변수 ID 추가
		model.addAttribute("pageNum",pageNum);
		String user_id = (String)session.getAttribute("memId");
		int chkLogin = 0;
		if(user_id!= null) {
			chkLogin = 1;
			try {
				int check = dicDAO.getRecommend(word_no, user_id);
				model.addAttribute("check",check);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("chkLogin",chkLogin);
		return "dictionary/dictionary/recommendDictionary";
	}
	
	// 신고
	@RequestMapping("reportDictionary.ju")
	public String reportDictionary(Model model, int word_no,HttpSession session) throws Exception {
		String user_id = (String)session.getAttribute("memId");
		int chkLogin =0;
		if(user_id != null) {
			chkLogin=1;
			model.addAttribute("user_id",user_id);
			DictionaryDTO dicDTO = dicDAO.getUpdateDictionary(word_no);
			model.addAttribute("dicDTO", dicDTO);
		}
		model.addAttribute("chkLogin",chkLogin);
		return "dictionary/dictionary/reportDictionary";
	}
	//신고
	@RequestMapping("reportDictionaryPro.ju")
	public String reportDictionaryPro(ReportDTO rptDTO, Model model,HttpSession session) {
		String user_id = (String)session.getAttribute("memId");
		int chkLogin = 0;
		
		if(user_id!=null) {
			chkLogin=1;
			try {
				int check = dicDAO.reportWord(rptDTO);
				model.addAttribute("check",check);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("chkLogin",chkLogin);
		return "dictionary/dictionary/reportDictionaryPro";
	}
	
	//신고 게시물 조회
	@RequestMapping("showReport.ju")
	public String showReport(Model model,HttpSession session) {
		String admin = (String)session.getAttribute("admin");
		int adminChk = 0;
		if(admin!= null) {
			try {
				List reportList = dicDAO.getReportList();
				model.addAttribute("reportList", reportList);
				adminChk = 1;
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("adminChk",adminChk);
		return "dictionary/dictionary/showReport";
	}
	
	@RequestMapping("showReportPro.ju")
	public String showReportPro(Model model, int word_no,HttpSession session) {
		String admin = (String)session.getAttribute("admin");
		int adminChk = 0;
		if(admin!= null) {
			try{
				List reportContent = dicDAO.getReport(word_no);
				model.addAttribute("reportContent", reportContent);
				adminChk = 1;
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		model.addAttribute("adminChk",adminChk);
		
		return "dictionary/dictionary/showReportPro";
	}
	
	@RequestMapping("test.ju")
	public String test() {
		
		return "dictionary/dictionary/test";
	}
	
	// 사전 기능을 위한 dicToolTip 
	@RequestMapping("dicToolTip")
	public String dicToolTip(Model model,String keyword) {
		// selection으로 받아오는 keyword에 대한 유효성검사. null값인지 확인한다.
		if(keyword!=null && keyword!="") {
			// 정규식을 통해 숫자 혹은 특수문자를 제외하고, 공백을 없앤다.
			String regexp = "[^가-힣]";
			keyword = keyword.replaceAll(regexp, "");
			keyword = keyword.replace(" ", "");
		}
		// 단어의 길이가 너무 길 경우 dicToolTip에서 에러메세지 출력을 위한 처리
		if(keyword.length()>10) {
			model.addAttribute("lengthError","error");
		}
		// 단어의 길이가 적당하며, 공백값이 아닐때 DAO에서 값을 꺼내오고 이를 view페이지로 보낸다
		if(keyword!=null && keyword!="" && keyword.length()>0 && keyword.length()<10 ) {
			List toolTipList = dicDAO.showToolTip(keyword);
			model.addAttribute("toolTipList",toolTipList);
		}
		model.addAttribute("keyword",keyword);
		return "dictionary/dictionary/dicToolTip";
	}
	
	
	
	

}
