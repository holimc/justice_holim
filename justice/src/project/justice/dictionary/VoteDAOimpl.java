package project.justice.dictionary;

import java.util.HashMap;
import java.util.List;

public interface VoteDAOimpl {
	// 페이징을 위한 count 가져오기
	public int getVoteCount() throws Exception;
	// 글 메뉴 리스트를 위해 가져오기
	public List getVoteList(int startRow, int endRow) throws Exception;
	// d_board_no 를 통해 내용물 가져오기
	public HashMap getVoteContent(int vote_no) throws Exception;
	// admin이 투표 삭제
	public int deleteVote() throws Exception;
	// admin 이 투표 마감
	public int closeVote() throws Exception;
	// 투표하기
	public int votingPost() throws Exception;
}
