var OxOac51=["idSource","TargetUrl","value","","$4","$5","\x26","wmode=\x22transparent\x22","allowfullscreen=\x22true\x22","\x3Cembed src=\x22","\x22 width=\x22","\x22 height=\x22","\x22 "," "," type=\x22application/x-shockwave-flash\x22 pluginspage=\x22http://www.macromedia.com/go/getflashplayer\x22 \x3E\x3C/embed\x3E\x0A","\x3Cobject xcodebase=","\x22http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab\x22"," height=\x22","\x22 classid=","\x22clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\x22 \x3E"," \x3Cparam name=\x22Movie\x22 value=\x22","\x22 /\x3E","\x3Cparam name=\x22wmode\x22 value=\x22transparent\x22/\x3E","\x3Cparam name=\x22allowFullScreen\x22 value=\x22true\x22/\x3E","\x3C/object\x3E"];var idSource=Window_GetElement(window,OxOac51[0],true);var TargetUrl=Window_GetElement(window,OxOac51[1],true);var editor=Window_GetDialogArguments(window);var oldWidth,OldHeight;function do_preview(){var Ox120=GetEmbed();if(Ox120){if(idSource[OxOac51[2]]!=Ox120&&idSource[OxOac51[2]]!=null){idSource[OxOac51[2]]=Ox120;} ;} ;} ;function do_insert(){var Ox120=GetEmbed();if(Ox120){editor.PasteHTML(Ox120);} ;Window_CloseDialog(window);} ;function do_Close(){Window_CloseDialog(window);} ;function GetEmbed(){if(idSource[OxOac51[2]]==OxOac51[3]||idSource[OxOac51[2]]==null){return ;} ;var Ox649=OxOac51[3];Ox649=idSource[OxOac51[2]];var Ox64a=/(<iframe[^\>]*?)(\ssrc=\s*)\s*("|')(.+?)\3([^>]*)(.*<\/iframe>)/gi;var Ox64b=/(<object[^\>]*>[\s|\S]*?)(<embed[^\>]*?)(\ssrc=\s*)\s*("|')(.+?)\4([^>]*)(.*<\/embed>)[\s|\S]*?<\/object>/gi;if(Ox649.match(Ox64a)){Ox649=Ox649.replace(Ox64a,OxOac51[4]);TargetUrl[OxOac51[2]]=Ox649;return idSource[OxOac51[2]];} else {if(Ox649.match(Ox64b)){oldWidth=Ox649.replace(/(<object[^\>]*>[\s|\S]*?)(<embed[^\>]*?)(\swidth=\s*)\s*("|')(.+?)\4([^>]*)(.*<\/embed>)[\s|\S]*?<\/object>/gi,OxOac51[5]);oldHeight=Ox649.replace(/(<object[^\>]*>[\s|\S]*?)(<embed[^\>]*?)(\sheight=\s*)\s*("|')(.+?)\4([^>]*)(.*<\/embed>)[\s|\S]*?<\/object>/gi,OxOac51[5]);Ox649=Ox649.replace(Ox64b,OxOac51[5]);if(Ox649.indexOf(OxOac51[6])!=-1){TargetUrl[OxOac51[2]]=Ox649.substring(0,Ox649.indexOf(OxOac51[6]));} ;var Ox64c=OxOac51[3];var Oxe1=425;var Ox2d=344;var Ox3e3,Ox3e4;oldWidth=parseInt(oldWidth);if(oldWidth){Oxe1=oldWidth;} ;oldHeight=parseInt(oldHeight);if(oldHeight){Ox2d=oldHeight;} ;Ox3e3=true;if(Ox649==OxOac51[3]){return ;} ;var Ox3e7,Ox3e9;Ox3e9=OxOac51[3];Ox3e7=true?OxOac51[7]:OxOac51[3];Ox3e9=true?OxOac51[8]:OxOac51[3];var Ox3ef=OxOac51[9]+Ox649+OxOac51[10]+Oxe1+OxOac51[11]+Ox2d+OxOac51[12]+Ox3e9+OxOac51[13]+Ox3e7+OxOac51[14];var Ox3f0=OxOac51[15]+OxOac51[16]+OxOac51[17]+Ox2d+OxOac51[10]+Oxe1+OxOac51[18]+OxOac51[19]+OxOac51[20]+Ox649+OxOac51[21];if(true){Ox3f0=Ox3f0+OxOac51[22];} ;if(true){Ox3f0=Ox3f0+OxOac51[23];} ;Ox3f0=Ox3f0+Ox3ef+OxOac51[24];return Ox3f0;} ;} ;} ;