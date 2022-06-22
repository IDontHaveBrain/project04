package project04;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import project04.vo.Account;
import project04.vo.Board;
import project04.vo.Photog;

public class DAO {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public void setConn() throws SQLException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String info = "jdbc:oracle:thin:@localhost:1521:xe";
			con = DriverManager.getConnection(info, "p04", "1111"); // 각자 환경에 맞춰 설정해두세요.
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("클래스 에러 : " + e.getMessage());
		}
	}

	// 1 로그인 성공, 0 로그인 실패
	public int login(String id, String pw) {
		int result = 0;
		try {
			setConn();
			String sql = "SELECT * FROM ACCOUNT WHERE id = ? AND pw = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				result = 1;
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("일반 예외 : "+e.getMessage());
		}finally {
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return result; // 예외발생
	}

	public Account getAccountNo(int accno) {
		Account acc = null;
		try {
			setConn();
			String sql = "SELECT * FROM ACCOUNT WHERE accno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, accno);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				acc = new Account(
						rs.getInt("accno"),
						rs.getString("name"),
						rs.getString("id"),
						rs.getString("pw"),
						rs.getDate("birthday"),
						rs.getString("mnum"),
						rs.getString("pnum"),
						rs.getString("email"),
						rs.getString("address"),
						rs.getDate("regdate"),
						rs.getInt("admin"));
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("일반 예외 : "+e.getMessage());
		}finally {
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return acc;
	}

	public Account getAccountId(String id) {
		Account acc = null;
		try {
			setConn();
			String sql = "SELECT * FROM ACCOUNT WHERE id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				acc = new Account(
						rs.getInt("accno"),
						rs.getString("name"),
						rs.getString("id"),
						rs.getString("pw"),
						rs.getDate("birthday"),
						rs.getString("mnum"),
						rs.getString("pnum"),
						rs.getString("email"),
						rs.getString("address"),
						rs.getDate("regdate"),
						rs.getInt("admin"));
			}
			
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("일반 예외 : "+e.getMessage());
		}finally {
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return acc;
	}

	public void insertAccount(Account acc) {
		try {
			setConn();
			con.setAutoCommit(false);
			String sql = "INSERT INTO Account VALUES("
					+ "	acc_seq.nextval," //기본키 accno
					+ "	?," // 이름
					+ "	?," // id
					+ "	?," // pw
					+ "	?," // 생년월일
					+ "	?," // 휴대폰번호
					+ " ?," // 집전화번호
					+ " ?," // 이메일
					+ " ?," // 주소
					+ " sysdate," // 가입일
					+ " ?)"; // 권한 0 일반, 1 관리자
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, acc.getId());
			pstmt.setString(2, acc.getPw());
			pstmt.setDate(3, acc.getBirthday());
			pstmt.setString(4, acc.getMnum());
			pstmt.setString(5, acc.getPnum());
			pstmt.setString(6, acc.getEmail());
			pstmt.setString(7, acc.getAddress());
			pstmt.setDate(8, acc.getRegdate());
			pstmt.setInt(9, acc.getAdmin());
			pstmt.executeUpdate();
			
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("일반 예외 : "+e.getMessage());
		}finally {
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	public void updateAccount(Account acc) {
		try {
			setConn();
			con.setAutoCommit(false);
			String sql = "UPDATE Account SET "
					+ "pw = ?, "
					+ "birthday = ? "
					+ "mnum = ? "
					+ "pnum = ? "
					+ "email = ? "
					+ "address = ? "
					+ "WHERE accno = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, acc.getPw());
			pstmt.setDate(2, acc.getBirthday());
			pstmt.setString(3, acc.getMnum());
			pstmt.setString(4, acc.getPnum());
			pstmt.setString(5, acc.getEmail());
			pstmt.setString(6, acc.getAddress());
			pstmt.setInt(7, acc.getAccno());
			pstmt.executeUpdate();
			
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("일반 예외 : "+e.getMessage());
		}finally {
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	public void deleteAccount(Account acc) {
		try {
			setConn();
			con.setAutoCommit(false);
			String sql = "DELETE FROM Account WHERE accno = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, acc.getAccno());
			pstmt.executeUpdate();
			
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("일반 예외 : "+e.getMessage());
		}finally {
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	//0622추가 (갤러리 dao)
	//전체 게시글 목록 조회
	public ArrayList<Board> getBdList() {
		ArrayList<Board> bdList = new ArrayList<Board>();
		try {
			setConn();
			String sql = "SELECT * FROM board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				//Board(int postid, int accno, String ptype)
				bdList.add(new Board(
							rs.getInt("postid"),
							rs.getInt("accno"),
							rs.getString("ptype")
							));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : "+e.getMessage());
		} catch ( Exception e ) {
			System.out.println("일반 예외 : "+e.getMessage());
		} finally {
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return bdList;
	}
	


	//전체 게시글 목록 조회 (계정번호를 이용해서)
	public ArrayList<Board> getBdListAccno(int accno) {
		ArrayList<Board> bdList = new ArrayList<Board>();
		try {
			setConn();
			String sql = "SELECT *\r\n"
					+ "FROM board\r\n"
					+ "WHERE accno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, accno);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				//Board(int postid, int accno, String ptype)
				bdList.add(new Board(
							rs.getInt("postid"),
							rs.getInt("accno"),
							rs.getString("ptype")
							));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : "+e.getMessage());
		} catch ( Exception e ) {
			System.out.println("일반 예외 : "+e.getMessage());
		} finally {
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return bdList;
	}

	//전체 게시글 목록 조회 (게시글유형을 이용해서)
	public ArrayList<Board> getBdListPtype(String ptype) {
		ArrayList<Board> bdList = new ArrayList<Board>();
		try {
			setConn();
			String sql = "SELECT *\r\n"
					+ "FROM board\r\n"
					+ "WHERE ptype=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ptype);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				//Board(int postid, int accno, String ptype)
				bdList.add(new Board(
							rs.getInt("postid"),
							rs.getInt("accno"),
							rs.getString("ptype")
							));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : "+e.getMessage());
		} catch ( Exception e ) {
			System.out.println("일반 예외 : "+e.getMessage());
		} finally {
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return bdList;
	}

	//전체 게시글 목록에서 삭제 (게시글번호 입력)
	public void deleteBdList(int postid) {
		try {
			setConn();
			con.setAutoCommit(false);
			String sql = "DELETE FROM board\r\n"
					+ "WHERE postid = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, postid);
			
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : "+e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.getMessage();
			}
			
		} catch ( Exception e ) {
			System.out.println("일반 예외 : "+e.getMessage());
		} finally {
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	// 전체 게시글 목록 등록
	public void insertBdList(Board bd) {
		try {
			setConn();
			con.setAutoCommit(false);
			//Board(int postid, int accno, String ptype)
			String sql = "INSERT INTO board values(brd_seq.nextval ,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bd.getAccno());
			pstmt.setString(2, bd.getPtype());
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : "+e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.getMessage();
			}
		} catch ( Exception e ) {
			System.out.println("일반 예외 : "+e.getMessage());
		} finally {
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	//포토갤러리 조회
	public ArrayList<Photog> getPgList() {
		ArrayList<Photog> pgList = new ArrayList<Photog>();
		try {
			setConn();
			String sql = "SELECT * from photog";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				//Photog(int postid, int accno, String title, Date uploaddate, String content, String imgurl)
				pgList.add(new Photog(
							rs.getInt("postid"),
							rs.getInt("accno"),
							rs.getString("title"),
							rs.getDate("uploaddate"),
							rs.getString("content"),
							rs.getString("imgurl")
							));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : "+e.getMessage());
		} catch ( Exception e ) {
			System.out.println("일반 예외 : "+e.getMessage());
		} finally {
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return pgList;
	}
	
	//제목으로 포토갤러리 조회
	public ArrayList<Photog> getPgListTitle(String title) {
		ArrayList<Photog> pgList = new ArrayList<Photog>();
		try {
			setConn();
			String sql = "SELECT *\r\n"
					+ "FROM photog\r\n"
					+ "WHERE title LIKE '%'||?||'%'";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, title);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				//Photog(int postid, int accno, String title, Date uploaddate, String content, String imgurl)
				pgList.add(new Photog(
							rs.getInt("postid"),
							rs.getInt("accno"),
							rs.getString("title"),
							rs.getDate("uploaddate"),
							rs.getString("content"),
							rs.getString("imgurl")
							));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : "+e.getMessage());
		} catch ( Exception e ) {
			System.out.println("일반 예외 : "+e.getMessage());
		} finally {
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return pgList;
	}

	//내용으로 포토갤러리 조회
	public ArrayList<Photog> getPgListContent(String content) {
		ArrayList<Photog> pgList = new ArrayList<Photog>();
		try {
			setConn();
			String sql = "SELECT *\r\n"
					+ "FROM photog\r\n"
					+ "WHERE content LIKE '%'||?||'%'";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, content);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				//Photog(int postid, int accno, String title, Date uploaddate, String content, String imgurl)
				pgList.add(new Photog(
							rs.getInt("postid"),
							rs.getInt("accno"),
							rs.getString("title"),
							rs.getDate("uploaddate"),
							rs.getString("content"),
							rs.getString("imgurl")
							));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : "+e.getMessage());
		} catch ( Exception e ) {
			System.out.println("일반 예외 : "+e.getMessage());
		} finally {
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return pgList;
	}

	//제목,내용으로 포토갤러리 조회
	public ArrayList<Photog> getPgListTitle_Content(String title, String content) {
		ArrayList<Photog> pgList = new ArrayList<Photog>();
		try {
			setConn();
			String sql = "SELECT *\r\n"
					+ "FROM photog\r\n"
					+ "WHERE title LIKE '%'||?||'%'"
					+ "AND content LIKE '%'||?||'%'";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				//Photog(int postid, int accno, String title, Date uploaddate, String content, String imgurl)
				pgList.add(new Photog(
							rs.getInt("postid"),
							rs.getInt("accno"),
							rs.getString("title"),
							rs.getDate("uploaddate"),
							rs.getString("content"),
							rs.getString("imgurl")
							));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : "+e.getMessage());
		} catch ( Exception e ) {
			System.out.println("일반 예외 : "+e.getMessage());
		} finally {
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return pgList;
	}

	//제목,내용으로 포토갤러리 조회
	public ArrayList<Photog> getPgList_All(String input) {
		ArrayList<Photog> pgList = new ArrayList<Photog>();
		try {
			setConn();
			String sql = "SELECT * FROM photog\r\n"
					+ "WHERE title LIKE '%'||?||'%'\r\n"
					+ "OR content LIKE '%'||?||'%'";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, input);
			pstmt.setString(2, input);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				//Photog(int postid, int accno, String title, Date uploaddate, String content, String imgurl)
				pgList.add(new Photog(
							rs.getInt("postid"),
							rs.getInt("accno"),
							rs.getString("title"),
							rs.getDate("uploaddate"),
							rs.getString("content"),
							rs.getString("imgurl")
							));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : "+e.getMessage());
		} catch ( Exception e ) {
			System.out.println("일반 예외 : "+e.getMessage());
		} finally {
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return pgList;
	}

	

	//포토갤러리 게시글번호로 조회 (단일데이터)
	public ArrayList<Photog> getPgList_Postid(int postid) {
		ArrayList<Photog> pgList = new ArrayList<Photog>();
		try {
			setConn();
			String sql = "SELECT *\r\n"
					+ "FROM photog\r\n"
					+ "WHERE postid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, postid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				//Photog(int postid, int accno, String title, Date uploaddate, String content, String imgurl)
				pgList.add(new Photog(
							rs.getInt("postid"),
							rs.getInt("accno"),
							rs.getString("title"),
							rs.getDate("uploaddate"),
							rs.getString("content"),
							rs.getString("imgurl")
							));
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : "+e.getMessage());
		} catch ( Exception e ) {
			System.out.println("일반 예외 : "+e.getMessage());
		} finally {
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return pgList;
	}

	//포토갤러리 데이터 수
	public int getPgList_Count() {
		int cnt=0;
		try {
			setConn();
			String sql = "SELECT count(*) c \r\n"
					+ "FROM PHOTOG";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			cnt=rs.getInt("c");
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : "+e.getMessage());
		} catch ( Exception e ) {
			System.out.println("일반 예외 : "+e.getMessage());
		} finally {
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return cnt;
	}

	//포토갤러리 게시글번호 이용해서 작성자 이름 반환
	public String getPgList_Name(int postid) {
		String name = "";
		try {
			setConn();
			String sql = "SELECT name\r\n"
					+ "FROM account\r\n"
					+ "WHERE accno IN (\r\n"
					+ "	SELECT accno\r\n"
					+ "	FROM photog\r\n"
					+ "	WHERE postid=?\r\n"
					+ ")";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, postid);
			rs = pstmt.executeQuery();
			rs.next();
			name=rs.getString("name");
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : "+e.getMessage());
		} catch ( Exception e ) {
			System.out.println("일반 예외 : "+e.getMessage());
		} finally {
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return name;
	}

	//포토갤러리 사용자번호(accno)이용해서 최근에 등록한 전체 게시글목록에서 postid반환
	public int getBdList_postid(int accno) {
		int postid = 0;
		try {
			setConn();
			String sql = "SELECT * FROM board WHERE accno=? ORDER BY postid desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, accno);
			rs = pstmt.executeQuery();
			rs.next();
			postid=rs.getInt("postid");
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : "+e.getMessage());
		} catch ( Exception e ) {
			System.out.println("일반 예외 : "+e.getMessage());
		} finally {
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return postid;
	}

	// 포토갤러리 등록
	// 수정필요
	public void insertPgList(Photog pg) {
		try {
			setConn();
			con.setAutoCommit(false);
			//Photog(int accno, String title, String content, String imgurl)
			String sql = "INSERT INTO photog values(?,\r\n"
					+ "	?,?,sysdate,?,\r\n"
					+ "	?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pg.getPostid());
			pstmt.setInt(2, pg.getAccno());
			pstmt.setString(3, pg.getTitle());
			pstmt.setString(4, pg.getContent());
			pstmt.setString(5, pg.getImgurl());
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : "+e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.getMessage();
			}
		} catch ( Exception e ) {
			System.out.println("일반 예외 : "+e.getMessage());
		} finally {
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	// 포토갤러리 수정
	public void updatePgList(Photog pg) {
		try {
			setConn();
			con.setAutoCommit(false); 
			String sql = "UPDATE photog\r\n"
					+ "	SET title = ?,\r\n"
					+ "		content = ?,\r\n"
					+ "		imgurl = ?\r\n"
					+ "	WHERE postid = ?\r\n"
					+ "	AND accno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pg.getTitle());
			pstmt.setString(2, pg.getContent());
			pstmt.setString(3, pg.getImgurl());
			pstmt.setInt(4, pg.getPostid());
			pstmt.setInt(5, pg.getAccno());
			
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : "+e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.getMessage();
			}
			
		} catch ( Exception e ) {
			System.out.println("일반 예외 : "+e.getMessage());
		} finally {
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	//포토갤러리 삭제
	public void deletePgList(int postid) {
		try {
			setConn();
			con.setAutoCommit(false);
			String sql = "DELETE FROM photog\r\n"
					+ "WHERE postid = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, postid);
			
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : "+e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.getMessage();
			}
			
		} catch ( Exception e ) {
			System.out.println("일반 예외 : "+e.getMessage());
		} finally {
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
}



