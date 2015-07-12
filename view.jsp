<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.office.common.**"%>
<%@ page import="com.office.component.config1.*"%>

<%
  // 得到文件名字和路径  
  String fileServer = ConfigReader.getFileServer(request.getRemoteAddr());
  String path=request.getParameter("path"); 
  String filename = request.getParameter("fileName");
  String datePath = filename.substring(0,6);
 
 %>
<html>
<title>图片预览
</title>
<body>
<img src="<%=fileServer%>/upload/<%=path%>/<%=datePath%>/<%=filename%>"> 
</body>
</html>
