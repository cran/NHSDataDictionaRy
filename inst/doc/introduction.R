## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(NHSDataDictionaRy)
library(dplyr)
library(magrittr)
library(tibble)

## ----extracting_dd------------------------------------------------------------
nhs_tibble <- NHSDataDictionaRy::nhs_data_elements()
print(head(nhs_tibble))

## ----left_xl------------------------------------------------------------------
#Grab a sub set of the data frame
df <- nhs_tibble[10,]
result <- NHSDataDictionaRy::left_xl(df$link_name, 22)
print(result)
class(result)


## ----right_xl-----------------------------------------------------------------
#Grab a sub set of the data frame
df <- nhs_tibble[10,]
result <- NHSDataDictionaRy::right_xl(df$link_name, 23)
print(result)
class(result)


## ----mid_xl-------------------------------------------------------------------
#Grab a sub set of the data frame
df <- nhs_tibble[10,]
original <- df$link_name
#Original string
result <- NHSDataDictionaRy::mid_xl(df$link_name, 12, 20)
print(original); print(result)
class(result)


## ----len_xl-------------------------------------------------------------------
#Grab a sub set of the data frame
df <- nhs_tibble[10,]
#Original string
original <- df$link_name
string_length <- NHSDataDictionaRy::len_xl(original)
print(string_length)
class(string_length)



## ----link_scrapeR-------------------------------------------------------------
# Analyse all the links on a website
website_url <- "https://nhsrcommunity.com/home/webinars/"
results <- NHSDataDictionaRy::linkScrapeR(website_url)
print(head(results, 20))


## ----browse_url---------------------------------------------------------------
#This opens the 18th result of the URL
#browseURL(results$url[18])


## ----tableR_example-----------------------------------------------------------
# Filter by a specific lookup required
reduced_tibble <- 
  dplyr::filter(nhs_tibble, link_name == "ACTIVITY TREATMENT FUNCTION CODE")

#Use the tableR function to query the NHS Data Dictionary website and return the associate tibble

national_codes <- NHSDataDictionaRy::tableR(url=reduced_tibble$full_url,
                          xpath = reduced_tibble$xpath_nat_code, 
                          title = "NHS Hospital Activity Treatment Function National Codes")

default_codes <- NHSDataDictionaRy::tableR(url=reduced_tibble$full_url,
                          xpath = reduced_tibble$xpath_default_code, 
                          title = "NHS Hospital Activity Treatment Function Default Codes")


# Here you could merge the codes - as you will have national and default codes

merged_frame <- national_codes %>% 
  dplyr::bind_rows(default_codes)


# The query has returned results, if the url does not have a lookup table an error will be thrown

print(head(national_codes,10))
print(head(default_codes), 10)
print(head(merged_frame))

  

## ----lookup_fields------------------------------------------------------------

act_aggregations <- tibble(SpecCode = as.character(c(101,102,103, 104, 105)),
                             ActivityCounts = round(rnorm(5,250,3),0), 
                             Month = rep("May", 5))

# Use dplyr to join the NHS activity by specialty code

act_aggregations %>% 
  left_join(merged_frame, by = c("SpecCode"="Code"))
  
# This easily joins the lookup on to your data
  

## ----xpath_text---------------------------------------------------------------

url <- "https://datadictionary.nhs.uk/data_elements/abbreviated_mental_test_score.html"
xpath_element <- '//*[@id="element_abbreviated_mental_test_score.description"]'

# Run the xpathTextR function to retrieve details of the element retrieved

result_list <- NHSDataDictionaRy::xpathTextR(url, xpath_element)
print(result_list)


  

## ----cleaned_text-------------------------------------------------------------
# Use the returned result and do some text processing
clean_text <- trimws(unlist(result_list$result))
clean_text <- clean_text %>% 
  gsub("[\r\n]", "", .) %>% #Remove new line and breaks
  trimws() %>% #Get rid of any white space
  as.character() #Cast to a character vector

print(clean_text)


