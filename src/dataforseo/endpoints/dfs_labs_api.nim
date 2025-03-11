import std/httpcore
import common

const
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