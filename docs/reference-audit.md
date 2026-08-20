# Проверка эталонных решений

Прогон `test.jl` поверх `reference.jl` для всех 576 задач на Julia 1.12.6.

Не проходят: **12**. У этих задач сломан именно импортированный эталон (upstream JuliaCN/LeetCode.jl), условие и тесты рабочие.

| # | Задача | ok | fail | error |
|---|--------|----|------|-------|
| 12 | Integer to Roman | 0 | 0 | 1 |
| 40 | Combination Sum II | 0 | 0 | 2 |
| 106 | Construct Binary Tree from Inorder and Postorder Traversal | 0 | 0 | 1 |
| 315 | Count of Smaller Numbers After Self | 0 | 0 | 5 |
| 345 | Reverse Vowels of a String | 1 | 1 | 0 |
| 547 | Friend Circles | 0 | 0 | 4 |
| 583 | Delete Operation for Two Strings | 0 | 0 | 1 |
| 592 | Fraction Addition and Subtraction | 0 | 0 | 4 |
| 990 | Satisfiability of Equality Equations | 0 | 0 | 5 |
| 1019 | Next Greater Node In Linked List | 0 | 0 | 3 |
| 1035 | Uncrossed Lines | 0 | 0 | 3 |
| 1631 | Path With Minimum Effort | 0 | 0 | 4 |
