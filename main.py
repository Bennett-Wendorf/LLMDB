#region Imports
# # Environment variables
from dotenv import load_dotenv
load_dotenv()

# Langchain
from langchain.agents import create_sql_agent
from langchain.agents.agent_toolkits import SQLDatabaseToolkit
from langchain.sql_database import SQLDatabase
from langchain.llms.openai import OpenAI
from langchain.agents import AgentExecutor
from langchain.agents.agent_types import AgentType
from langchain.chat_models import ChatOpenAI

# Application
import streamlit as st
#endregion

llm = ChatOpenAI(temperature=0)

db  = SQLDatabase.from_uri("sqlite:///Chinook.db")
toolkit = SQLDatabaseToolkit(db=db, llm=llm)

agent_executor = create_sql_agent(
    llm = llm,
    toolkit = toolkit,
    verbose = True,
    agent_type = AgentType.OPENAI_FUNCTIONS,
)

# agent_executor.run("Describe the playlist track table")

# print()

agent_executor.run("How many tracks are in the classical genre?")

# st.title("LLMDB")

#def generate_response(input_text):
#    st.info(agent_executor.run(input_text))

#with st.form("chat_form"):
#    text = st.text_area("Enter text:", "Describe the playlist track table")
#    submitted = st.form_submit_button("Submit")
#    if submitted:
#        generate_response(text)
