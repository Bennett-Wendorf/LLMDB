# Execution Plan

## Minimum Viable Product (MVP)
1. Explore existing research in the area, including [chatgpt-sql](https://github.com/kulltc/chatgpt-sql)
    - This is a useful benchmark as it doesn't really do any tuning or infrastructure surrounding the LLM and relies
    on the LLM call itself returning valid SQL
    - Because it doesn't use any techniques other than prompt engineering, it provides some interesting insight on what 
    a model like ChatGPT can do on its own
2. Replicate similar work using either ChatGPT or another LLM (or both) and run against my own chosen/built test data
    - This is important to make sure it't not just the one dataset that allows ChatGPT to perform well
3. Migrate replicated work to LangChain to allow for later infrastructure implementations
4. Begin building extra infrastructure
    - Use vector database or alternative method of retrieving useful parts of DB schema 
        - Example project already does this by letting the LLM request schema information, so that might be enough.
        However, for increasingly larger DBs, it might not even be possible to include the full list of tables in the prompt
    - Validate that response is valid SQL code
    - Validate that response is accurate to schema (no hallucination of tables, fields, etc)
    - Think about validating response for accuracy?
5. Add extra features (ideas/examples)
    - Report writing
    - Aggregation
    - Visualization (graphing)
    - Others?
6. Take to production
