var moveLeft = slate.operation("move", {
  "x": "screenOriginX",
  "y": "screenOriginY",
  "width": "screenSizeX * 0.45",
  "height": "screenSizeY"
});

var moveRight = slate.operation("move", {
  "x": "screenOriginX + screenSizeX * 0.45",
  "y": "screenOriginY",
  "width": "screenSizeX * 0.55",
  "height": "screenSizeY"
});

var moveFull = slate.operation("move", {
  "x": "screenOriginX",
  "y": "screenOriginY",
  "width": "screenSizeX",
  "height": "screenSizeY"
});

var shrinkUp = slate.operation("resize", {
  "width": "+0",
  "height": "-5%",
  "anchor": "top-left"
});

var shrinkDown = slate.operation("resize", {
  "width": "+0",
  "height": "-5%",
  "anchor": "bottom-left"
});

slate.bind("left:cmd,alt", function(window) {
  window.doOperation(moveLeft);
});

slate.bind("right:cmd,alt", function(window) {
  window.doOperation(moveRight);
});

slate.bind("up:cmd,alt", function(window) {
  window.doOperation(moveFull);
});

slate.bind("up:cmd,alt,ctrl", function(window) {
  window.doOperation(shrinkUp);
});

slate.bind("down:cmd,alt,ctrl", function(window) {
  window.doOperation(shrinkDown);
});