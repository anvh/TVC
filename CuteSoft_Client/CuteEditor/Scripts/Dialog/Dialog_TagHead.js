var OxO59dd=["top","opener","_dialog_arguments","document","dialogArguments","editor","window","element","changed","propertyName","value","checked","trim","prototype",""];function Window_GetDialogTop(Ox1a8){return Ox1a8[OxO59dd[0]];} ;function Window_FindDialogArguments(Ox1a8){var Ox23b=Ox1a8[OxO59dd[0]];try{var Ox23c=Ox23b[OxO59dd[1]];if(Ox23c&&Ox23c[OxO59dd[3]][OxO59dd[2]]){return Ox23c[OxO59dd[3]][OxO59dd[2]];} ;} catch(x){} ;if(Ox23b[OxO59dd[3]][OxO59dd[2]]){return Ox23b[OxO59dd[3]][OxO59dd[2]];} ;if(Ox23b[OxO59dd[4]]){return Ox23b[OxO59dd[4]];} ;return Ox23b[OxO59dd[3]][OxO59dd[2]];} ;var arg=Window_FindDialogArguments(window);var editor=arg[OxO59dd[5]];var editwin=arg[OxO59dd[6]];var editdoc=arg[OxO59dd[3]];var element=arg[OxO59dd[7]];var syncingtoview=false;Window_GetDialogTop(window)[OxO59dd[8]]=Window_GetDialogTop(window)[OxO59dd[8]]||arg[OxO59dd[8]];function OnPropertyChange(){if(syncingtoview){return ;} ;var Ox332=Event_GetEvent();if(Ox332[OxO59dd[9]]!=OxO59dd[10]&&Ox332[OxO59dd[9]]!=OxO59dd[11]){return ;} ;FireUIChanged();} ;function FireUIChanged(){Window_GetDialogTop(window)[OxO59dd[8]]=true;SyncTo(element);UpdateState();} ;function SyncToViewInternal(){syncingtoview=true;try{SyncToView();UpdateState();} finally{syncingtoview=false;} ;} ;String[OxO59dd[13]][OxO59dd[12]]=function (){return this.replace(/(^\s*)|(\s*$)/g,OxO59dd[14]);} ;function UpdateState(){} ;function SyncTo(element){} ;function SyncToView(){} ;