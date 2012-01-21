(TeX-add-style-hook "Portfolio-CRRA-20110322"
 (lambda ()
    (LaTeX-add-labels
     "eq:CampVic"
     "eq:exputil"
     "eq:Ex"
     "eq:riskyshareMS"
     "eq:eport"
     "eq:epremOpt"
     "fig:Port"
     "fig:Port:a"
     "fig:Port:b")
    (TeX-run-style-hooks
     "subfigure"
     "latex2e"
     "bejournal10"
     "bejournal"
     "CDCDocStartForBE"
     "HandoutStart"
     "DocStartExam"
     "HandoutHeader"
     "HandoutName"
     "./body"
     "bibMake")))

