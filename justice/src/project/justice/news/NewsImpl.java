package project.justice.news;

import java.util.List;

public interface NewsImpl {
	public List newsList() throws Exception;
	public int getCount() throws Exception;
	public int getCategoryCount(String word) throws Exception;
	public List rnewsList(String word) throws Exception;
	public List getCategoryNews(String word) throws Exception;
}
