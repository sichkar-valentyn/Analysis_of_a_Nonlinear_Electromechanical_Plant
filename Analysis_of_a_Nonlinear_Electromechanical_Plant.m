%Analysis of Nonlinear Electromechanical Plant Using Simulink Model 
close all;
 
%% Model Properties
NonLinearPlant % Simulink-model
 
%DC Motor
Ra=10;      % Electrical resistance         Units: ohms
La=0.1;     % Electrical inductance         Units: henry
Ta=La/Ra;   % Inductance Resistance Ratio
Ke=0.05;    % Torque constant               Units: Nm / (Work)^2
Km = Ke;    % Torque constant               Units: Nm / (Work)^2
J=0.5e-5;   % Inertia                       Units: Kg*m^2
 
%Power Controller
Kpc = 3;
Tpc = 0.001;
 
%Simulink Model
Tend = 1.5; % For sine
%Tend = 0.1; % For step
h = Tpc/10;
M_L=0.0;
t_L=Tend/2;
u = 5;
 
%% Simulation A
%Model Properties
dU=0;
Kvf=0;
Mdf=0;
LINE = 'k-'; %Display style
Legend1 = 'A';
 
%Generate Data
[t,x,W,Ia]=sim('NonLinearPlant',Tend);
 
%Plot Charts
figure(1);
    subplot(2,1,1);
        plot(t,W,LINE);
        title('W(t), rad/s');
        grid on; hold on;
    subplot(2,1,2);
        plot(t,Ia,LINE);
        title('Ia(t), A');
        grid on; hold on;
        
figure(2);
    plot(Ia,W,LINE);
    title('W=f(Ia)'); xlabel('Ia,A');ylabel('W, rad/s');
    grid on; hold on;
    
%% Simulation B     
%Model Properties
dU=0;
Kvf=0.00000;
Mdf=0.000;
LINE = 'k--'; %Display style
Legend2 = 'B';
 
%Generate Data
[t,x,W,Ia]=sim('NonLinearPlant',Tend);
 
%Plot Charts
figure(1);
    subplot(2,1,1);
        plot(t,W,LINE); 
        title('W(t), rad/s');
        grid on; hold on;
    subplot(2,1,2);
        plot(t,Ia,LINE);
        title('Ia(t), A');
        grid on; hold on;
        
figure(2);
    plot(Ia,W,LINE);
    title('W=f(Ia)'); xlabel('Ia, A');ylabel('W, rad/s');
    grid on; hold on;
    
   
%% Simulation C 
%Model Properties
dU=0;
Kvf=0.00000;
Mdf=0.000;
LINE = 'k:'; %Display style
Legend3 = 'C';
 
%Generate Data
[t,x,W,Ia]=sim('NonLinearPlant',Tend);
 
%Plot Charts
figure(1);
    subplot(2,1,1);
        plot(t,W,LINE);
        title('W(t), rad/s');
        grid on; hold on;
    subplot(2,1,2);
        plot(t,Ia,LINE);
        title('Ia(t), A');
        grid on; hold on;
        
figure(2);
    plot(Ia,W,LINE);
    title('W=f(Ia)'); xlabel('Ia, A');ylabel('W, rad/s');
    grid on; hold on;
