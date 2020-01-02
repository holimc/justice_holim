package project.justice.action;

import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GraphicAction {
	@RequestMapping("graphic.ju")
	public String graphic(Model model) throws Exception {
		RConnection r = new RConnection();
		r.setStringEncoding("utf8");
		r.eval("library(DBI)");
		r.eval("library(RJDBC)");
		r.eval("library(htmltools)");
		r.eval("library(plotly)");
		r.eval("dri <- JDBC(\"oracle.jdbc.driver.OracleDriver\",\"ojdbc6.jar\")");
		r.eval("conn<- dbConnect(dri,\"jdbc:oracle:thin:@nullmaster.iptime.org:1521:xe\",\"final01\",\"final01\")");
		r.eval("query<-\"select p_subject,count(*) num from petition where p_date>sysdate group by p_subject order by num\"");
		r.eval("test<-dbGetQuery(conn,query)");
		r.eval("g1<-plot_ly(test,labels=test$P_SUBJECT,values=test$NUM,type = 'pie')");
		r.eval("pie_html<-renderTags(g1)");
		String pie =  r.eval("pie<-pie_html$html").asString();
		model.addAttribute("pie", pie);

		r.close();
		return "main/graphic";
	}	
}
