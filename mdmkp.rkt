#lang slideshow
(require racket/draw)
(require slideshow/latex)
(require slideshow/text)

(current-titlet (lambda (s)
                  (colorize (text s (cons 'bold (current-main-font)) 50)
                            "black")))

(current-main-font "Liberation Sans")
(set-page-numbers-visible! #t)

(current-font-size 38)

(slide
  (t "Using a Population-based Metaheuristic to Solve")
  (t "the Multidemand Multidimensional Knapsack Problem"))

(slide
  #:title "Knapsack Problem"
  (item "A combinatorial optimization")
  (item "Some set of items, each item with a weight and value")
  (item "Attempt to maximize value while staying within weight"))

(slide
  #:title "MDMKP"
  (item "Multidemand Multidimensional Knapsack Problem (MDMKP)")
  (item "Knapsack problem with more dimensions")
  (item "Demand constraints require minimum weight"))

(slide
  #:title "MDMKP"
  (hbl-append (t "Let ") ($ "x_j \\in \\{0,1\\}, \\forall j \\in \\{1,...,n\\}"))
  (hbl-append (t "Maximize ") ($ "\\displaystyle\\sum_{j=1}^{n} c_j x_j"))
  (t "Subject to the constraints:")
  ($$ "\\displaystyle\\sum_{j=1}^{n} a_{ij} x_{j} \\leq b_i, \\forall i \\in \\{1, ..., m\\}")
  ($$ "\\displaystyle\\sum_{j=1}^{n} a_{ij} x_{j} \\geq b_i, \\forall i \\in \\{m + 1, ..., m + q\\}"))

(slide #:title "Practical applications"
       (item "Portfolio selection")
       (item "Capital budgeting")
       (item "Cargo loading"))

(slide #:title "NP-complete"
       (item "No efficient algorithm to solve as n increases")
       (item "Computation time grows exponentially"))

(slide #:title "Metaheuristics"
       (item "Problem independent heuristics")
       (item "Approximate approach")
       (item "Used to solve NP-complete problems"))

(slide #:title "Types of Metaheuristics"
       (item "Population based")
       (item "Single solution")
       (item "Hybrid"))

(slide #:title "JAYA"
       (item "JAYA (R. venkata Rao 2016")
       (item "Parameter-less")
       (item "Population based")
       (item "Single phased")
       (scale ($$ "R1, R2 \\in \\{0, 1\\}") 3/4)
       (scale ($$ "X_{jki} = X_{jki} + R1_{jki} [X_{jBESTi} - X_{jki}] - R2_{jki}[X_{jWORSTi} - X_{jki}]") 3/4))

(slide #:title "Repair"
       (t "After each iteration of JAYA repair to improve feasibility")
       (scale ($$ "obj = 10 x_1 + 20 x_2 + 30 x_3 + 40 x_4 + 50 x_5 + 60 x_6 + 70 x_7 + 80 x_8 ") 4/5)
       (scale ($$ " 5 x_1 +  20 x_2 +  25 x_3 +  35 x_4 + 40 x_5 + 45 x_6 + 55 x_7 +  60 x_8 \\leq 150") 4/5)
       (scale ($$ "90 x_1 + 120 x_2 +  70 x_3 + 110 x_4 + 90 x_5 + 65 x_6 + 80 x_7 + 150 x_8 \\leq 300") 4/5)
       (scale ($$ " 5 x_1 +  20 x_2 + 100 x_3 +  35 x_4 + 60 x_5 + 45 x_6 + 50 x_7 +  60 x_8 \\geq 80") 4/5)
       (scale ($$ "90 x_1 +  60 x_2 +  70 x_3 + 110 x_4 + 90 x_5 + 45 x_6 + 20 x_7 +  10 x_8 \\geq 200") 4/5)
       'next
       (scale (tt "(0 1 0 0 1 0 0 1) violation = 100") 4/5)
       'next
       (scale (tt "(0 1 0 0 1 0 0 0) violation = 50") 4/5)
       'next
       (scale (tt "(0 1 1 0 1 0 0 0) feasible obj = 100") 4/5))

(slide #:title "Approach"
       (item "Initial population generation")
       (item "Binarized JAYA with repair"))
