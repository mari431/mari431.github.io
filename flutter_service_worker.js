'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "690f5f88cc9ee95f7537f4b83802a83c",
"assets/AssetManifest.bin.json": "d7ebd244e15f576eaf942a5ea4466367",
"assets/AssetManifest.json": "9754306d95e0508dccadb9eeee057301",
"assets/assets/images/android_icon.png": "038ea15b40a395099451862327ebcfc1",
"assets/assets/images/css3.png": "b1bd0673d70ccee89e1457bd71554759",
"assets/assets/images/dart.png": "1a089616e2be1ac7c5188c00225772c8",
"assets/assets/images/desktop_icon.png": "e0e90a080a776fd1da23f5a249b5ce3c",
"assets/assets/images/docker.png": "722cafb6c71b44bba6292a603b2e198c",
"assets/assets/images/dowhisle_logo.png": "a19c7746f1433347ab3ba1713e88120d",
"assets/assets/images/dowhisle_logo_web.png": "7a3c5a7c796e0574234ec0695597c475",
"assets/assets/images/facebook.png": "fa74fe1619d75d68df1f0db7c654e39a",
"assets/assets/images/flutter.png": "abe34b0551ded954f6759cada7807e3e",
"assets/assets/images/github_logo.png": "ec3a60c8c6539a07eb70b52f6737ea6e",
"assets/assets/images/html5.png": "9d5b22bfe74ac513d5cd33563908ae71",
"assets/assets/images/instagram.png": "02c7721e097a6bb001d00fa61750bc81",
"assets/assets/images/instagram_logo_black.png": "f87d11ec24f369ad551b7780cc6e1dae",
"assets/assets/images/ios_icon.png": "4b8039e8a442657c7b9b379322eb2793",
"assets/assets/images/javascript.png": "ab8e2beca091db2345ff66a5cc432985",
"assets/assets/images/linkedin.png": "e4d142586676a80b3927d899d3584148",
"assets/assets/images/linkedin_logo_black.png": "96806b29e2f2bcf8055985c49f5c8d0f",
"assets/assets/images/linkedin_logo_black3.png": "4126fcbc9ef55d94a3820e5c54ed1ac4",
"assets/assets/images/mn_logo_bg_black.png": "3795b882348a2c612de2703d3308a04c",
"assets/assets/images/mn_logo_bg_white.png": "019b3fbda58b84377605a3fddb20059f",
"assets/assets/images/mn_logo_black.png": "56dd7a860529f147288daef305b5c469",
"assets/assets/images/mn_logo_white.png": "341980652a85db95145f86510781d246",
"assets/assets/images/mssql_sql_server_icon.png": "800e635e5e7b79a23244b752512d05c8",
"assets/assets/images/my_image1.jpg": "877773b2383d2c157f9644eb6f9ae83c",
"assets/assets/images/my_image2.jpg": "919ba8b7012e582525277b5ecb9ee7db",
"assets/assets/images/my_image22.jpg": "2921297db91cfe5664ade573b8dff595",
"assets/assets/images/my_image222.jpg": "f076c9fa41a95c5538e15dca09e83dd9",
"assets/assets/images/my_image2222.jpg": "adff16023c98feb547f6cf075559b3a6",
"assets/assets/images/my_image2233.jpg": "f4cb5ca1c5670e00e4ee54935bbcbef6",
"assets/assets/images/nodejs_icon.png": "a41475ff79a461158d72d9fe63e537d5",
"assets/assets/images/playstore.png": "ccc98f82a2005a96be76fdbd13e13172",
"assets/assets/images/sto.png": "e1baa1be327595b101f1a4c508ea721e",
"assets/assets/images/telegram.png": "d940cd7b5e7b66510b59785177c6414f",
"assets/assets/images/tomjerry_logo.png": "7c2846470aa1a5488f4f5d7135b50139",
"assets/assets/images/web_icon.png": "8867144689b70d099377ee3c4ab1baa0",
"assets/assets/marimuthuKannayiram.pdf": "98307d98e7079c5adfa9b8e3f37704ea",
"assets/assets/videos/3d_animation_flutter.mp4": "54538b15035604ccaaa85ddf1830816d",
"assets/assets/videos/3d_animation_flutter.webm": "7d0c3adf19cc3c2a44d5a223754a8f07",
"assets/assets/videos/amountIn_words_OP.mp4": "71096f93aabb209e218aed597c8b3283",
"assets/assets/videos/amountIn_words_OP.webm": "b75372551c973ab025deeb521683f46a",
"assets/assets/videos/Image_animation_flutter.mp4": "497ee29bcd1f9777df8c4071afc3ad8b",
"assets/assets/videos/Image_animation_flutter.webm": "3b18642537bd46059e03bb1ebb3ac621",
"assets/assets/videos/share_receipt_image_OP.webm": "c6500d19fb4e0b0f6c688c60878d95f4",
"assets/assets/videos/shopping_cart_Image_OP.mp4": "5d009dc8dbacd30537975528258b7bb9",
"assets/assets/videos/shopping_cart_Image_OP.webm": "73bb579405a649ea6156a33b99b3ac85",
"assets/assets/videos/signin_signup_OP.mp4": "9a1eae516f048896895ed5f1defbbe4c",
"assets/assets/videos/signin_signup_OP.webm": "5f5f826e54036e4e689e13cbc0161c01",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "ad57b2d3e61c635c5f3632bc8ae3b740",
"assets/images/android_icon.png": "038ea15b40a395099451862327ebcfc1",
"assets/images/css3.png": "b1bd0673d70ccee89e1457bd71554759",
"assets/images/dart.png": "1a089616e2be1ac7c5188c00225772c8",
"assets/images/desktop_icon.png": "e0e90a080a776fd1da23f5a249b5ce3c",
"assets/images/docker.png": "722cafb6c71b44bba6292a603b2e198c",
"assets/images/dowhisle_logo.png": "a19c7746f1433347ab3ba1713e88120d",
"assets/images/dowhisle_logo_web.png": "7a3c5a7c796e0574234ec0695597c475",
"assets/images/facebook.png": "fa74fe1619d75d68df1f0db7c654e39a",
"assets/images/flutter.png": "abe34b0551ded954f6759cada7807e3e",
"assets/images/html5.png": "9d5b22bfe74ac513d5cd33563908ae71",
"assets/images/instagram.png": "02c7721e097a6bb001d00fa61750bc81",
"assets/images/ios_icon.png": "4b8039e8a442657c7b9b379322eb2793",
"assets/images/javascript.png": "ab8e2beca091db2345ff66a5cc432985",
"assets/images/linkedin.png": "e4d142586676a80b3927d899d3584148",
"assets/images/mssql_sql_server_icon.png": "800e635e5e7b79a23244b752512d05c8",
"assets/images/nodejs_icon.png": "a41475ff79a461158d72d9fe63e537d5",
"assets/images/playstore.png": "ccc98f82a2005a96be76fdbd13e13172",
"assets/images/sto.png": "e1baa1be327595b101f1a4c508ea721e",
"assets/images/telegram.png": "d940cd7b5e7b66510b59785177c6414f",
"assets/images/web_icon.png": "8867144689b70d099377ee3c4ab1baa0",
"assets/jsonfiles/mydata.json": "c83ad9b8d47aef01691e33c458f24b43",
"assets/marimuthuKannayiram.pdf": "98307d98e7079c5adfa9b8e3f37704ea",
"assets/NOTICES": "129c8f73202d1380058488e4f71efe0c",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/videos/3d_animation_flutter.mp4": "54538b15035604ccaaa85ddf1830816d",
"assets/videos/amountIn_words_OP.mp4": "71096f93aabb209e218aed597c8b3283",
"assets/videos/Image_animation_flutter.mp4": "497ee29bcd1f9777df8c4071afc3ad8b",
"assets/videos/signin_signup_OP.mp4": "9a1eae516f048896895ed5f1defbbe4c",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"custom_flutter_loader.js": "e52cde7ee8336b60a4c8937f1b7ab693",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "10ab92b29b0667d0bff0744a4641886d",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "16b8e4ca7ddefd421578a36c309f2e56",
"/": "16b8e4ca7ddefd421578a36c309f2e56",
"main.dart.js": "ab384a0fd8bdc6e6a91df73dcebce0e2",
"manifest.json": "128dc7da1df0fad62fffb6f292129e68",
"version.json": "12286b11c8ec64a9f98eb0ea698d47b9"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
