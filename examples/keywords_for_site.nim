# https://docs.dataforseo.com/v3/dataforseo_labs/google/keywords_for_site/live/?bash
# Keywords For Site
#
# The Keywords For Site endpoint will provide you with a list of keywords relevant to the
# target domain. Each keyword is supplied with relevant categories, search volume data for
# the last month, cost-per-click, competition, and search volume trend values for the
# past 12 months.

# Datasource: DataForSEO Keyword Database segmented by relevant domains from Google
# Ads API and supplemented by data from DataForSEO SERP Database.
#
# Search algorithm: relevance-based search for keywords that fall into the same category
# as the target domain.
#
# Examples:
# Specified target domain:
# “letslevitate.com”
# Resulting keyword ideas:
# •”xvt blades”,
# •”scar blades falcon”,
# •”palatine blades”,
# •”blades macomb il”

import std/[json, strutils]
import ../src/dataforseo

let creds = readFile("creds.txt").splitWhitespace()
var client = newDFSClient(login=creds[0], password=creds[1])

var data = %*[{"language_name": "English", "location_name": "United States"}]
data[0]["target"] = newJstring "seo.science"
data[0]["include_clickstream_data"] = newJbool false # if true, doubles price from 0.011 to 0.021
data[0]["limit"] = newJint 10
data[0]["offset"] = newJint 0

let response = client.fetch(KeywordsForSite, data)
writeFile("keywords_for_site.json", response.body.parseJson().pretty(2))
client.close()