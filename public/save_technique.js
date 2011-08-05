(function(){

var fname = (+((''+Math.random()).substring(2))).toString(36);

var metas = document.getElementsByTagName("meta");
for(var i in metas){
  if (metas[i].name == "title"){
    var title = metas[i].content;
    break;
  } 
}

//http://localhost:3000/save/?name=
if (title) postData("data", "http://fightchain.heroku.com/save/?name=" + encodeURIComponent(title)
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
})();
