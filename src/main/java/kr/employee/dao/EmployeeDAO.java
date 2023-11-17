package kr.employee.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.employee.vo.EmployeeVO;
import kr.employee.dao.EmployeeDAO;
import kr.util.DBUtil;

public class EmployeeDAO {
	//싱글턴 패턴
	private static EmployeeDAO instance = new EmployeeDAO();
	
	public static EmployeeDAO getInstance() {
		return instance;
	}
	
	private EmployeeDAO() {}
	
	//사원 등록
	public void insertEmployee(EmployeeVO vo)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			//커넥션 풀로부터 커넥션을 할당(1,2단계)
			conn = DBUtil.getConnection();
			//sql문 작성
			sql = "INSERT INTO semployee (snum,id,name,passwd,salary,job) VALUES (semployee_seq.nextval,?,?,?,?,?)";
			//PreparedStatement객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getPasswd());
			pstmt.setInt(4, vo.getSalary());
			pstmt.setString(5, vo.getJob());
			//sql문 실행
			pstmt.executeUpdate();
		}catch(Exception e){
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	//사원상세정보
	public EmployeeVO getEmployee(int snum)throws Exception{
		Connection conn= null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		String sql = null;
		EmployeeVO vo = null;
		
		try {
			//커넥션풀로부터 커넥션을 할당
			conn = DBUtil.getConnection();
			//sql문 작성
			sql = "SELECT * FROM semployee WHERE snum=?";
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setInt(1, snum);
			//sql문 실행
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new EmployeeVO(); //자바빈 객체 생성
				vo.setSnum(rs.getInt("snum"));
				vo.setId(rs.getString("id"));
				vo.setPasswd(rs.getString("passwd"));
				vo.setName(rs.getString("name"));
				vo.setSalary(rs.getInt("salary"));
				vo.setJob(rs.getString("job"));
				vo.setReg_date(rs.getDate("reg_date"));
			}
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
		return vo;
	}
	
	//아이디 중복체크, 로그인 체크
	public EmployeeVO checkEmployee(String id)throws Exception{
		Connection conn= null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		String sql = null;
		EmployeeVO vo = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM semployee WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new EmployeeVO();
				vo.setId(rs.getString("id"));
				vo.setSnum(rs.getInt("snum"));
				vo.setPasswd(rs.getString("passwd"));
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return vo;
	}
	
	//사원정보수정
	public void updateEmployee(EmployeeVO vo)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			//커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			//sql문 작성
			sql = "UPDATE semployee SET name=?,passwd=?,salary=?,job=? WHERE snum=?";
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getPasswd());
			pstmt.setInt(3, vo.getSalary());
			pstmt.setString(4, vo.getJob());
			pstmt.setInt(5, vo.getSnum());
			//sql문 실행
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	//사원정보삭제
	public void deleteEmployee(int snum)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		String sql = null;
		
		try {
			//커넥션풀로부터 커넥션을 할당
			 conn = DBUtil.getConnection();
			 conn.setAutoCommit(false);
			 
			 //자식글을 먼저 다 지우고 탈퇴, 없으면 그냥 탈퇴
			 //sql문 작성
			 sql = "DELETE FROM story WHERE snum=?";
			 //PreparedStatement객체 생성
			 pstmt = conn.prepareStatement(sql);
			 //?에 데이터 바인딩
			 pstmt.setInt(1, snum);
			 //sql문 실행
			 pstmt.executeUpdate();
			 
			 sql = "DELETE FROM semployee WHERE snum=?";
			 pstmt2 = conn.prepareStatement(sql);
			 pstmt2.setInt(1, snum);
			 pstmt2.executeUpdate();
			 
			 conn.commit();
		}catch(Exception e) {
			conn.rollback();
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt2, null);
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
}
