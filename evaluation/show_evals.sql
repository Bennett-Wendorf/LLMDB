SELECT e.EvaluationTime, q.QuestionText, e.IsSimilar, e.LLM, e.LLMAnswer, e.Exception
FROM Question AS q
JOIN (
    SELECT QuestionID, IsSimilar, LLM, LLMAnswer, Exception, EvaluationTime
    FROM Evaluation e1
    WHERE e1.EvaluationTime = (
        SELECT MAX(e2.EvaluationTime)
        FROM Evaluation e2
        WHERE e2.QuestionID = e1.QuestionID
    )
) AS e ON q.QuestionID = e.QuestionID;