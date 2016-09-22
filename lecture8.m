%lecture8

data = xlsread('well_head_prices.xlsx');

histogram(data);

transformed_data = log(data);
histogram(transformed_data);   %Gaussian distribution (is symmetrical, but not normal bc normal is (0,1)

years = length(data)/12;


monthly_matrix = reshape(transformed_data, 12, years);
monthly_matrix = monthly_matrix';

% for i = 1:years
%     for j = 1:12
%         monthly_matrix(i,j) = trasformed_data((i-1)*12))
%     end
% end

stats = zeros (12, 2);   %first column means and second column std devs for each month 
for i= 1:12             %rows are years, columns are months 
    stats(i,1) = mean(monthly_matrix(:,i));
    stats(i,2) = std(monthly_matrix(:,i));
end

%lowest gas prices are in april, march, & september
%higher demand in winter and summer, but lower variance 

%a = randn(100,1) %creates a sample of 100 different values, 100 rows and 1 column 
%putting an n on the end samples from standard normal distributions 
%to shift a disribution left or right we are adding 
% a = 1.4263 + randn(100,1) <-- assumes a variance of 1 
%a = 1.4263 + .4657*randn(100,1); multiplying by a unit chances the mean 
%100 sample NG prices
%the plot shows no year to year consistency 

%number 5 
highest_mean = 1.4545 + .4460*randn(1000,1);
lowest_mean = 1.3194 +0.4961*randn(1000,1);
highest_stddev = 1.3364 + 0.5292*randn(1000,1);
lowest_stddev = 1.4354 + 0.4036*randn(1000,1);

%number6
a = exp(highest_mean);
b = exp(lowest_mean);
c = exp(highest_stddev);
d = exp(lowest_stddev);

figure
histogram(a) 
title('Back Transformed Synthetic Samples')
xlabel('natural gas price')
ylabel('frequency')

hold on;

histogram(b)
histogram(c)
histogram(d);


%number 7 
x = data(1:145, 1);
y = data(145:192, 1);

figure
plot(data)

hold on;

histogram(x)
histogram(y) 











