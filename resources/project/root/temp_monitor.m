%% TASK 2 - LED TEMPERATURE MONITORING DEVICE IMPLEMENTATION [25 MARKS]
clear
close all
clc
a=arduino("COM3", "Uno");
time=0
while true
     j= readVoltage(a,'A0')
     pause(1);
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
    time = time +1;
   
    pause(1)

temp=(j-0.5)*100;

plot(time,temp)
xlabel('time (s)','Interpreter','latex')
ylabel('temperature ($^{o}$C)','Interpreter','latex')
drawnow
end