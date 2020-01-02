package project.justice.rjava;
import javax.servlet.http.HttpServletRequest;

import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

@RequestMapping("/news/")



//test
public class RjavaAction {
	
	@RequestMapping("news_list_Ajax1.ju")
	public String main(Model model, HttpServletRequest request)throws Exception{
		RConnection r= new RConnection();
		
		String add_url = request.getParameter("add_url");
		r.eval("category_url<-('https://news.naver.com/main/list.nhn?mode=LS2D&mid=sec&sid1=100')");
		String query1 = "category<-("+add_url+"))";
		r.eval(query1);
		r.eval("url<-paste(category_url,category,sep='')");
			
		r.eval("source('C:\\Users\\pc\\Documents\\R\\test2.r')");
		
		r.eval("wd_html<-renderTags(wd)"); //html코드로 바꿔주는 코드 
		String wd = r.eval("wd_html$html").asString(); //HTML만 꺼내서 보여주는
		model.addAttribute("wd",wd);
		return "news/news_list_Ajax1";
		
	}

}
