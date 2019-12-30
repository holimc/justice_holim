package project.justice.dictionary;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/vote/")
public class VoteAction {
	@Autowired
	private VoteDAO vtDAO = null;
	@Autowired
	private VoteDTO vtDTO = null;
	
	@RequestMapping("voteList.ju")
	public String voteList(@RequestParam(defaultValue="1") String pageNum, Model model, HttpSession session) {
		
		String admin = (String)session.getAttribute("admin");
		String memId = (String)session.getAttribute("memId");
		model.addAttribute("memId",memId);
		
		if(admin!= null) {
			model.addAttribute("admin",admin);
		}
		int pageSize=10;
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage -1)* pageSize +1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		List voteList = null;
		try {
			count = vtDAO.getVoteCount();
			if(count>0) {
				voteList = vtDAO.getVoteList(startRow, endRow);
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
		model.addAttribute("voteList", voteList );
		
		return "dictionary/votePage/voteList";
	}
	@RequestMapping("voteContent.ju")
	public String voteContent(Model model,int vote_no) throws Exception {
		
		HashMap dtoMap = vtDAO.getVoteContent(vote_no);
		BoardDTO brdDTO = (BoardDTO)dtoMap.get("brdDTO");
		VoteDTO vtDTO = (VoteDTO)dtoMap.get("vtDTO");
		model.addAttribute("brdDTO",brdDTO);
		model.addAttribute("vtDTO", vtDTO);
		model.addAttribute("vote_no",vote_no);
		return "dictionary/votePage/voteContent";
	}
	
	
	@RequestMapping("voteClose.ju")
	public String voteClose(Model model,
			@RequestParam(value="chbox[]") List<String> chkArr,
			HttpSession session) throws Exception {
		String admin = (String)session.getAttribute("admin");
		if(admin!= null) {
			int check = 0;
			if(chkArr!=null) {
				check = vtDAO.closeVote(chkArr);
			}
			model.addAttribute("check", check);
		}
		return "dictionary/votePage/voteClose";
	}
	@RequestMapping("voteDelete.ju")
	public String voteDelete(Model model,
			@RequestParam(value="chbox[]") List<String> chkArr,
			HttpSession session) throws Exception {
		String admin = (String)session.getAttribute("admin");
		if(admin!= null) {
			int check = 0;
			if(chkArr!=null) {
				check = vtDAO.deleteVote(chkArr);
			}
			model.addAttribute("check",check);
		}
		
		
		return "dictionary/votePage/voteDelete";
	}
	@RequestMapping("votePro.ju")
	public String votePro(Model model, String type, HttpSession session, int vote_no) throws Exception {
		int check = 0;
		String memId = (String)session.getAttribute("memId");
		String voteStatus = vtDAO.getVoteStatus(vote_no);
		
		// 투표가 닫혀있으면 check -4
		if(voteStatus.equals("open")) {
			// type이 없이 pro에 접근시 check = -2
			if(type==null || vote_no == 0) {
				check = -2;
			}else {
				// 세션이 없을시 check = -1
				if(memId==null) {
					check = -1;
				}else {
					HashMap hm = new HashMap();
					hm.put("user_id", memId);
					hm.put("type", type);
					hm.put("vote_no", vote_no);
					// 정상적으로 DAO가 실행되면 1, 실행에러 0, 중복시 -3
					check = vtDAO.votingPost(hm);
				}
			}
		}else {
			check = -4;
		}
		model.addAttribute("check",check);
		return "dictionary/votePage/votePro";
	}
}
