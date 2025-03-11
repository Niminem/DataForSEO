# To run these tests, execute `nimble test` from within the root directory.
import std/[unittest, strutils, json]
import dataforseo

let creds = readFile("creds.txt").splitWhitespace()
var client = newDFSClient(login=creds[0], password=creds[1])

test "Clickstream Global Search Volume": # just a quick test to check if API is working, should
                                         # probably use an endpoint that doesn't cost anything 
    let
        keyword = "seo consultant"
        data = %*[{"keywords": [keyword]}]
        response = client.fetch(ClickstreamGlobalSearchVolume, data)
    check response.code == Http200
    let body = response.body.parseJson()
    check body["status_code"].getInt() == 20000

client.close()