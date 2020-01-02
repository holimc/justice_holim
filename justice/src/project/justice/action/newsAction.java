package project.justice.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	public String rnews_list(Model model, HttpServletRequest request) {
		RConnection r=null;
		try {
			String keyword = request.getParameter("keyword");
			String add_url = request.getParameter("add_url");
			
			r = new RConnection();
			r.eval("source('C://Users//pc//Documents//R//test2.R')");
			System.out.println(keyword);
			System.out.println(add_url);
			
			//error �ΤѺ� 
			
			if(add_url.equals("&sid2=264")) { //û�ʹ�
				r.eval("url<-('https://news.naver.com/main/list.nhn?mode=LS2D&mid=sec&sid1=100&sid2=264')");
				r.eval("remDr$navigate(url)");
			}else if(add_url.equals("&sid2=265")) {//��ȸ/����
				r.eval("url<-('https://news.naver.com/main/list.nhn?mode=LS2D&mid=sec&sid1=100&sid2=265')");
				r.eval("remDr$navigate(url)");
			}else if(add_url.equals("&sid2=267")) {//����/�ܱ� 
				r.eval("url<-('https://news.naver.com/main/list.nhn?mode=LS2D&mid=sec&sid1=100&sid2=267')");
				r.eval("remDr$navigate(url)");
			}else if(add_url.equals("&sid2=268")) {//����
				r.eval("url<-('https://news.naver.com/main/list.nhn?mode=LS2D&mid=sec&sid1=100&sid2=268')");
				r.eval("remDr$navigate(url)");
			}else if(add_url.equals("&sid2=269")) {//��ġ/�Ϲ�
				r.eval("url<-('https://news.naver.com/main/list.nhn?mode=LS2D&mid=sec&sid1=100&sid2=269')");
				r.eval("remDr$navigate(url)");
			}else if(add_url.equals("&sid2=251")) {//���ڸ�
				r.eval("url<-('https://news.naver.com/main/list.nhn?mode=LS2D&mid=sec&sid1=102&sid2=251')");
				r.eval("remDr$navigate(url)");
			}else if(add_url.equals("&sid2=256")) {//������
				r.eval("url<-('https://news.naver.com/main/list.nhn?mode=LS2D&mid=sec&sid1=102&sid2=256')");
				r.eval("remDr$navigate(url)");
			}else if(add_url.equals("&sid2=59b")) {//���Ǻ���
				r.eval("url<-('https://news.naver.com/main/list.nhn?mode=LS2D&mid=sec&sid1=102&sid2=59b')");
				r.eval("remDr$navigate(url)");
			}else if(add_url.equals("&sid2=250")) {//���Ʊ���
				r.eval("url<-('https://news.naver.com/main/list.nhn?mode=LS2D&mid=sec&sid1=102&sid2=250')");
				r.eval("remDr$navigate(url)");
			}else if(add_url.equals("&sid2=250")) {//����/ȯ��
				r.eval("url<-('https://news.naver.com/main/list.nhn?mode=LS2D&mid=sec&sid1=102&sid2=252')");
				r.eval("remDr$navigate(url)");
			}else if(add_url.equals("&sid2=266")) {//����
				r.eval("url<-('https://news.naver.com/main/list.nhn?mode=LS2D&mid=sec&sid1=100&sid2=266')");
				r.eval("remDr$navigate(url)");
			}else if(add_url.equals("&sid2=240")) {//����/����/����
				r.eval("url<-('https://news.naver.com/main/list.nhn?mode=LS2D&mid=sec&sid1=103&sid2=240')");
				r.eval("remDr$navigate(url)");
			}else if(add_url.equals("&sid2=245")) {//��ȭ/����/ü��/���
				r.eval("url<-('https://news.naver.com/main/list.nhn?mode=LS2D&mid=sec&sid1=103&sid2=245')");
				r.eval("remDr$navigate(url)");
			}

			else {//��ġ �Ӻ�
				r.eval("url<-('https://news.naver.com/main/list.nhn?mode=LSD&mid=sec&sid1=100')");
				r.eval("remDr$navigate(url)");
			}
//			
			
			
			//String query1 = "category<-("+add_url+")";
			
			//System.out.println(query1);
			//r.eval(query1);
			//r.eval("url<-paste(category_url,category,sep='')");
			r.eval("source('C://Users//pc//Documents//R//test4.R')");

			
			
			
			
			
			//r.eval("wd_html<-renderTags(wd)"); //html�ڵ�� �ٲ��ִ� �ڵ� 
			//String wd = r.eval("wd_html$html").asString(); //HTML�� ������ �����ִ�
			//model.addAttribute("wd",wd);
			///

			
			
			
			
			List rlst = dao.rnewsList(keyword);
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
	

}
