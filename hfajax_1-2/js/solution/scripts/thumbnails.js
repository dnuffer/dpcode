window.onload = initPage;

function initPage() {
  // find the thumbnails on the page
  thumbs = document.getElementById("thumbnailPane").getElementsByTagName("img");

  // set the handler for each image
  for (var i = 0; i < thumbs.length; i++) {
    image = thumbs[i];

    // create the onclick function
    image.onclick = function() {
      // find the image name
      detailURL = 'images/' + this.title + '-detail.jpg';
      document.getElementById("itemDetail").src = detailURL;
      getDetails(this.title);
    }
  }
}

