# myxtsum2
myxtsum2 outputs xtsum results to esstab.  
This package myxtsum2 was adopted from myxtsum by Ben Jann.
See https://www.stata.com/meeting/switzerland16/slides/jann_example3-switzerland16.pdf
I am not claiming this package as my own.
The current myxtsum2 package was developed to fix the following issues that are present in the original package myxtsum by Ben Jann.
(1) myxtsum uses listwise deletion. This may create noticeable differences  from xtsum varlist unless if !missing(varlist) is specified. (2) myxtsum does not report separete N n Tbar for each variable. Instead it reports these figures of the last variable in the varlist. In the following esttab, these three statistics are listed at the bottom. This may lead to a false impression that they described the overall data when actually they are just for the last variable used.
