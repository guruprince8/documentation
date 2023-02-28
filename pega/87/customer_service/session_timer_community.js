// pega.util.Event.addListener(window, "load", pega.desktop.restartTimeoutWarningTimer);
// desktop_showTimeoutLogoffDialogNew(1,currentTimerRandID)
$(".ui-dialog-titlebar-close")[0].click(function () {
  window.alert("js");
});
$(".ui-dialog-titlebar-close").on("click", function () {
  window.top.alert("set title");
  window.top.title = "Interaction Portal";
});
if (pega.d.TimeoutWarningCountdown != null) {
  console.log("clearing timer [load]: " + pega.desktop.TimeoutWarningCountdown);
  clearTimeout(pega.desktop.TimeoutWarningCountdown);
}
console.log("onload inline setting timer to null");
pega.d.TimeoutWarningCountdown = null;
currentTimerRandID = null;

function desktop_restartTimeoutWarningTimer() {
  if (pega.desktop.TimeoutTime && pega.desktop.TimeoutTime > 0) {
    var nTimeoutWarningTime =
      (pega.desktop.TimeoutTime - pega.desktop.TimeoutWarningWindow) * 60000;
    console.log("clearing timer: " + pega.desktop.TimeoutWarningCountdown);
    clearTimeout(pega.desktop.TimeoutWarningCountdown);
    pega.desktop.TimeoutWarningCountdown = null;

    if (nTimeoutWarningTime >= 0) {
      currentTimerRandID = Math.floor(100000 + Math.random() * 9000000);
      console.log("currentTimerRandID: " + currentTimerRandID);
      pega.d.TimeoutWarningCountdown = self.setTimeout(
        "desktop_showTimeoutLogoffDialogNew('" +
          pega.d.TimeoutWarningWindow +
          "','" +
          currentTimerRandID +
          "')",
        nTimeoutWarningTime
      );
      console.log("created timer: " + pega.desktop.TimeoutWarningCountdown);
    }
  }
}

function desktop_showTimeoutLogoffDialogNew(strTime, timerID) {
  if (timerID == currentTimerRandID) {
    var iTime = parseInt(strTime);
    iTime = iTime * 60000;
    var oSafeURL = new SafeURL("@baseclass.ShowLogoffTimer");
    oSafeURL.put("time", iTime);
    /*pega.openUrlInModal.showModalDialog*/
    console.log("displaying logoff timer");
    showJqueryModalDialog(oSafeURL, iTime, 210, 420, function (ret) {
      if (ret == null || ret == "ok") {
        console.log(
          "calling desktop_restartTimeoutWarningTimer from OK response from modal"
        );
        desktop_restartTimeoutWarningTimer();
      } else {
        pega.u.d.gDirtyOverride = false;
        closeAllPRPCChildWindows();
        try {
          application.logOff(true);
        } catch (e) {
          pega.u.d.replace(
            "pyActivity=LogOff&pzPrimaryPageName=pyDisplayHarness",
            null
          );
        }
      }
    });
    /* This is not needed, was put in for testing lower timeout values
	self.setTimeout(function(){console.log("clearing timer while modal displays");clearTimeout(pega.desktop.TimeoutWarningCountdown);}, 5000);
	*/
  } else {
    console.log(
      "timerID: " +
        timerID +
        "  did not match currentTimerRandID: " +
        currentTimerRandID
    );
  }
}

/*  display a modal dialog  using jquery  */
function showJqueryModalDialog(
  url,
  arDialogArguments,
  height,
  width,
  callbackFunction
) {
  if (arDialogArguments) window.dialogArguments = arDialogArguments;
  var $frame = $(
    '<div><iframe name="pzDisplayModalDialog" id="pzDisplayModalDialog" frameborder="0" src="' +
      (typeof url == "string" ? url : url.toURL()) +
      '" style="width:100%; height:100%"/></div>'
  );
  var $dialogWindow = $frame
    .dialog({
      autoOpen: true,
      modal: true,
      width: width,
      height: height + 50,
      resizable: false,
      autoResize: false,
      overlay: {
        opacity: 0.8,
        background: "black",
      },
      open: function () {
        pzDisplayModalDialogWindow = $(this).children()[0].contentWindow;
        if (window.gsServerReqURI)
          pzDisplayModalDialogWindow.gsServerReqURI = window.gsServerReqURI;
        pzDisplayModalDialogWindow.dialogArguments = window.dialogArguments;
        pzDisplayModalDialogWindow.returnValue = undefined;
      },
      close: function () {
        handleCloseJqueryModal(
          callbackFunction,
          undefined,
          $frame,
          $dialogWindow
        );
      },
    })
    .width(width - 30)
    .height(height)
    .css("overflow", "hidden");
  $frame.children().on("load", function () {
    var title = $(this).contents().find("title").html();
    $dialogWindow.dialog("option", "title", title);
    pzDisplayModalDialogWindow = $(this)[0].contentWindow;
    pzDisplayModalDialogWindow.closeModal = function () {
      handleCloseJqueryModal(
        callbackFunction,
        pzDisplayModalDialogWindow.returnValue,
        $frame,
        $dialogWindow
      );
    };
  });
}

function handleCloseJqueryModal(callbackFunction, retval, frame, dialogWindow) {
  window.returnValue = retval;
  dialogWindow.dialog("destroy");
  frame.remove();
  dialogWindow.remove();
  if (callbackFunction) {
    try {
      callbackFunction(window.returnValue);
    } catch (e) {
      alert(
        "pega.openUrlInModal.showModalDialog - error when calling callbackfunction: '" +
          e.message +
          "'"
      );
    }
  }
}

/*
Close all windows opened by standard UI calls using pega ui api. 
If you coded your own window.open ... close it yourself ;) 
*/
function closeAllPRPCChildWindows() {
  var currWin = null;
  var app = pega.desktop.support.getDesktopApplication();

  while (null != (curWin = app.openedWindows.pop())) {
    curWin.close();
  }
}
