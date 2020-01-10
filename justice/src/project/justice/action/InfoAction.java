package project.justice.action;

import java.util.Date;
import java.util.List;

import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project.justice.petition.PetitionContentDTO;
import project.justice.petition.PetitionDAO;
import project.justice.petition.PetitionDTO;
import project.justice.petition.PetitionSubjectDTO;

@Controller
@RequestMapping("/petitions/")
public class InfoAction {
	@Autowired
	PetitionDAO petitionDAO = null;
	@Autowired
	PetitionDTO petitionDTO= null;
	@RequestMapping("info.ju")
	public String info(int num, Model model) throws Exception{
		RConnection r = new RConnection();
		r.setStringEncoding("utf8");
		r.eval("library(DBI)");
		r.eval("library(RJDBC)");
		r.eval("library(htmltools)");
		r.eval("library(plotly)");
		r.eval("dri <- JDBC(\"oracle.jdbc.driver.OracleDriver\",\"ojdbc6.jar\")");
		r.eval("conn<- dbConnect(dri,\"jdbc:oracle:thin:@nullmaster.iptime.org:1521:xe\",\"final01\",\"final01\")");
		r.eval("query <- \"select * from petition p,petition_data p2 where p.p_no=p2.p_no and p.p_no=?\"");
		r.eval("tmp<-dbGetQuery(conn,query,"+num+")");
		r.eval("tdate<-strptime(tmp$P_UPDATE,\"%Y-%m-%d %H:%M:%S\")");
		r.eval("tdate<-Sys.time()-tdate");
		r.eval("tdate<-floor(tdate)");
		r.eval("tdate<-paste0(tdate,\"시간전\")");	
		r.eval("g1<-plot_ly(tmp,x=c(1:4),y=c(tmp$P_DATA2,tmp$P_DATA1,tmp$P_DATA,tmp$P_PERSON),mode  = \"lines\")%>%\n" + 
				"  layout(\n" + 
				"    title= tmp$P_TITLE,\n" + 
				"    xaxis = list(\n" + 
				"      showexponent = \"all\",\n" + 
				"      exponentformat = \"e\",\n" + 
				"      ticktext = list(\"2일전\", \"어제\",tdate,\"현재\"), \n" + 
				"      tickvals = list(1, 2, 3,4),\n" + 
				"      tickmode = \"array\"\n" + 
				"    ),\n" + 
				"    yaxis = list(\n" + 
				"      showexponent = \"all\",\n" + 
				"      exponentformat = \"none\"\n" + 
				"    ))");
		r.eval("pie_html<-renderTags(g1)");
		String lines= r.eval("pie<-pie_html$html").asString();
		model.addAttribute("lines", lines);
		r.close();
		return "petitions/info";
	}
	@RequestMapping("subject.ju")
	public String subject(String cg,String pg,Model model,String order) throws Exception{
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
		if(order==null) {
			order="1";
		}
		int tmp = Integer.parseInt(pg);
		subject=petitionDAO.getSubject(num2);
		model.addAttribute("subject", subject);
		model.addAttribute("list", list);
		List<PetitionDTO> list2 = petitionDAO.getPetitionBySubject(num2,tmp,order);
		model.addAttribute("list2", list2);
		int lastPage = 0;
		int startPage = 0;
		if(tmp%10==0) {
			tmp = tmp -1;
		}
		startPage= (tmp/10)*10+1;
		if(pageAll>startPage+9) {
			lastPage=startPage+9;
		}
		else {
			lastPage=pageAll;
		}
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("pageAll", pageAll);
		model.addAttribute("cg", cg);
		model.addAttribute("order", order);
		model.addAttribute("page", pg);

		return "petitions/subject";
	}
	@RequestMapping("content.ju")
	public String content(String num,Model model) {
		PetitionContentDTO dto = petitionDAO.getContent(Integer.parseInt(num));
		String t = dto.getP_content();
		t=t.replaceAll("\n", "<br/>");		
		dto.setP_content(t);
		model.addAttribute("content", dto);
		model.addAttribute("now", new Date());
		return "petitions/content";
		
	}
	
}
