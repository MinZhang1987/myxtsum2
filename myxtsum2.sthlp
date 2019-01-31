{smcl}
{* *! version 1.0  30Jan2019}{...}

{phang}
{bf:myxtsum2} {hline 2} Output xtsum results to esttab


{marker syntax}{...}
{title:Syntax}

{p 8 17 2}
{cmdab:myxtsum2}
[{varlist}]
{ifin}


{marker description}{...}
{title:Description}


{pstd}
{cmd:myxtsum2} output xtsum statistic for the variables in
{varlist} to esttab.


{marker remarks}{...}
{title:Remarks}

{pstd}
This package myxtsum2 was adopted from myxtsum by Ben Jann, 
see https://www.stata.com/meeting/switzerland16/slides/jann_example3-switzerland16.pdf.

{pstd}
I am not claiming this package as my own.

{pstd}
The current myxtsum2 package was developed to fix the following issues that 
are present in the original package myxtsum by Ben Jann.

{pstd}
(1) myxtsum uses listwise deletion. This may create noticeable differences 
from xtsum varlist unless if !missing(varlist) is specified.

{pstd}
(2) myxtsum does not report separete N n Tbar for each variable. Instead it
reports these figures of the last variable in the varlist.
In the following esttab, these three statistics are listed at the bottom. 
This may lead to a false impression that they described the overall data when 
actually they are just for the last variable used.
 

{marker examples}{...}
{title:Examples}

{phang}{cmd:. myxtsum2} {varlist} {p_end}

{phang}{cmd:. esttab , replace cells((mean sd min max sd_b sd_w N n Tbar)) nomtitles nonumbers compress noobs}{p_end}
 
{marker contact}{...}
{title:Contact}
Min Zhang, ISER, The University of Essex
zhangmin.ac@gmail.com

