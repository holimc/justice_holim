package project.justice.action;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project.justice.petition.PetitionDAO;
import project.justice.petition.PetitionDTO;
import project.justice.petition.PetitionData2DTO;
import project.justice.petition.PetitionDataDTO;

@Controller
public class SideAction {
	@Autowired
	PetitionDAO petitionDAO = null;	
	@RequestMapping("list.ju")
	public String main(Model model) {
		List<PetitionDataDTO> list=null;
		try {
			list = petitionDAO.getMain2();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("list", list);
		return "main/list2";
	}
	@RequestMapping("list2.ju")
	public String main2(Model model) {
		List<PetitionDataDTO> list=null;
		try {
			list = petitionDAO.getMain();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("list", list);
		return "main/list";
	}
	@RequestMapping("list3.ju")
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
		return "main/list3";
	}
	@RequestMapping("list4.ju")
	public String main3(Model model) {
		try {
			List<PetitionDTO> list = petitionDAO.notAnswer();
			model.addAttribute("list", list);
			Timestamp time = new Timestamp(System.currentTimeMillis());
			model.addAttribute("Time", time);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return "main/list4";
	}
	@RequestMapping("list5.ju")
	public String main5(Model model) {
		try {
			List<PetitionDTO> list = petitionDAO.getToday();
			model.addAttribute("list", list);		
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return "main/list5";
	}
}
