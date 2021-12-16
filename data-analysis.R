library(tidyverse)
library(lme4)
library(texreg)
library(knitr)
library(kableExtra)

# FITTING THE REGRESSION MODELS AND REPORTING THE RESULTS
p <- read_delim(file = "big-tent-data.csv", delim = ";")

# Modelling tie formation
f1 <- glmer(gave ~ dyad_type + received_last + period + (1|session) + (1|session:subject), data = d, subset = gave_last == 0, family = binomial(link = "logit"))

# Modelling tie renewal
r1 <- glmer(gave ~ dyad_type + received_last + period + (1|session) + (1|session:subject), data = d, subset = gave_last == 1, family = binomial(link = "logit"))

# Building a regression table (text format, to be displayed on the screen)
screenreg(l = list(f1, r1), digits = 3, single.row = TRUE,
          custom.coef.names = c("Intercept", "In-group dyad", "Reciprocity", "Round"),
          custom.model.names = c("Formation", "Renewal"))

# Building a regression table (html format, to be saved to an external file editable in a standard word processor, if needed)
htmlreg(l = list(f1, r1), digits = 3, single.row = TRUE,
          custom.coef.names = c("Intercept", "In-group dyad", "Reciprocity", "Round"),
          custom.model.names = c("Formation", "Renewal"),
        caption = "Results of Fitting Logistic Regression Models to Our Data.",
        caption.above = TRUE,
        file = "tab-3-results.html")

# BUILDING A REGRESSION WITH ESTIMATES OF THE PARAMETERS IN THE THEORETICAL MODELS
# The attraction model. Using formulas shown in Table 2 in the main text

attr <- c(
  exp(fixef(f1)[1])/(1 + exp(fixef(f1)[1])),                                            # d_f
  exp(fixef(f1)[1]) * (exp(fixef(f1)[3]) - 1)/(1 + exp(fixef(f1)[1] + fixef(f1)[3])),   # \pi_f
  exp(fixef(f1)[1]) * (exp(fixef(f1)[2]) - 1)/(1 + exp(fixef(f1)[1] + fixef(f1)[2])),   # \tau_f
  exp(fixef(r1)[1])/(1 + exp(fixef(r1)[1])),                                            # d_r
  exp(fixef(r1)[1]) * (exp(fixef(r1)[3]) - 1)/(1 + exp(fixef(r1)[1] + fixef(r1)[3])),   # \pi_r
  exp(fixef(r1)[1]) * (exp(fixef(r1)[2]) - 1)/(1 + exp(fixef(r1)[1] + fixef(r1)[2]))    # \tau_r
) %>%
  as.double()
repl <- c(
  exp(fixef(f1)[1] + fixef(f1)[2])/(1 + exp(fixef(f1)[1] + fixef(f1)[2])),              # d_f
  exp(sum(fixef(f1)[1:2])) * (exp(fixef(f1)[3]) - 1)/(1 + exp(sum(fixef(f1)[1:3]))),    # \pi_f
  (exp(fixef(f1)[2]) - 1)/(exp(fixef(f1)[2]) + exp(fixef(f1)[1] + fixef(f1)[2])),       # \eta_f
  exp(fixef(r1)[1] + fixef(r1)[2])/(1 + exp(fixef(r1)[1] + fixef(r1)[2])),              # d_f
  exp(sum(fixef(r1)[1:2])) * (exp(fixef(r1)[3]) - 1)/(1 + exp(sum(fixef(r1)[1:3]))),    # \pi_f
  (exp(fixef(r1)[2]) - 1)/(exp(fixef(r1)[2]) + exp(fixef(r1)[1] + fixef(r1)[2]))        # \eta_r
) %>%
  as.double()

p.attr <- c("$d_f$", "$\\pi_f$", "$\\tau_f$", "$d_r$", "$\\pi_r$", "$\\tau_r$")
p.repl <- c("$d_f$", "$\\pi_f$", "$\\eta_f$", "$d_r$", "$\\pi_r$", "$\\eta_r$")

cbind(
  paste(p.attr, round(attr, 3), sep = " = "), 
  paste(p.repl, round(repl, 3), sep = " = ")) %>%
  kable(col.names = c("Atraction", "Repulsion")) %>%
  kable_styling() %>%
  pack_rows("Formation", 1, 3) %>%
  pack_rows("Repulsion", 4, 6) 

# The result can be copied and pasted into a Word document