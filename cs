addEventListener("fetch", event => {
  let url = new URL(event.request.url);
  if (url.pathname == "/" && url.search == "") {
    url.href="https://raw.githubusercontent.com/qjlxh/x/x/__down"
    let request = new Request(url, event.request);
    event.respondWith(fetch(request));
  }
})