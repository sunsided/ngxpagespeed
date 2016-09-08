# nginx with HTTP/2 and ngx_pagespeed

[![](https://images.microbadger.com/badges/version/sunside/ngxpagespeed.svg)](http://microbadger.com/images/sunside/ngxpagespeed "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/sunside/ngxpagespeed.svg)](http://microbadger.com/images/sunside/ngxpagespeed "Get your own image badge on microbadger.com")

An Ubuntu Trusty based NGINX image inspired by [dgageot/ngxpagespeed](https://github.com/dgageot/ngxpagespeed). It includes HTTP/2 support (superseding SPDY), as well as [ngx_pagespeed](https://github.com/pagespeed/ngx_pagespeed).

The following additional modules are enabled:

- SSL (`ngx_http_ssl_module`)
- HTTP/2 (`ngx_http_v2_module`)
- Stub Status (`ngx_http_stub_status_module`)

Hints:

- No default ports are exposed.
- No volumes are defined.

## Build

	docker build -t sunside/ngxpagespeed .

## Example Startup

	docker run --rm -ti --net host -v $(pwd)/sites-enabled:/etc/nginx/sites-enabled sunside/ngxpagespeed
