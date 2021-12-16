The Big Tent
================

This repository contains data and R code necessary to reproduce results
reported in Karpiński et al. (2021). It consists of just two files:

-   the file `big-tent-data.csv` contains the data used in the analyses.
    More information about the variables is given below;
-   the file `data-analysis.R` is an R script file with R code used in
    the analyses of the data.

# The dataset

The data come from 8 experimental sessions, with 10 participants per
session. The sessions were divided into 20 “exchange opportunities.” At
each opportunity, participants could share the resources they had been
endowed with the remaining 9 participants. Sharing one’s resources with
an other means establishing an “exchange relation” with them. Thus,
there is a total of 8 × 20 × 10 × 9 = 14,400 unique observations in the
data, each observation being an instance of participant *i* sharing
their resources with participant *j* at round *t* of session *k*. The
following variables are included:

-   `session` – session identifier
-   `subject` – subject’s identifier
-   `alter` – alter’s identifier
-   `period` – exchange opportunity, an integer ranging from 1 to 20
-   `s_cat` – subject’s social category. See **Details** below.
-   `a_cat` – alter’s social category. See **Details** below.
-   `dyad_type` – a binary variable distinguishing between “In-group”
    (where the subject and alter belong to the same social category) and
    “Out-group” (where the subject and alter belong to different
    categories) dyads.
-   `gave` – a binary variable specific to each subject-alter dyad. It
    is coded 1 if the subject chose to share their resources with the
    alter at a given exchange opportunity. Otherwise, it is coded as 0.
-   `received` – a binary variable specific to each subject-alter dyad.
    It is coded 1 if the subject received resources from the alter at a
    given exchange opportunity. Otherwise, it is coded as 0.
-   `confirmed` – a binary variable specific to each subject-alter dyad.
    It is coded 1 if the subject confirmed their willingness to share
    their resources with the given alter at a given exchange
    opportunity. See below for more details.
-   `gave_last` – a lagged version of `gave`: it is coded 1 if the
    subject shared their resources with the alter at the **previous
    exchange opportunity**. Otherwise, it is coded as 0. Note that this
    variable is not defined when `period == 1`.
-   `received_last` – a lagged version of `received`: it is coded 1 if
    the subject received resources from the alter at the **previous
    exchange opportunity**. Otherwise, it is coded as 0. Note that this
    variable is not defined when `period == 1`.
-   `confirmed_last` – a lagged version of `confirmed`: it is coded 1 if
    the subject confirmed their willingness to share their resources
    with the alter at the **previous exchange opportunity**. Otherwise,
    it is coded as 0. Note that this variable is not defined when
    `period == 1`.

## Details

### Experimental design

Each experimental session consisted of two parts. In the first part,
participants were divided into two categories. The assignment to the
categories was on a random basis, although the subjects were led to
believe that it reflected differences among them in terms of “response
style.” The procedure had been developed by students of status
construction processes (Ridgeway et al. 1998; Walker, Webster, and
Bianchi 2011) to create **purely nominal differentiation** between
subjects. This procedure is an adaptation of the classical **minimal
group** design in the social identity tradition (Tajfel et al. 1971;
Hogg 2006).

At the beginning of the first part, subjects were asked to fill in a
short to survey designed to measure their “response styles.” The
subjects were further notified that, according to “current research,”
there were two broad categories of response style, labelled
*Q*<sub>2</sub> and *S*<sub>2</sub>, represented more or less equally in
the population, and that response style was not associated with other
personal characteristics. The subjects were then shown a series of
pictures featuring paintings by artists Paul Klee and Wassily Kandinsky.
Each picture contained two paintings, one by each artist, and the
participants were asked which of the two paintings in the pair they
liked more. The “survey” contained 7 questions of this type. After
filling in the survey, the subjects were informed which category of
response style they belonged to. As mentioned before, the participants
were assigned to the categories randomly, irrespective of their
responses to the questionnaire, and the study of response style was just
a cover story made up to conceal that fact.

In the second part of the experiment, subjects were given a series of
opportunities to exchange or, more precisely, share their resources with
other participants. More specifically, at each exchange opportunity
subjects were endowed with 12 points that they could keep in their
pockets or share with other subjects. Importantly, each point
transferred to an other was multiplied by a constant greater than 1
(either 1.5 or 2), so that it was worth more for the recipient than for
the sender. Points kept in one’s pocket did not increase their value in
this way. Also, there was a constraint on how much a subject could give
to an alter at a given opportunity. That is, the subject could give the
alter either 0 or 6 of the 12 points that they had been endowed with. In
other words, instead of being free to choose the number of points that
they can share with an other, the subjects were constrained to choose
between 0 and 6 points. This means that they could share their endowment
with up to 2 other participants — at least at the first opportunity,
because in subsequent rounds they could share with more than 2 alters,
using resources earned at previous exchange opportunities for that
purpose.

### Giving, confirmation, and rejection

Crucially, the sharing of one’s resources with others proceeded in 2
stages. In stage 1, subjects initially selected others with whom they
wanted to share their resources. In stage 2, they were asked to confirm
their initial choice. In other words, at this stage they could change
their mind about giving to a particular other. If they did change their
mind about giving to a particular person, the 6 points that they
initially wanted to send to this person would return to their pocket. In
Karpiński et al. (2021), only the information about the stage 1 decision
is used in the analyses, as represented by the variable `gave`.

# Acknowledgement

Karpiński et al. (2021) use a subset of data from an experiment designed
to study homophily processes in a small-group social exchange setting.
The experiment is a part of a larger research project on **attraction to
similar others** and **repulsion from dissimilar others** as drivers of
homophily in social relations. The research is supported by a grant from
National Science Centre in Poland (grant number
UMO-2017/25/B/HS6/02543).

# References

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-hogg2006" class="csl-entry">

Hogg, Michael A. 2006. “Social Identity Theory.” In *Contemporary Social
Psychological Theories*, edited by Peter J. Burke. Stanford: Stanford
University Press.

</div>

<div id="ref-karpinski2021" class="csl-entry">

Karpiński, Zbigniew, John Skvoretz, Adam Kęska, and Dariusz Przybysz.
2021. “The Big Tent: Integrating Macro Models for Intergroup Association
with Experimental Data on Exchange Relations in a Minimal Group
Setting.” In *Advances in Group Processes*, edited by Shane R. Thye and
Edward J. Lawler. Vol. 38. Bingley, UK: Emerald Publishing Limited.

</div>

<div id="ref-ridgeway1998" class="csl-entry">

Ridgeway, Cecilia L., Elizabeth Heger Boyle, Kathy J. Kuipers, and Dawn
T. Robinson. 1998. “How Do Status Beliefs Develop? The Role of Resources
and Interactional Experience.” *American Sociological Review* 63 (3):
331–50.

</div>

<div id="ref-tajfel1971" class="csl-entry">

Tajfel, Henri, Michael Billig, R. P. Bundy, and Claude Flament. 1971.
“Social Categorisation and Intergroup Behaviour.” *European Journal of
Social Psychology* 40: 149–78.

</div>

<div id="ref-walker2011" class="csl-entry">

Walker, Lisa Slattery, Murray Webster, and Alison J. Bianchi. 2011.
“Testing the Spread of Status Value Theory.” *Social Science Research*
40 (6): 1652–63.
https://doi.org/<https://doi.org/10.1016/j.ssresearch.2011.04.005>.

</div>

</div>
