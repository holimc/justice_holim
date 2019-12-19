package project.justice.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project.justice.petition.PetitionDAO;
import project.justice.petition.PetitionDTO;
import project.justice.petition.PetitionDataDTO;

@Controller
@RequestMapping("/petitions/")
public class InfoAction {
	@Autowired
	PetitionDAO petitionDAO = null;
	@Autowired
	PetitionDTO petitionDTO= null;
	@RequestMapping("info.ju")
	public String info(int num, Model model){	
		PetitionDataDTO tmp = petitionDAO.getInfo(num);
		model.addAttribute("info", tmp);
		return "petitions/info";
	}
}
