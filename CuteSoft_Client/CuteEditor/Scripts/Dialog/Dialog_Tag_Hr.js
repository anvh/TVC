var OxOf987=["inp_width","eenheid","alignment","hrcolor","hrcolorpreview","shade","sel_size","width","style","value","px","%","size","align","color","backgroundColor","noShade","noshade","","onclick"];var inp_width=Window_GetElement(window,OxOf987[0],true);var eenheid=Window_GetElement(window,OxOf987[1],true);var alignment=Window_GetElement(window,OxOf987[2],true);var hrcolor=Window_GetElement(window,OxOf987[3],true);var hrcolorpreview=Window_GetElement(window,OxOf987[4],true);var shade=Window_GetElement(window,OxOf987[5],true);var sel_size=Window_GetElement(window,OxOf987[6],true);UpdateState=function UpdateState_Hr(){} ;SyncToView=function SyncToView_Hr(){if(element[OxOf987[8]][OxOf987[7]]){if(element[OxOf987[8]][OxOf987[7]].search(/%/)<0){eenheid[OxOf987[9]]=OxOf987[10];inp_width[OxOf987[9]]=element[OxOf987[8]][OxOf987[7]].split(OxOf987[10])[0];} else {eenheid[OxOf987[9]]=OxOf987[11];inp_width[OxOf987[9]]=element[OxOf987[8]][OxOf987[7]].split(OxOf987[11])[0];} ;} ;sel_size[OxOf987[9]]=element[OxOf987[12]];alignment[OxOf987[9]]=element[OxOf987[13]];hrcolor[OxOf987[9]]=element[OxOf987[14]];if(element[OxOf987[14]]){hrcolor[OxOf987[8]][OxOf987[15]]=element[OxOf987[14]];} ;if(element[OxOf987[16]]){shade[OxOf987[9]]=OxOf987[17];} else {shade[OxOf987[9]]=OxOf987[18];} ;} ;SyncTo=function SyncTo_Hr(element){if(sel_size[OxOf987[9]]){element[OxOf987[12]]=sel_size[OxOf987[9]];} ;if(hrcolor[OxOf987[9]]){element[OxOf987[14]]=hrcolor[OxOf987[9]];} ;if(alignment[OxOf987[9]]){element[OxOf987[13]]=alignment[OxOf987[9]];} ;if(shade[OxOf987[9]]==OxOf987[17]){element[OxOf987[16]]=true;} else {element[OxOf987[16]]=false;} ;if(inp_width[OxOf987[9]]){element[OxOf987[8]][OxOf987[7]]=inp_width[OxOf987[9]]+eenheid[OxOf987[9]];} ;} ;hrcolor[OxOf987[19]]=hrcolorpreview[OxOf987[19]]=function hrcolor_onclick(){SelectColor(hrcolor,hrcolorpreview);} ;