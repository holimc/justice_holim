package project.justice.action;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project.justice.petition.PetitionDAO;
import project.justice.petition.PetitionDTO;
import project.justice.petition.PetitionDataDTO;
import project.justice.petition.PetitionSubjectDTO;

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
	@RequestMapping("subject.ju")
	public String subject(String num,Model model) {
		String subject = null;
		List<PetitionSubjectDTO> list = petitionDAO.getList();
		if(num==null) {
			num="0";
		}
		subject=petitionDAO.getSubject(Integer.parseInt(num));
		model.addAttribute("subject", subject);
		model.addAttribute("list", list);
		
		return "petitions/subject";
	}
}
