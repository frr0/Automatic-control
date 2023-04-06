% Define the transfer function
num = [1 2];
den = [1 5 6];
sys = tf(num, den);

% Set the percentage threshold for the rising time
percent_threshold = 0.9;

% Calculate the step response of the system
t = linspace(0, 10, 1000);
step_response = step(sys, t);

% Find the time index when the output rises above the percentage threshold
index = find(step_response >= percent_threshold, 1);

% Calculate the rising time
rising_time = t(index);

% Display the rising time
disp(['The rising time is ' num2str(rising_time) ' seconds.']);