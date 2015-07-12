update
<%@ page import="com.office.bean.*"%>
<%@ page import="com.office.view.*"%>
<%@ page import="com.office.model.*"%>
<%@ page import="com.office.common.util.*"%>
<%@ page import="com.office.component.config.*"%>


<%if(new SysSetupReader().isFtp(sysMap)){%>
<span id=ftpSpan style="display:none">
<object classid="clsid:A7EE3B4B-DB6C-4957-A904-DD7EA2BB3DCB"
	id="ActiveFormX2" width="340" height="35" codebase="<%=rootPath%>/public/jsp/pdown.cab#version=1.0.20.0">
	<param name="Color" value="15592680">
	<param name="AxBorderStyle" value="0">
	<param name="ftpuser" value="<%=ConfigReader.getUploadMap(request.getRemoteAddr(), session.getAttribute("domainId").toString()).get("user")%>">
	<param name="ftppwd" value="<%=ConfigReader.getUploadMap(request.getRemoteAddr(), session.getAttribute("domainId").toString()).get("password")%>whir?!">
	<param name="ftpport" value="<%=ConfigReader.getUploadMap(request.getRemoteAddr(), session.getAttribute("domainId").toString()).get("port")%>">
	<param name="dddd" value="<%=ConfigReader.getUploadMap(request.getRemoteAddr(), session.getAttribute("domainId").toString()).get("ddd")%>">
	<param name="ftphost" value="<%=ConfigReader.getUploadMap(request.getRemoteAddr(), session.getAttribute("domainId").toString()).get("server")%>">
	<param name="curpath" value="<%=path%>">
</object>
</span>
<%}%>

<table width="100%" border="0" id="<%=tableName%>">
    <tr>
        <td height="25">
            <button type="button" id="<%=tableName%>_bt" class="btnButton4font" onclick="javascript:addAccessory('<%=path%>','<%=fileName%>','<%=saveName%>','<%=tableName%>','<%=fileMaxSize%>','<%=fileMaxNum%>','<%=fileType%>','<%=fileMinWidth%>','<%=fileMinHeight%>','<%=fileMaxWidth%>','<%=fileMaxHeight%>');"><%=Resource.getValue(session.getAttribute("org.apache.struts.action.LOCALE").toString(), "common", "comm.attupload")%></button>
        </td>
    </tr>
    <tr id="<%=tableName%>_tr">
        <td id="<%=tableName%>_td"></td>
    </tr>
</table>
<input type="hidden" name="saveFileNameTemp_0_1" value="">
<table style="display:none">
   <tr>
       <td><iframe id="delFile" name="delFile" src=""></iframe></td>
	   <input type="hidden" name="allAttachSize" value="0">
   </tr>
</table>
<script language ="javascript">
//------------------------------------------------------------------------------
function DOWN2(serverFileName, clietFileName){document.getElementsByName("ftpSpan")[0].style.display="";
	var retdown = '';
	if(document.all.ActiveFormX2 && document.all.ActiveFormX2.length != undefined){
		retdown = document.all.ActiveFormX2[0].downall(clietFileName,serverFileName);
	} else {
		retdown = document.all.ActiveFormX2.downall(clietFileName,serverFileName);
	}
//	if(retdown == 'OK'){
//		alert('Download complete!');
//	}
document.getElementsByName("ftpSpan")[0].style.display="none";
}
function DOWNALL(){document.getElementsByName("ftpSpan")[0].style.display="";
	var retdown = "";
	if(document.all.downSaveFile.length){
		var _real = '';
		var _save = '';
		for(var i=0; i<document.all.downSaveFile.length; i++){
			if(i == 0){
				_real = document.all.downRealFile[i].value;
				_save = document.all.downSaveFile[i].value;
			} else {
				_real += '|' + document.all.downRealFile[i].value;
				_save += '|' + document.all.downSaveFile[i].value;
			}
		}
		if(document.all.ActiveFormX2 && document.all.ActiveFormX2.length != undefined){
			retdown = document.all.ActiveFormX2[0].downall(_real,_save);
		} else {
			retdown = document.all.ActiveFormX2.downall(_real,_save);
		}
	} else {
		if(document.all.ActiveFormX2 && document.all.ActiveFormX2.length != undefined){
			retdown = document.all.ActiveFormX2[0].downall(document.all.downRealFile.value,document.all.downSaveFile.value);
		} else {
			retdown = document.all.ActiveFormX2.downall(document.all.downRealFile.value,document.all.downSaveFile.value);
		}
	}
//	if(retdown == 'OK'){
//		alert('Download complete!');
//	}
document.getElementsByName("ftpSpan")[0].style.display="none";
}
//------------------------------------------------------------------------------

