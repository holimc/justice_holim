package project.justice.member;

import java.util.List;

public interface MemberImpl {
	public int userCheck(MemberVO vo) throws Exception;
	public void insertMember(MemberVO vo) throws Exception;
	public int confirmId(MemberVO vo) throws Exception;
	public MemberVO getMember(String id) throws Exception;
	public void updateMember(MemberVO vo) throws Exception;
	public int deleteMember(String id,String passwd) throws Exception;
	public int adminCheck(MemberVO vo) throws Exception;
	public List showMember(int start, int end, String category, String keyword) throws Exception;
	public int deleteMemberByAdmin(String id) throws Exception;
	public int updateMemberByAdmin(MemberVO vo) throws Exception;
}
