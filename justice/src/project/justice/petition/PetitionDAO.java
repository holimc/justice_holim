package project.justice.petition;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class PetitionDAO {
	private int pagesize = 20;
	private SqlSessionTemplate sqlSession =null;
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	public List<PetitionDTO> getSelectAll() throws Exception {
		List<PetitionDTO> list = sqlSession.selectList("petition.seleteAll");
		return list;
	}
	public List<PetitionDTO> getSelectcheck(int i) throws Exception {
		List<PetitionDTO> list = sqlSession.selectList("petition.seletecheck",i);
		return list;
	}
	public List<AnswerDTO> answerAll(String num) throws Exception {
		int tmp = Integer.parseInt(num);
		int lastIndex = tmp*pagesize;
		int firstIndex= (tmp-1)*pagesize+1;
		HashMap<String, Integer> map = new HashMap<>();
		map.put("firstIndex", firstIndex);
		map.put("lastIndex", lastIndex);
		List<AnswerDTO> list = sqlSession.selectList("petition.answerAll",map);
		return list;
	}
	public int checklastPage() throws Exception{
		int tmp = sqlSession.selectOne("petition.countcheck");
		int lastpage = tmp%pagesize==0? tmp/pagesize : tmp/pagesize+1;		
		return lastpage;
	}
	public int checkPage() throws Exception{
		int tmp = sqlSession.selectOne("petition.countNotcheck");
		int lastpage = tmp%pagesize==0? tmp/pagesize : tmp/pagesize+1;		
		return lastpage;
	}
	public List<PetitionDTO> notAnswer() throws Exception{
		List <PetitionDTO> list = sqlSession.selectList("petition.notAnswer");
		return list;
	}
	public List<PetitionDTO> available(String num) throws Exception{
		int tmp = Integer.parseInt(num);
		int lastIndex = tmp*pagesize;
		int firstIndex= (tmp-1)*pagesize+1;
		HashMap<String, Integer> map = new HashMap<>();
		map.put("firstIndex", firstIndex);
		map.put("lastIndex", lastIndex);
		List <PetitionDTO> list = sqlSession.selectList("petition.availablePetition",map);
		return list;
	}
	public PetitionDataDTO getInfo(int num) {
		PetitionDataDTO dto = sqlSession.selectOne("petition.getinfo",num);
		return dto;
	}
}

