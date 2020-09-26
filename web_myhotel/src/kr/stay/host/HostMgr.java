package kr.stay.host;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class HostMgr {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public HostMgr() {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("HotelMgr err : " + e);
		}
	}
	
	public HostDto getInfo(String hostid) {
		HostDto dto = null;
		
		try {
			conn = ds.getConnection();
			String sql = "select * from hotelhost where hostid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hostid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new HostDto();
				dto.setHostid(rs.getString("hostid"));
				dto.setHostpasswd(rs.getString("hostpasswd"));
				dto.setHosttel(rs.getString("hosttel"));
			}
			
		} catch (Exception e) {
			System.out.println("getInfo err : " + e);
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
	
	public boolean loginCheck(String hostid, String hostpasswd) {
		boolean b = false;
		
		try {
			conn = ds.getConnection();
			String sql = "select hostid, hostpasswd from hotelhost where hostid = ? and hostpasswd = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hostid);
			pstmt.setString(2, hostpasswd);
			rs = pstmt.executeQuery();
			b = rs.next();
			
		} catch (Exception e) {
			System.out.println("loginCheck err : " + e);
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
	
	public boolean hostInsert(HostBean bean) {
		boolean b = false;
		
		try {
			conn = ds.getConnection();
			String sql = "insert into hotelhost values(?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getHostid());
			pstmt.setString(2, bean.getHostpasswd());
			pstmt.setString(3, bean.getHosttel());
			if(pstmt.executeUpdate() > 0) b = true;
			
		} catch (Exception e) {
			System.out.println("hostInsert err : " + e);
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
	
	public boolean checkHostId(String hostid) {
		boolean b = false;
		
		try {
			conn = ds.getConnection();
			String sql= "select hostid from hotelhost where hostid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hostid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) b = true;
			
		} catch (Exception e) {
			System.out.println("checkHostId err : " + e);
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
	
	public ArrayList<HostDto> getHostAll(){
		ArrayList<HostDto> list = new ArrayList<HostDto>();
		
		try {
			conn = ds.getConnection();
			String sql= "select * from hotelhost order by hostid desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				HostDto dto = new HostDto();
				dto.setHostid(rs.getString("hostid"));
				dto.setHostpasswd(rs.getString("hostpasswd"));
				dto.setHosttel(rs.getString("hosttel"));
				list.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println("getHostAll err : " + e);
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
	
	public boolean deleteHost(String hostid) {
		boolean b = false;
		
		try {
			conn = ds.getConnection();
			String sql = "delete from hotelhost where hostid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hostid);
			
			if(pstmt.executeUpdate() > 0) b = true;
		} catch (Exception e) {
			System.out.println("deleteHost err : " + e);
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
