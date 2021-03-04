# Web

Index of Contents

* [HTTP Status Codes](#http-status-codes)
* [HTTP Request Headers](#http-request-headers)
* [Common Non-standard HTTP Request Headers]()
* [Response Headers](#response-headers)
* [Scraping Wikipedia](#scraping-wikipedia)

## HTTP Status Codes

#### 1xx Informatial Responses
* **100** Continue
* **101** Switching Protocols
* **102** Processing (WebDAV; RFC 2518)

#### 2xx Success
* **200** OK
* **201** Created
* **202** Accepted
* **203** Non-Authoritative Information (since HTTP/1.1)
* **204** No Content
* **205** Reset Content
* **206** Partial Content (RFC 7233)
* **207** Multi-Status (WebDAV; RFC 4918)
* **208** Already Reported (WebDAV; RFC 5842)
* **226** IM Used (RFC 3229)

#### 3xx Redirection
* **300** Multiple Choices
* **301** Moved Permanently
* **302** Found
* **303** See Other (since HTTP/1.1)
* **304** Not Modified (RFC 7232)
* **305** Use Proxy (since HTTP/1.1)
* **306** Switch Proxy
* **307** Temporary Redirect (since HTTP/1.1)
* **308** Permanent Redirect (RFC 7538)

#### 4xx Client Errors
* **400** Bad Request
* **401** Unauthorized (RFC 7235)
* **402** Payment Required
* **403** Forbidden
* **404** Not Found
* **405** Method Not Allowed
* **406** Not Acceptable
* **407** Proxy Authentication Required (RFC 7235)
* **408** Request Timeout
* **409** Conflict
* **410** Gone
* **411** Length Required
* **412** Precondition Failed (RFC 7232)
* **413** Payload Too Large (RFC 7231)
* **414** URI Too Long (RFC 7231)
* **415** Unsupported Media Type
* **416** Range Not Satisfiable (RFC 7233)
* **417** Expectation Failed
* **418** I'm a teapot (RFC 2324)
* **421** Misdirected Request (RFC 7540)
* **422** Unprocessable Entity (WebDAV; RFC 4918)
* **423** Locked (WebDAV; RFC 4918)
* **424** Failed Dependency (WebDAV; RFC 4918)
* **426** Upgrade Required
* **428** Precondition Required (RFC 6585)
* **429** Too Many Requests (RFC 6585)
* **431** Request Header Fields Too Large (RFC 6585)
* **451** Unavailable For Legal Reasons (RFC 7725)

#### 5xx Server Errors
* **500** Internal Server Error
* **501** Not Implemented
* **502** Bad Gateway
* **503** Service Unavailable
* **504** Gateway Time-out
* **505** HTTP Version Not Supported
* **506** Variant Also Negotiates (RFC 2295)
* **507** Insufficient Storage (WebDAV; RFC 4918)
* **508** Loop Detected (WebDAV; RFC 5842)
* **510** Not Extended (RFC 2774)
* **511** Network Authentication Required (RFC 6585)

#### Unofficial Codes
* **103** Checkpoint
* **103** Early Hints
* **420** Method Failure (Spring Framework)
* **420** Enhance Your Calm (Twitter)
* **450** Blocked by Windows Parental Controls (Microsoft)
* **498** Invalid Token (Esri)
* **499** Token Required (Esri)
* **509** Bandwidth Limit Exceeded (Apache Web Server/cPanel)
* **530** Site is frozen
* **598** (Informal convention) Network read timeout error
* **599** (Informal convention) Network connect timeout error
* **440** Login Time-out
* **449** Retry With
* **451** Redirect
* **444** No Response
* **495** SSL Certificate Error
* **496** SSL Certificate Required
* **497** HTTP Request Sent to HTTPS Port
* **499** Client Closed Request
* **520** Unknown Error
* **521** Web Server Is Down
* **522** Connection Timed Out
* **523** Origin Is Unreachable
* **524** A Timeout Occurred
* **525** SSL Handshake Failed
* **526** Invalid SSL Certificate
* **527** Railgun Error

## HTTP Request Headers

| Field name | Desc | Example | Status |
| --- | --- | --- | --- |
| A-IM | Acceptable instance-manipulations for the request[7]. | A-IM: feed | Permanent |
| Accept | Media type(s) that is(/are) acceptable for the response. See Content negotiation. | Accept: text/plain | Permanent |
| Accept-Charset | Character sets that are acceptable. | Accept-Charset: utf-8 | Permanent |
| Accept-Datetime | Acceptable version in time. | Accept-Datetime: Thu, 31 May 2007 20:35:00 GMT | Provisional |
| Accept-Encoding | List of acceptable encodings. See HTTP compression. | Accept-Encoding: gzip, deflate | Permanent |
| Accept-Language | List of acceptable human languages for response. See Content negotiation. | Accept-Language: en-US | Permanent |
| Access-Control-Request-Method, Access-Control-Request-Headers | Initiates a request for cross-origin resource sharing with Origin (below). | Access-Control-Request-Method: GET | Permanent: standard |
| Authorization | Authentication credentials for HTTP authentication. | Authorization: Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ== | Permanent |
| Cache-Control | Used to specify directives that must be obeyed by all caching mechanisms along the request-response chain. | Cache-Control: no-cache | Permanent |
| Connection | Control options for the current connection and list of hop-by-hop request fields.[9] Must not be used with HTTP/2.[10]   | Connection: keep-alive Connection: Upgrade   | Permanent |
| Content-Length | The length of the request body in octets (8-bit bytes). | Content-Length: 348 | Permanent |
| Content-MD5 | A Base64-encoded binary MD5 sum of the content of the request body. | Content-MD5: Q2hlY2sgSW50ZWdyaXR5IQ== | Obsolete[11] |
| Content-Type | The Media type of the body of the request (used with POST and PUT requests). | Content-Type: application/x-www-form-urlencoded | Permanent |
| Cookie | An HTTP cookie previously sent by the server with Set-Cookie (below). | Cookie: $Version=1; Skin=new; | Permanent: standard |
| Date | The date and time that the message was originated (in "HTTP-date" format as defined by RFC 7231 Date/Time Formats). | Date: Tue, 15 Nov 1994 08:12:31 GMT | Permanent |
| Expect | Indicates that particular server behaviors are required by the client. | Expect: 100-continue | Permanent |
| Forwarded | Disclose original information of a client connecting to a web server through an HTTP proxy.[12] | Forwarded: for=192.0.2.60;proto=http;by=203.0.113.43 Forwarded: for=192.0.2.43, for=198.51.100.17 | Permanent |
| From | The email address of the user making the request. | From: user@example.com | Permanent |
| Host | The domain name of the server (for virtual hosting), and the TCP port number on which the server is listening. The port number may be omitted if the port is the standard port for the service requested. Mandatory since HTTP/1.1.[13] If the request is generated directly in HTTP/2, it should not be used.[14]   | Host: en.wikipedia.org:8080 Host: en.wikipedia.org   | Permanent |
| If-Match | Only perform the action if the client supplied entity matches the same entity on the server. This is mainly for methods like PUT to only update a resource if it has not been modified since the user last updated it. | If-Match: "737060cd8c284d8af7ad3082f209582d" | Permanent |
| If-Modified-Since | Allows a 304 Not Modified to be returned if content is unchanged. | If-Modified-Since: Sat, 29 Oct 1994 19:43:31 GMT | Permanent |
| If-None-Match | Allows a 304 Not Modified to be returned if content is unchanged, see HTTP ETag. | If-None-Match: "737060cd8c284d8af7ad3082f209582d" | Permanent |
| If-Range | If the entity is unchanged, send me the part(s) that I am missing; otherwise, send me the entire new entity. | If-Range: "737060cd8c284d8af7ad3082f209582d" | Permanent |
| If-Unmodified-Since | Only send the response if the entity has not been modified since a specific time. | If-Unmodified-Since: Sat, 29 Oct 1994 19:43:31 GMT | Permanent |
| Max-Forwards | Limit the number of times the message can be forwarded through proxies or gateways. | Max-Forwards: 10 | Permanent |
| Origin[8] | Initiates a request for cross-origin resource sharing (asks server for Access-Control-* response fields). | Origin: http://www.example-social-network.com | Permanent: standard |
| Pragma | Implementation-specific fields that may have various effects anywhere along the request-response chain. | Pragma: no-cache | Permanent |
| Proxy-Authorization | Authorization credentials for connecting to a proxy. | Proxy-Authorization: Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ== | Permanent |
| Range | Request only part of an entity. Bytes are numbered from 0. See Byte serving. | Range: bytes=500-999 | Permanent |
| Referer [sic] | This is the address of the previous web page from which a link to the currently requested page was followed. (The word “referrer” has been misspelled in the RFC as well as in most implementations to the point that it has become standard usage and is considered correct terminology) | Referer: http://en.wikipedia.org/wiki/Main_Page | Permanent |
| TE | The transfer encodings the user agent is willing to accept: the same values as for the response header field Transfer-Encoding can be used, plus the "trailers" value (related to the "chunked" transfer method) to notify the server it expects to receive additional fields in the trailer after the last, zero-sized, chunk. Only trailers is supported in HTTP/2.[10]   | TE: trailers, deflate | Permanent |
| Upgrade | Ask the server to upgrade to another protocol. Must not be used in HTTP/2.[10]   | Upgrade: h2c, HTTPS/1.3, IRC/6.9, RTA/x11, websocket | Permanent |
| User-Agent | The user agent string of the user agent. | User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:12.0) Gecko/20100101 Firefox/12.0 | Permanent |
| Via | Informs the server of proxies through which the request was sent. | Via: 1.0 fred, 1.1 example.com (Apache/1.1) | Permanent |
| Warning | A general warning about possible problems with the entity body. | Warning: 199 Miscellaneous warning | Permanent |

## Common Non-standard HTTP Request Headers

| Field name | Desc | Example |
| --- | --- | --- |
| Upgrade-Insecure-Requests[15] | Tells a server which (presumably in the middle of a HTTP -> HTTPS migration) hosts mixed content that the client would prefer redirection to HTTPS and can handle Content-Security-Policy: upgrade-insecure-requests Must not be used with HTTP/2[10]   | Upgrade-Insecure-Requests: 1  |
| X-Requested-With | Mainly used to identify Ajax requests. Most JavaScript frameworks send this field with value of XMLHttpRequest | X-Requested-With: XMLHttpRequest  |
| DNT[16] | Requests a web application to disable their tracking of a user. This is Mozilla's version of the X-Do-Not-Track header field (since Firefox 4.0 Beta 11). Safari and IE9 also have support for this field.[17] On March 7, 2011, a draft proposal was submitted to IETF.[18] The W3C Tracking Protection Working Group is producing a specification.[19] | DNT: 1 (Do Not Track Enabled) DNT: 0 (Do Not Track Disabled)    |
| X-Forwarded-For[20] | A de facto standard for identifying the originating IP address of a client connecting to a web server through an HTTP proxy or load balancer. Superseded by Forwarded header. | X-Forwarded-For: client1, proxy1, proxy2 X-Forwarded-For: 129.78.138.66, 129.78.64.103    |
| X-Forwarded-Host[21] | A de facto standard for identifying the original host requested by the client in the Host HTTP request header, since the host name and/or port of the reverse proxy (load balancer) may differ from the origin server handling the request. Superseded by Forwarded header. | X-Forwarded-Host: en.wikipedia.org:8080 X-Forwarded-Host: en.wikipedia.org    |
| X-Forwarded-Proto[22] | A de facto standard for identifying the originating protocol of an HTTP request, since a reverse proxy (or a load balancer) may communicate with a web server using HTTP even if the request to the reverse proxy is HTTPS. An alternative form of the header (X-ProxyUser-Ip) is used by Google clients talking to Google servers. Superseded by Forwarded header. | X-Forwarded-Proto: https  |
| Front-End-Https[23] | Non-standard header field used by Microsoft applications and load-balancers | Front-End-Https: on  |
| X-Http-Method-Override[24] | Requests a web application to override the method specified in the request (typically POST) with the method given in the header field (typically PUT or DELETE). This can be used when a user agent or firewall prevents PUT or DELETE methods from being sent directly (note that this is either a bug in the software component, which ought to be fixed, or an intentional configuration, in which case bypassing it may be the wrong thing to do). | X-HTTP-Method-Override: DELETE  |
| X-ATT-DeviceId[25] | Allows easier parsing of the MakeModel/Firmware that is usually found in the User-Agent String of AT&T Devices | X-Att-Deviceid: GT-P7320/P7320XXLPG  |
| X-Wap-Profile[26] | Links to an XML file on the Internet with a full description and details about the device currently connecting. In the example to the right is an XML file for an AT&T Samsung Galaxy S2. | x-wap-profile: http://wap.samsungmobile.com/uaprof/SGH-I777.xml  |
| Proxy-Connection[27] | Implemented as a misunderstanding of the HTTP specifications. Common because of mistakes in implementations of early HTTP versions. Has exactly the same functionality as standard Connection field. Must not be used with HTTP/2.[10]   | Proxy-Connection: keep-alive  |
| X-UIDH[28][29][30] | Server-side deep packet insertion of a unique ID identifying customers of Verizon Wireless; also known as "perma-cookie" or "supercookie" | X-UIDH: ...  |
| X-Csrf-Token[31] | Used to prevent cross-site request forgery. Alternative header names are: X-CSRFToken[32] and X-XSRF-TOKEN[33] | X-Csrf-Token: i8XNjC4b8KVok4uw5RftR38Wgp2BFwql  |
| X-Request-ID[34][35], X-Correlation-ID[36][37] | Correlates HTTP requests between a client and server. | X-Request-ID: f058ebd6-02f7-4d3f-942e-904344e8cde5  |
| Save-Data | The Save-Data client hint request header available in Chrome, Opera, and Yandex browsers lets developers deliver lighter, faster applications to users who opt-in to data saving mode in their browser. | Save-Data: on  |

## Response Headers


| Field name | Desc | Example | Status |
| --- | --- | --- | --- |
| Access-Control-Allow-Origin, Access-Control-Allow-Credentials, Access-Control-Expose-Headers, Access-Control-Max-Age, Access-Control-Allow-Methods, Access-Control-Allow-Headers | Specifying which web sites can participate in cross-origin resource sharing | Access-Control-Allow-Origin: * | Permanent: standard |
| Accept-Patch[38] | Specifies which patch document formats this server supports | Accept-Patch: text/example;charset=utf-8 | Permanent |
| Accept-Ranges | What partial content range types this server supports via byte serving | Accept-Ranges: bytes | Permanent |
| Age | The age the object has been in a proxy cache in seconds | Age: 12 | Permanent |
| Allow | Valid methods for a specified resource. To be used for a 405 Method not allowed | Allow: GET, HEAD | Permanent |
| Alt-Svc | A server uses "Alt-Svc" header (meaning Alternative Services) to indicate that its resources can also be accessed at a different network location (host or port) or using a different protocol When using HTTP/2, servers should instead send an ALTSVC frame. [40]   | Alt-Svc: http/1.1="http2.example.com:8001"; ma=7200 | Permanent |
| Cache-Control | Tells all caching mechanisms from server to client whether they may cache this object. It is measured in seconds | Cache-Control: max-age=3600 | Permanent |
| Connection | Control options for the current connection and list of hop-by-hop response fields.[9] Must not be used with HTTP/2.   | Connection: close | Permanent |
| Content-Disposition[41] | An opportunity to raise a "File Download" dialogue box for a known MIME type with binary format or suggest a filename for dynamic content. Quotes are necessary with special characters. | Content-Disposition: attachment; filename="fname.ext" | Permanent |
| Content-Encoding | The type of encoding used on the data. See HTTP compression. | Content-Encoding: gzip | Permanent |
| Content-Language | The natural language or languages of the intended audience for the enclosed content[42] | Content-Language: da | Permanent |
| Content-Length | The length of the response body in octets (8-bit bytes) | Content-Length: 348 | Permanent |
| Content-Location | An alternate location for the returned data | Content-Location: /index.htm | Permanent |
| Content-MD5 | A Base64-encoded binary MD5 sum of the content of the response | Content-MD5: Q2hlY2sgSW50ZWdyaXR5IQ== | Obsolete |
| Content-Range | Where in a full body message this partial message belongs | Content-Range: bytes 21010-47021/47022 | Permanent |
| Content-Type | The MIME type of this content | Content-Type: text/html; charset=utf-8 | Permanent |
| Date | The date and time that the message was sent (in "HTTP-date" format as defined by RFC 7231) [43] | Date: Tue, 15 Nov 1994 08:12:31 GMT | Permanent |
| Delta-Base | Specifies the delta-encoding entity tag of the response[7]. | Delta-Base: "abc" | Permanent |
| ETag | An identifier for a specific version of a resource, often a message digest | ETag: "737060cd8c284d8af7ad3082f209582d" | Permanent |
| Expires | Gives the date/time after which the response is considered stale (in "HTTP-date" format as defined by RFC 7231) | Expires: Thu, 01 Dec 1994 16:00:00 GMT | Permanent: standard |
| IM | Instance-manipulations applied to the response[7]. | IM: feed | Permanent |
| Last-Modified | The last modified date for the requested object (in "HTTP-date" format as defined by RFC 7231) | Last-Modified: Tue, 15 Nov 1994 12:45:26 GMT | Permanent |
| Link | Used to express a typed relationship with another resource, where the relation type is defined by RFC 5988 | Link: </feed>; rel="alternate"[44] | Permanent |
| Location | Used in redirection, or when a new resource has been created. | Example 1: Location: http://www.w3.org/pub/WWW/People.html Example 2: Location: /pub/WWW/People.html  | Permanent |
| P3P | This field is supposed to set P3P policy, in the form of P3P:CP="your_compact_policy". However, P3P did not take off,[45] most browsers have never fully implemented it, a lot of websites set this field with fake policy text, that was enough to fool browsers the existence of P3P policy and grant permissions for third party cookies. | P3P: CP="This is not a P3P policy! See https://en.wikipedia.org/wiki/Special:CentralAutoLogin/P3P for more info." | Permanent |
| Pragma | Implementation-specific fields that may have various effects anywhere along the request-response chain. | Pragma: no-cache | Permanent |
| Proxy-Authenticate | Request authentication to access the proxy. | Proxy-Authenticate: Basic | Permanent |
| Public-Key-Pins[46] | HTTP Public Key Pinning, announces hash of website's authentic TLS certificate | Public-Key-Pins: max-age=2592000; pin-sha256="E9CZ9INDbd+2eRQozYqqbQ2yXLVKB9+xcprMF+44U1g="; | Permanent |
| Retry-After | If an entity is temporarily unavailable, this instructs the client to try again later. Value could be a specified period of time (in seconds) or a HTTP-date.[47] | Example 1: Retry-After: 120 Example 2: Retry-After: Fri, 07 Nov 2014 23:59:59 GMT  | Permanent   |
| Server | A name for the server | Server: Apache/2.4.1 (Unix) | Permanent |
| Set-Cookie | An HTTP cookie | Set-Cookie: UserID=JohnDoe; Max-Age=3600; Version=1 | Permanent: standard |
| Strict-Transport-Security | A HSTS Policy informing the HTTP client how long to cache the HTTPS only policy and whether this applies to subdomains. | Strict-Transport-Security: max-age=16070400; includeSubDomains | Permanent: standard |
| Trailer | The Trailer general field value indicates that the given set of header fields is present in the trailer of a message encoded with chunked transfer coding. | Trailer: Max-Forwards | Permanent |
| Transfer-Encoding | The form of encoding used to safely transfer the entity to the user. Currently defined methods are: chunked, compress, deflate, gzip, identity. Must not be used with HTTP/2.[10]   | Transfer-Encoding: chunked | Permanent |
| Tk | Tracking Status header, value suggested to be sent in response to a DNT(do-not-track), possible values: "!" — under construction "?" — dynamic "G" — gateway to multiple parties "N" — not tracking "T" — tracking "C" — tracking with consent "P" — tracking only if consented "D" — disregarding DNT "U" — updated  | Tk: ? | Permanent |
| Upgrade | Ask the client to upgrade to another protocol. Must not be used in HTTP/2[10]   | Upgrade: h2c, HTTPS/1.3, IRC/6.9, RTA/x11, websocket | Permanent |
| Vary | Tells downstream proxies how to match future request headers to decide whether the cached response can be used rather than requesting a fresh one from the origin server. | Example 1: Vary: * Example 2: Vary: Accept-Language  | Permanent |
| Via | Informs the client of proxies through which the response was sent. | Via: 1.0 fred, 1.1 example.com (Apache/1.1) | Permanent |
| Warning | A general warning about possible problems with the entity body. | Warning: 199 Miscellaneous warning | Permanent |
| WWW-Authenticate | Indicates the authentication scheme that should be used to access the requested entity. | WWW-Authenticate: Basic | Permanent |
| X-Frame-Options | Clickjacking protection: deny - no rendering within a frame, sameorigin - no rendering if origin mismatch, allow-from - allow from specified location, allowall - non-standard, allow from any location | X-Frame-Options: deny | Obsolete[49] |

## Scraping Wikipedia

* [Request JSON Output of an Article](https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&explaintext=1&titles=Michelangelo)
