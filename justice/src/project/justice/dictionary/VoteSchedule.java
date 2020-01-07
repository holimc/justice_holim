package project.justice.dictionary;

import java.util.Date;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service
public class VoteSchedule {
	// 30분마다 실행
	@Scheduled(cron="0 */30 * * * *")
	public void closeVote() {
		VoteDAO vtDAO = new VoteDAO();
		
	}
}
