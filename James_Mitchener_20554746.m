% Insert name here
% Insert email address here
%% PRELIMINARY TASK - ARDUINO AND GIT INSTALLATION [10 MARKS]

% a) done
% b) done
% c)
clear a
a=arduino("COM7", "Uno");

for x=1:10;
    writeDigitalPin (a, 'D8',1);
    pause (1);
    writeDigitalPin(a,'D8',0);
    pause(1);
end
%% TASK 1 - READ TEMPERATURE DATA, PLOT, AND WRITE TO A LOG FILE [20 MARKS]
clear
close all
clc

a=arduino("COM7", "Uno");
duration = 600;
v=zeros(duration,1);
temp=zeros(duration,1);

for d= 1:duration;
    v(d)= readVoltage(a,'A0');
    pause(0.0001)%change to 1 to last for 10 min
end

temp=(V-0.5)*100;
x=1:duration;
plot(x,temp)
xlabel('time (s)','Interpreter','latex')
ylabel('temperature ($^{o}$C)','Interpreter','latex')

%% TASK 2 - LED TEMPERATURE MONITORING DEVICE IMPLEMENTATION [25 MARKS]
clear
close all
clc

a=arduino("COM3", "Uno");


while true
     j= readVoltage(a,'A0')
     if j<0.68
         writeDigitalPin (a, 'D3',1);
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

end
    



%% TASK 3 - ALGORITHMS – TEMPERATURE PREDICTION [25 MARKS]

% Insert answers here


%% TASK 4 - REFLECTIVE STATEMENT [5 MARKS]

% Insert answers here