package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import models.book.Book;


public class BookDAO {
	private Connection conn;
	public List<Book> findALL()throws Exception{
		String sql = "SELECT * FROM BOOK";
		Statement smt = null;

		try{
			conn = DBManager.getConnection();
			smt = conn.createStatement();
			ResultSet rs = smt.executeQuery(sql);

			List<Book> books = new ArrayList<Book>();
			while(rs.next()){
				Book book = new Book();
				book.setBookId(rs.getInt("BOOK_ID"));
				book.setBookNameMain(rs.getString("BOOK_NAME_MAIN"));
				book.setBookNameSub(rs.getString("BOOK_NAME_SUB"));
				book.setAuthor(rs.getString("AUTHOR"));
				book.setPrice(rs.getInt("PRICE"));
				book.setIssueDay(rs.getDate("ISSUE_DAY"));
				book.setPage(rs.getInt("PAGE"));
				book.setIsbn(rs.getString("ISBN"));
				book.setCategoryId(rs.getInt("CATEGORY_ID"));
				book.setIntroductionReport(rs.getString("INTRODUCTION_REPORT"));
				books.add(book);
			}
			return books;
		}catch(Exception e){
			throw new Exception(e);
		}finally{
			if(smt != null){
				try{
					smt.close();
					}catch(SQLException e){
						throw new Exception(e);
					}
			}
			if(conn != null){
				try{
					conn.close();
				}catch(SQLException e){
					throw new Exception(e);
				}
			}
		}
	}
	
