(function(){

  //if (!document.getElementById("#fight_chain_script")){

    //make movies obey z index
    var movies = document.getElementsByTagName("embed");
    for(var i = 0; i < movies.length; i++){ 
      var embed = movies[i];
      if (embed.type === "application/x-shockwave-flash"){
        embed.setAttribute("wmode", "transparent");
      }
    }

    var script = document.getElementById("fight_chain_script");

    var overlayDiv = document.createElement("div");
    overlayDiv.id = "fight_chain_overlay";
    overlayDiv.style.height = "100%";
    overlayDiv.style.width = "100%"; 
    overlayDiv.style.position = "fixed";
    overlayDiv.style.top = "0px";
    overlayDiv.style.zIndex = "1000";
    overlayDiv.style.backgroundColor = "rgba(255, 255, 255, .3)";
    document.body.appendChild(overlayDiv);
    overlayDiv.addEventListener("click", function overlayHandler(event){
      event.stopPropagation();
      overlayDiv.removeEventListener("click", overlayHandler, false);
      overlayDiv.parentNode.removeChild(overlayDiv);
      script.parentNode.removeChild(script);
    }, false);


    var iframe = document.createElement("iframe");
    iframe.id = "fightchain_savetech";
    iframe.src = "http://127.0.0.1:3000/savetech";
    iframe.style.height = "200px";
    iframe.style.width = "300px";
    iframe.style.margin = "150px auto";
    iframe.style.backgroundColor = "white";
    iframe.style.border = "solid 2px black";
    iframe.style.display = "block";
    overlayDiv.appendChild(iframe);
    
  //}
  
/*var fname = (+((''+Math.random()).substring(2))).toString(36);

var metas = document.getElementsByTagName("meta");
for(var i in metas){
  if (metas[i].name == "title"){
    var title = metas[i].content;
    break;
  } 
}

if (title) postData("data", "http://localhost:3000/save/?name=" + encodeURIComponent(title)
                               + "&url=" + encodeURIComponent(location.href), 
                               (function(){
                                  document.body.removeChild(document.getElementById(fname)); 
                                  document.body.removeChild(document.getElementById("fight_chain_script"));
                                  alert("Success!");
                                }));


  function postData( data, url, cb){
    var f = document.createElement('iframe');
    f.setAttribute('name', fname);
    f.setAttribute('id', fname);
    f.setAttribute('style', 'width:0;height:0;border:none;margin:none;padding:none;position:absolute;');

    document.body.appendChild(f);

    var frame = window.frames[fname];
    var doc = frame.document;
    var form = doc.createElement('form');
    var text = doc.createElement('textarea');

    text.setAttribute('name', 'data');
    text.appendChild(doc.createTextNode(data));

    form.setAttribute('action', url);
    form.setAttribute('method', 'post');
    form.appendChild(text);

    doc.body.appendChild(form);

    if (cb) {document.getElementById(fname).onload=cb; }

    doc.forms[0].submit();
  }
*/
})();
