package project.justice.news;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface NewsImpl {
	public List newsList() throws Exception;
	public int getCount() throws Exception;
	public int getCategoryCount(String word) throws Exception;
	public List rnewsList(String word) throws Exception;
	public List getCategoryNews(String word) throws Exception;
	//전체 자료 가져오기
	public List<NewsDTO> testlist( String keyword_save,@Param("pagenum") int pagenum,@Param("contentnum") int contentnum);
	//전체 게시글 count
	public int testcount();
}
