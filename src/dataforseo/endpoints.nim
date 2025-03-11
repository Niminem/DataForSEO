import std/httpcore

type DFSRequest* = tuple[mthd: HttpMethod, endpoint: string]
const EndpointBase = "https://api.dataforseo.com/v3/"
const
    # ----- Keywords Data API -> Clickstream Data API -----
    # https://docs.dataforseo.com/v3/keywords_data/clickstream_data/global_search_volume/live/
    ClickstreamGlobalSearchVolume*: DFSRequest = (HttpPost,
        EndpointBase & "keywords_data/clickstream_data/global_search_volume/live")
    # https://docs.dataforseo.com/v3/keywords_data/clickstream_data/dataforseo_search_volume/live/
    DataForSEOSearchVolume*: DFSRequest = (HttpPost,
        EndpointBase & "keywords_data/clickstream_data/dataforseo_search_volume/live")
    # https://docs.dataforseo.com/v3/keywords_data/clickstream_data/bulk_search_volume/live/
    BulkClickstreamSearchVolume*: DFSRequest = (HttpPost,
        EndpointBase & "keywords_data/clickstream_data/bulk_search_volume/live")
    # ------------------------------------------------------
    
    # TODO: ***Add more endpoints here ***