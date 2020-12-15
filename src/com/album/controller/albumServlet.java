package com.album.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.websocket.Session;

import com.album.model.AlbumVO;

import sun.rmi.server.Dispatcher;

@WebServlet("/album/albumManage.do")
@MultipartConfig
public class albumServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("add_album".equals(action)) {

			List<String> errorMsgs = new LinkedList();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				HttpSession session = null;
				session = req.getSession();
				String band_id = (String) session.getAttribute("band_id");
				
				String album_name = req.getParameter("album_name");
				if (album_name == null || (album_name.trim()).length() == 0) {
					errorMsgs.add("請輸入專輯名稱");
				}
				String album_intro = req.getParameter("album_intro");
				if (album_intro == null || (album_intro.trim()).length() == 0) {
					errorMsgs.add("請輸入專輯簡介");
				}
				java.sql.Timestamp album_add_time = new java.sql.Timestamp(
						new SimpleDateFormat("yyyy-MM-dd").parse(req.getParameter("album_add_time")).getTime());
//				album_photo
				Part album_photo = req.getPart("album_photo");
				InputStream album_photo_in = album_photo.getInputStream();
				byte[] album_photo_byte = new byte[album_photo_in.available()];
				album_photo_in.read(album_photo_byte);
				if(album_photo_in!=null) {
					album_photo_in.close();
				}
				
				String piece_name = req.getParameter("piece_name");
				if (piece_name == null || (piece_name.trim()).length() == 0) {
					errorMsgs.add("請輸入作品名稱");
				}
//				piece
				Part piece = req.getPart("piece");
				InputStream piece_in = album_photo.getInputStream();
				byte[] piece_byte = new byte[piece_in.available()];
				album_photo_in.read(piece_byte);
				if(piece_in!=null) {
					piece_in.close();
				}

				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/album/album_management.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 *****************************************/
				
				AlbumVO albumVO = new AlbumVO();
				albumVO.setBand_id(band_id);
				albumVO.setAlbum_name(album_name);
				albumVO.setAlbum_intro(album_intro);
				albumVO.setAlbum_photo(album_photo_byte);
				albumVO.setAlbum_status(1);
				albumVO.setAlbum_add_time(new java.sql.Timestamp(System.currentTimeMillis()));
				albumVO.setAlbum_release_time(new java.sql.Timestamp(System.currentTimeMillis()));
				albumVO.setAlbum_last_edit_time(new java.sql.Timestamp(System.currentTimeMillis()));
				albumVO.setAlbum_last_editor(band_id);
				
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				e.printStackTrace();
			} finally {

			}

		}

	}

}
