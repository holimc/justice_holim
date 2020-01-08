package project.justice.action;

import java.util.List;

import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
		r.eval("g1<-plot_ly(tmp,x=c(1:3),y=c(tmp$P_DATA2,tmp$P_DATA1,tmp$P_DATA),mode  = \"lines\")%>%\n" + 
				"  layout(\n" + 
				"    title= tmp$P_TITLE,\n" + 
				"    xaxis = list(\n" + 
				"      showexponent = \"all\",\n" + 
				"      exponentformat = \"e\",\n" + 
				"      ticktext = list(\"2일전\", \"어제\", \"오늘\"), \n" + 
				"      tickvals = list(1, 2, 3),\n" + 
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

		return "petitions/subject";
	}
}
