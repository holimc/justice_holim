package project.justice.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import project.justice.news.NewsDAO;
import project.justice.news.NewsDTO;

import project.justice.news.PageMaker;

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
			r = new RConnection();
			String keyword = request.getParameter("keyword");
			session.setAttribute("keyword_save",keyword);
			String add_url = request.getParameter("add_url");
			int cnt1 = dao.getCategoryCount(keyword);
			r.eval("source('C://test//test2.R')");
		

			
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
			}else if(add_url.equals("&sid2=252")) {//占쏙옙占쏙옙/환占쏙옙
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
			r.eval("source('C://test//test4.R')");
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
	public String news_categoryAll_list(//@RequestParam(defaultValue="1")String pagenum,
			Model model,HttpServletRequest request,HttpSession session,@RequestParam(defaultValue="1")String pagenum) {
		try {
			String keyword_save = (String)session.getAttribute("keyword_save");
			String add_url = request.getParameter("add_url");
			int cnt1 = dao.getCategoryCount(keyword_save);
			List rlst = dao.getCategoryNews(keyword_save);
	

			PageMaker pagemaker = new PageMaker();

			String contentnum = request.getParameter("contentnum");
			if(contentnum == null) {
				contentnum = "10"; 
			}
			 
			int cpagenum = Integer.parseInt(pagenum);
			int ccontentnum = Integer.parseInt(contentnum);

			pagemaker.setTotalcount(cnt1);
			pagemaker.setPagenum(cpagenum-1); //현재 페이지를 페이지 객체에 지정 . -1를 해야 쿼리에서 사용 가능
			pagemaker.setContentnum(ccontentnum); // 한 페이지에 몇개씩 게시글을 보여줄지 정함
			pagemaker.setCurrentblock(cpagenum);//현제 페이지 블록이 몇번인지 현제 페이지 번호를 통해 지정 
			
			
			pagemaker.setLastblock(pagemaker.getTotalcount());//마지막 블록 번호를 전체 게시글 수를 통해 정함 ;

			pagemaker.prevnext(cpagenum);//현재 페이지 번호로 화살표를 나타낼지 정함
			pagemaker.setStartPage(pagemaker.getCurrentblock()); // 시작 페이지를 페이지 블록 번호 정함
			pagemaker.setEndPage(pagemaker.getLastblock(),pagemaker.getCurrentblock()); // 마지막 페이지를 마지막 페이지 블록과 현제 페이지 블록으로 정함
			
			List<NewsDTO> testlist = new ArrayList();

			
			testlist = dao.testlist(keyword_save,pagemaker.getPagenum()*10+1,pagemaker.getContentnum()+pagemaker.getPagenum()*10+1);
			
			model.addAttribute("list",testlist);
			model.addAttribute("page",pagemaker);
			model.addAttribute("cnt1",cnt1);
			model.addAttribute("add_url",add_url);
			model.addAttribute("rlst",rlst);
			model.addAttribute("method",keyword_save);

		} catch (Exception e) {
			
			e.printStackTrace();
			//error처리 
		}
		return "news/news_categoryAll";
	}	

	@RequestMapping("news_samekeyword.ju")
	public String new_connectedlist(Model model, String keyword, HttpServletRequest request,@RequestParam(defaultValue="1")String pagenum) {
		try {
			String connectedword = request.getParameter("keyword");
			System.out.println(connectedword);
			int cl_cnt = dao.getConnectedcount(connectedword);
			List samelist = dao.getSamekeywordNews(connectedword);	
			
			//pagination 작성중
			PageMaker pagemaker = new PageMaker();
			String contentnum = request.getParameter("contentnum");
			if(contentnum == null) {
				contentnum = "10"; 
			}
			
			int cpagenum = Integer.parseInt(pagenum);
			int ccontentnum = Integer.parseInt(contentnum);
			pagemaker.setTotalcount(cl_cnt);
			pagemaker.setPagenum(cpagenum-1); //현재 페이지를 페이지 객체에 지정 . -1를 해야 쿼리에서 사용 가능
			pagemaker.setContentnum(ccontentnum); // 한 페이지에 몇개씩 게시글을 보여줄지 정함
			pagemaker.setCurrentblock(cpagenum);//현재 페이지 블록이 몇번인지 현제 페이지 번호를 통해 지정 
			pagemaker.setLastblock(pagemaker.getTotalcount());//마지막 블록 번호를 전체 게시글 수를 통해 정함 ;
			pagemaker.prevnext(cpagenum);//현재 페이지 번호로 화살표를 나타낼지 정함
			pagemaker.setStartPage(pagemaker.getCurrentblock()); // 시작 페이지를 페이지 블록 번호 정함
			pagemaker.setEndPage(pagemaker.getLastblock(),pagemaker.getCurrentblock()); // 마지막 페이지를 마지막 페이지 블록과 현제 페이지 블록으로 정함
			List<NewsDTO> testlist = new ArrayList();
			System.out.println("pagenum>>"+pagemaker.getPagenum());
			System.out.println("contentnum>>"+pagemaker.getContentnum());
			System.out.println("connectedword>>"+connectedword);
			testlist = dao.testlist1(connectedword, pagemaker.getPagenum()*10-1, pagemaker.getContentnum()+pagemaker.getPagenum()*10+1);
			//

			model.addAttribute("list",testlist);
			model.addAttribute("page",pagemaker);
			model.addAttribute("samelist",samelist);
			model.addAttribute("news_keyword",connectedword);
			model.addAttribute("cl_cnt",cl_cnt);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "news/news_samekeyword";
	}	
}
