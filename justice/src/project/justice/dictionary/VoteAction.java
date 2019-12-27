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
	public String voteClose(Model model) {
		return "dictionary/votePage/voteClose";
	}
	@RequestMapping("voteDelete.ju")
	public String voteDelete(Model model) {
		return "dictionary/votePage/voteDelete";
	}
	@RequestMapping("votePro.ju")
	public String votePro(Model model) {
		return "dictionary/votePage/votePro";
	}
	
}
