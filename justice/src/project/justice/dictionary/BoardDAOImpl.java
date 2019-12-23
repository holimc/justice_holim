package project.justice.dictionary;

import java.util.List;

public interface BoardDAOImpl {
	
	public int getBoardCount(String category, String keyword) throws Exception;
	// 게시판 글 가져오는 메서드
	public List getBoardList(String pageNum, String category, String keyword, int start, int end) throws Exception;
	// 글 내용(content) 가져오는 메서드
	public BoardDTO getContent(int d_board_no) throws Exception;
	// 사전에서 다른 단어 제시할때 원 단어 가져오기
	public String getWordData(int word_no) throws Exception;
	// 게시글 작성 메서드
	public int insertPost(BoardDTO brdDTO) throws Exception;
	// 게시글 수정시 정보 가져오는 메서드
	public BoardDTO getUpdatePost(int d_board_no) throws Exception;
	// 게시글 수정 메서드
	public int updatePost(BoardDTO brdDTO) throws Exception;
	// 게시글 삭제 메서드
	public int deletePost(int d_board_no, String user_id, String admin, String passwd) throws Exception;
	// 추천 메서드
	public int getRecommend(int d_board_no, String user_id) throws Exception;
	// 투표게시판으로 옮기는 메서드
	public int insertVoting(List<String> chkArr) throws Exception;
	// 어드민 글삭제
	public int deletePostAdmin(List checkPostList) throws Exception;
	
}
