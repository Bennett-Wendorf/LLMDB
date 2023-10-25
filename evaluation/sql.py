import sqlite3 as sql
from datetime import datetime
from dataclasses import dataclass
import os

@dataclass
class Question():
    id: int
    question_text: str
    difficulty: str
    human_answer: str

class SQL():
    def __init__(self):
        self.conn = sql.connect(os.path.join(os.path.dirname(__file__), "Evaluations.db"))
    
    def _get_executor(self):
        return self.conn.cursor()

    def add_evaluation(self, questionID: int, isSimilar: bool, lLM: str, human_answer: str, lLM_answer: str = None, exception: str = None):
        if not human_answer and not lLM_answer:
            raise Exception("Either human_answer or lLM_answer must be provided")
        
        executer = self._get_executor()

        timestamp = datetime.now().strftime("%d/%m/%Y %H:%M:%S")

        executer.execute("INSERT INTO Evaluation (QuestionID, IsSimilar, LLM, LLMAnswer, Exception, EvaluationTime) VALUES (?, ?, ?, ?, ?, ?)", (questionID, isSimilar, lLM, lLM_answer, exception, timestamp))

        self.conn.commit()

    def get_questions(self):
        executer = self._get_executor()

        executer.execute("SELECT * FROM Question")

        return [Question(id = row[0], question_text = row[1], difficulty = row[2], human_answer = row[3]) for row in executer.fetchall()]
