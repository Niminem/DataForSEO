![DataForSEO](https://github.com/user-attachments/assets/f4bf1ee1-d3ef-44fd-98a5-c2caef551d8c)

A simple Nim REST client for the [DataForSEO](https://dataforseo.com/) API (v3). No dependencies (stdlib only), supports both sync and async requests.

>This library is intentially low-level and you must refer to the (well-designed) [API documentation](https://docs.dataforseo.com/v3/?bash) for proper usage- no hand holding, minimal abstractions. We are using DataForSEO as part of our tooling ecosytem for my [SEO agency, SEO Science](https://www.seo.science). We unfortunately do not have the time to make a high-level API and keep up with all changes DFSEO may make.

## Under Active Development

Updates to this repository will be sporadic, as needed.

The API is expansive and covers endpoints we'll never use, such as the Baidu search engine. These endpoints will likely never be implemented by us.

This doesn't make the library unusable- quite the contrary. We designed the API to be extremely straightforward and simple. The [Extending The API](#extending-the-api) section details how you can create an endpoint that isn't currently supported. PRs are welcomed ;)

## Installation

`git clone https://github.com/Niminem/DataForSEO`

or

`nimble install dataforseo`

## Usage

```nim
# main.nim
import std/[strutils, json]
import dataforseo

let creds = readFile("creds.txt").splitWhitespace()
var client = newDFSClient(login=creds[0], password=creds[1])

let
    keyword = "seo consultant"
    data = %*[{"keywords": [keyword]}]
    response = client.fetch(ClickstreamGlobalSearchVolume, data)

assert response.code == Http200
let body = response.body.parseJson()
assert body["status_code"].getInt() == 20000

let globalsearchvol = body["tasks"][0]["result"][0]["items"][0]["search_volume"].getInt()
echo "Keyword: ", keyword
echo "Global Search Volume: ", globalsearchvol

client.close()
# nim c -r -d:ssl main.nim
```

This library supports synchronous and asynchronous requests
via `newDFSClient` and `newAsyncDFSClient` respectively. Both clients are simply aliases for the http clients within `std/httpclient`.

There are currently only two basic functions:

```nim
# 1.) DataForSEO HTTPClient
proc newDFSClient*(login, password: string): DFSClient
proc newAsyncDFSClient*(login, password: string): AsyncDFSClient
```

```nim
# 2.) Performs requests for the client
proc fetch*(client: DFSClient | AsyncDFSClient; req: DFSRequest; taskData: JsonNode):
              Future[Response | AsyncResponse] {.multisync.}
```

When calling `fetch`, you'll be providing two key arguments:
- req: `DFSRequest`
- taskData: `JsonNode`

`req` is simply a tuple, with the type of http request and the endpoint:

```nim
type DFSRequest* = tuple[mthd: HttpMethod, endpoint: string]
```

We already defined many `DFSRequest` constants, named after the endpoint, like what we see above with **ClickstreamGlobalSearchVolume**.

Refer to the DataForSEO [API documentation](https://docs.dataforseo.com/v3/?bash) to see the name of the endpoint you need. If we don't have it yet, the section below will show you how to support it. Again, **PRs are welcomed**.

`taskData` is simply a `JsonNode` containing the data structure DataForSEO expects for that endpoint.

`%*[{"keywords": [keyword]}]` in the case above.

**NOTE:** All error handling, abstracting the response body, etc. falls on the developer. 

## Extending The API

`src/dataforseo/endpoints/common` exports the following to help you support wanted endpoints:

```nim
type DFSRequest* = tuple[mthd: HttpMethod, endpoint: string]
const EndpointBase* = "https://api.dataforseo.com/v3/"
```

All you need to do is create a `DFSRequest` based on your API.

An example:

```nim
const
    HistoricalBulkTrafficEstimation*: DFSRequest = (HttpPost,
        EndpointBase & "dataforseo_labs/google/historical_bulk_traffic_estimation/live")
```

Yep. That's it. Just make sure the appropriate HTTP request and endpoint matches, and you'll be able to use any endpoint this way.

```nim
# ...
let response = client.fetch(HistoricalBulkTrafficEstimation, myData)
# ...
```
