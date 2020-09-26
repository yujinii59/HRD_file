package kr.stay.reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class ReserveMgr {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;

	public ReserveMgr() {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("ReserveMgr err : " + e);
		}
	}
	
	public boolean insertReservation(ReserveBean reserv , String option) {
		boolean b = false;
		
		try {
			conn = ds.getConnection();
			String sql = "insert into reservationlist(hotel_no, startdate, enddate, personsu, option, sdate, state, guest_id, host_id) values (?,?,?,?,?,now(),?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reserv.getHotel_no());
			pstmt.setString(2, reserv.getStartdate());
			pstmt.setString(3, reserv.getEnddate());
			pstmt.setString(4, reserv.getPersonsu());
			pstmt.setString(5, option);
			pstmt.setString(6, "1");		//reserv.getState()
			pstmt.setString(7, reserv.getGuest_id());
			pstmt.setString(8, reserv.getHost_id());
			
			if(pstmt.executeUpdate() > 0) b = true;
			
		} catch (Exception e) {
			System.out.println("insertReservation err : " + e);
		} finally { 
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return b;
	
	}
	
	public ArrayList<ReserveDto> getReserveId(String guestid){
		ArrayList<ReserveDto> list = new ArrayList<ReserveDto>();
		
		try {
			conn = ds.getConnection();
			String sql = "select * from reservationlist where guest_id = ? order by no desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, guestid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReserveDto dto = new ReserveDto();
				dto.setNo(rs.getString("no"));
				dto.setHotel_no(rs.getString("hotel_no"));
				dto.setStartdate(rs.getString("startdate"));
				dto.setEnddate(rs.getString("enddate"));
				dto.setPersonsu(rs.getString("personsu"));
				dto.setOption(rs.getString("option"));
				dto.setSdate(rs.getString("sdate"));
				dto.setState(rs.getString("state"));
				dto.setGuest_id(rs.getString("guest_id"));
				dto.setHost_id(rs.getString("host_id"));
				list.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println("getReserve err : " + e);
		} finally { 
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return list;
	}
	
	
	public ReserveDto getReserve(String no) {
		ReserveDto dto = null;
		
		try {
			conn = ds.getConnection();
			String sql = "select * from reservationlist where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new ReserveDto();
				dto.setNo(rs.getString("no"));
				dto.setHotel_no(rs.getString("hotel_no"));
				dto.setStartdate(rs.getString("startdate"));
				dto.setEnddate(rs.getString("enddate"));
				dto.setPersonsu(rs.getString("personsu"));
				dto.setOption(rs.getString("option"));
				dto.setSdate(rs.getString("sdate"));
				dto.setState(rs.getString("state"));
				dto.setGuest_id(rs.getString("guest_id"));
				dto.setHost_id(rs.getString("host_id"));
			}
			
		} catch (Exception e) {
			System.out.println("getReserve err : " + e);
		} finally { 
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return dto;
	}
	
	public ArrayList<ReserveDto> getReserveAll(){
		ArrayList<ReserveDto> list = new ArrayList<ReserveDto>();
		
		try {
			conn = ds.getConnection();
			String sql = "select * from reservationlist order by no desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReserveDto dto = new ReserveDto();
				dto.setNo(rs.getString("no"));
				dto.setHotel_no(rs.getString("hotel_no"));
				dto.setStartdate(rs.getString("startdate"));
				dto.setEnddate(rs.getString("enddate"));
				dto.setPersonsu(rs.getString("personsu"));
				dto.setOption(rs.getString("option"));
				dto.setSdate(rs.getString("sdate"));
				dto.setState(rs.getString("state"));
				dto.setGuest_id(rs.getString("guest_id"));
				dto.setHost_id(rs.getString("host_id"));
				list.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println("getReserveAll err : " + e);
		} finally { 
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return list;
	}
	
	public boolean deleteReserv(String no) {
		boolean b = false;
		
		try {
			conn = ds.getConnection();
			String sql = "delete from reservationlist where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			
			if(pstmt.executeUpdate() > 0) b = true;
			
		} catch (Exception e) {
			System.out.println("deleteReserv err : " + e);
		} finally { 
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return b;
	}
	
	public ArrayList<ReserveDto> getReserveHostid(String hostid){
		ArrayList<ReserveDto> list = new ArrayList<ReserveDto>();
		
		try {
			conn = ds.getConnection();
			String sql = "select * from reservationlist where host_id = ? order by no desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hostid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReserveDto dto = new ReserveDto();
				dto.setNo(rs.getString("no"));
				dto.setHotel_no(rs.getString("hotel_no"));
				dto.setStartdate(rs.getString("startdate"));
				dto.setEnddate(rs.getString("enddate"));
				dto.setPersonsu(rs.getString("personsu"));
				dto.setOption(rs.getString("option"));
				dto.setSdate(rs.getString("sdate"));
				dto.setState(rs.getString("state"));
				dto.setGuest_id(rs.getString("guest_id"));
				dto.setHost_id(rs.getString("host_id"));
				list.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println("getReserveAll err : " + e);
		} finally { 
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return list;
	}
	
	public boolean reserveUpdate(ReserveBean bean, String no) {
		boolean b = false;
		
		try {
			conn = ds.getConnection();
			String sql = "update reservationlist set hotel_no=?, startdate=?, enddate=?, personsu=?, option=?, sdate=?, state=?, guest_id=?, host_id =? where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,bean.getHotel_no());
			pstmt.setString(2,bean.getStartdate());
			pstmt.setString(3,bean.getEnddate());
			pstmt.setString(4,bean.getPersonsu());
			pstmt.setString(5,bean.getOption());
			pstmt.setString(6,bean.getSdate());
			pstmt.setString(7,bean.getState());
			pstmt.setString(8,bean.getGuest_id());
			pstmt.setString(9,bean.getHost_id());
			pstmt.setString(10, no);
			System.out.println(sql + "   " + no);
			
			if(pstmt.executeUpdate() > 0) b = true;
			
			
		} catch (Exception e) {
			System.out.println("reserveUpdate err : " + e);
		} finally { 
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}		
		return b;
	}
	
}

