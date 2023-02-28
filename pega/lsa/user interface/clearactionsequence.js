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
