(TeX-add-style-hook "Portfolio-CRRA"
 (lambda ()
    (LaTeX-add-labels
     "eq:RportDef"
     "eq:rportCV"
     "eq:rportDist"
     "eq:exputil"
     "eq:Ex"
     "eq:riskyshareMS"
     "eq:eport"
     "eq:rportPremOpt"
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
     "HandoutHeader"
     "HandoutName"
     "./body"
     "bibMake")))

