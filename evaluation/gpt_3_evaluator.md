# Questions
- The GPT 3 version of the evaluator was tested on question IDs 1-15, 17, 19-21, 23, 24, 25, and 27-36 (Evaluations 16-47)

# Models
- Initially, this evaluator was run only on responses generated using a Divinci model. The following statistics are on that set of evaluations

# Results
- On this set it evaluated 17 responses as similar (Evaluations, 16, 18, 19, 20, 21, 22, 26, 32, 34, 35, 36, 37, 38, 39, 40, 42, and 47; Questions 1, 3, 4, 5, 6, 7, 11, 19, 21, 23, 24, 25, 27, 28, 29, 31, and 26)
- After human evaluation, 3 additional questions were marked as similar (Evaluations 17, 24, and 46; Questions 2, 9, and 35)
    - Of these, only eval 2 was really the fault of the evaluator as the human answers for the other two were incorrect
- In addition, 4 questions were incorrectly marked as similar, and thus needed to be manually marked as not similar (Evaluations 32, 34, 35, and 47; Questions 19, 21, 23, and 36)
- After disregarding the two inaccurate questions, the GPT 3 evaluator achieved a 77% accuracy on evaluating correctness
