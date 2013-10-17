function $(id){
	return document.getElementById(id);
}

function loadAjaxContent(url,obj){
  var ajaxObj;
  if(window.XMLHttpRequest){ajaxObj = new XMLHttpRequest();} else if(window.ActiveXObject){ajaxObj = new ActiveXObject("Microsoft.XMLHTTP");} else {return;} 

  post=false;
  ajaxObj.open ((post?'POST':'GET'), url);

  if (post&&ajaxObj.setRequestHeader)
      ajaxObj.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=utf-8;");
     
  ajaxObj.onreadystatechange = ajaxCallBack(ajaxObj,obj);
  ajaxObj.send(post); 
  return false;
} 
  
function updateObj(obj, data){ 
   $(obj).innerHTML = data;
   $(obj).disabled=false;
}
  
function ajaxCallBack(ajaxObj,obj){
return function(){
    if(ajaxObj.readyState == 4){
       if (ajaxObj.status==200)
        updateObj(obj, ajaxObj.responseText);
       else updateObj(obj, ajaxObj.status+' '+ajaxObj.statusText,1,1);
    }
}}