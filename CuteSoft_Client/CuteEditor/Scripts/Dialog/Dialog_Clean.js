var OxOa30b=["ig","\x3C/?[^\x3E]*\x3E","","allhtml","\x3C\x5C?xml[^\x3E]*\x3E","\x3C/?[a-z]+:[^\x3E]*\x3E","(\x3C[^\x3E]+) class=[^ |^\x3E]*([^\x3E]*\x3E)","$1 $2","(\x3C[^\x3E]+) style=\x22[^\x22]*\x22([^\x3E]*\x3E)","\x3Cspan[^\x3E]*\x3E\x3C/span[^\x3E]*\x3E","\x3Cspan\x3E\x3Cspan\x3E","\x3Cspan\x3E","\x3C/span\x3E\x3C/span\x3E","\x3C/span\x3E","[ ]*\x3E","\x3E","word","css","\x3C/?font[^\x3E]*\x3E","font","\x3C/?span[^\x3E]*\x3E","span"];var editor=Window_GetDialogArguments(window);function execRE(Ox295,Ox296,Oxce){var Ox297= new RegExp(Ox295,OxOa30b[0]);return Oxce.replace(Ox297,Ox296);} ;function getContent(){return editor.GetBodyInnerHTML();} ;function setContent(Oxce){editor.SetHTML(Oxce);} ;function codeCleaner(Ox216){var Oxce=getContent();switch(Ox216){case OxOa30b[3]:Oxce=execRE(OxOa30b[1],OxOa30b[2],Oxce);break ;;case OxOa30b[16]:Oxce=execRE(OxOa30b[4],OxOa30b[2],Oxce);Oxce=execRE(OxOa30b[5],OxOa30b[2],Oxce);Oxce=execRE(OxOa30b[6],OxOa30b[7],Oxce);Oxce=execRE(OxOa30b[8],OxOa30b[7],Oxce);Oxce=execRE(OxOa30b[9],OxOa30b[2],Oxce);Oxce=execRE(OxOa30b[10],OxOa30b[11],Oxce);Oxce=execRE(OxOa30b[12],OxOa30b[13],Oxce);Oxce=execRE(OxOa30b[14],OxOa30b[15],Oxce);break ;;case OxOa30b[17]:Oxce=execRE(OxOa30b[6],OxOa30b[7],Oxce);Oxce=execRE(OxOa30b[8],OxOa30b[7],Oxce);break ;;case OxOa30b[19]:Oxce=execRE(OxOa30b[18],OxOa30b[2],Oxce);break ;;case OxOa30b[21]:Oxce=execRE(OxOa30b[20],OxOa30b[2],Oxce);break ;;} ;setContent(Oxce);} ;