package project.justice.dictionary;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class VoteDAO implements VoteDAOimpl {
	private SqlSessionTemplate sqlSession =null;
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	public int getVoteCount() throws Exception{
		int count = sqlSession.selectOne("dictionary_vote.getCountVote");
		return count;
	}
	public List getVoteList(int startRow, int endRow) throws Exception{
		List list = null;
		HashMap hm = new HashMap();
		hm.put("start", startRow);
		hm.put("end", endRow);
		list = sqlSession.selectList("dictionary_vote.getBoardList",hm);
		return list;
	}
	public HashMap getVoteContent(int vote_no) throws Exception{
		HashMap dtoMap = new HashMap();
		VoteDTO vtDTO = sqlSession.selectOne("dictionary_vote.getVoteData",vote_no);
		dtoMap.put("vtDTO", vtDTO);
		int d_board_no = vtDTO.getD_board_no();
		
		BoardDTO brdDTO = sqlSession.selectOne("d_board_DB.getPost",d_board_no);
		dtoMap.put("brdDTO", brdDTO);
		
		return dtoMap;
	}
	public int deleteVote() throws Exception{
		return 0;
	}
	public int closeVote() throws Exception{
		return 0;
	}
	public int votingPost() throws Exception{
		return 0;
	}
}
