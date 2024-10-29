clc;clear all;close all
syms lambda beta delta mu r epsilon d
R0=(lambda*beta*delta)/(mu*(r+epsilon+mu+d)); %Reproduction
% R0=(lambda/(r+epsilon+mu+d))-(mu/(beta*delta)); %Infected
%%
gh_lambda_1(lambda,beta,delta,mu,r,epsilon,d)=diff(R0,lambda).*(lambda/R0);
gh_beta_1(lambda,beta,delta,mu,r,epsilon,d)=diff(R0,beta).*(beta/R0);
gh_delta_1(lambda,beta,delta,mu,r,epsilon,d)=diff(R0,delta).*(delta/R0);
gh_mu_1(lambda,beta,delta,mu,r,epsilon,d)=diff(R0,mu).*(mu/R0);
gh_r_1(lambda,beta,delta,mu,r,epsilon,d)=diff(R0,r).*(r/R0);
gh_epsilon(lambda,beta,delta,mu,r,epsilon,d)=diff(R0,epsilon).*(epsilon/R0);
gh_d(lambda,beta,delta,mu,r,epsilon,d)=diff(R0,d).*(d/R0);
%%
lambda=0.01; 
beta=0.01; 
delta=1; 
mu=0.00003; 
r=0.03; 
epsilon=0.03; 
d=0.008;
%%
gh_lambda=gh_lambda_1(lambda,beta,delta,mu,r,epsilon,d);
gh_beta=gh_beta_1(lambda,beta,delta,mu,r,epsilon,d);
gh_delta=gh_delta_1(lambda,beta,delta,mu,r,epsilon,d);
gh_mu=gh_mu_1(lambda,beta,delta,mu,r,epsilon,d);
gh_r=gh_r_1(lambda,beta,delta,mu,r,epsilon,d);
gh_epsilon=gh_epsilon(lambda,beta,delta,mu,r,epsilon,d);
gh_d=gh_d(lambda,beta,delta,mu,r,epsilon,d);

y=[gh_lambda,gh_beta,gh_delta,gh_mu,gh_r,gh_epsilon,gh_d];
barh(y)
set(gca,'yticklabel',({'\Lambda','\beta','\delta','\mu','r','\epsilon','d'}))
grid on
% syms x
% f(x) = diff(x^3,x)
% x = 2;
% v=f(x)