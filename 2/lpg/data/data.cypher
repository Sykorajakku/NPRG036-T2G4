// Edge properties: To demonstrate usage of edge properties as assignment requires, we flattened LeaseOffer relationship and modified genre relations with book.
//                  Otherwise both could be easily modeled as standalone nodes, each RDF resource having its node. Downside is the model then does not have descriptions of genre and availability.

MERGE(en:Language { name: 'English', description: 'English is a West Germanic language of the Indo-European language family.', tag: 'en' })
MERGE(cs:Language { name: 'Czech', description: 'Spoken by over 10 million people, it serves as the official language of the Czech Republic.', tag: 'cs'})

MERGE(fellowship:Book { isbn: '9780345339706', name: 'The Fellowship of the Ring (The Lord of the Rings, Part 1)', keywords: ['middle-earth', 'quest']})
MERGE (fellowship)-[:IN_LANGUAGE]->(en)

MERGE(tolkien:Author { familyName: 'Tolkien', givenName: ['John', 'Ronald', 'Reul'], birthDate: '1892-01-03'})
MERGE (tolkien)-[:KNOWS_LANGUAGE]->(en)
MERGE (tolkien)-[:WRITTEN { inGenre: 'fantasy' }]->(fellowship)

MERGE(krajskaPce:Library { name: 'Krajská knihovna v Pardubicích', url: 'https://kkpce.cz', email: 'dotazy@kkpce.cz' })
MERGE(knihovnaHk:Library { name: 'Knihovna města Hradce Králové', url: 'https://www.knihovnahk.cz', email: 'knihovna@knihovnahk.cz' })

MERGE (krajskaPce)-[:MAKES_OFFER { availableFrom: '2022-09-13', availableUntil: '2032-09-13', sku: 'KS944RUR', availability: 'available' }]->(fellowship)
MERGE (krajskaPce)-[:MAKES_OFFER { availableFrom: '2020-05-01', availableUntil: '2030-09-01', sku: 'KS945RUR', availability: 'available' }]->(fellowship)
MERGE (knihovnaHk)-[:MAKES_OFFER { availableFrom: '2015-05-01', availableUntil: '2025-09-01', sku: 'KS94HRDC', availability: 'available' }]->(fellowship)
