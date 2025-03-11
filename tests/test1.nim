# To run these tests, execute `nimble test` from within the root directory.
import std/[unittest, strutils, json]
import dataforseo

let creds = readFile("creds.txt").splitWhitespace()
var client = newDFSClient(login=creds[0], password=creds[1])

test "Clickstream Global Search Volume":
    let
        data = %*[{"keywords": ["seo consultant"]}]
        response = client.fetch(ClickstreamGlobalSearchVolume, data)
    check response.code == Http200
    let body = response.body.parseJson()
    check body["status_code"].getInt() == 20000

# *** more tests here ***

client.close()