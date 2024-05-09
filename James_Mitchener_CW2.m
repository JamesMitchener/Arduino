% James Mitchener
% egyjm17@nottingham.ac.uk
%% PRELIMINARY TASK - ARDUINO AND GIT INSTALLATION [10 MARKS]

% a) done
% b) done
% c)
clear a
a=arduino("COM7", "Uno");%link to the arduino

for x=1:10
    writeDigitalPin (a, 'D8',1);
    pause (1);
    writeDigitalPin(a,'D8',0);
    pause(1);
end
%% TASK 1 - READ TEMPERATURE DATA, PLOT, AND WRITE TO A LOG FILE [20 MARKS]
clear
close all
clc

a=arduino("COM7", "Uno");%link to the arduino
duration = 600;
v=zeros(duration,1);
temp=zeros(duration,1);

for d= 1:duration
    v(d)= readVoltage(a,'A0');
    pause(0.0001)%change to 1 to last for 10 min
end

temp=(V-0.5)*100; %information needed to plot the graph
x=1:duration;
plot(x,temp)
xlabel('time (s)','Interpreter','latex')
ylabel('temperature ($^{o}$C)','Interpreter','latex')

%% TASK 2 - LED TEMPERATURE MONITORING DEVICE IMPLEMENTATION [25 MARKS]
clear
close all
clc
a=arduino("COM3", "Uno");%link to the arduino
time=0
while true
     j= readVoltage(a,'A0')% cheack the votage to change to temp
     pause(1);
     if j<0.68
         writeDigitalPin (a, 'D3',1);% conection to the ardunio pin
    pause (0.5);
    writeDigitalPin(a,'D3',0);
    pause(0.5);
     end

     if j>0.74
          writeDigitalPin (a, 'D2',1);
    pause (0.25);
    writeDigitalPin(a,'D2',0);
    pause(0.25);
     end
    
          if (0.68<=j) && (j<=0.74)
          writeDigitalPin (a, 'D4',1)
          end
          if j<0.68
              writeDigitalPin (a, 'D4',0)
          end
          if j>0.74
              writeDigitalPin (a, 'D4',0)
          end
    time = time +1;% count to increase the x axis
   
    pause(1)

temp=(j-0.5)*100;

plot(time,temp)
xlabel('time (s)','Interpreter','latex')
ylabel('temperature ($^{o}$C)','Interpreter','latex')
drawnow %allows the line on the graph to keep increasing
end
     


%% TASK 3 - ALGORITHMS – TEMPERATURE PREDICTION [25 MARKS]
a=arduino("COM3", "Uno");
function predict_temp
   
    %intial points and range
    temp_rate = 0;    
    range = [20, 25]; 
    prediction_time = 5;
    time_interval = 1
  
    while true
     j= readVoltage(a,'A0');
        temp=(j-0.5)*100;

       
        prev_temp = temp - temp_rate * time_interval;%calculations to work out the temp based of the changing temps
        temp_rate = (temp - prev_temp) / time_interval;
        

        fprintf('Current temperature: %.2f°C\n', temp);% shows the information
        fprintf('Temperature change rate: %.2f°C/s\n', temp_rate);
        future_temp = current_temp + temp_rate * prediction_time;
        fprintf('Temperature expected in %d minutes: %.2f°C\n', prediction_time, future_temp);

     
        if temp >= range(1) && temp <= range(2)% shows the information via the lights
            disp('Green light: Temperature stable ');
        elseif temp_rate > 4
            disp('Red light: Temperature increasing too quickly');
        elseif temp_rate < -4
            disp('Yellow light: Temperature decreasing too quickly');
        end
        pause(1);
    end
end





%% TASK 4 - REFLECTIVE STATEMENT [5 MARKS]

% some of the code seams long winded and inificiant so i would try to make
% it more compact and easier for some one to understand also i would just
% generaly improve the layout