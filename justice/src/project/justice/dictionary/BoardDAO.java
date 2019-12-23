package project.justice.dictionary;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class BoardDAO implements BoardDAOImpl {

	private SqlSessionTemplate sqlSession =null;
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	@Override
	public int getBoardCount(String category, String keyword) throws Exception{
		HashMap params = new HashMap();
		params.put("category",category);
		params.put("keyword",keyword);
		int count = sqlSession.selectOne("d_board_DB.getCount",params);
		return count;
	}
	// 게시판 글 가져오는 메서드
	@Override
	public List getBoardList(String pageNum, String category, String keyword, int start, int end) throws Exception{
		List list = null;
		HashMap params = new HashMap();
		params.put("start", start);
		params.put("end", end);
		params.put("category",category);
		params.put("keyword",keyword);
		list = sqlSession.selectList("d_board_DB.getBoardList", params);
		return list;
	}
	// 글 내용(content) 가져오는 메서드
	@Override
	public BoardDTO getContent(int d_board_no) throws Exception{
		BoardDTO brdDTO = sqlSession.selectOne("d_board_DB.getPost", d_board_no);;
		return brdDTO;
	}
	// 사전에서 다른 단어 제시할때 원 단어 가져오기
	public String getWordData(int word_no) throws Exception{
		String wname = null;
		wname = sqlSession.selectOne("d_board_DB.getWordData",word_no);
		return wname;
	}
	
	// 게시글 작성 메서드
	@Override
	public int insertPost(BoardDTO brdDTO) throws Exception{
		int check = 0;
		check = sqlSession.insert("d_board_DB.insertPost", brdDTO);
		return check;
	}
	// 게시글 수정시 정보 가져오는 메서드
	@Override
	public BoardDTO getUpdatePost(int d_board_no) throws Exception{
		BoardDTO brdDTO = sqlSession.selectOne("d_board_DB.getPost", d_board_no);
		return brdDTO;
	}
	// 게시글 수정 메서드
	@Override
	public int updatePost(BoardDTO brdDTO) throws Exception{
		int check = 0;
		check = sqlSession.update("d_board_DB.updatePost",brdDTO);
		return check;
	}
	// 게시글 삭제 메서드
	@Override
	public int deletePost(int d_board_no, String user_id,String admin, String passwd) throws Exception{
		int check = 0;
		HashMap params = new HashMap();
		params.put("id", user_id);
		params.put("passwd", passwd);
		check = sqlSession.selectOne("d_board_DB.chkMember",params);
		
		if(check!= 0 || admin!= null) {
			check = sqlSession.delete("d_board_DB.postDelete",d_board_no);
		}else {
			check = -1;
		}
		return check;
	}
	
	// 추천 메서드
	@Override
	public int getRecommend(int d_board_no, String user_id) throws Exception{
		// 메서드 동작을 확인할 변수 check, 초기값 0 및 해쉬맵 선언
		int check = 0;
		HashMap params = new HashMap();
		// 메서드로 id_list를 가져온다. 
		String id_list = sqlSession.selectOne("d_board_DB.confirmRecommend", d_board_no);
		
		// list가 null일때. (추천인이 없을때)
		if(id_list == null) {
			// hashmap에 값을 넣고 update
			params.put("d_board_no", d_board_no);
			params.put("user_id", user_id);
			check = sqlSession.update("d_board_DB.getRecommend", params);
		// list가 null이 아닐때 (추천인이 있을때) 
		}else {
			// 중복체크를 위해 ,를 기준으로 끊어준다.
			String [] id_arr = id_list.split(",");
			// id_arr에 user_id가 있는지 체크.
			if(Arrays.asList(id_arr).contains(user_id)) {
				check = -1;
			}else if(!Arrays.asList(id_arr).contains(user_id)){
				params.put("d_board_no", d_board_no);
				params.put("user_id", user_id);
				check = sqlSession.update("d_board_DB.getRecommend", params);
			}
		}
		return check;
	}
	// 투표게시판으로 옮기는 메서드
	@Override
	public int insertVoting(List<String> chkArr) throws Exception{
		// 중복 체크를 위한 check
		int check = 0;
		// 정보를 담을 DTO 
		BoardDTO brdDTO = null;
		// vote_table의 단어 번호를 가져온다. 중복체크
		List voteList = sqlSession.selectList("d_board_DB.confirmVoteList");
		if(voteList!=null) {
			for(int i=0; i<chkArr.size();i++) {
				if(voteList.contains(chkArr.get(i))) {
					
				}
				
			}
		}else {
			for(int i=0; i<chkArr.size(); i++) {
				int d_board_no = Integer.parseInt(chkArr.get(i));
				brdDTO = sqlSession.selectOne("d_board_DB.getPost",d_board_no);
				sqlSession.insert("d_board_DB.insertVote",brdDTO);
			}
			check = 1;
		}
		return check;
	}
	
	@Override
	public int deletePostAdmin(List chkArr) throws Exception{
		int check = 0;
		if(chkArr!= null) {
			check = sqlSession.delete("d_board_DB.deletePostByAdmin",chkArr);
		}
		return check;
	}
	
	
	
	
}
