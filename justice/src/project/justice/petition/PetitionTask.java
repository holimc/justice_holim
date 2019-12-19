package project.justice.petition;

import java.io.IOException;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class PetitionTask {
	@Scheduled(cron="0 0 17 * * *")
	public void test() {
		String command = "Rscript D:\\2차_프로젝트-R\\최종완성\\새로_추가된_청원_읽어오기.R";
		Runtime run = Runtime.getRuntime();
		try {
			run.exec(command);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
}
