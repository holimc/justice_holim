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
			int cnt = dao.getCount();
			
			model.addAttribute("cnt",cnt);
			model.addAttribute("lst",lst);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "news/news_list";
	}	
	
	@RequestMapping("news_list_Ajax.ju")
	public String rnews_list(Model model, HttpServletRequest request) {
		try {
			String keyword = request.getParameter("keyword");
			List rlst = dao.rnewsList(keyword);
			model.addAttribute("rlst",rlst);
			model.addAttribute("method",keyword);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "news/news_list_Ajax";
	}
}
