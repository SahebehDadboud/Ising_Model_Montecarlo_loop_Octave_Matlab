%% Initial Configuration

n_grid = 20; % Size of grid
 
Ms = [];
Ts = [];
Ns = [];
Es = [];

%% Monte Carlo Loop


%T=5
while (1)
 % Choose a temperature
 %while T>0.00001,
 %T = T-0.005;
 T = rand()*5+1e-10;

% Perform a simulation
[M, N, E] = ising(n_grid, T);
% Record the results and also take mean value of our variables
Ms = [Ms M/(n_grid^2)];
Es = [Es E/(n_grid^2)];
Ns = [Ns N];
Ts = [Ts T];

endwhile

%% Figure Generation
%Energy per site, versus temperature
plot(Ts, Es, 'ro');
ylabel('energy per site');
xlabel('temperature');
pbaspect([2 1 1]);
print(gcf, '-depsc2', 'ising-energy');
% Magnetization per site, versus temperature
plot(Ts, Ms, 'bo');
ylabel('magnetization per site');
xlabel('temperature');
ylim([-1.1 1.1]);
pbaspect([2 1 1]);
print(gcf, '-depsc2', 'ising-magnetization');
% Magnetization per site, versus Energy per site
plot(Es, Ms, 'o', 'Color', [0 0.5 0]);
ylabel('Magnetization per site'); 
xlabel('Energy per site');
pbaspect([2 1 1]);
print(gcf, '-depsc2', 'ising-mvse');
