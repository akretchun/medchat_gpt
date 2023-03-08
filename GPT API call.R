# test API call for ChatGPT
# Alec Kretchun, 2023

library(httr)
library(stringr)

api_key <- "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" #this should ideally be a rstudioapi prompt


# Calls the ChatGPT API with the given prompt and returns the answer
ask_chatgpt <- function(prompt) {
  response <- POST(
    url = "https://api.openai.com/v1/chat/completions", 
    add_headers(Authorization = paste("Bearer", api_key)),
    content_type_json(),
    encode = "json",
    body = list(
      model = "gpt-3.5-turbo",
      messages = list(list(
        role = "user", 
        content = prompt
      ))
    )
  )
  str_trim(content(response)$choices[[1]]$message$content)
}

prompt <- "what are the kaiser permanente billing codes for flu shots, routine physical exam, and ear wax removal"

ask_chatgpt(prompt)
