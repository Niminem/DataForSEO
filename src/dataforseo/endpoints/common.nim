import std/httpcore

type DFSRequest* = tuple[mthd: HttpMethod, endpoint: string]
const EndpointBase* = "https://api.dataforseo.com/v3/"