var childWindow;

function addAccessory(path,fileName,saveName,tableName,fileSize,fileNum,fileType,fileMinWidth,fileMinHeight,fileMaxWidth,fileMaxHeight){
    var len=0;
    var obj=eval("document.all."+saveName);
    if(obj){
        if(obj.length){
            len=obj.length;
        }else{
            len=1;
        }
    }else{
        len=0;
    }
	try{
		childWindow.close();
	}catch(e){
	}
    if(fileNum=="0" || len<fileNum){
        <%if(new SysSetupReader().isFtp(sysMap)){%>
        childWindow=window.open("<%=rootPath%>/public/jsp/multiupload.jsp?path="+path+"&fileName="+fileName+"&saveName="+saveName+"&tableName="+tableName+"&fileMaxSize="+fileSize+"&fileMaxNum="+fileNum+"&fileType="+fileType+"&fileMinHeight="+fileMinHeight+"&fileMinWidth="+fileMinWidth+"&fileMaxHeight="+fileMaxHeight+"&fileMaxWidth="+fileMaxWidth,'<%=Resource.getValue(session.getAttribute("org.apache.struts.action.LOCALE").toString(), "common", "comm.upload")%>','menubar=0,scrollbars=0,locations=0,width=650,height=200,resizable=yes');
        <%}else{%>
        childWindow=window.open("<%=rootPath%>/public/jsp/swfupload/swfupload.jsp?path="+path+"&fileName="+fileName+"&saveName="+saveName+"&tableName="+tableName+"&fileMaxSize="+fileSize+"&fileMaxNum="+fileNum+"&fileType="+fileType+"&fileMinHeight="+fileMinHeight+"&fileMinWidth="+fileMinWidth+"&fileMaxHeight="+fileMaxHeight+"&fileMaxWidth="+fileMaxWidth,'<%=Resource.getValue(session.getAttribute("org.apache.struts.action.LOCALE").toString(), "common", "comm.upload")%>','menubar=0,scrollbars=0,locations=0,width=650,height=200,resizable=yes');
        <%}%>
		childWindow.focus();

    }else{
        alert("<%=Resource.getValue(session.getAttribute("org.apache.struts.action.LOCALE").toString(), "common", "comm.maxuplaodattachment")%>"+fileNum+"<%=Resource.getValue(session.getAttribute("org.apache.struts.action.LOCALE").toString(), "common", "comm.attachment")%>");
    }
}

function delaccessory(spId, accessorySize, imgObj, fileName) {
	if(confirm("<%=Resource.getValue(session.getAttribute("org.apache.struts.action.LOCALE").toString(), "common", "comm.attremind2")%>")){
		var sp = document.getElementById(spId);
		sp.innerHTML = "";
		imgObj.removeNode();
		if(document.all.accessorySize){
			document.all.accessorySize.value = parseInt(document.all.accessorySize.value) - parseInt(accessorySize);
		}
        if(document.all.delFile.length){
            document.all.delFile[0].src="<%=rootPath%>/public/jsp/deleteFile.jsp?delpath=<%=path%>&delfile="+fileName;
        }else{
            document.all.delFile.src="<%=rootPath%>/public/jsp/deleteFile.jsp?delpath=<%=path%>&delfile="+fileName;
        }		
	}
}

function clearAccessory(table,path,saveName,fileName){
    eval("document.all." + table + "_td.innerHTML=''");
}
</script>