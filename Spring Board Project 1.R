data <- read.csv(file.choose(), header=TRUE)
data
library(dplyr)
library(tidyr)
View(data)
data <- data.frame(data1)

data[1:6,1] <- "philips"
data[7:13,1] <- "akzo"  
data[14:16,1] <- "philips"    
data[17:21,1] <- "van houten"
data[22:25,1] <- "unilever"

data <- data %>%
  separate(Product.code...number, into=c("product_code","product_number", sep = "-"))

data <- data  %>%
  mutate("product_category" = ifelse(product_code == "p", "Smartphone", ""))  %>%
  mutate("product_category" = ifelse(product_code == "v", "TV", product_category))  %>%
  mutate("product_category" = ifelse(product_code == "x", "Laptop", product_category))  %>%
  mutate("product_category" = ifelse(product_code == "q", "Tablet", product_category))

data <- data  %>%
  unite(full_address, 5:7, sep = ",", remove = FALSE)

data <- data  %>%
  mutate(company_philips = ifelse(ï..company == "philips", 1, 0))  %>%
  mutate(company_akzo = ifelse(ï..company == "akzo", 1, 0))  %>%
  mutate(company_van_houten = ifelse(ï..company == "van houten", 1, 0))  %>%
  mutate(company_unilever = ifelse(ï..company == "unilever", 1, 0))

data <- data %>%
  mutate(product_smartphone = ifelse(product_code == "p", 1, 0))  %>%
  mutate(product_tv = ifelse(product_code == "v", 1, 0)) %>%
  mutate(product_laptop = ifelse(product_code == "x", 1, 0)) %>%
  mutate(product_tablet = ifelse(product_code == "q", 1, 0))

