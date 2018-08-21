package com.jsp.project.travel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class TravelDBBean {
	private static TravelDBBean instance = new TravelDBBean();
	
	public static TravelDBBean getInstance() {
		return instance;
	}
	
	private TravelDBBean() {
		
	}
	
	//커넥션 풀로부터 커넥션객체를 얻어내는 메소드
	private Connection getConnection() throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc:mysql://localhost:3306/mydb");
		return ds.getConnection();
	}
	
	//등록 메소드
	public void insertTravel(TravelBean travel)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(
					"insert into travel values(?,'?','?','?','?','?','?','?','?','?','?',?)");
			pstmt.setInt(1, travel.getId());
			pstmt.setString(2, travel.getTitle_img());
			pstmt.setString(3, travel.getConcept());
			pstmt.setString(4, travel.getPlace());
			pstmt.setString(5, travel.getPlace_e());
			pstmt.setString(6, travel.getS_date());
			pstmt.setString(7, travel.getE_date());
			pstmt.setString(8, travel.getMoney());
			pstmt.setString(9, travel.getTrans());
			pstmt.setString(10, travel.getPeople());
			pstmt.setString(11, travel.getCourse());
			pstmt.setTimestamp(12, travel.getAdd_date());
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) 
				try {pstmt.close();}catch(SQLException ex) {}
			if(conn != null)
				try {conn.close();}catch(SQLException ex) {}
		}
	}
	
	//전체 등록된 여행 수를 얻어내는 메소드
	public int getTravelCount() throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select count(*) from book");
			rs = pstmt.executeQuery();
			
			if(rs.next())
				x = rs.getInt(1);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)
				try {rs.close();}catch(SQLException e) {}
			if(pstmt != null)
				try {pstmt.close();}catch(SQLException e) {}
			if(conn != null)
				try {conn.close();}catch(SQLException e) {}
		}
		
		return x;
	}
	
	//travelid 에 해당하는 책의 정보를 얻어내는 메소드
	//등록된 여행을 수정하기 위해 수정폼으로 읽어들이기 위한 메소드
	public TravelBean getTravel(int travelId) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		TravelBean travel = null;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select * from travel where id = ?");
			pstmt.setInt(1, travelId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				travel = new TravelBean();
				
				travel.setTitle_img(rs.getString("title_img"));
				travel.setConcept(rs.getString("concept"));
				travel.setPlace(rs.getString("place"));
				travel.setPlace_e(rs.getString("place_e"));
				travel.setS_date(rs.getString("s_date"));
				travel.setE_date(rs.getString("e_date"));
				travel.setMoney(rs.getString("money"));
				travel.setTrans(rs.getString("trans"));
				travel.setPeople(rs.getString("people"));
				travel.setCourse(rs.getString("course"));
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)
				try {rs.close();}catch(SQLException e) {}
			if(pstmt != null)
				try {pstmt.close();}catch(SQLException e) {}
			if(conn != null)
				try {conn.close();}catch(SQLException e) {}
		}
		
		return travel;
	}
	
	//등록된 여행 정보를 수정시 사용하는 메소드
	public void updateTravel(TravelBean travel, int travelId)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			conn = getConnection();
			
			sql = "update travel set title_img=?, cocept=?, place=?, place_e=?";
			sql += ", s_date=?, e_date=?, money=?, trans=?, people=?, course=?";
			sql += " where id=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, travel.getTitle_img());
			pstmt.setString(2, travel.getConcept());
			pstmt.setString(3, travel.getPlace());
			pstmt.setString(4, travel.getPlace_e());
			pstmt.setString(5, travel.getS_date());
			pstmt.setString(6, travel.getE_date());
			pstmt.setString(7, travel.getMoney());
			pstmt.setString(8, travel.getTrans());
			pstmt.setString(9, travel.getPeople());
			pstmt.setString(10, travel.getCourse());
			pstmt.setInt(11, travelId);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null)
				try {pstmt.close();}catch(SQLException e) {}
			if(conn != null)
				try {pstmt.close();}catch(SQLException e) {}
		}
	}
	
	//id에 해당하는 여행의 정보를 삭제시 사용하는 메소드
	public void deleteTravel(int travelId)throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(
					"delete from travel where id=?");
			pstmt.setInt(1, travelId);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)
				try {rs.close();}catch(SQLException e) {}
			if(pstmt != null)
				try {pstmt.close();}catch(SQLException e) {}
			if(conn != null)
				try {conn.close();}catch(SQLException e) {}
		}
	}
}
