# Example preprocessing script.

source("/Users/davidjones/documents/R/home_made_libraries/file_ingestion.R")
source("/Users/davidjones/documents/R/home_made_libraries/data_cleaner.R")
source("/Users/davidjones/documents/R/home_made_libraries/data_split.R")

#### Merge and clean data ####
train.data.merged <- as.data.table(merge(dengue.features.train,dengue.labels.train,by=c("city","year","weekofyear"),all.x = TRUE))
train.data.clean <- ReplaceBadValues(train.data.merged,"zero")
test.data.clean <- ReplaceBadValues(dengue.features.test,"zero")

# remove the original data-sets; they're no longer required
rm(dengue.features.train)
rm(dengue.labels.train)
rm(dengue.features.test)
rm(train.data.merged)