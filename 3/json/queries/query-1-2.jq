jq '[ ."@graph"[].makesOffer[] | { offer: ., start: (.availabilityStarts| strptime("%Y-%m-%d") | mktime), end: (.availabilityEnds | strptime("%Y-%m-%d") | mktime), target: ( "2017-03-05" | strptime("%Y-%m-%d") | mktime) } | select(.start < .target and .target < .end) ]'