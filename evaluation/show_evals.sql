SELECT e.LLM, q.QuestionText, CASE e.IsSimilar
           WHEN 1 THEN 'True'
           ELSE 'False'
       END AS IsSimilar, e.LLMAnswer, e.EvaluationTime
FROM Evaluation e
JOIN (
    SELECT LLM, QuestionID, MAX(EvaluationTime) AS MaxEvaluationTime
    FROM Evaluation
    GROUP BY LLM, QuestionID
) recent_evaluations
ON e.LLM = recent_evaluations.LLM
AND e.QuestionID = recent_evaluations.QuestionID
AND e.EvaluationTime = recent_evaluations.MaxEvaluationTime
JOIN Question q ON e.QuestionID = q.QuestionID