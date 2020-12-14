package com.pieces.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pieces.model.PiecesService;
import com.pieces.model.PiecesVO;

@WebServlet("/pieces/pieces.do")
public class PiecesServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String str = req.getParameter("piece_id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入作品ID");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/pieces/index_pieces.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/

				String piece_id = str;
				PiecesService piecesSvc = new PiecesService();
				PiecesVO piecesVO = piecesSvc.getOnePiece(piece_id);
				if (piecesVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/pieces/index_pieces.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("piecesVO", piecesVO);
				String url = "/back-end/pieces/listOnePiece.jsp";
				RequestDispatcher successView = req.getRequestDispatcher("/back-end/pieces/listOnePiece.jsp");
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/pieces/index_pieces.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				String piece_id = req.getParameter("piece_id");

				/*************************** 2.開始查詢資料 ****************************************/
				PiecesService piecesSvc = new PiecesService();
				PiecesVO piecesVO = piecesSvc.getOnePiece(piece_id);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("piecesVO", piecesVO); // 資料庫取出的empVO物件,存入req
				String url = "/back-end/pieces/update_piece_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/pieces/index_pieces.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String piece_id = req.getParameter("piece_id");
				String album_id = req.getParameter("album_id");
				byte[] piece = new byte[1024]; // 要上傳檔案
				Integer piece_status = Integer.valueOf(req.getParameter("piece_status"));
				Integer piece_play_count = Integer.valueOf(req.getParameter("piece_play_count"));
				java.sql.Timestamp piece_add_time = new java.sql.Timestamp(System.currentTimeMillis());
				java.sql.Timestamp piece_last_edit_time = new java.sql.Timestamp(System.currentTimeMillis());
				String piece_last_editor = req.getParameter("piece_last_editor");
				
				PiecesVO piecesVO = new PiecesVO();
				piecesVO.setPiece_id(piece_id);
				piecesVO.setAlbum_id(album_id);
				piecesVO.setPiece(piece);
				piecesVO.setPiece_status(piece_status);
				piecesVO.setPiece_play_count(piece_play_count);
				piecesVO.setPiece_add_time(piece_add_time);
				piecesVO.setPiece_last_edit_time(piece_last_edit_time);
				piecesVO.setPiece_last_editor(piece_last_editor);
				piecesVO.toString();

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("piecesVO", piecesVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/pieces/update_piece_input.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				PiecesService piecesSvc = new PiecesService();
				piecesVO = piecesSvc.updatePieces(piece_id, album_id, piece, piece_status, piece_play_count, piece_add_time, piece_last_edit_time, piece_last_editor);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("piecesVO", piecesVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/back-end/pieces/listOnePiece.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/pieces/update_piece_input.jsp");
				failureView.forward(req, res);
			}
		}

	}

}
