package project.justice.news;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface NewsImpl {
	public List newsList() throws Exception;
	public int getCount() throws Exception;
	public int getCategoryCount(String word) throws Exception;
	public List rnewsList(String word) throws Exception;
	public List getCategoryNews(String word) throws Exception;
	//��ü �ڷ� ��������
	public List<NewsDTO> testlist( String keyword_save,@Param("pagenum") int pagenum,@Param("contentnum") int contentnum);
	//��ü �Խñ� count
	public List<NewsDTO> getSamekeywordNews(String samekeyword);
	//���� �����ܾ� �Խñ� COUNT
	public int getConnectedcount(String samekeyword);

}
