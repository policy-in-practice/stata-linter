


forvalues num = 1(3)243 {
    gen var_`num' = `num'
}

foreach var in varlist x y z {
    gen `var'_`var' = `var' + 1
}
