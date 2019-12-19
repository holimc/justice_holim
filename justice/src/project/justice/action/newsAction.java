package project.justice.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project.justice.news.NewsDAO;
import project.justice.news.NewsDTO;

@Controller
@RequestMapping("/news/")
public class newsAction {
	
	@Autowired
	private NewsDAO dao = null;
	@Autowired
	private NewsDTO dto = null;
	
	@RequestMapping("news_list.ju")
	public String news_list(Model model,HttpServletRequest request) {
		try {
			List lst = dao.newsList();
			model.addAttribute("lst",lst);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "news_list";
	}	
}
