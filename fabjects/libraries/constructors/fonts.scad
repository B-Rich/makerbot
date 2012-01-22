// Font Functions
// Encoding from http://en.wikipedia.org/wiki/ASCII

function 8bit_polyfont() = [
  [8,8,0,"fixed"],["Decimal Byte","Caret Notation","Character Escape Code","Abbreviation","Name","Bound Box","[points,paths]"]
  ,[
   [  0,"^@","\0","NUL","Null character",[[0,0],[8,8]],[]]
  ,[  1,"^A","",  "SOH","Start of Header",[[0,0],[8,8]],[]]
  ,[  2,"^B","",  "STX","Start of Text",[[0,0],[8,8]],[]]
  ,[  3,"^C","",  "ETX","End of Text",[[0,0],[8,8]],[]]
  ,[  4,"^D","",  "EOT","End of Transmission",[[0,0],[8,8]],[]]
  ,[  5,"^E","",  "ENQ","Enquiry",[[0,0],[8,8]],[]]
  ,[  6,"^F","",  "ACK","Acknowledgment",[[0,0],[8,8]],[]]
  ,[  7,"^G","\a","BEL","Bell",[[0,0],[8,8]],[]]
  ,[  8,"^H","\b","BS", "Backspace",[[0,0],[8,8]],[]]
  ,[  9,"^I","\t","HT", "Horizontal Tab",[[0,0],[8,8]],[]]
  ,[ 10,"^J","\n","LF", "Line Feed",[[0,0],[8,8]],[]]
  ,[ 11,"^K","\v","VT", "Vertical Tab",[[0,0],[8,8]],[]]
  ,[ 12,"^L","\f","FF", "Form feed",[[0,0],[8,8]],[]]
  ,[ 13,"^M","\r","CR", "Carriage return",[[0,0],[8,8]],[]]
  ,[ 14,"^N","",  "SO", "Shift Out",[[0,0],[8,8]],[]]
  ,[ 15,"^O","",  "SI", "Shift In",[[0,0],[8,8]],[]]
  ,[ 16,"^P","",  "DLE","Data Link Escape",[[0,0],[8,8]],[]]
  ,[ 17,"^Q","",  "DC1","Device Control 1",[[0,0],[8,8]],[]]
  ,[ 18,"^R","",  "DC2","Device Control 2",[[0,0],[8,8]],[]]
  ,[ 19,"^S","",  "DC3","Device Control 3",[[0,0],[8,8]],[]]
  ,[ 20,"^T","",  "DC4","Device Control 4",[[0,0],[8,8]],[]]
  ,[ 21,"^U","",  "NAK","Negative Acknowledgement",[[0,0],[8,8]],[]]
  ,[ 22,"^V","",  "SYN","Synchronous Idle",[[0,0],[8,8]],[]]
  ,[ 23,"^W","",  "ETB","End of Transmission Block",[[0,0],[8,8]],[]]
  ,[ 24,"^X","",  "CAN","Cancel",[[0,0],[8,8]],[]]
  ,[ 25,"^Y","",  "EM", "End of Medium",[[0,0],[8,8]],[]]
  ,[ 26,"^Z","",  "SUB","Substitute",[[0,0],[8,8]],[]]
  ,[ 27,"^[","\e","ESC","Escape",[[0,0],[8,8]],[]]
  ,[ 28,"^\\","", "FS", "File Separator",[[0,0],[8,8]],[]]
  ,[ 29,"^]","",  "GS", "Group Separator",[[0,0],[8,8]],[]]
  ,[ 30,"^^","",  "RS", "Record Separator",[[0,0],[8,8]],[]]
  ,[ 31,"^_","",  "US", "Unit Separator",[[0,0],[8,8]],[]]
  ,[ 32," "," ",  "", "Space",[[0,0],[2,8]],[]]
  ,[ 33,"!","!",  "", "",[[0,0],[8,8]],[
	[[3,1],[3,2],[5,2],[5,1]
	,[3,3],[3,7],[5,7],[5,3]]
	,[[0,1,2,3],[4,5,6,7]]
	]]
  ,[ 34,"\"","\"","", "",[[0,0],[8,8]],[
	[[1,4],[1,7],[3,7],[3,4]
	,[5,4],[5,7],[7,7],[7,4]]
	,[[0,1,2,3],[4,5,6,7]]
	]]
  ,[ 35,"#","#",  "", "",[[0,0],[8,8]],[
	[[1,1],[1,2],[0,2],[0,3],[1,3],[1,5],[0,5],[0,6],[1,6],[1,7],[3,7],[3,6],[5,6],[5,7],[7,7]
		,[7,6],[8,6],[8,5],[7,5],[7,3],[8,3],[8,2],[7,2],[7,1],[5,1],[5,2],[3,2],[3,1]
	,[3,3],[3,5],[5,5],[5,3]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27],[28,29,30,31]]
	]]
  ,[ 36,"$","$",  "", "",[[0,0],[8,8]],[
	[[3,1],[3,2],[1,2],[1,3],[5,3],[5,4],[2,4],[2,5],[1,5],[1,6],[2,6],[2,7],[3,7],[3,8],[5,8],[5,7],[7,7],[7,6]
		,[3,6],[3,5],[6,5],[6,4],[7,4],[7,3],[6,3],[6,2],[5,2],[5,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27]]
	]]
  ,[ 37,"%","%",  "", "",[[0,0],[8,8]],[
	[[1,1],[1,3],[2,3],[2,5],[1,5],[1,7],[3,7],[3,5],[4,5],[4,6],[5,6],[5,7],[7,7]
		,[7,6],[6,6],[6,5],[5,5],[5,4],[4,4],[4,3],[3,3],[3,2],[2,2],[2,1]
	,[5,1],[5,3],[7,3],[7,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23],[24,25,26,27]]
	]]
  ,[ 38,"&","&",  "", "",[[0,0],[8,8]],[
	[[2,1],[2,2],[1,2],[1,4],[2,4],[2,5],[3,5],[3,6],[2,6],[2,7],[3,7],[3,8],[6,8],[6,7],[7,7],[7,6],[6,6],[6,5],[5,5],[5,4]
		,[8,4],[8,3],[7,3],[7,2],[8,2],[8,1],[6,1],[6,2],[5,2],[5,1]
	,[3,2],[3,4],[4,4],[4,2]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29],[30,31,32,33]]
	]]
  ,[ 39,"'","'",  "", "",[[0,0],[8,8]],[
	[[3,4],[3,7],[5,7],[5,4]]
	,[[0,1,2,3]]
	]]
  ,[ 40,"(","(",  "", "",[[0,0],[8,8]],[
	[[3,1],[3,2],[2,2],[2,6],[3,6],[3,7],[6,7],[6,6],[5,6],[5,5],[4,5],[4,3],[5,3],[5,2],[6,2],[6,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]]
	]]
  ,[ 41,")",")",  "", "",[[0,0],[8,8]],[
	[[2,1],[2,2],[3,2],[3,3],[4,3],[4,5],[3,5],[3,6],[2,6],[2,7],[5,7],[5,6],[6,6],[6,2],[5,2],[5,1],[4,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]]
	]]
  ,[ 42,"*","*",  "", "",[[0,0],[8,8]],[
	[[1,2],[1,3],[2,3],[2,4],[0,4],[0,5],[2,5],[2,6],[1,6],[1,7],[3,7],[3,6],[5,6],[5,7],[7,7],[7,6],[6,6]
		,[6,5],[8,5],[8,4],[6,4],[6,3],[7,3],[7,2],[5,2],[5,3],[3,3],[3,2]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27]]
	]]
  ,[ 43,"+","+",  "", "",[[0,0],[8,8]],[]]
  ,[ 44,",",",",  "", "",[[0,0],[8,8]],[]]
  ,[ 45,"-","-",  "", "",[[0,0],[8,8]],[]]
  ,[ 46,".",".",  "", "",[[0,0],[8,8]],[]]
  ,[ 47,"/","/",  "", "",[[0,0],[8,8]],[]]
  ,[ 48,"0","0",  "", "",[[0,0],[8,8]],[
	[[2,1],[2,2],[1,2],[1,6],[2,6],[2,7],[6,7],[6,6],[7,6],[7,2],[6,2],[6,1]
	,[3,2],[3,3],[5,3],[5,2]
	,[3,4],[3,6],[5,6],[5,5],[4,5],[4,4]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11],[12,13,14,15],[16,17,18,19,20,21]]
	]]
  ,[ 49,"1","1",  "", "",[[0,0],[8,8]],[
	[[1,1],[1,2],[3,2],[3,5],[2,5],[2,6],[3,6],[3,7],[5,7],[5,2],[7,2],[7,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11]]
	]]
  ,[ 50,"2","2",  "", "",[[0,0],[8,8]],[
	[[1,1],[1,2],[2,2],[2,3],[3,3],[3,4],[4,4],[4,5],[5,5],[5,6],[3,6],[3,5],[1,5],[1,6],[2,6],[2,7],[6,7],[6,6],[7,6],[7,5],[6,5],[6,4],[5,4],[5,3],[4,3],[4,2],[3,2],[7,2],[7,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28]]
	]]
  ,[ 51,"3","3",  "", "",[[0,0],[8,8]],[
	[[2,1],[2,2],[1,2],[1,3],[3,3],[3,2],[5,2],[5,3],[4,3],[4,4],[3,4],[3,5],[4,5],[4,6],[1,6],[1,7],[7,7],[7,6],[6,6],[6,5],[5,5],[5,4],[6,4],[6,3],[7,3],[7,2],[6,2],[6,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27]]
	]]
  ,[ 52,"4","4",  "", "",[[0,0],[8,8]],[
	[[4,1],[4,2],[1,2],[1,4],[2,4],[2,5],[3,5],[3,6],[4,6],[4,7],[6,7],[6,3],[7,3],[7,2],[6,2],[6,1]
	,[3,3],[3,4],[4,4],[4,3]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],[16,17,18,19]]
	]]
  ,[ 53,"5","5",  "", "",[[0,0],[8,8]],[
	[[2,1],[2,2],[1,2],[1,3],[3,3],[3,2],[5,2],[5,4],[1,4],[1,7],[7,7],[7,6],[3,6],[3,5],[6,5],[6,4],[7,4],[7,2],[6,2],[6,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]]
	]]
  ,[ 54,"6","6",  "", "",[[0,0],[8,8]],[
	[[2,1],[2,2],[1,2],[1,6],[2,6],[2,7],[6,7],[6,6],[3,6],[3,5],[6,5],[6,4],[7,4],[7,2],[6,2],[6,1]
	,[3,2],[3,4],[5,4],[5,2]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],[16,17,18,19]]
	]]
  ,[ 55,"7","7",  "", "",[[0,0],[8,8]],[
	[[2,1],[2,3],[3,3],[3,4],[4,4],[4,5],[5,5],[5,6],[1,6],[1,7],[7,7],[7,5],[6,5],[6,4],[5,4],[5,3],[4,3],[4,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]]
	]]
  ,[ 56,"8","8",  "", "",[[0,0],[8,8]],[
	[[2,1],[2,2],[1,2],[1,4],[2,4],[2,5],[1,5],[1,6],[2,6],[2,7],[6,7],[6,6],[7,6],[7,5],[6,5],[6,4],[7,4],[7,2],[6,2],[6,1]
	,[3,2],[3,4],[5,4],[5,2]
	,[3,5],[3,6],[5,6],[5,5]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19],[20,21,22,23],[24,25,26,27]]
	]]
  ,[ 57,"9","9",  "", "",[[0,0],[8,8]],[
	[[2,1],[2,2],[4,2],[4,3],[5,3],[5,4],[2,4],[2,5],[1,5],[1,6],[2,6],[2,7],[6,7],[6,6],[7,6],[7,3],[6,3],[6,2],[5,2],[5,1]
	,[3,5],[3,6],[5,6],[5,5]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19],[20,21,22,23]]
	]]
  ,[ 58,":",":",  "", "",[[0,0],[8,8]],[]]
  ,[ 59,";",";",  "", "",[[0,0],[8,8]],[]]
  ,[ 60,"<","<",  "", "",[[0,0],[8,8]],[]]
  ,[ 61,"=","=",  "", "",[[0,0],[8,8]],[]]
  ,[ 62,">",">",  "", "",[[0,0],[8,8]],[]]
  ,[ 63,"?","?",  "", "",[[0,0],[8,8]],[]]
  ,[ 64,"@","@",  "", "",[[0,0],[8,8]],[]]
  ,[ 65,"A","A",  "", "",[[1,1],[7,7]],[
	[[1,1],[1,5],[2,5],[2,6],[3,6],[3,7],[5,7],[5,6],[6,6],[6,5],[7,5],[7,1],[5,1],[5,2],[3,2],[3,1]
	,[3,3],[3,5],[5,5],[5,3]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],[16,17,18,19]]
	]]
  ,[ 66,"B","B",  "", "",[[0,0],[8,8]],[
	[[1,1],[1,7],[6,7],[6,6],[7,6],[7,5],[6,5],[6,4],[7,4],[7,2],[6,2],[6,1]
	,[3,5],[3,6],[5,6],[5,5]
	,[3,2],[3,4],[5,4],[5,2]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11],[12,13,14,15],[16,17,18,19]]
	]]
  ,[ 67,"C","C",  "", "",[[0,0],[8,8]],[
	[[2,1],[2,2],[1,2],[1,6],[2,6],[2,7],[6,7],[6,6],[7,6],[7,5],[5,5],[5,6],[3,6],[3,2],[5,2],[5,3],[7,3],[7,2],[6,2],[6,1]]	    ,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]]
	]]
  ,[ 68,"D","D",  "", "",[[0,0],[8,8]],[
	[[1,1],[1,7],[5,7],[5,6],[6,6],[6,5],[7,5],[7,3],[6,3],[6,2],[5,2],[5,1]
	,[3,2],[3,6],[4,6],[4,5],[5,5],[5,3],[4,3],[4,2]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11],[12,13,14,15,16,17,18,19]]
	]]
  ,[ 69,"E","E",  "", "",[[0,0],[8,8]],[
	[[1,1],[1,7],[7,7],[7,6],[3,6],[3,5],[6,5],[6,4],[3,4],[3,2],[7,2],[7,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11]]
	]]
  ,[ 70,"F","F",  "", "",[[0,0],[8,8]],[
	[[1,1],[1,7],[7,7],[7,6],[3,6],[3,5],[6,5],[6,4],[3,4],[3,1]]
	,[[0,1,2,3,4,5,6,7,8,9]]
	]]
  ,[ 71,"G","G",  "", "",[[0,0],[8,8]],[
	[[2,1],[2,2],[1,2],[1,6],[2,6],[2,7],[7,7],[7,6],[3,6],[3,2],[5,2],[5,3],[4,3],[4,4],[7,4],[7,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]]
	]]
  ,[ 72,"H","H",  "", "",[[0,0],[8,8]],[
	[[1,1],[1,7],[3,7],[3,5],[5,5],[5,7],[7,7],[7,1],[5,1],[5,4],[3,4],[3,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11]]
	]]
  ,[ 73,"I","I",  "", "",[[0,0],[8,8]],[
	[[1,1],[1,2],[3,2],[3,6],[1,6],[1,7],[7,7],[7,6],[5,6],[5,2],[7,2],[7,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11]]
	]]
  ,[ 74,"J","J",  "", "",[[0,0],[8,8]],[
	[[2,1],[2,2],[1,2],[1,3],[3,3],[3,2],[5,2],[5,6],[4,6],[4,7],[7,7],[7,2],[6,2],[6,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13]]
	]]
  ,[ 75,"K","K",  "", "",[[0,0],[8,8]],[
	[[1,1],[1,7],[3,7],[3,5],[4,5],[4,6],[5,6],[5,7],[7,7],[7,6],[6,6],[6,5],[5,5],[5,3],[6,3],[6,2],[7,2],[7,1],[5,1],[5,2],[4,2],[4,3],[3,3],[3,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23]]
	]]
  ,[ 76,"L","L",  "", "",[[0,0],[8,8]],[
	[[1,1],[1,7],[3,7],[3,2],[7,2],[7,1]]
	,[[0,1,2,3,4,5]]
	]]
  ,[ 77,"M","M",  "", "",[[0,0],[8,8]],[
	[[1,1],[1,7],[3,7],[3,6],[4,6],[4,5],[5,5],[5,6],[6,6],[6,7],[8,7],[8,1],[6,1],[6,4],[5,4],[5,3],[4,3],[4,4],[3,4],[3,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]]
	]]
  ,[ 78,"N","N",  "", "",[[0,0],[8,8]],[
	[[1,1],[1,7],[3,7],[3,6],[4,6],[4,5],[5,5],[5,7],[7,7],[7,1],[5,1],[5,2],[4,2],[4,3],[3,3],[3,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]]
	]]
  ,[ 79,"O","O",  "", "",[[0,0],[8,8]],[
	[[2,1],[2,2],[1,2],[1,6],[2,6],[2,7],[6,7],[6,6],[7,6],[7,2],[6,2],[6,1]
	,[3,2],[3,6],[5,6],[5,2]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11],[12,13,14,15]]
	]]
  ,[ 80,"P","P",  "", "",[[0,0],[8,8]],[
	[[1,1],[1,7],[6,7],[6,6],[7,6],[7,4],[6,4],[6,3],[3,3],[3,1]
	,[3,4],[3,6],[5,6],[5,4]]
	,[[0,1,2,3,4,5,6,7,8,9],[10,11,12,13]]
	]]
  ,[ 81,"Q","Q",  "", "",[[0,0],[8,8]],[
	[[2,1],[2,2],[1,2],[1,6],[2,6],[2,7],[6,7],[6,6],[7,6],[7,3],[6,3],[6,2],[7,2],[7,1],[5,1],[5,2],[4,2],[4,1]
	,[3,3],[3,6],[5,6],[5,3]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17],[18,19,20,21]]
	]]
  ,[ 82,"R","R",  "", "",[[0,0],[8,8]],[
	[[1,1],[1,7],[6,7],[6,6],[7,6],[7,4],[6,4],[6,2],[7,2],[7,1],[5,1],[5,2],[4,2],[4,3],[3,3],[3,1]
	,[3,4],[3,6],[5,6],[5,4]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],[16,17,18,19]]
	]]
  ,[ 83,"S","S",  "", "",[[0,0],[8,8]],[
	[[2,1],[2,2],[5,2],[5,4],[2,4],[2,5],[1,5],[1,6],[2,6],[2,7],[6,7],[6,6],[3,6],[3,5],[6,5],[6,4],[7,4],[7,2],[6,2],[6,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]]
	]]
  ,[ 84,"T","T",  "", "",[[0,0],[8,8]],[
	[[3,1],[3,6],[1,6],[1,7],[7,7],[7,6],[5,6],[5,1]]
	,[[0,1,2,3,4,5,6,7]]
	]]
  ,[ 85,"U","U",  "", "",[[0,0],[8,8]],[
	[[1,1],[1,7],[3,7],[3,2],[5,2],[5,7],[7,7],[7,1]]
	,[[0,1,2,3,4,5,6,7]]
	]]
  ,[ 86,"V","V",  "", "",[[0,0],[8,8]],[
	[[3,1],[3,2],[2,2],[2,3],[1,3],[1,7],[3,7],[3,3],[5,3],[5,7],[7,7],[7,3],[6,3],[6,2],[5,2],[5,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]]
	]]
  ,[ 87,"W","W",  "", "",[[0,0],[8,8]],[
	[[1,1],[1,7],[3,7],[3,4],[4,4],[4,5],[5,5],[5,4],[6,4],[6,7],[8,7],[8,1],[6,1],[6,2],[5,2],[5,3],[4,3],[4,2],[3,2],[3,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]]
	]]
  ,[ 88,"X","X",  "", "",[[0,0],[8,8]],[
	[[1,1],[1,3],[2,3],[2,5],[1,5],[1,7],[3,7],[3,5],[5,5],[5,7],[7,7],[7,5],[6,5],[6,3],[7,3],[7,1],[5,1],[5,3],[3,3],[3,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]]
	]]
  ,[ 89,"Y","Y",  "", "",[[0,0],[8,8]],[
	[[3,1],[3,4],[2,4],[2,5],[1,5],[1,7],[3,7],[3,5],[5,5],[5,7],[7,7],[7,5],[6,5],[6,4],[5,4],[5,1],[3,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]]
	]]
  ,[ 90,"Z","Z",  "", "",[[0,0],[8,8]],[
	[[1,1],[1,3],[2,3],[2,4],[3,4],[3,5],[4,5],[4,6],[1,6],[1,7],[7,7],[7,6],[6,6],[6,5],[5,5],[5,4],[4,4],[4,3],[3,3],[3,2],[7,2],[7,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]]
	]]
  ,[ 91,"[","[",  "", "",[[0,0],[8,8]],[]]
  ,[ 92,"\\","\\","", "",[[0,0],[8,8]],[]]
  ,[ 93,"]","]",  "", "",[[0,0],[8,8]],[]]
  ,[ 94,"^","^",  "", "",[[0,0],[8,8]],[]]
  ,[ 95,"_","_",  "", "",[[0,0],[8,8]],[]]
  ,[ 96,"`","`",  "", "",[[0,0],[8,8]],[]]
  ,[ 97,"a","a",  "", "",[[0,0],[8,8]],[
	[[2,1],[2,2],[1,2],[1,3],[2,3],[2,4],[5,4],[5,5],[2,5],[2,6],[6,6],[6,5],[7,5],[7,1]
	,[3,2],[3,3],[5,3],[5,2]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13],[14,15,16,17]]
	]]
  ,[ 98,"b","b",  "", "",[[0,0],[8,8]],[
	[[1,1],[1,7],[3,7],[3,5],[6,5],[6,4],[7,4],[7,2],[6,2],[6,1]
	,[3,2],[3,4],[5,4],[5,2]]
	,[[0,1,2,3,4,5,6,7,8,9],[10,11,12,13]]
	]]
  ,[ 99,"c","c",  "", "",[[0,0],[8,8]],[
	[[2,1],[2,2],[1,2],[1,5],[2,5],[2,6],[6,6],[6,5],[3,5],[3,2],[6,2],[6,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11]]
	]]
  ,[100,"d","d",  "", "",[[0,0],[8,8]],[
	[[2,1],[2,2],[1,2],[1,4],[2,4],[2,5],[5,5],[5,7],[7,7],[7,1]
	,[3,2],[3,4],[5,4],[5,2]]
	,[[0,1,2,3,4,5,6,7,8,9],[10,11,12,13]]
	]]
  ,[101,"e","e",  "", "",[[0,0],[8,8]],[
	[[2,1],[2,2],[1,2],[1,5],[2,5],[2,6],[6,6],[6,5],[7,5],[7,3],[3,3],[3,2],[6,2],[6,1]
	,[3,4],[3,5],[5,5],[5,4]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13],[14,15,16,17]]
	]]
  ,[102,"f","f",  "", "",[[0,0],[8,8]],[
	[[3,1],[3,4],[2,4],[2,5],[3,5],[3,6],[4,6],[4,7],[7,7],[7,6],[5,6],[5,5],[7,5],[7,4],[5,4],[5,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]]
	]]
  ,[103,"g","g",  "", "",[[0,0],[8,8]],[
	[[1,0],[1,1],[5,1],[5,2],[2,2],[2,3],[1,3],[1,5],[2,5],[2,6],[6,6],[6,5],[7,5],[7,1],[6,1],[6,0]
	,[3,3],[3,5],[5,5],[5,3]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15],[16,17,18,19]]
	]]
  ,[104,"h","h",  "", "",[[0,0],[8,8]],[
	[[1,1],[1,7],[3,7],[3,5],[6,5],[6,4],[7,4],[7,1],[5,1],[5,4],[3,4],[3,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11]]
	]]
  ,[105,"i","i",  "", "",[[0,0],[8,8]],[
	[[2,1],[2,2],[3,2],[3,4],[2,4],[2,5],[5,5],[5,2],[6,2],[6,1]
	,[3,6],[3,7],[5,7],[5,6]]
	,[[0,1,2,3,4,5,6,7,8,9],[10,11,12,13]]
	]]
  ,[106,"j","j",  "", "",[[0,0],[8,8]],[
	[[2,0],[2,1],[5,1],[5,5],[7,5],[7,1],[6,1],[6,0]
	,[5,6],[5,7],[7,7],[7,6]]
	,[[0,1,2,3,4,5,6,7],[8,9,10,11]]
	]]
  ,[107,"k","k",  "", "",[[0,0],[8,8]],[
	[[1,1],[1,7],[3,7],[3,4],[4,4],[4,5],[6,5],[6,4],[5,4],[5,3],[6,3],[6,2],[7,2],[7,1],[5,1],[5,2],[4,2],[4,3],[3,3],[3,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]]
	]]
  ,[108,"l","l",  "", "",[[0,0],[8,8]],[
	[[2,1],[2,2],[3,2],[3,6],[2,6],[2,7],[5,7],[5,2],[6,2],[6,1]]
	,[[0,1,2,3,4,5,6,7,8,9]]
	]]
  ,[109,"m","m",  "", "",[[0,0],[8,8]],[
	[[1,1],[1,6],[3,6],[3,5],[5,5],[5,6],[7,6],[7,5],[8,5],[8,1],[6,1],[6,3],[5,3],[5,2],[4,2],[4,3],[3,3],[3,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]]
	]]
  ,[110,"n","n",  "", "",[[0,0],[8,8]],[
	[[1,1],[1,6],[6,6],[6,5],[7,5],[7,1],[5,1],[5,5],[3,5],[3,1]]
	,[[0,1,2,3,4,5,6,7,8,9]]
	]]
  ,[111,"o","o",  "", "",[[0,0],[8,8]],[
	[[2,1],[2,2],[1,2],[1,5],[2,5],[2,6],[6,6],[6,5],[7,5],[7,2],[6,2],[6,1]
	,[3,2],[3,5],[5,5],[5,2]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11],[12,13,14,15]]
	]]
  ,[112,"p","p",  "", "",[[0,0],[8,8]],[
	[[1,0],[1,6],[6,6],[6,5],[7,5],[7,3],[6,3],[6,2],[3,2],[3,0]
	,[3,3],[3,5],[5,5],[5,3]]
	,[[0,1,2,3,4,5,6,7,8,9],[10,11,12,13]]
	]]
  ,[113,"q","q",  "", "",[[0,0],[8,8]],[
	[[5,0],[5,2],[2,2],[2,3],[1,3],[1,5],[2,5],[2,6],[7,6],[7,0]
	,[3,3],[3,5],[5,5],[5,3]]
	,[[0,1,2,3,4,5,6,7,8,9],[10,11,12,13]]
	]]
  ,[114,"r","r",  "", "",[[0,0],[8,8]],[
	[[1,1],[1,6],[6,6],[6,5],[7,5],[7,4],[5,4],[5,5],[3,5],[3,1]]
	,[[0,1,2,3,4,5,6,7,8,9]]
	]]
  ,[115,"s","s",  "", "",[[0,0],[8,8]],[
	[[1,1],[1,2],[5,2],[5,3],[2,3],[2,4],[1,4],[1,5],[2,5],[2,6],[7,6],[7,5],[3,5],[3,4],[6,4],[6,3],[7,3],[7,2],[6,2],[6,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]]
	]]
  ,[116,"t","t",  "", "",[[0,0],[8,8]],[
	[[4,1],[4,2],[3,2],[3,5],[1,5],[1,6],[3,6],[3,7],[5,7],[5,6],[7,6],[7,5],[5,5],[5,2],[7,2],[7,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]]
	]]
  ,[117,"u","u",  "", "",[[0,0],[8,8]],[
	[[2,1],[2,2],[1,2],[1,6],[3,6],[3,2],[5,2],[5,6],[7,6],[7,1]]
	,[[0,1,2,3,4,5,6,7,8,9]]
	]]
  ,[118,"v","v",  "", "",[[0,0],[8,8]],[
	[[3,1],[3,2],[2,2],[2,3],[1,3],[1,6],[3,6],[3,3],[5,3],[5,6],[7,6],[7,3],[6,3],[6,2],[5,2],[5,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]]
	]]
  ,[119,"w","w",  "", "",[[0,0],[8,8]],[
	[[2,1],[2,3],[1,3],[1,6],[3,6],[3,4],[4,4],[4,5],[5,5],[5,4],[6,4],[6,6],[8,6],[8,3],[7,3],[7,1],[5,1],[5,2],[4,2],[4,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]]
	]]
  ,[120,"x","x",  "", "",[[0,0],[8,8]],[
	[[1,1],[1,2],[2,2],[2,3],[3,3],[3,4],[2,4],[2,5],[1,5],[1,6],[3,6],[3,5],[5,5],[5,6],[7,6],[7,5],[6,5],[6,4],[5,4],[5,3],[6,3],[6,2],[7,2],[7,1],[5,1],[5,2],[3,2],[3,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27]]
	]]
  ,[121,"y","y",  "", "",[[0,0],[8,8]],[
	[[1,0],[1,1],[4,1],[4,2],[2,2],[2,3],[1,3],[1,6],[3,6],[3,3],[5,3],[5,6],[7,6],[7,2],[6,2],[6,1],[5,1],[5,0]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]]
	]]
  ,[122,"z","z",  "", "",[[0,0],[8,8]],[
	[[1,1],[1,2],[2,2],[2,3],[3,3],[3,4],[4,4],[4,5],[1,5],[1,6],[7,6],[7,5],[6,5],[6,4],[5,4],[5,3],[4,3],[4,2],[7,2],[7,1]]
	,[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]]
	]]
  ,[123,"{","{",  "", "",[[0,0],[8,8]],[]]
  ,[124,"|","|",  "", "",[[0,0],[8,8]],[]]
  ,[125,"}","}",  "", "",[[0,0],[8,8]],[]]
  ,[126,"~","~",  "", "",[[0,0],[8,8]],[]]
  ,[127,"^?","",  "DEL","Delete",[[0,0],[8,8]],[]]
  ] ];

