package project.justice.news;

import java.util.List;

public interface NewsImpl {
	public List newsList() throws Exception;
	public int getCount() throws Exception;
	public List rnewsList(String word) throws Exception;

}
