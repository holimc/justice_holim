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
	public List<PetitionSubjectDTO> getList(){
		List<PetitionSubjectDTO> list = sqlSession.selectList("petition.getSubject");
		return list;
	}
	public String getSubject(int num) {
		String subject = sqlSession.selectOne("petition.getSubjectName",num);
		return subject;
	}
	public List<PetitionDTO> getPetitionBySubject(int num) {
		List<PetitionDTO> dto = null;
		if(num!=0) {
		dto = sqlSession.selectList("petition.getPetitionBySubject",num); 
		}
		else {
			dto = sqlSession.selectList("petition.seleteAll");
		}
		return dto;
	}
	public List<PetitionDTO> getPetitionBySubject(int num,int page){
		int lastIndex = page*pagesize;
		int firstIndex= (page-1)*pagesize+1;
		List<PetitionDTO> dto = null;
		HashMap<String, Integer> map = new HashMap<>();
		map.put("firstIndex", firstIndex);
		map.put("lastIndex", lastIndex);
		if(num!=0) {
			map.put("s_id", num);
			dto = sqlSession.selectList("petition.getPetitionBySubject1",map);
		}
		else {
			dto = sqlSession.selectList("petition.availablePetition",map);
		}
		return dto;
	}
	public int subjectPage(int num) {
		int tmp = sqlSession.selectOne("petition.getSubjectPage",num);
		int page = tmp%pagesize==0? tmp/pagesize : tmp/pagesize+1;		
		return page;
	}
	public List<PetitionDataDTO> getMain(){
		List<PetitionDataDTO> list = sqlSession.selectList("petition.getMain");
		return list;
	}
	public List<PetitionDataDTO> getMain2(){
		List<PetitionDataDTO> list = sqlSession.selectList("petition.getMain2");
		return list;
	}
}

