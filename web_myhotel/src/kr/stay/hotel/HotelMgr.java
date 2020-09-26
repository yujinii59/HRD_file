package kr.stay.hotel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class HotelMgr {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public HotelMgr() {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
			System.out.println("HotelMgr err : " + e);
		}
	}
	
	public ArrayList<HotelDto> getHotelHostAll(String hostid){
		ArrayList<HotelDto> list = new ArrayList<HotelDto>();
		
		try {
			conn = ds.getConnection();
			String sql = "select * from hotellist where host_id = ? order by no desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hostid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				HotelDto dto = new HotelDto();
				dto.setNo(rs.getString("no"));
				dto.setHost_id(rs.getString("host_id"));
				dto.setName(rs.getString("name"));
				dto.setHotel_address(rs.getString("hotel_address"));
				dto.setImage(rs.getString("image"));
				dto.setDetail(rs.getString("detail"));
				dto.setMin_person(rs.getString("min_person"));
				dto.setMax_person(rs.getString("max_person"));
				dto.setPrice(rs.getString("price"));
				list.add(dto);

			}
		} catch (Exception e) {
			System.out.println("getHotelAll err : " + e);
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
	
	public ArrayList<HotelDto> getHotelAll(){
		ArrayList<HotelDto> list = new ArrayList<HotelDto>();
		
		try {
			conn = ds.getConnection();
			String sql = "select * from hotellist order by no desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				HotelDto dto = new HotelDto();
				dto.setNo(rs.getString("no"));
				dto.setHost_id(rs.getString("host_id"));
				dto.setName(rs.getString("name"));
				dto.setHotel_address(rs.getString("hotel_address"));
				dto.setImage(rs.getString("image"));
				dto.setDetail(rs.getString("detail"));
				dto.setMin_person(rs.getString("min_person"));
				dto.setMax_person(rs.getString("max_person"));
				dto.setPrice(rs.getString("price"));
				list.add(dto);

			}
		} catch (Exception e) {
			System.out.println("getHotelAll err : " + e);
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
	
	public ArrayList<HotelDto> getHotelGu(String zip_narea2, String personsu){
		ArrayList<HotelDto> list = new ArrayList<HotelDto>();
		
		try {
			conn = ds.getConnection();
			String sql = "select * from hotellist where hotel_address like ? and min_person <= ? and max_person >= ? order by no desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + zip_narea2 + "%");
			pstmt.setString(2, personsu);
			pstmt.setString(3, personsu);
			System.out.println(sql + zip_narea2 + personsu);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				HotelDto dto = new HotelDto();
				dto.setNo(rs.getString("no"));
				dto.setHost_id(rs.getString("host_id"));
				dto.setName(rs.getString("name"));
				dto.setHotel_address(rs.getString("hotel_address"));
				dto.setImage(rs.getString("image"));
				dto.setDetail(rs.getString("detail"));
				dto.setMin_person(rs.getString("min_person"));
				dto.setMax_person(rs.getString("max_person"));
				dto.setPrice(rs.getString("price"));
				list.add(dto);

			}
		} catch (Exception e) {
			System.out.println("getHotelAll err : " + e);
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
	
	
	public HotelDto getHotel(String no) {
		HotelDto dto = null;
		
		try {
			conn = ds.getConnection();
			String sql = "select * from hotellist where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new HotelDto();
				dto.setNo(rs.getString("no"));
				dto.setHost_id(rs.getString("host_id"));
				dto.setName(rs.getString("name"));
				dto.setHotel_address(rs.getString("hotel_address"));
				dto.setImage(rs.getString("image"));
				dto.setDetail(rs.getString("detail"));
				dto.setMin_person(rs.getString("min_person"));
				dto.setMax_person(rs.getString("max_person"));
				dto.setPrice(rs.getString("price"));
			}
		} catch (Exception e) {
			System.out.println("getHotel err : " + e);
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
	
	
	public boolean insertHotel(HttpServletRequest request, String hostid) {
		boolean b = false;
		
		try {
			//업로드할 이미지 경로(절대경로)	cos.jar사용
			String uploadDir = "C:/work/wsou/web_myhotel/WebContent/upload";
			
			MultipartRequest multi = new MultipartRequest(request, uploadDir, 5*1024*1024, "utf-8", new DefaultFileRenamePolicy());	//최대크기 5MB
			
			conn = ds.getConnection();
			String sql = "insert into hotellist(host_id, name, hotel_address, image, detail, min_person, max_person, price) values(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hostid);
			pstmt.setString(2, multi.getParameter("name"));
			pstmt.setString(3, multi.getParameter("hotel_address"));
			
			if(multi.getFilesystemName("image") == null) {
				pstmt.setString(4, "ready.gif");		//상품 등록 시 이미지를 선택하지 않은 경우
			}else {
				pstmt.setString(4, multi.getFilesystemName("image"));  //상품 등록 시 이미지를 선택한 경우
			}
			
			pstmt.setString(5, multi.getParameter("detail"));
			pstmt.setString(6, multi.getParameter("min_person"));
			pstmt.setString(7, multi.getParameter("max_person"));
			pstmt.setString(8, multi.getParameter("price"));
			
			if(pstmt.executeUpdate() > 0) b = true;
			
		} catch (Exception e) {
			System.out.println("insertHotel err : " + e);
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
	
	public boolean updateHotel(HttpServletRequest request) {
		boolean b = false;
		
		try {
			//업로드할 이미지 경로(절대경로)	cos.jar사용
			String uploadDir = "C:/work/wsou/web_myhotel/WebContent/upload";
			
			MultipartRequest multi = new MultipartRequest(request, uploadDir, 5*1024*1024, "utf-8", new DefaultFileRenamePolicy());	//최대크기 5MB
			
			conn = ds.getConnection();
			
			if(multi.getFilesystemName("image") == null) {
				String sql = "update hotellist set name=?, hotel_address=?, detail=?, min_person=?, max_person=?, price=? where no = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, multi.getParameter("name"));
				pstmt.setString(2, multi.getParameter("hotel_address"));
				pstmt.setString(3, multi.getParameter("detail"));
				pstmt.setString(4, multi.getParameter("min_person"));
				pstmt.setString(5, multi.getParameter("max_person"));
				pstmt.setString(6, multi.getParameter("price"));
				pstmt.setString(7, multi.getParameter("no"));
			}else {
				String sql = "update hotellist set name=?, hotel_address=?, image=?, detail=?, min_person=?, max_person=?, price=? where no = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, multi.getParameter("name"));
				pstmt.setString(2, multi.getParameter("hotel_address"));
				pstmt.setString(3, multi.getFilesystemName("image"));
				pstmt.setString(4, multi.getParameter("detail"));
				pstmt.setString(5, multi.getParameter("min_person"));
				pstmt.setString(6, multi.getParameter("max_person"));
				pstmt.setString(7, multi.getParameter("price"));
				pstmt.setString(8, multi.getParameter("no"));
			}
			
			if(pstmt.executeUpdate() > 0) b = true;
			
		} catch (Exception e) {
			System.out.println("updateHotel err : " + e);
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
	
	public boolean deleteHotel(String no) {
		boolean b = false;
		
		try {
			conn = ds.getConnection();
			String sql = "delete from hotellist where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, no);
			
			if(pstmt.executeUpdate() > 0) b = true;
		} catch (Exception e) {
			System.out.println("deleteHotel err : " + e);
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
