<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" >
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/album/album_management.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
	<title>album_management.jsp</title>
</head>
<body>
	<div class="page">
        <form method="post" action="<%=request.getContextPath()%>/album/albumManage.do" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>
                        <span>專輯名稱</span>
                    </td>
                    <td>
                        <input type="text" name="album_name">
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>專輯簡介</span>
                    </td>
                    <td>
                        <input type="text" name="album_intro">
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>上架時間</span>
                    </td>
                    <td>
                        <input type="text" name="album_add_time">
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>專輯照片</span>
                    </td>
                    <td>
                        <input type="file" name="album_photo">
                    </td>
                </tr>
                <tr>
                    <tr>
                        <td>
                            <span>專輯歌曲</span>
                        </td>
                        <td>
                            <button >新增歌曲</button>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <div>
                                <span>曲目名稱</span>
                            </div>
                            <div>
                                <input type="text" name="piece_name">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <div>
                                <span>選擇檔案</span>
                            </div>
                            <div>
                                <input type="file" name="piece">
                            </div>
                        </td>
                    </tr>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <ul class="piece_list">

                            <li class="piece">
                                <div class="piece_item">
                                    <div class="left">
                                        <span><button><i class="fas fa-minus-circle"></i></button></span>
                                    </div>
                                    <div class="middle">
                                        <h2>1</h2>
                                        <img class="album_photo" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Tomcat-logo.svg/1200px-Tomcat-logo.svg.png" alt="">
                                        <span>piece_name</span>
                                    </div>
                                    <div class="right">
                                        <button><i class="far fa-heart"></i></button>
                                    </div>
                                </div>
                            </li>
                            
                            

                        </ul>
                    </td>
                </tr>  
                
                <tr>
                    <td></td>
                    <td>
                    	<% session.setAttribute("band_id", "BAND00000"); %>
                    	<input type="hidden" name="action" value="add_album">
                        <button type="submit">確定送出</button>
                    </td>
                </tr>
                
            </table>
        </form>
    </div>
</body>
</html>