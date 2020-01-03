package project.justice.news;

import java.util.List;

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
	

}
