import std/[httpclient, asyncdispatch, base64, json]
import endpoints

{.warning[ImplicitDefaultValue]: off.}

type
    DFSError* = object of CatchableError
    DFSClient* = Httpclient
    AsyncDFSClient* = AsyncHttpClient

proc newDFSClient*(login, password: string): DFSClient =
    let
        creds = encode(login & ":" & password)
        headers = newHttpHeaders({"Content-Type": "application/json",
                                  "Authorization": "Basic " & creds
                                })
    result = newhttpClient(headers = headers)

proc newAsyncDFSClient*(login, password: string): AsyncDFSClient =
    let
        creds = encode(login & ":" & password)
        headers = newHttpHeaders({"Content-Type": "application/json",
                                  "Authorization": "Basic " & creds
                                })
    result = newAsyncHttpClient(headers = headers)

proc fetch*(client: DFSClient | AsyncDFSClient; req: DFSRequest; taskData: JsonNode):
              Future[Response | AsyncResponse] {.multisync.} =
    let (mthd, endpoint) = req
    result = await client.request(endpoint, mthd, $taskData)