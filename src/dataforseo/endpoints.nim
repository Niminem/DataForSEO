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
    
    # ----- DataForSEO Labs API -> Google -> Keyword Research -----
    # https://docs.dataforseo.com/v3/dataforseo_labs/google/keywords_for_site/live/?bash
    KeywordsForSite*: DFSRequest = (HttpPost,
        EndpointBase & "dataforseo_labs/google/keywords_for_site/live")
    # https://docs.dataforseo.com/v3/dataforseo_labs/google/related_keywords/live/?bash
    RelatedKeywords*: DFSRequest = (HttpPost,
        EndpointBase & "dataforseo_labs/google/related_keywords/live")
    # https://docs.dataforseo.com/v3/dataforseo_labs/google/keyword_suggestions/live/?bash
    KeywordSuggestions*: DFSRequest = (HttpPost,
        EndpointBase & "dataforseo_labs/google/keyword_suggestions/live")
    # https://docs.dataforseo.com/v3/dataforseo_labs/google/keyword_ideas/live/?bash
    KeywordIdeas*: DFSRequest = (HttpPost,
        EndpointBase & "dataforseo_labs/google/keyword_ideas/live")
    # https://docs.dataforseo.com/v3/dataforseo_labs/google/historical_search_volume/live/?bash
    HistoricalSearchVolume*: DFSRequest = (HttpPost,
        EndpointBase & "dataforseo_labs/google/historical_search_volume/live")
    # https://docs.dataforseo.com/v3/dataforseo_labs/google/bulk_keyword_difficulty/live/?bash
    BulkKeywordDifficulty*: DFSRequest = (HttpPost,
        EndpointBase & "dataforseo_labs/google/bulk_keyword_difficulty/live")
    # https://docs.dataforseo.com/v3/dataforseo_labs/google/search_intent/live/?bash
    SearchIntent*: DFSRequest = (HttpPost,
        EndpointBase & "dataforseo_labs/google/search_intent/live")
    # ----------------------------------------------------------------

    # ----- DataForSEO Labs API -> Google -> Competitor Research -----
    # https://docs.dataforseo.com/v3/dataforseo_labs/google/historical_bulk_traffic_estimation/live/
    HistoricalBulkTrafficEstimation*: DFSRequest = (HttpPost,
        EndpointBase & "dataforseo_labs/google/historical_bulk_traffic_estimation/live")

    # TODO: ***Add more endpoints here ***