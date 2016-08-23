const {app, BrowserWindow} = require('electron');

let mainWindow;

app.on('window-all-closed', function() {
  app.quit();
});

app.on('ready', function() {
  mainWindow = new BrowserWindow({width: 1024, height: 768, fullscreen:true, frame:false });
  mainWindow.loadURL('file://' + __dirname + '/browser.html');
  // mainWindow.openDevTools();
});
