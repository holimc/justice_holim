package project.justice.dictionary;

import org.mybatis.spring.SqlSessionTemplate;

public class VoteDAO implements VoteDAOimpl {
	private SqlSessionTemplate sqlSession =null;
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
}
