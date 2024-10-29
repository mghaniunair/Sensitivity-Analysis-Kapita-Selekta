clear all;
clc;
close all;
p1 = [0.4 0.04];
ic = [995 5 0];
F = ode(ODEFcn=@epidemic, ...
        InitialValue=ic, ...
        Parameters=p1);
sol1 = solve(F,0,80)
figure(1)
plot(sol1.Time,sol1.Solution,"-o")
legend("S","I","R")
title(["SIR Populations over Time","$\beta=0.4$, $\gamma=0.04$"],Interpreter="latex")
xlabel("Time",Interpreter="latex")
ylabel("Population",Interpreter="latex")
%%
p2 = [0.2 0.1];
F.Parameters = p2;
F.Sensitivity = odeSensitivity;
sol2 = solve(F,0,80)
figure(2)
plot(sol2.Time,sol2.Solution,"-o")
legend("S","I","R")
title(["SIR Populations over Time","$\beta=0.2$, $\gamma=0.1$"],Interpreter="latex")
xlabel("Time",Interpreter="latex")
ylabel("Population",Interpreter="latex")
%%
U11 = squeeze(sol2.Sensitivity(1,1,:))'.*(p2(1)./sol2.Solution(1,:));
U12 = squeeze(sol2.Sensitivity(1,2,:))'.*(p2(2)./sol2.Solution(1,:));
U21 = squeeze(sol2.Sensitivity(2,1,:))'.*(p2(1)./sol2.Solution(2,:));
U22 = squeeze(sol2.Sensitivity(2,2,:))'.*(p2(2)./sol2.Solution(2,:));
U31 = squeeze(sol2.Sensitivity(3,1,:))'.*(p2(1)./sol2.Solution(3,:));
U32 = squeeze(sol2.Sensitivity(3,2,:))'.*(p2(2)./sol2.Solution(3,:));
figure(3)
t = tiledlayout(3,2);
title(t,["Parameter Sensitivity by Equation","$\beta=0.2$, $\gamma=0.1$"],Interpreter="latex")
xlabel(t,"Time",Interpreter="latex")
ylabel(t,"\% Change in Eqn",Interpreter="latex")
nexttile
plot(sol2.Time,U11)
title("$\beta$, Eqn. 1",Interpreter="latex")
ylim([-5 5])
nexttile
plot(sol2.Time,U12)
title("$\gamma$, Eqn. 1",Interpreter="latex")
ylim([-5 5])
nexttile
plot(sol2.Time,U21)
title("$\beta$, Eqn. 2",Interpreter="latex")
ylim([-5 5])
nexttile
plot(sol2.Time,U22)
title("$\gamma$, Eqn. 2",Interpreter="latex")
ylim([-5 5])
nexttile
plot(sol2.Time,U31)
title("$\beta$, Eqn. 3",Interpreter="latex")
ylim([-5 5])
nexttile
plot(sol2.Time,U32)
title("$\gamma$, Eqn. 3",Interpreter="latex")
ylim([-5 5])