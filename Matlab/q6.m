clc;
clear;

% Initialization
x = -3:0.02:3;
y = 5*sin(1.8*x + pi/3);

plot(x, y, 'black');
hold on;

% Corrupted data:
f = 0.6; % Fraction to be corrupted
z = y;
n = length(z);
n_corrupt = round(f*n);
corrupt_indices = randperm(n, n_corrupt);
z(corrupt_indices) = z(corrupt_indices) + (100 + 20*rand(1, n_corrupt));

plot(x, z, 'y');

% Median Filtering:
y_median = zeros(1,n);
for i = 1:n
    y_median(i) = median(z(max([1 i-8]):min([i+8 n])));
end

plot(x, y_median, 'b');

% Mean Filtering:
y_mean = zeros(1,n);
for i = 1:n
    y_mean(i) = mean(z(max([1 i-8]):min([i+8 n])));
end

plot(x, y_mean, 'c');

% Quartile Filtering:
y_q1 = zeros(1,n);
for i = 1:n
    y_q1(i) = quantile(z(max([1 i-8]):min([i+8 n])), 0.25);
end

plot(x, y_q1, 'm');

% Errors
e_corrupted = sum((z-y).^2)/sum(y.^2);
e_median = sum((y_median-y).^2)/sum(y.^2);
e_mean = sum((y_mean-y).^2)/sum(y.^2);
e_q1 = sum((y_q1-y).^2)/sum(y.^2);

legend("Original", "Corrupted", "Median", "Mean", "Quartile")
ylabel("y");
xlabel("x");
title("Comparison between different types of filtering");


