package project.justice.action;

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
	public String subject(String cg,String pg,Model model) throws Exception{
		String subject = null;		
		List<PetitionSubjectDTO> list = petitionDAO.getList();
		int pageAll=0;
		int num2=0;
		if(cg==null||cg.equals("0")) {
			cg="0";		
			pageAll=petitionDAO.checkPage();
		}
		else {
			num2 =Integer.parseInt(cg);
			pageAll=petitionDAO.subjectPage(num2);
		}
		num2 =Integer.parseInt(cg);
		if(pg==null) {
			pg="1";
		}
		int tmp = Integer.parseInt(pg);
		subject=petitionDAO.getSubject(num2);
		model.addAttribute("subject", subject);
		model.addAttribute("list", list);
		List<PetitionDTO> list2 = petitionDAO.getPetitionBySubject(num2,tmp);
		model.addAttribute("list2", list2);
		int lastPage = 0;
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
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("pageAll", pageAll);
		model.addAttribute("cg", cg);

		return "petitions/subject";
	}
}