	//一覧画面にGETで投げて使う
	public ArrayList<Book> find_by(HttpServletRequest request) {
		ArrayList<Book> books = new ArrayList<Book>();
		StringBuilder sqlBuilder = new StringBuilder();
		
		if(request.getParameter("searchWord").length() == 0) {
			sqlBuilder.append("SELECT * FROM book b INNER JOIN review r ON b.book_id = r.book_id");
		} else {
			sqlBuilder.append("SELECT * FROM category c INNER JOIN (book b INNER JOIN review r ON b.book_id = r.book_id) ON b.category_id = c.category_id WHERE b.book_name_main = %?% AND b.author = %?% AND category_name = %?%");
		}
		

		if(request.getParameter("sortBy").equals("issueDayASC")) {
			sqlBuilder.append(" ORDER BY b.issue_day ASC");
		} else if (request.getParameter("sortBy").equals("issueDayDESC")) {
			sqlBuilder.append(" ORDER BY b.issue_day DESC");
		} else if (request.getParameter("sortBy").equals("reviewPointASC")) {
			sqlBuilder.append(" GROUP BY b.book_id ORDER BY AVG(r.review_point) ASC");
		} else if (request.getParameter("sortBy").equals("reviewPointDESC")) {
			sqlBuilder.append(" GROUP BY b.book_id ORDER BY AVG(r.review_point) DESC");
		}
		
		String sql = sqlBuilder.toString();
		
		if(request.getParameter("searchWord").length() == 0){
			
		} else {
			PreparedStatement ps = null;
			try{
				conn = DBManager.getConnection();
				ps = conn.prepareStatement(sql);
				ps.setString(1, request.getParameter("searchWord"));
				ps.setString(2, request.getParameter("searchWord"));
				ps.setString(3, request.getParameter("searchWord"));
				
				ResultSet rs = ps.executeQuery(sql);

				List<Book> books = new ArrayList<Book>();
				while(rs.next()){
					Book book = new Book();
					book.setBookId(rs.getInt("BOOK_ID"));
					book.setBookNameMain(rs.getString("BOOK_NAME_MAIN"));
					book.setBookNameSub(rs.getString("BOOK_NAME_SUB"));
					book.setAuthor(rs.getString("AUTHOR"));
					book.setPrice(rs.getInt("PRICE"));
					book.setIssueDay(rs.getDate("ISSUE_DAY"));
					book.setPage(rs.getInt("PAGE"));
					book.setIsbn(rs.getString("ISBN"));
					book.setCategoryId(rs.getInt("CATEGORY_ID"));
					book.setIntroductionReport(rs.getString("INTRODUCTION_REPORT"));
					books.add(book);
				}
				return books;
			}catch(Exception e){
				throw new Exception(e);
			}finally{
				if(ps != null){
					try{
						ps.close();
						}catch(SQLException e){
							throw new Exception(e);
						}
				}
				if(conn != null){
					try{
						conn.close();
					}catch(SQLException e){
						throw new Exception(e);
					}
				}
			}	
		}	
	}
	public Book find(int id) throws Exception {
		String sql = "SELECT * FROM book WHERE book_id = ?";
		Book book = new Book();
		PreparedStatement ps = null;
		try {
			conn = DBManager.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				book.setBookId(rs.getInt("BOOK_ID"));
				book.setBookNameMain(rs.getString("BOOK_NAME_MAIN"));
				book.setBookNameSub(rs.getString("BOOK_NAME_SUB"));
				book.setAuthor(rs.getString("AUTHOR"));
				book.setPrice(rs.getInt("PRICE"));
				book.setIssueDay(rs.getDate("ISSUE_DAY"));
				book.setPage(rs.getInt("PAGE"));
				book.setIsbn(rs.getString("ISBN"));
				book.setCategoryId(rs.getInt("CATEGORY_ID"));
				book.setIntroductionReport(rs.getString("INTRODUCTION_REPORT"));
			}
			return book;
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			if(ps!= null){
				ps.close();
			}

			if(conn != null){
				try{
					conn.close();
				}catch(SQLException e){
					throw new Exception(e);
				}
			}
		}
	}

	public void create(Book book) throws Exception {
		String sql = "INSERT INTO book VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = null;
		try{

			conn = DBManager.getConnection();
			ps = conn.prepareStatement(sql);
			//Bookクラスの情報をもとにクエリを完成させていく
			ps.setInt(1, book.getBookId());
			ps.setString(2, book.getBookNameMain());

			if(book.getBookNameSub() != null) {
				ps.setString(3, book.getBookNameSub());
			} else {
				ps.setNull(3, java.sql.Types.NULL);
			}

			ps.setString(4, book.getAuthor());

			if(Integer.toString(book.getPrice()) != null) {
				ps.setInt(5, book.getPrice());
			} else {
				ps.setNull(5, java.sql.Types.NULL);
			}


			if(book.getIssueDay() != null) {
				java.sql.Date d2 = new java.sql.Date(book.getIssueDay().getTime());
				ps.setDate(6, d2);
			} else {
				ps.setNull(6, java.sql.Types.NULL);
			}

			ps.setInt(7, book.getPage());


			if(book.getIsbn() != null) {
				ps.setString(8, book.getIsbn());
			} else {
				ps.setNull(8, java.sql.Types.NULL);
			}

			ps.setInt(9, book.getCategoryId());


			if(book.getIntroductionReport() != null) {
				ps.setString(10, book.getIntroductionReport());
			} else {
				ps.setNull(10, java.sql.Types.NULL);
			}

			int cnt = ps.executeUpdate();
		} catch(Exception e) {
			throw new Exception(e);
		} finally {
			if(ps!= null){
				ps.close();
			}

			if(conn != null){
				try{
					conn.close();
				}catch(SQLException e){
					throw new Exception(e);
				}
			}
		}
	}

	public void update(Book book) throws Exception {
		String sql =
			"UPDATE BOOK SET BOOK_ID = ?, BOOK_NAME_MAIN = ?, BOOK_NAME_SUB = ?, AUTHOR = ?, PRICE = ?, ISSUE_DAY = ?, PAGE = ?, ISBN = ?, CATEGORY_ID = ?, INTRODUCTION_REPORT =? WHERE BOOK_ID = ?";
		PreparedStatement ps = null;
		try{
			conn = DBManager.getConnection();
			ps = conn.prepareStatement(sql);

			//Bookクラスの情報をもとにクエリを完成させていく
			ps.setInt(1, book.getBookId());
			ps.setString(2, book.getBookNameMain());

			if(book.getBookNameSub() != null) {
				ps.setString(3, book.getBookNameSub());
			} else {
				ps.setNull(3, java.sql.Types.NULL);
			}

			ps.setString(4, book.getAuthor());

			if(Integer.toString(book.getPrice()) != null) {
				ps.setInt(5, book.getPrice());
			} else {
				ps.setNull(5, java.sql.Types.NULL);
			}


			if(book.getIssueDay() != null) {
				java.sql.Date d2 = new java.sql.Date(book.getIssueDay().getTime());
				ps.setDate(6, d2);
			} else {
				ps.setNull(6, java.sql.Types.NULL);
			}

			ps.setInt(7, book.getPage());


			if(book.getIsbn() != null) {
				ps.setString(8, book.getIsbn());
			} else {
				ps.setNull(8, java.sql.Types.NULL);
			}

			ps.setInt(9, book.getCategoryId());


			if(book.getIntroductionReport() != null) {
				ps.setString(10, book.getIntroductionReport());
			} else {
				ps.setNull(10, java.sql.Types.NULL);
			}

			ps.setInt(11, book.getBookId());

			int cnt = ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		} finally {
			if(ps!= null){
				ps.close();
			}

			if(conn != null){
				try{
					conn.close();
				}catch(SQLException e){
					throw new Exception(e);
				}
			}
		}
	}

	public void destroy(Book book) throws Exception {
		// bookのidを受け取る
		// うけとったbookのidを持ってるreviewを全部削除するSQLを発行する
		//実行する

		String sql1 = "DELETE FROM review WHERE book_id = ?";
		String sql2 = "DELETE FROM book WHERE book_id = ?";
		PreparedStatement ps = null;

		try {
			// bookのidをもとにbook削除用のSQLを発行する

			conn = DBManager.getConnection();
			conn.setAutoCommit(false);

			ps = conn.prepareStatement(sql1);
			int bookId = book.getBookId();
			ps.setInt(1, bookId);
			int cnt = ps.executeUpdate();


			ps = conn.prepareStatement(sql2);
			int bookId2 = book.getBookId();
			ps.setInt(1, bookId2);
			int cnt2 = ps.executeUpdate();

			conn.commit();


		} catch (Exception e) {
			conn.rollback();
			throw new Exception(e);
		} finally {
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					throw new Exception(e);
				}
			}
			if (conn != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					throw new Exception(e);
				}
			}
		}

	}

	public void joinCategoryName(Book book)throws Exception{
		String sql = "SELECT B.BOOK_NAME_MAIN, C.CATEGORY_NAME FROM BOOK B, CATEGORY C WHERE B.CATEGORY_ID = C.CATEGORY_ID AND B.BOOK_ID = ?";
		PreparedStatement ps = null;
		try{
			int bookId = book.getBookId();
			conn = DBManager.getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, bookId);

			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				book.setCategoryName(rs.getString("CATEGORY_NAME"));
			}
		} catch(Exception e) {
			throw new Exception(e);
		} finally {
			if(ps!= null){
				ps.close();
			}

			if(conn != null){
				try{
					conn.close();
				}catch(SQLException e){
					throw new Exception(e);
				}
			}
		}
	}
	
}
