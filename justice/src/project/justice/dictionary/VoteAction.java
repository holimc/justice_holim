package project.justice.dictionary;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/vote/")
public class VoteAction {
	@Autowired
	private VoteDAO vtDAO = null;
	@Autowired
	private VoteDTO vtDTO = null;
	
	@RequestMapping("voteList.ju")
	public String voteList() {
		
		return "dictionary/votePage/voteList";
	}
	
	@RequestMapping("proceedingVote.ju")
	public String proceedingVote() {
		return "dictionary/votePage/proceedingVote";
	}
	@RequestMapping("voteClose.ju")
	public String voteClose() {
		return "dictionary/votePage/voteClose";
	}
	@RequestMapping("voteDelete.ju")
	public String voteDelete() {
		return "dictionary/votePage/voteDelete";
	}
	@RequestMapping("votePro.ju")
	public String votePro() {
		return "dictionary/votePage/votePro";
	}
}
