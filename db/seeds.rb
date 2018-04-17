documents = [
  "Your listings will be shown at the top of relevant search results and be seen instantly by our most interested buyers. You will capture the buyer’s attention immediately.",
  "Every time you add a new listing, our system sends an email to relevant buyers who have shown interest in similar items. Our sellers can sometimes find buyers for their machines almost instantly!",
  "Adding and updating listings on Machinio is extremely quick and easy. Thanks to our advanced technology you can add and update all of your listings automatically.",
  "Each month you will receive a detailed report showing how many visitors, clicks, and leads we’ve successfully generated for your listings. Reports will include valuable analysis and insights to help your business grow.",
  "Machinio is a global search engine for finding used machinery and equipment. Our comprehensive database contains more active machinery listings than any other website.",
  "We cover all major categories of machinery including: construction, farming, metalworking, processing, printing, woodworking, test and laboratory equipment.",
  "We already work with thousands of sellers and accelerate the sale of their equipment.",
  "We have been receiving great leads from Machinio, resulting in 2 incremental sales from new customers this past quarter, plus adding valuable new overseas customers to our database. The deals have been smooth and it is a pleasure to work with Machinio.",
  "Once you find what you are looking for (and we are confident you will), click on the interested listing. To contact the seller, click the Contact seller button.",
  "We do all of the work of adding and updating your equipment, saving you several hours each month."
]

documents.each do |document|
  Document.create!(description: document)
end