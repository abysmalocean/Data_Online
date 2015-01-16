
hg19 <- dbConnect(MySQL(),user="genome",db="hg19",host="genome-mysql.cse.ucsc.edu")

allTables <- dbListTables(hg19)

length(allTables)

dbListFields(hg19,"affyU133Plus2")

dbGetQuery(conn = hg19,statement = "select count(*) from affyU133Plus2")

affydata <- dbReadTable(hg19,"affyU133Plus2")

query <- dbSendQuery(conn = hg19,"select * from affyU133Plus2 where misMatches between 1 and 3")

affyMisSmall <- fetch(query,n=10);
dbClearResult(query)

## MySQL 