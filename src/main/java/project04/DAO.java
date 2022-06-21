package project04;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import project04.vo.Account;

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
}