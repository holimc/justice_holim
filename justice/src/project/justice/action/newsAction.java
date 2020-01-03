package project.justice.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.rosuda.REngine.Rserve.RConnection;
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
	public String rnews_list(Model model, HttpServletRequest request,HttpSession session) {
		RConnection r=null;
		try {
			String keyword = request.getParameter("keyword");
			session.setAttribute("keyword_save",keyword);
			String add_url = request.getParameter("add_url");
			int cnt1 = dao.getCategoryCount(keyword);
			r = new RConnection();
			r.eval("source('C://Users//pc//Documents//R//test2.R')");

			
			//error 占싸ㅡ븝옙 
			
			if(add_url.equals("&sid2=264")) { //청占싶댐옙
				r.eval("url<-('https://news.naver.com/main/list.nhn?mode=LS2D&mid=sec&sid1=100&sid2=264')");
				r.eval("remDr$navigate(url)");
			}else if(add_url.equals("&sid2=265")) {//占쏙옙회/占쏙옙占쏙옙
				r.eval("url<-('https://news.naver.com/main/list.nhn?mode=LS2D&mid=sec&sid1=100&sid2=265')");
				r.eval("remDr$navigate(url)");
			}else if(add_url.equals("&sid2=267")) {//占쏙옙占쏙옙/占쌤깍옙 
				r.eval("url<-('https://news.naver.com/main/list.nhn?mode=LS2D&mid=sec&sid1=100&sid2=267')");
				r.eval("remDr$navigate(url)");
			}else if(add_url.equals("&sid2=268")) {//占쏙옙占쏙옙
				r.eval("url<-('https://news.naver.com/main/list.nhn?mode=LS2D&mid=sec&sid1=100&sid2=268')");
				r.eval("remDr$navigate(url)");
			}else if(add_url.equals("&sid2=269")) {//占쏙옙치/占싹뱄옙
				r.eval("url<-('https://news.naver.com/main/list.nhn?mode=LS2D&mid=sec&sid1=100&sid2=269')");
				r.eval("remDr$navigate(url)");
			}else if(add_url.equals("&sid2=251")) {//占쏙옙占쌘몌옙
				r.eval("url<-('https://news.naver.com/main/list.nhn?mode=LS2D&mid=sec&sid1=102&sid2=251')");
				r.eval("remDr$navigate(url)");
			}else if(add_url.equals("&sid2=256")) {//占쏙옙占쏙옙占쏙옙
				r.eval("url<-('https://news.naver.com/main/list.nhn?mode=LS2D&mid=sec&sid1=102&sid2=256')");
				r.eval("remDr$navigate(url)");
			}else if(add_url.equals("&sid2=59b")) {//占쏙옙占실븝옙占쏙옙
				r.eval("url<-('https://news.naver.com/main/list.nhn?mode=LS2D&mid=sec&sid1=102&sid2=59b')");
				r.eval("remDr$navigate(url)");
			}else if(add_url.equals("&sid2=250")) {//占쏙옙占싣깍옙占쏙옙
				r.eval("url<-('https://news.naver.com/main/list.nhn?mode=LS2D&mid=sec&sid1=102&sid2=250')");
				r.eval("remDr$navigate(url)");
			}else if(add_url.equals("&sid2=250")) {//占쏙옙占쏙옙/환占쏙옙
				r.eval("url<-('https://news.naver.com/main/list.nhn?mode=LS2D&mid=sec&sid1=102&sid2=252')");
				r.eval("remDr$navigate(url)");
			}else if(add_url.equals("&sid2=266")) {//占쏙옙占쏙옙
				r.eval("url<-('https://news.naver.com/main/list.nhn?mode=LS2D&mid=sec&sid1=100&sid2=266')");
				r.eval("remDr$navigate(url)");
			}else if(add_url.equals("&sid2=240")) {//占쏙옙占쏙옙/占쏙옙占쏙옙/占쏙옙占쏙옙
				r.eval("url<-('https://news.naver.com/main/list.nhn?mode=LS2D&mid=sec&sid1=103&sid2=240')");
				r.eval("remDr$navigate(url)");
			}else if(add_url.equals("&sid2=245")) {//占쏙옙화/占쏙옙占쏙옙/체占쏙옙/占쏙옙占�
				r.eval("url<-('https://news.naver.com/main/list.nhn?mode=LS2D&mid=sec&sid1=103&sid2=245')");
				r.eval("remDr$navigate(url)");
			}

			else {//占쏙옙치 占쌈븝옙
				r.eval("url<-('https://news.naver.com/main/list.nhn?mode=LSD&mid=sec&sid1=100')");
				r.eval("remDr$navigate(url)");
			}
			//String query1 = "category<-("+add_url+")";
			//r.eval(query1);
			//r.eval("url<-paste(category_url,category,sep='')");
			r.eval("source('C://Users//pc//Documents//R//test4.R')");
			List rlst = dao.rnewsList(keyword);
			model.addAttribute("cnt1",cnt1);
			model.addAttribute("add_url",add_url);
			model.addAttribute("rlst",rlst);
			model.addAttribute("method",keyword);
			
		}catch(Exception e) {			
			e.printStackTrace();
		}finally {
			if(r != null) {r.close();}
		}
		return "news/news_list_Ajax";
	}
	
	
	@RequestMapping("news_categoryAll.ju")
	public String news_categoryAll_list(Model model,HttpServletRequest request,HttpSession session) {
		try {
			//String keyword = request.getParameter("keyword");
			String keyword_save = (String)session.getAttribute("keyword_save");
			//System.out.println(keyword_save); //null
			String add_url = request.getParameter("add_url");
			int cnt1 = dao.getCategoryCount(keyword_save);
			List rlst = dao.getCategoryNews(keyword_save);
			//System.out.println(rlst.size());
			model.addAttribute("cnt1",cnt1);
			model.addAttribute("add_url",add_url);
			model.addAttribute("rlst",rlst);
			model.addAttribute("method",keyword_save);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "news/news_categoryAll";
	}	
	

}
