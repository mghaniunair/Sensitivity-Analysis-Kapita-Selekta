function dydt = epidemic(t,y,p)
    beta = p(1);
    gamma = p(2);

    S = y(1);
    I = y(2);
    R = y(3);
    N = S + I + R;

    dSdt = -beta*(I*S)/N;
    dIdt = beta*(I*S)/N - gamma*I;
    dRdt = gamma*I;

    dydt = [dSdt;
            dIdt;
            dRdt];
end