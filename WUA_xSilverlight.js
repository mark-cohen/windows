# taken from: https://superuser.com/questions/435124/how-do-i-tell-windows-to-shut-up-about-silverlight?answertab=votes#tab-top
# run by issuing the following command:
# cscript.exe WUA_xSilverlight.js

### comments must be removed prior to running the script, as they are invalid Javascript characters ### 

var wu_Session = WScript.CreateObject("Microsoft.Update.Session");
var wu_Searcher = wu_Session.CreateUpdateSearcher();
wu_Searcher.Online = false;

do {
  WScript.echo("Searching...");
  var silverstreak = false;
  var searchResult = wu_Searcher.Search("IsHidden=0 And IsInstalled=0");

  for(var i=0; i<searchResult.Updates.Count; i++){
    var wupdate = searchResult.Updates.Item(i);
    if ( ! wupdate.Title.indexOf("Microsoft Silverlight") ) { // if -1
    wupdate.IsHidden=1;
    WScript.echo("   Hiding update: " + wupdate.Title);
    silverstreak = true;
    
    ### start mod - show other updates
    } else { WScript.echo(".............. " + wupdate.Title);
    ### end mod - remove the line above to simply hide Silverlight updates 

    }
  }
} while ( silverstreak );  // repeat search