var OxOfd97=["inp_name","inp_access","inp_id","inp_index","inp_size","inp_Multiple","inp_Disabled","inp_item_text","inp_item_value","btnInsertItem","btnUpdateItem","btnDeleteItem","btnMoveUpItem","btnMoveDownItem","list_options","list_options2","inp_item_forecolor","inp_item_forecolor_Preview","inp_item_backcolor_Preview","text","value","color","style","backgroundColor","selectedIndex","options","Please select an item first","length","ondblclick","onclick","OPTION","document","id","cssText","Name","name","size","checked","disabled","multiple","tabIndex","","accessKey"];var inp_name=Window_GetElement(window,OxOfd97[0],true);var inp_access=Window_GetElement(window,OxOfd97[1],true);var inp_id=Window_GetElement(window,OxOfd97[2],true);var inp_index=Window_GetElement(window,OxOfd97[3],true);var inp_size=Window_GetElement(window,OxOfd97[4],true);var inp_Multiple=Window_GetElement(window,OxOfd97[5],true);var inp_Disabled=Window_GetElement(window,OxOfd97[6],true);var inp_item_text=Window_GetElement(window,OxOfd97[7],true);var inp_item_value=Window_GetElement(window,OxOfd97[8],true);var btnInsertItem=Window_GetElement(window,OxOfd97[9],true);var btnUpdateItem=Window_GetElement(window,OxOfd97[10],true);var btnDeleteItem=Window_GetElement(window,OxOfd97[11],true);var btnMoveUpItem=Window_GetElement(window,OxOfd97[12],true);var btnMoveDownItem=Window_GetElement(window,OxOfd97[13],true);var list_options=Window_GetElement(window,OxOfd97[14],true);var list_options2=Window_GetElement(window,OxOfd97[15],true);var inp_item_forecolor=Window_GetElement(window,OxOfd97[16],true);var inp_item_forecolor=Window_GetElement(window,OxOfd97[16],true);var inp_item_forecolor_Preview=Window_GetElement(window,OxOfd97[17],true);var inp_item_backcolor_Preview=Window_GetElement(window,OxOfd97[18],true);function SetOption(Ox1a6){Ox1a6[OxOfd97[19]]=inp_item_text[OxOfd97[20]];Ox1a6[OxOfd97[20]]=inp_item_value[OxOfd97[20]];Ox1a6[OxOfd97[22]][OxOfd97[21]]=inp_item_forecolor[OxOfd97[20]];Ox1a6[OxOfd97[22]][OxOfd97[23]]=inp_item_backcolor[OxOfd97[20]];} ;function SetOption2(Ox1a6){Ox1a6[OxOfd97[19]]=inp_item_value[OxOfd97[20]];Ox1a6[OxOfd97[20]]=inp_item_text[OxOfd97[20]];Ox1a6[OxOfd97[22]][OxOfd97[21]]=inp_item_forecolor[OxOfd97[20]];Ox1a6[OxOfd97[22]][OxOfd97[23]]=inp_item_backcolor[OxOfd97[20]];} ;function Select(Ox1a6){var Ox59e=Ox1a6[OxOfd97[24]];list_options[OxOfd97[24]]=Ox59e;list_options2[OxOfd97[24]]=Ox59e;inp_item_text[OxOfd97[20]]=list_options2[OxOfd97[20]];inp_item_value[OxOfd97[20]]=list_options[OxOfd97[20]];} ;function Insert(){var Ox1a6= new Option();SetOption(Ox1a6);list_options[OxOfd97[25]].add(Ox1a6);var Ox5a0= new Option();SetOption2(Ox5a0);list_options2[OxOfd97[25]].add(Ox5a0);FireUIChanged();} ;function Update(){if(list_options[OxOfd97[24]]==-1){alert(OxOfd97[26]);return ;} ;var Ox1a6=list_options.options(list_options.selectedIndex);SetOption(Ox1a6);var Ox5a0=list_options2.options(list_options2.selectedIndex);SetOption2(Ox5a0);FireUIChanged();} ;function Move(Ox142){var Ox59e=list_options[OxOfd97[24]];if(Ox59e<0){return ;} ;var Ox5a2=Ox59e-Ox142;if(Ox5a2<0){Ox5a2=0;} ;if(Ox5a2>(list_options[OxOfd97[25]][OxOfd97[27]]-1)){Ox5a2=list_options[OxOfd97[25]][OxOfd97[27]]-1;} ;if(Ox59e==Ox5a2){return ;} ;var Ox1a6=list_options.options(list_options.selectedIndex);var Ox12=list_options2[OxOfd97[20]];var Ox8=list_options[OxOfd97[20]];Delete();inp_item_text[OxOfd97[20]]=Ox12;inp_item_value[OxOfd97[20]]=Ox8;var Ox1a6= new Option();SetOption(Ox1a6);list_options[OxOfd97[25]].add(Ox1a6,Ox5a2);var Ox5a0= new Option();SetOption2(Ox5a0);list_options2[OxOfd97[25]].add(Ox5a0,Ox5a2);list_options[OxOfd97[24]]=Ox5a2;list_options2[OxOfd97[24]]=Ox5a2;FireUIChanged();} ;function Delete(){if(list_options[OxOfd97[24]]==-1||list_options[OxOfd97[24]]==-1){alert(OxOfd97[26]);return ;} ;var Ox5a3=list_options[OxOfd97[24]];var Ox1a6=list_options.options(list_options.selectedIndex);Ox1a6.removeNode(true);Ox1a6=list_options2.options(list_options2.selectedIndex);Ox1a6.removeNode(true);if(list_options[OxOfd97[25]][OxOfd97[27]]>Ox5a3){list_options[OxOfd97[24]]=Ox5a3;} else {if(list_options[OxOfd97[25]][OxOfd97[27]]){list_options[OxOfd97[24]]=list_options[OxOfd97[25]][OxOfd97[27]]-1;} ;} ;list_options.ondblclick();if(list_options2[OxOfd97[25]][OxOfd97[27]]>Ox5a3){list_options2[OxOfd97[24]]=Ox5a3;} else {if(list_options2[OxOfd97[25]][OxOfd97[27]]){list_options2[OxOfd97[24]]=list_options2[OxOfd97[25]][OxOfd97[27]]-1;} ;} ;FireUIChanged();} ;list_options[OxOfd97[28]]=function list_options_ondblclick(){if(list_options[OxOfd97[24]]==-1){return ;} ;var Ox1a6=list_options.options(list_options.selectedIndex);inp_item_text[OxOfd97[20]]=Ox1a6[OxOfd97[19]];inp_item_value[OxOfd97[20]]=Ox1a6[OxOfd97[20]];inp_item_forecolor[OxOfd97[20]]=inp_item_forecolor[OxOfd97[22]][OxOfd97[23]]=inp_item_forecolor_Preview[OxOfd97[22]][OxOfd97[23]]=Ox1a6[OxOfd97[22]][OxOfd97[21]];inp_item_backcolor[OxOfd97[20]]=inp_item_backcolor[OxOfd97[22]][OxOfd97[23]]=inp_item_backcolor_Preview[OxOfd97[22]][OxOfd97[23]]=Ox1a6[OxOfd97[22]][OxOfd97[23]];} ;inp_item_forecolor[OxOfd97[29]]=inp_item_forecolor_Preview[OxOfd97[29]]=function inp_item_forecolor_onclick(){SelectColor(inp_item_forecolor,inp_item_forecolor_Preview);} ;inp_item_backcolor[OxOfd97[29]]=inp_item_backcolor_Preview[OxOfd97[29]]=function inp_item_backcolor_onclick(){SelectColor(inp_item_backcolor,inp_item_backcolor_Preview);} ;function CopySelect(Ox5a8,Ox5a9){Ox5a9[OxOfd97[25]][OxOfd97[27]]=0;for(var i=0;i<Ox5a8[OxOfd97[25]][OxOfd97[27]];i++){var Ox5aa=Ox5a8[OxOfd97[25]][i];var Ox5a0;if(Browser_IsWinIE()){Ox5a0=Ox5a9[OxOfd97[31]].createElement(OxOfd97[30]);} else {Ox5a0=document.createElement(OxOfd97[30]);} ;if(Ox5a9[OxOfd97[32]]!=OxOfd97[15]){Ox5a0[OxOfd97[20]]=Ox5aa[OxOfd97[20]];Ox5a0[OxOfd97[19]]=Ox5aa[OxOfd97[19]];} else {Ox5a0[OxOfd97[20]]=Ox5aa[OxOfd97[19]];Ox5a0[OxOfd97[19]]=Ox5aa[OxOfd97[20]];} ;Ox5a0[OxOfd97[22]][OxOfd97[33]]=Ox5aa[OxOfd97[22]][OxOfd97[33]];Ox5a9[OxOfd97[25]].add(Ox5a0);} ;Ox5a9[OxOfd97[24]]=Ox5a8[OxOfd97[24]];} ;UpdateState=function UpdateState_Select(){} ;SyncToView=function SyncToView_Select(){if(element[OxOfd97[34]]){inp_name[OxOfd97[20]]=element[OxOfd97[34]];} ;if(element[OxOfd97[35]]){inp_name[OxOfd97[20]]=element[OxOfd97[35]];} ;inp_id[OxOfd97[20]]=element[OxOfd97[32]];inp_size[OxOfd97[20]]=element[OxOfd97[36]];CopySelect(element,list_options);CopySelect(element,list_options2);inp_Disabled[OxOfd97[37]]=element[OxOfd97[38]];inp_Multiple[OxOfd97[37]]=element[OxOfd97[39]];if(element[OxOfd97[40]]==0){inp_index[OxOfd97[20]]=OxOfd97[41];} else {inp_index[OxOfd97[20]]=element[OxOfd97[40]];} ;if(element[OxOfd97[42]]){inp_access[OxOfd97[20]]=element[OxOfd97[42]];} ;} ;SyncTo=function SyncTo_Select(element){element[OxOfd97[35]]=inp_name[OxOfd97[20]];if(element[OxOfd97[34]]){element[OxOfd97[34]]=inp_name[OxOfd97[20]];} else {if(element[OxOfd97[35]]){element.removeAttribute(OxOfd97[35],0);element[OxOfd97[34]]=inp_name[OxOfd97[20]];} else {element[OxOfd97[34]]=inp_name[OxOfd97[20]];} ;} ;element[OxOfd97[32]]=inp_id[OxOfd97[20]];element[OxOfd97[36]]=inp_size[OxOfd97[20]];element[OxOfd97[38]]=inp_Disabled[OxOfd97[37]];element[OxOfd97[39]]=inp_Multiple[OxOfd97[37]];element[OxOfd97[42]]=inp_access[OxOfd97[20]];element[OxOfd97[40]]=inp_index[OxOfd97[20]];if(element[OxOfd97[40]]==OxOfd97[41]){element.removeAttribute(OxOfd97[40]);} ;if(element[OxOfd97[42]]==OxOfd97[41]){element.removeAttribute(OxOfd97[42]);} ;CopySelect(list_options,element);} ;