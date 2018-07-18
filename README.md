# Social-disadvantage-and-educational-achievement

Social disadvantage and educational achievement in Australian public and private schools: A control function approach

  Sarah Cornell-Farrow
  
  The University of Adelaide


Data source

  This analysis was undertaken using a confidential data set from the Australian Curriculum, Assessment and Reporting Authority. 
  
  Researchers may apply for the data through their Data Access Program. 
  
  We used the student-level data files from 2013 and 2014.
  

Stata codes

  Stata .do files for cleaning the data and undertaking the analysis are included in this file. This file contains the following:

    • createdata.do which cleans the raw .csv files into the data used by this project, and labels the
variables adequately to be matched with those in the paper.

    • choosevars.do which selects the variables required for the analysis.

    • FINAL.do which generates the final results for Section V (requires choosevars.do to run).

    • instruments.do which produces the results in Appendix F.

    • predict.do which generates the predictions in Section VI.
