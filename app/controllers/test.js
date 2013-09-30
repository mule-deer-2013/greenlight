function getXHR(url, callback) {
  var req = new XMLHttpRequest();
  req.onreadystatechange = function () {
    if (this.readyState == 4) {
      if (this.status == 200 || this.status == 0) {
        callback(this.responseText);
      } else {
        console.log(‹something went wrong');
      }
    }
  }