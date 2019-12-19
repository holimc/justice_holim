package project.justice.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class MemberDAO implements MemberImpl{
	private SqlSessionTemplate sqlSession =null;
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int userCheck(MemberVO vo) throws Exception {
		int check = sqlSession.selectOne("member.userCheck",vo);
		return check;
	}
	public void insertMember(MemberVO vo) throws Exception {
		sqlSession.insert("member.insertMember",vo);
	}
	public int confirmId(MemberVO vo) throws Exception {
		return 0;
	}
	public MemberVO getMember(String id) throws Exception {
		MemberVO vo = sqlSession.selectOne("member.memberId",id);
		return vo;
	}
	public void updateMember(MemberVO vo) throws Exception {
		sqlSession.update("member.memberUpdate",vo);		
	}

	public int deleteMember(String id, String passwd) throws Exception {
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPasswd(passwd);
		int count = sqlSession.selectOne("member.userCheck",vo);
		if(count!=1) {	// 비밀번호가 다른 경우
			return -1;	// -1 리턴 받음
		}
		else {
			sqlSession.delete("member.memberDelete", vo.getId());
		}
		return 0;
	}
	//admin 세션 체크
	public int adminCheck(MemberVO vo) throws Exception{
		int check = 0;
		check = sqlSession.selectOne("member.adminCheck",vo);
		return check;
	}
	// admin이 회원 정보 관리를 위해 list 받기 위한 메서드
	public List showMember() throws Exception{
		List list = null;
		list = sqlSession.selectList("member.getMemberList");
		return list;
	}
	// admin이 계정 삭제
	public int deleteMemberByAdmin(String id) throws Exception{
		int check = 0;
		try {
			check = sqlSession.delete("deleteMemberByAdmin", id);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}
	public int updateMemberByAdmin(MemberVO vo) throws Exception{
		int check = 0;
		try {
			check = sqlSession.update("updateMemberByAdmin", vo);
		}catch (Exception e) {
			e.printStackTrace();			
		}		
		return check;		
	}
	
	
	
	
	
	
	
	
	

}
