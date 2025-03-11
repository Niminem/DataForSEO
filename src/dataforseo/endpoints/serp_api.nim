import std/httpcore
import common

const
    # ----- SERP API -> SERP API ----- 
    # https://docs.dataforseo.com/v3/serp/id_list/?bash
    SerpAPIIdList*: DFSRequest = (HttpPost,
        EndpointBase & "serp/id_list")
    # https://docs.dataforseo.com/v3/serp/errors/?bash
    SerpAPIErrors*: DFSRequest = (HttpPost,
        EndpointBase & "serp/errors")
    # https://docs.dataforseo.com/v3/serp/screenshot/?bash
    SerpAPIScreenshot*: DFSRequest = (HttpPost,
        EndpointBase & "serp/screenshot")
    # https://docs.dataforseo.com/v3/serp/ai_summary/?bash
    SerpAPIAISummary*: DFSRequest = (HttpPost,
        EndpointBase & "serp/ai_summary")
    # ------------------------------------------------------

    # ----- SERP API -> Google ----- 
    # ------------------------------------------------------