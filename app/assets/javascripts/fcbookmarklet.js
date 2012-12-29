$("#fightchain_savetech").ready(function(){  
  _.each(document.getElementsByTagName("embed"), function(embed){
    if (embed.type === "application/x-shockwave-flash"){
      embed.setAttribute("wmode", "transparent");
    }
  });

  $("div#fcbookmarklet_popup").on("click", function(event){
    event.stopPropagation();
  });

  $("html").on("click", function(){
    console.log("fight chain iframe here");
    //top.removeFightChainFrame();
  });
});
