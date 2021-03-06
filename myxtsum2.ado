* Min ZHANG, ISER, Essex University, 30 Jan 2019
* Contact: zhangmin.ac@gmail.com

* This package myxtsum2 was adopted from myxtsum by Ben Jann.
* See https://www.stata.com/meeting/switzerland16/slides/jann_example3-switzerland16.pdf
* I am not claiming this package as my own.
* The current myxtsum2 package was developed to fix the following issues that 
* are present in the original package myxtsum by Ben Jann.
* (1) myxtsum uses listwise deletion. This may create noticeable differences 
* from xtsum varlist unless if !missing(varlist) is specified.
* (2) myxtsum does not report separete N n Tbar for each variable. Instead it
* reports these figures of the last variable in the varlist.
* In the following esttab, these three statistics are listed at the bottom. 
* This may lead to a false impression that they described the overall data when 
* actually they are just for the last variable used.

*! version 1.0 30Jan2019
program myxtsum2, eclass
ereturn clear
syntax varlist [if] [in]
tempvar touse
mark `touse' `if' `in'
markout `touse' 
local stats mean sd min max sd_b min_b max_b sd_w min_w max_w N n Tbar
foreach s of local stats { // prepare matrix tempnames
tempname `s'
}
foreach v of local varlist { // run xtsum for each var and collect results
xtsum `v'  if `touse'
foreach s of local stats {
matrix ``s'' = nullmat(``s''), `r(`s')'
}
}
foreach s of local stats { // add column names
matrix coln ``s'' = `varlist'
}
eret local cmd "minxtsum"

foreach s of local stats {
eret matrix `s' = ``s''
}
end

