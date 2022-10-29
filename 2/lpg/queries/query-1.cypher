// Aggregate query to find number of available lease offers of fantasy books for given date '2022-10-30' per library.

MATCH
 (l:Library)-[mo:MAKES_OFFER]->(lo:LeaseOffer)-[:OFFERS_ITEM]->(:Book)-[:HAS_GENRE]->(:Genre { name: 'Fantasy' })
WHERE (date(mo.availableFrom) <= date('2022-10-30') <= date(mo.availableUntil)) AND EXISTS((lo)-[:HAS_AVAILABILITY]->(:AvailabilityStatus { name: 'Available' }))
RETURN l.name AS library, COUNT(lo) AS availableOffersCount