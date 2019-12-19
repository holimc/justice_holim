package project.justice.dictionary;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/dboard/")
public class BoardAction {
	
	 @Autowired
	 private BoardDAO brdDAO = null;
	 @Autowired
	 private BoardDTO brdDTO = null;
	 
	 @RequestMapping("boardContent.ju")
	 public String boardContent(Model model, int d_board_no) throws Exception {
		 BoardDTO brdDTO = brdDAO.getContent(d_board_no);
		 model.addAttribute("brdDTO", brdDTO);
		 return "/dictionary/dicBoard/boardContent";
	 }
	
	@RequestMapping("boardList.ju")
	public String boardList(@RequestParam(defaultValue="1") String pageNum,
							@RequestParam(defaultValue="wname") String category,
							@RequestParam(defaultValue="") String keyword,
							Model model, HttpSession session) {
		String admin = (String)session.getAttribute("admin");
		String memId = (String)session.getAttribute("memId");
		model.addAttribute("memId",memId);
		
		if(admin!= null) {
			model.addAttribute("admin",admin);
		}
		int pageSize=10;
		model.addAttribute("category", category);
		model.addAttribute("keyword", keyword);
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage -1)* pageSize +1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		List boardList = null;
		try {
			count = brdDAO.getBoardCount(category, keyword);
			if(count>0) {
				boardList = brdDAO.getBoardList(pageNum, category, keyword, startRow, endRow);
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
		model.addAttribute("boardList", boardList );
		
		
		return "/dictionary/dicBoard/boardList";
	}
	
	@RequestMapping("boardWrite.ju")
	public String boardWrite(Model model, String word_no, HttpSession session) throws Exception {
		String memId = (String)session.getAttribute("memId");
		model.addAttribute("user_id",memId);
		
		if(word_no!=null) {
			String wname = brdDAO.getWordData(Integer.parseInt(word_no));
			model.addAttribute("wname",wname);
		}
		model.addAttribute("word_no", word_no);
		
		return "/dictionary/dicBoard/boardWrite";
	}
	
	@RequestMapping("boardWritePro.ju")
	public String boardWritePro(Model model, HttpSession session, BoardDTO brdDTO) throws Exception {
		int check = 0;
		if((String)session.getAttribute("memId")==null) {
			check = -1;
		}else if(brdDTO.getWname() == null || brdDTO.getPrompt() == null || brdDTO.getUser_id() == null || brdDTO.getDetail_content() ==null || brdDTO.getPrompt() ==null ) {
			check = -2;
		}else {
			check = brdDAO.insertPost(brdDTO);
		}
		model.addAttribute("check",check);
		
		
		return "/dictionary/dicBoard/boardWritePro";
	}
	
	@RequestMapping("boardUpdate.ju")
	public String boardUpdate(Model model,HttpSession session, int d_board_no) throws Exception {
		String memId = (String)session.getAttribute("memId");
		String admin = (String)session.getAttribute("admin");
		BoardDTO brdDTO = brdDAO.getUpdatePost(d_board_no);
		model.addAttribute("brdDTO", brdDTO);
		
		// 기본값 0, 실행에러
		int check = 0;
		
		// 글쓴이거나, admin일때. 1
		if(memId.equals(brdDTO.getUser_id()) || admin != null) {
			check = 1;
			System.out.println("hello");
		}else{
			// 글쓴이도 아니고 admin도 아닐때
			check = -1;
		}
		model.addAttribute("check", check);
		
		return "/dictionary/dicBoard/boardUpdate";
	}
	
	@RequestMapping("boardUpdatePro.ju")
	public String boardUpdatePro(Model model, BoardDTO brdDTO,HttpSession session) throws Exception {
		String memId = (String)session.getAttribute("memId");
		String admin = (String)session.getAttribute("admin");
		String user_id = brdDTO.getUser_id();
		
		int check = 0;
		
		System.out.println(memId);
		System.out.println(user_id);
		if(memId.equals(user_id) || admin!= null) {
			check = 1;
			int updateChk = brdDAO.updatePost(brdDTO);
			model.addAttribute("updateChk", updateChk);
		}else {
			check = -1;
		}
		model.addAttribute("check", check);
		
		return "/dictionary/dicBoard/boardUpdatePro";
	}
	
	@RequestMapping("boardDelete.ju")
	public String boardDelete(Model model, HttpSession session, int d_board_no) throws Exception {
		String memId = (String)session.getAttribute("memId");
		String admin = (String)session.getAttribute("admin");
		brdDTO = brdDAO.getUpdatePost(d_board_no);
		String user_id = brdDTO.getUser_id();
		System.out.println(user_id);
		int check = 0;
		if(memId!= null) {
			if(memId.equals(user_id) || admin!= null) {
				check = 1;
			}else {
				check = -1;
			}
		}else {
			check = -1;
		}
		model.addAttribute("check",check);
		model.addAttribute("d_board_no",d_board_no);
		return "/dictionary/dicBoard/boardDelete";
	}
	@RequestMapping("boardDeletePro.ju")
	public String boardDeletePro(Model model, HttpSession session, String passwd, int d_board_no) throws Exception {
		String memId = (String)session.getAttribute("memId");
		String admin = (String)session.getAttribute("admin");
		brdDTO = brdDAO.getUpdatePost(d_board_no);
		String user_id = brdDTO.getUser_id();
		
		int check = 0;
		int delChk = 0;
		// 한번 더 유저체크 check = 0 -> 에러, 1 = 정상, -1 = 정상적인경로가아님 ( 세션없음)
		if(memId.equals(user_id) || admin!= null) {
			check = 1;
			delChk = brdDAO.deletePost(d_board_no, user_id, admin, passwd);
		}else {
			check = -1;
		}
		model.addAttribute("check",check);
		model.addAttribute("delChk",delChk);
		return "/dictionary/dicBoard/boardDeletePro";
	}
	
	
	@RequestMapping("boardRecommend.ju")
	public String boardRecommend(Model model,HttpSession session,int d_board_no, String pageNum) {
		model.addAttribute("pageNum",pageNum);
		String user_id = (String)session.getAttribute("memId");
		
		int chkLogin = 0;
		if(user_id!= null) {
			chkLogin = 1;
			try {
				int check = brdDAO.getRecommend(d_board_no, user_id);
				model.addAttribute("check",check);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("chkLogin",chkLogin);
		return "/dictionary/dicBoard/boardRecommend";
	}
	
	@RequestMapping("insertVoting.ju")
	public String insertVoting() {
		return "/dictionary/dicBoard/insertVoting";
	}
	
		
}
