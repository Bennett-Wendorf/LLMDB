# Problem Statement
Information and access to it are an increasingly import part of the modern world. Products and systems do exist to help users find this information as easily as possible, but sometimes users require niche combinations of data that developers did not anticipate. To that end, the goal of this project is to develop a system by which users may ask questions in natural language (English), and also receive an answer in natural language, based on data contained within the specified database.

# Existing Research and Products
This project is not the first to look into the problem of integrating natural language processing with databases. There are a variety of existing products and research that have been done in this area, and this section aims to provide a brief overview of some of these products and research. More generally, this problem is popularly called "text-to-SQL" in the language model and machine learning space.

## LLMs
Simple language model inferences by themselves have proven somewhat useful in solving the text-to-SQL problem when they are sufficiently large or well tuned to the problem. In a general sense, large models like OpenAI's GPT-3 and GPT-4 models tend to perform fairly well, so long as prompts are crafted to make the problem more clear. See the [results](#results) section for more information on how these models performed on the Chinook database using Langchain's sql_database agent. Though not tested in this project, organizations such as [BigCode](https://www.bigcode-project.org/) and [Defog AI](https://defog-ai.github.io/) have also had success with fine tuning language models to handle similar problems. In particular, BigCode's [StarCoder](https://huggingface.co/bigcode/starcoder) model is trained on the text-to-code problem, and Defog AI's [SQLCoder](https://huggingface.co/defog-ai/sqlcoder) model is trained on the text-to-SQL problem. Defog claims that their model performs better than GPT-3 when generating SQL queries, and almost as well as GPT-4.

## Cohesive Systems
Beyond simple language model inferencing, much work has been done on more cohesive systems that aim to further improve performance of natural language processing for the text-to-SQL problem. One such system is [Langchain's own SQL Database agent](https://python.langchain.com/docs/integrations/toolkits/sql_database). This system uses a combination of language models for both writing SQL queries themselves, and reasoning about how to get the information it needs, plus supporting tools for output parsing and query execution. The primary advantage of a more complex system such as this is that it can 1) more easily get the portions of the database schema it needs without requiring the language model context window to be too large, 2) iterate over the queries it writes with new context on errors if the query fails, and 3) more easily parse the language model output and synthesize a human-readable answer to the original question.

Other similar systems exist, though Langchain's was the only one tested in this project. For example, [OpenAI's Assistants](https://platform.openai.com/assistants) feature can be built to accomplish a similar task exclusively on cloud resources. The nature of cloud computing can make it easier to iterate and develop quickly, though may hamper performance and cost more in the long run.

## Evaluation
Evaluation of generated SQL queries and their corresponding natural language answers is one of the most difficult problems plaguing the development of solutions to the text-to-SQL problem. Since initial questions can contain ambiguity and even solutions to any particular question may not be exclusive, it is incredibly difficult to determine of a generated query is correct or not. Prior research has been done to help combat this problem. Defog AI developed their own [evaluation framework](https://github.com/defog-ai/sql-eval) using the popular Spider dataset. Their approach is to generate queries with a language model, and compare the generated query against a ground-truth solution using exact and subset matching on the result sets from executing each query. Another example of an evaluation framework is [WikiSQL](https://github.com/salesforce/WikiSQL), developed by Salesforce, which has similar goals of trying to evaluate queries against a ground-truth solution.

# Current Project
The current project aims to evaluate the performance of existing techniques in the text-to-SQL category of language models, primarily looking at Langchain's existing sql_database agent, and OpenAI's GPT-3.5 and GPT-4 models. The goal is to determine if these models are capable of answering questions about a database, and if so, how well they perform. Presuming this basic system would not be sufficient for a production use case of text-to-SQL models, the project also aims to identify areas of improvement for the system, and propose possible solutions to these problems as well as implement some of the solutions, time permitting.

## Data
This project uses the famous Chinook database for testing and evaluation. You can find scripts for recreating this database in a variety of SQL implementations in [this Github repository](https://github.com/lerocha/chinook-database).

As a general overview, the Chinook database contains information about a fictional digital music store. It contains information about artists, albums, tracks, invoices, customers, and employees.

<!-- TODO: Add schema diagram -->

## System Overview
<!-- TODO: Write about Divinci, GPT-3.5, and GPT-4 (once I get to it) -->
<!-- TODO: Add info about langchain sql agent -->
<!-- TODO: For Langchain, try to discuss what the sql agent already does -->

## Evaluation
<!-- TODO: Add intro about concept behind this -->

### Evaluator LLM
<!-- TODO: Talk about differences in performance -->
<!-- TODO: Possibly include a table here -->
<!-- TODO: Note that accuracy is relatively low, but enough for comparison -->
<!-- TODO: Could improve accuracy with a bit of prompt engineering on the evaluator -->

### Questions
To evaluate the models and systems, 32 questions were proposed and human-labeled with difficulty rankings and answers. Four categories of complexity were evaluated: basic (likely no join statements required), simple (likely only one or two simple joins), complex (complex joins and/or sub-queries), and invalid questions that don't make sense or can't be answered on the data.
The complete set of questions is as follows:
| Question Text | Complexity | Human Answer |
| ------------- | ---------- | ------------ |
| What is the average price of a track in the database? | Basic | The average track price is $1.05. |
| What is the distribution of music genres in the Chinook database? | Basic | There are 25 genres in the database. A few examples are Rock, Metal, Blues, and Drama. |
| Can you identify the most and least expensive tracks? | Basic | The most expensive tracks cost $1.99, and the least expensive tracks cost $0.99. |
| How many different media types and formats are available for tracks in the Chinook database? | Basic | There are 5 media types: MPEG audio file, Protected AAC audio file, Protected MPEG-4 video file, Purchased AAC audio file, and AAC audio file. |
| How many different artists are represented in the database? | Basic | There are 275 artists in the database. |
| What is the most common country among customers? | Basic | USA is the most common country among customers. |
| What is the distribution of sales by time of day? | Basic | The most sales occur at 00:00 with 2240 sales. |
| What are the preferred languages for track titles in the database? | Simple | All the tracks are in English. |
| How many customers have made repeat purchases? | Simple | There are 59 customers who have made repeat purchases. |
| What is the total revenue generated by each customer, and who are the highest-paying customers? | Simple | Helena Holý, Richard Cunningham, Luis Rojas, and Ladislav Kovács are the highest paying, with total purchases of $49.62, $47.62, $46.62, and $45.62 respectively. |
| Which tracks have been added to customers' playlists the most? | Simple | Some tracks that have been added to the most playlists are: "2 Minutes to Midnight" which was added to 13 playlists, "Wrathchild" which was added to 12 playlists, and "The Trooper" which was added to 12 playlists. |
| What is the average number of tracks per album in the database? | Simple | The average number of tracks per album is about 10. |
| Are there any tracks in the database that have never been purchased? | Simple | Yes, there are a total of 1519 tracks that have no purchase records. |
| Can you find the track with the highest lifetime value based on their purchase history? | Simple | "The Woman King" has the highest lifetime value. |
| What are the top-selling tracks in the Chinook database? | Simple | The top 5 best selling tracks are 'Balls to the Wall', 'Inject The Venom', 'Snowballed', 'Overdoes', and 'Deuces Are Wild'. |
| Which artists have the most tracks in the database? | Simple | Iron Maiden, U2, and Led Zeppelin are the top 3 artists by track count with 213, 135, and 114 tracks respectively. |
| Are there any patterns or correlations between customer demographics (e.g., age, gender) and their purchasing behavior? | Simple | There is a correlation between customer demographics (country) and their purchasing behavior (total amount spent) |
| Can you identify any customers who have made purchases in multiple countries? | Complex | There aren't any customers that have made purchases in multiple countries. |
| What is the total revenue generated by each employee? | Complex | Jane Peacock generated $833.04, Margaret Park generated $775.40, Steve Johnson generated $720.16, and the remainder of the employees generated no revenue. |
| What is the most popular track in each genre? | Complex | Some of the most popular tracks by genre are: "All Night Thing" in the Alternative genre, "Release" in the Alternative & Punk genre, and "Lay Down Sally" in the Blues genre. |
| Are there any noticeable correlations between the length of a track and its popularity? | Complex | There are no noticeable correlations between the length of track and its popularity. |
| Can you identify any seasonal patterns in music sales? | Complex | On average, the most sales are during the summer months (June through August), and the least sales are during the fall months (September through November). |
| What is the total revenue for each country? | Complex | Some of the top countries are USA with $523.06 in revenue, Canada with $303.96 in revenue, and France with $190.10 in revenue. |
| Can you provide a list of customers who have made the highest number of purchases? | Complex | Luís Gonçalves, Leonie Köhler, and François Tremblay have made some of the most purchases, with 7 each. |
| What is the most popular genre among customers in Germany? | Complex | Rock is the most popular genre among customers in Germany. |
| How has the revenue from sales changed in the last month? | Complex | There haven't been any sales in the past 2 months to compare to. |
| What is the average number of days between a customer's first and most recent purchase? | Complex | There are an average 1,403 days between a customer's first and last purchase, though that is likely skewed by customers that have only purchased one time. |
| Which tracks have been played the most based on play count data? | Invalid | The database does not contain play count data. |
| What is the most common method of payment used by customers? | Invalid | The database does not contain payment method data. |
| Which albums have the highest and lowest customer ratings? | Invalid | The database does not contain album rating data. |
| Can you provide a list of tracks that have been discounted the most often? | Invalid | The database does not contain discount data. |
| Which employees have the highest and lowest customer satisfaction ratings? | Invalid | The database does not contain employee rating data. |

### Results

#### Model Accuracy
<!-- Accuracy is based on 32 question dataset -->
| Model                     | Accuracy (% classified as correct by automated evaluator) | 
| ------------------------- | ------------- |
| OpenAI Divinci            | 59.4% (19/32) |
| OpenAI GPT-3.5 turbo      | 62.5% (20/32) |
| OpenAI GPT-4              | 62.5% (20/32) |

<!-- TODO: run GPT-4-Turbo -->

*Note: The accuracy values are based on the evaluator. See above for a discussion on the accuracy of the evaluator itself.*
#### Example Evaluations
| LLM            | Question Text                                         | Similarity                                                              | LLM Answer | Human Answer |
| -------------- | ----------------------------------------------------- | ----------------------------------------------------------------------- | ------------ | ------------------------------------------------ |
| Divinci Agent | What is the average price of a track in the database? | Similar | The average price of a track in the database is $1.05. | The average track price is $1.05 |
| Divinci Agent | How many customers have made repeat purchases? | Not Similar | There are 57 customers who have made repeat purchases. | There are 59 customers that have made repeat purchases |
| GPT-3.5 Agent | Can you identify the most and least expensive tracks? | Similar | The most expensive track is "Battlestar Galactica: The Story So Far" with a unit price of $1.99. The least expensive track is "For Those About To Rock (We Salute You)" with a unit price of $0.99. | The most expensive tracks cost $1.99, and the least expensive tracks cost $0.99. |
| GPT-3.5 Agent | What are the preferred languages for track titles in the database? | Not Similar | Based on the schema of the "Track" table, there is no specific column that indicates the preferred language for track titles. | All the tracks are in English. |

# Next Steps
<!-- TODO: Add intro about how these are general ideas (not in order) -->

### Prompt Engineering
<!-- TODO: Prompt engineering is the first major next step to take for improvement -->

### Fine Tuning
<!-- TODO: Add section about why fine tuning is important -->
<!-- TODO: cost considerations (probably only a few dollars for GPT 3.5) -->
<!-- TODO: Fine tuning generally helps the language model produce a more correct answer the first time -->

### Additional Tools/Steps
<!-- TODO: Talk about additional steps that could be added to the agent to make it better -->

#### Reducing Ambiguity
<!-- TODO: Ambiguity identification steps -->
<!-- TODO: Use a language model to first identify ambiguous questions (possibly in relation to DB schema) -->
<!-- TODO: If identified as ambiguous, use a model to rewrite the question to be less ambiguous/take a side -->
<!-- TODO: Give the user a warning if their question is ambiguous alongside the rewritten question to show the user how the model is interpreting their question. -->

#### Post Processing
<!-- TODO: After the answer is generated, is there a way we can try to check if it answers the question? Is something like that even needed, or are the models alone good enough at answering the question, even if data is wrong -->