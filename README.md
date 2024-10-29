<h1>Sensitivity Analysis of Epidemic ODE Parameters</h1>
This example shows how to perform sensitivity analysis on the parameters of an ordinary differential equation (ODE) system that models the spread of a disease in an epidemic.<br><br>
<b>SIR Epidemic Model</b><br>
A simple SIR model for epidemic spread [1] assigns members of the population to three groups (S, I, and R). As the simulation progresses, people can move between the groups. The model can predict outcomes for human-to-human transmission of infectious diseases where recovered individuals are able to resist further infection.<br>
<b>S</b> — The number of susceptible people. Susceptible people can transition into the infected group if they come into contact with an infected person.<br>
<b>I</b> — The number of infected people. Members of this group are capable of infecting people in the susceptible group.<br>
<b>R</b> — The number of recovered people who were previously infected with the disease. Members of this group are immune from further infection.<br><br>
The SIR model can be expressed with a system of three first-order ODEs:
