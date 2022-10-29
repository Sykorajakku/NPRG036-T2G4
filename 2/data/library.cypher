// https://console.neo4j.org

CREATE CONSTRAINT IF NOT EXISTS FOR (a:Author)
REQUIRE (a.familyName, a.givenName, a.birthDate) IS UNIQUE

CREATE CONSTRAINT IF NOT EXISTS FOR (b:Book)
REQUIRE (b.isbn) IS UNIQUE


MERGE(tolkien:Author { familyName: 'Tolkien', givenName: ["John", "Ronald", "Reul"], birthDate: '1892-01-03'})
MERGE(fellowship:Book { isbn: 9780345339706, name: "The Fellowship of the Ring (The Lord of the Rings, Part 1)", keywords: ["middle-earth", "quest"]})

MERGE(en:Language { name: 'English', description: 'English is a West Germanic language of the Indo-European language family.', tag: 'en' })
MERGE(cs:Language { name: 'Czech', description: 'Spoken by over 10 million people, it serves as the official language of the Czech Republic.', tag: 'cs'})

MERGE(fantasy:Genre { name: 'Fantasy', description: 'Fantasy is a genre of speculative fiction involving magical elements, typically set in a fictional universe and sometimes inspired by mythology and folklore.'})

MERGE(ks944rurLeaseOffer:LeaseOffer { sku: 'KS944RUR', availableFrom: '2022-09-13', availableUntil: '2032-09-13'})
MERGE(available:AvailabilityStatus { name: 'Available', description: 'Book is currently available in library system.' })
MERGE(krajskaPce:Library { name: 'Krajská knihovna v Pardubicích', url: 'https://kkpce.cz', email: 'dotazy@kkpce.cz' })




MERGE (fellowship)-[:HAS_AUTHOR]->(tolkien)
MERGE (fellowship)-[:HAS_GENRE]->(fantasy)
MERGE (fellowship)-[:IN_LANGUAGE]->(en)

MERGE (tolkien)-[:KNOWS_LANGUAGE]->(en)

MERGE (ks944rurLeaseOffer)-[:OFFERS_ITEM]->(fellowship)
MERGE (ks944rurLeaseOffer)-[:HAS_AVAILABILITY]->(available)
MERGE (krajskaPce)-[:MAKES_OFFER]->(ks944rurLeaseOffer)
