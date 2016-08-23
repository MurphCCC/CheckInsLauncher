const {app, BrowserWindow} = require('electron');

let mainWindow;

app.on('window-all-closed', function() {
  app.quit();
});

app.on('ready', function() {
  mainWindow = new BrowserWindow({width: 1920, height: 1080, fullscreen: true, frame:false});
  mainWindow.loadURL('file://' + __dirname + '/browser.html');
  // mainWindow.openDevTools();
  mainWindow.setFullScreen(true);
  //	Completely dissble any menus in the app, turn this bad boy into a legit kiosk!
  app.dock.hide();

});
