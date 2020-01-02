package project.justice.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project.justice.petition.AnswerDTO;
import project.justice.petition.PetitionDAO;
import project.justice.petition.PetitionDTO;
import project.justice.petition.PetitionDataDTO;

@Controller
@RequestMapping("/petitions/")
public class PetitionAction {
	@Autowired
	PetitionDAO petitionDAO = null;
	@Autowired
	PetitionDTO petitionDTO= null;
	
	@RequestMapping("main.ju")
	public String main(Model model) {
		try {
			String title = "�떟蹂��릺吏� �븡�� 泥��썝";
			List<PetitionDTO> list = petitionDAO.notAnswer();
			model.addAttribute("startPage", 1);
			model.addAttribute("list", list);
			model.addAttribute("title", title);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return "petitions/main";
	}
	@RequestMapping("main2.ju")
	public String main2(Model model,String page) {
		if(page==null)
			page="1";
		try {
			String title = "吏꾪뻾以묒씤 泥��썝";
			List<PetitionDTO> list = petitionDAO.available(page);
			int pageAll = petitionDAO.checkPage();
			int lastPage = 0;
			int tmp = Integer.parseInt(page);
			int startPage = 0;
			if(tmp%10==0) {
				tmp = tmp -1;
			}
			startPage= (tmp/10)*10+1;
			if(pageAll>startPage+10) {
				lastPage=startPage+9;
			}
			else {
				lastPage=pageAll;
			}			
			model.addAttribute("list", list);
			model.addAttribute("title", title);
			model.addAttribute("lastPage", lastPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("pageAll", pageAll);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return "petitions/main3";
	}
	@RequestMapping("answer.ju")
	public String main3(Model model,String num) {
		if(num==null)
			num="1";
		try {
			String title = "�떟蹂��맂 泥��썝";
			List<AnswerDTO> list = petitionDAO.answerAll(num);
			int pageAll = petitionDAO.checklastPage();
			int lastPage = 0;
			int tmp = Integer.parseInt(num);
			int startPage = 0;
			if(tmp%10==0) {
				tmp = tmp -1;
			}
			startPage= (tmp/10)*10+1;
			if(pageAll>startPage+10) {
				lastPage=startPage+9;
			}
			else {
				lastPage=pageAll;
			}			
			model.addAttribute("list", list);
			model.addAttribute("title", title);
			model.addAttribute("lastPage", lastPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("pageAll", pageAll);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return "petitions/main2";
	}
	
}
