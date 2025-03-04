// custom_flutter_loader.js
//window.flutterLoader = {
//  load: function(options) {
//    // Custom loader implementation
//  }
//};

window.flutterLoader = {
  load: function(options) {
    var baseUri = options.baseUri || document.baseURI;
    var script = document.createElement('script');

    script.src = baseUri + 'flutter.js';
    script.onload = function () {
      console.log('Flutter script loaded');
      if (window._flutter) {
        window._flutter.loader.loadEntrypoint({
          serviceWorker: {
            serviceWorkerVersion: options.serviceWorkerVersion || "1.0.0"
          }
        });
      } else {
        console.error('Flutter framework not found!');
      }
    };

    script.onerror = function() {
      console.error('Failed to load Flutter script:', script.src);
    };

    document.body.appendChild(script);
  }
};

// Automatically load Flutter when the page is ready
window.addEventListener('load', function() {
  window.flutterLoader.load({
    baseUri: document.baseURI,
    serviceWorkerVersion: "1.0.15"  // Update with your correct version
  });
});
