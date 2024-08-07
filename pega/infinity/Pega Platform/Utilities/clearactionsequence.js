/*
If conditionally to remove action sequeunce configured in any HTML element in Pega ( links, buttons and etc..
use example piece of code like 
clrActions - will have either true or false value
*/

function ClearActionQueue(clrActions){
  if (clrActions === "true"){
    pega.control.actionSequencer.clearQueue();
  } else {
    //dont clear action
  }
  
  /* use the above function in runScript action and pass the property as input parameter to that )
  
  /* Note - Please keep the above function in any of the JS Files accesible to HTML element - likely in Portal level harness otherwise in Perform harness ) */


  /* Set Busy Indicator ----------- start */
https://collaborate.pega.com/question/busy-indicator-not-displaying

<input id="maskImageID" type="text" onchange='turnOnBusyInd()'/>
<script>

function turnOnBusyInd() {
  pega.u.d.busyIndInterval = 0;
  pega.u.d.setBusyIndicator(document.body,true);
  if(pega.u.d.gBusyInd) {
    pega.u.d.gBusyInd.setTargetElement(document.body);
    pega.u.d.gBusyInd.show(true);

  }
}

function turnOffBusyInd() {

pega.u.d.gBusyInd.hide();

}

</script>

/* Set Busy Indicator ----------- end */

  /* Smart Info 

  <span title="<p:r n='$this-value'/>" onclick="pega.control.Actions.prototype.showSmartTip(event,'standard','<p:r n='$this-value'/>')"><i class="pi pi-information-solid"></i></span>

<%
  out.print(org.jsoup.Jsoup.parse(tools.getActiveValue()).body().text());
%>

<p:r n='$this-value' m='richtext'/>
<p:r n='$this-value' m='richtext'/>






