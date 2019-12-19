package project.justice.dictionary;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class DictionaryDAO implements DictionaryDAOImpl {
	private SqlSessionTemplate sqlSession =null;
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 사전 숫자 가져오기
	public int getDictionaryCount() throws Exception{
		int count = sqlSession.selectOne("dictionaryDB.getCount");
		return count;
	}
	// 리스트 읽어오기
	public List getDictionary(int start, int end) throws Exception{
		HashMap params = new HashMap();
		params.put("start", start);
		params.put("end", end);
		List list = sqlSession.selectList("dictionaryDB.getDictionaryList",params);
		return list;
	}
	// 글 읽어오기
	public DictionaryDTO getDictionaryContent(int word_no) throws Exception{
		DictionaryDTO dicDTO = null;
		return dicDTO;
	}
	
	// (관리자가) 단어 신규 등록
	public int insertDictionary(DictionaryDTO dicDTO) throws Exception{
		int check = 0;
		check = sqlSession.insert("dictionaryDB.insertDictionary",dicDTO);
		return check;
	}
	// 수정할 단어 정보 가져오기
	public DictionaryDTO getUpdateDictionary(int word_no) throws Exception{
		DictionaryDTO dicDTO = sqlSession.selectOne("dictionaryDB.getUpdateDicData", word_no);
		return dicDTO;
	}
	// (관리자가) 단어 수정
	public int updateDictionary(DictionaryDTO dicDTO) throws Exception{
		int check = 0;
		try {
			check = sqlSession.update("dictionaryDB.updateDictionary", dicDTO);
			if(check>0) {
				int word_no = dicDTO.getWord_no();
				sqlSession.delete("dictionaryDB.deleteReport",word_no);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}
	// (관리자가) 단어 삭제
	public int deleteDictionary(int word_no) throws Exception{
		int check = 0;
		try {
			check = sqlSession.delete("dictionaryDB.deleteDictionary", word_no);
			if(check>0) {
				sqlSession.delete("dictionaryDB.deleteReport", word_no);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return check;
	}
	// 리스트에서 단어 추천시 추천수 1증가
	public int getRecommend(int word_no, String user_id) throws Exception{
		int check = 0;
		HashMap params = new HashMap();
		String id_list = sqlSession.selectOne("dictionaryDB.confirmRecommend", word_no);
		if(id_list == null) {
			params.put("word_no", word_no);
			params.put("user_id", user_id);
			check = sqlSession.update("dictionaryDB.getRecommend", params);
		}else {
			String [] id_arr = id_list.split(",");
			if(Arrays.asList(id_arr).contains(user_id)) {
				check = -1;
			}else if(!Arrays.asList(id_arr).contains(user_id)){
				params.put("word_no", word_no);
				params.put("user_id", user_id);
				check = sqlSession.update("dictionaryDB.getRecommend", params);
			}
		}
		return check;
	}
	
	// 게시글 신고하기
	public int reportWord(ReportDTO rptDTO) throws Exception{
		int check = 0;
		try {
			check = sqlSession.selectOne("dictionaryDB.confirmReport", rptDTO);
			if(check==0) {
				check = sqlSession.insert("dictionaryDB.insertReport", rptDTO);
				if(check!=0) {
					sqlSession.insert("dictionaryDB.insertReportDictionary", rptDTO);
				}
			}else {
				check=-1;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return check;
	}
	
	
	// 게시글 신고 리스트 가져오기
	public List getReportList() throws Exception{
		List list = null;
		try{
			list = sqlSession.selectList("dictionaryDB.getReportList");
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	// 게시글 신고 리스트 읽어오기
	public List getReport(int word_no) throws Exception{
		List list = null;
		try {
			list = sqlSession.selectList("dictionaryDB.getReport", word_no);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
	
}
