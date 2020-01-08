package project.justice.news;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;

public class NewsDAO implements NewsImpl {
	private SqlSessionTemplate sqlSession =null;
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession= sqlSession;
	}
	
	public List<NewsDTO> newsList() throws Exception{
		List<NewsDTO> newsList = sqlSession.selectList("news.getNewsList");
		return newsList;
	}
	
	public int getCount() throws Exception{
		int cnt = sqlSession.selectOne("news.getCount");
		return cnt;
	}
	
	public List<NewsDTO> rnewsList(String word) throws Exception{
		List<NewsDTO> rnewsList = sqlSession.selectList("news.getRelatedList",word);
		return rnewsList;
	}
	
	public List<NewsDTO> getCategoryNews(String word) throws Exception{
		List<NewsDTO> rnewsList = sqlSession.selectList("news.getCategoryNews",word);
		return rnewsList;
	}
	
	
	public int getCategoryCount(String word) throws Exception{
		int category_cnt = sqlSession.selectOne("news.getCategoryCount",word);
		return category_cnt;
	}
	
	public List<NewsDTO> testlist(String keyword_save, @Param("pagenum") int pagenum, @Param("contentnum") int contentnum){
		HashMap map = new HashMap();
		map.put("keyword_save",keyword_save);
		map.put("pagenum", pagenum);
		map.put("contentnum",contentnum);
		List<NewsDTO> testlist = sqlSession.selectList("news.testlist",map);

		return testlist;
	}
	public int testcount(){

		return 1;
	}

}
