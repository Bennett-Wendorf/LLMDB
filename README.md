# Problem Statement
Information and access to it are an increasingly import part of the modern world. Products and systems do exist to help users find this information as easily as possible, but sometimes users require niche combinations of data that developers did not anticipate. To that end, the goal of this project is to develop a system by which users may ask questions in natural language (English), and also receive an answer in natural language, based on data contained within the specified database.

# Existing Research and Products
<!-- TODO: include brief intro for this section -->

## LLMs
<!-- TODO: This can be info about tuned models (SQLCoder/StarCoder from Defog) and possibly brief intro about general models like GPT-->

## Cohesive Systems
<!-- TODO: Be sure to touch on what LangChain's existing sql_database agent does -->
<!-- TODO: Research other similar systems -->

## Evaluation
<!-- TODO: [defog-ai/sql-eval](https://github.com/defog-ai/sql-eval) -->
<!-- TODO: Look into [salesforce/WikiSQL](https://github.com/salesforce/WikiSQL) -->

# Current Project
<!-- TODO: Include brief intro for this section -->

## Data
<!-- TODO: Quick writeup on the Chinook database (where to find it, what it contains, etc.) -->

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

### Results

#### Model Accuracy
<!-- Accuracy is based on 32 question dataset -->
| Model                     | Accuracy (% classified as correct by automated evaluator) | 
| ------------------------- | ------------- |
| OpenAI Divinci (1)        | 59.4% ± 13.79% (19/32) |
| OpenAI GPT-3.5 turbo (1)  | 62.5% ± 13.57% (20/32) |
| OpenAI GPT-4 (1)          | NOT TESTED              |
#### Example Evaluations
| LLM            | Question Text                                         | Similarity                                                              | LLM Answer |
| -------------- | ----------------------------------------------------- | ----------------------------------------------------------------------- | ------------ |
| Divinci Agent | What is the average price of a track in the database? | Similar | The average price of a track in the database is $1.05. |
| Divinci Agent | How many customers have made repeat purchases? | Not Similar | There are 57 customers who have made repeat purchases. |
| GPT-3.5 Agent | Can you identify the most and least expensive tracks? | Similar | The most expensive track is "Battlestar Galactica: The Story So Far" with a unit price of $1.99.The least expensive track is "For Those About To Rock (We Salute You)" with a unit price of $0.99. |
| GPT-3.5 Agent | What are the preferred languages for track titles in the database? | Not Similar | Based on the schema of the "Track" table, there is no specific column that indicates the preferred language for track titles. |

# Next Steps
<!-- TODO: Add intro about how these are general ideas (not in order) -->

### Prompt Engineering
<!-- TODO: Prompt engineering is the first major next step to take for improvement -->

### Fine Tuning
<!-- TODO: Add section about why fine tuning is important -->
<!-- TODO: cost considerations (probaly only a few dollars for GPT 3.5) -->
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