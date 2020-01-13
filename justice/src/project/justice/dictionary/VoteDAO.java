package project.justice.dictionary;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
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
	public int deleteVote(List<String> chkArr) throws Exception{
		int check = 0;
		if(chkArr!= null) {
			check = sqlSession.delete("dictionary_vote.deleteVote",chkArr);
		}
		return check;
	}
	public int closeVote(List<String> chkArr) throws Exception{
		int check = 0;
		if(chkArr!= null) {
			for(int i=0; i<chkArr.size(); i++) {
				int vote_no = Integer.parseInt(chkArr.get(i));
				VoteDTO vtDTO = sqlSession.selectOne("dictionary_vote.getVoteData", vote_no);
				if(vtDTO.getVote_close().equals("open") && vtDTO.getAgree()>vtDTO.getDisagree()) {
					// d_board_table에서 데이터를 꺼내옴
					BoardDTO brdDTO = sqlSession.selectOne("d_board_DB.getPost",vtDTO.getD_board_no());
					// 꺼내온 데이터를 통해 dictionary_table에 insert
					sqlSession.insert("dictionary_vote.insertDictionary",brdDTO);
					// vote_table에서 close로 업데이트
					sqlSession.update("dictionary_vote.closingVote",vote_no);
				}else {
					continue;
				}
			}
		}
		return check;
	}
	public int votingPost(HashMap hm) throws Exception{
		int check = 0;
		String id_list = sqlSession.selectOne("dictionary_vote.getVotingUserList",hm.get("vote_no"));
		
		if(id_list == null) {
			check = sqlSession.update("dictionary_vote.votingPost",hm);
		}else {
			String [] idArr = id_list.split(",");
			String user_id = (String)hm.get("user_id");
			if(Arrays.asList(idArr).contains(user_id)){
				check = -3;
			}else {
				check = sqlSession.update("dictionary_vote.votingPost",hm);
			}
		}
		return check;
	}
	
	public String getVoteStatus(int vote_no) {
		VoteDTO vtDTO = sqlSession.selectOne("dictionary_vote.getVoteData",vote_no);
		String voteStatus = vtDTO.getVote_close();
		return voteStatus;
	}
	
	public void scheduleVote() {
		List list = null;
		list = sqlSession.selectList("dictionary_vote.getOpenVoteList");
		if(list != null) {
			Date date = new Date();
			for(int i=0; i<list.size();i++) {
				int check = 0;
				VoteDTO vtDTO = (VoteDTO)list.get(i);
				long currentTime = date.getTime();
				long voteRegTime = vtDTO.getVote_reg().getTime();
				long difTime = currentTime - voteRegTime;
				
				int timeLap = (int)(difTime/(1000*60));
				if(timeLap >= 10080) {
					check = sqlSession.update("dictionary_vote.closingVote",vtDTO.getVote_no());
					if(check!=0) {
						if(vtDTO.getAgree()>vtDTO.getDisagree()) {
							BoardDTO brdDTO = sqlSession.selectOne("d_board_DB.getPost",vtDTO.getD_board_no());
							sqlSession.insert("dictionary_vote.insertDictionary",brdDTO);
						}
					}
					System.out.println(vtDTO.getWname()+"은 "+timeLap + "만큼 차이납니다.");
					
				}
			}
		}
		System.out.println("메서드 실행");
	}
	
}
