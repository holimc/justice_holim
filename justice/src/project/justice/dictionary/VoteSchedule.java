package project.justice.dictionary;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service
public class VoteSchedule {
	@Autowired
	VoteDAO vtDAO = null;
	@Autowired
	VoteDTO vtDTO = null;
	
	// 30분마다 실행
	@Scheduled(cron="0 */30 * * * *")
	public void closeVote() {
		Date date = new Date();
		System.out.println(date + "시작");
		vtDAO.scheduleVote();
		System.out.println(date+"스케쥴러 메서드 종료");
	}
}
