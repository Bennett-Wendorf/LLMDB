# Questions
- The Divinci version of the evaluator was tested on question IDs 1-7, 14, and 30-36 (Evaluations 1-15)

# Models
- This evaluator was run only on responses generated using a Divinci model

# Results
- On this set it evaluated 4 of the responses as similar (Evaluations 1, 5, 6, and 7; Questions 1, 5, 6, and 7)
- After human evaluation, 3 additional questions were marked as similar (Evaluations 2, 10, and 14; Questions 2, 31, and 35)
    - However, only one of these (eval 2) was really the fault of the evaluator as the human answers for the other two were incorrect
- After disregarding the two inaccurate questions, the Divinci evaluator achieved a 92% accuracy on evaluating correctness

# Results (Full set)
- The evaluator was rerun on the full dataset (Same as GPT evaluator) (Evaluations 47-79)
- Evaluations 49, 50, 51, 56, 58, 68, 71, 72, 74, and 78 needed to be corrected from not similar to similar
- Evaluation 57 needed to be updated from similar to not similar
- With the same 2 inaccurate questions, this leaves a true accuracy of 71%
