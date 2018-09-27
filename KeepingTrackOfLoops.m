% This script shows how to create a counter in the command window when 
% performing a loop. Useful when tracking a process/script. In this case we
% use the loop variable as an integer (formatting %d). Anything can be
% used, floats, strings, a timer, etc. Just remember the proper formatting.

total_loops = 500;

reverseStr = ''; % Essential
for I = 1:total_loops
    msg = sprintf('\tWe are now in loop %d/%d...\n', I, total_loops); % Essential, can change line ofcourse
    fprintf([reverseStr, msg]); % Essential
    reverseStr = repmat(sprintf('\b'), 1, length(msg)); % Essential
    
    % START WITH YOU CODE FOR THE LOOP
    pause(0.01); % As a dummy we pause a bit
    % END CODE FOR THE LOOP
end
fprintf('\tLoops completed!\n');

