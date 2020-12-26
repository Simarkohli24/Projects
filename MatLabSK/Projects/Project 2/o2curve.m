%initialize the set variables in the problem/graph
L0 = 30;
Cs = 8;
C0 = 7;
Kr = 0.35;
Kd = 0.35;
Ka = 0.00001;
k = 0;
checker = true;
anaerobic = true;
drop = false;

%establish figure parameters
figure;
axis([0 10 0 10]);
hold on; 
xlabel('Time (Days)', 'FontSize',12)
ylabel('Dissolved Oxygen (mg/L)', 'FontSize',12)

%plot initial value separately so that it doesn't hinder the for statement
%when Ct must be less than C0
plot (0, C0, 'r*');

%create a counter k
k = 0;

%create time domain of 0 to 10 days, at 0.1 interval (2.4 hours)
for t = 0:0.1:10
    
    %create equation that will be used to extract Ct values at given time t
    Ct = Cs - ((L0*Kd)/(Ka - Kr))*((exp(-Kr*t))- exp(-Ka*t)) - (Cs - C0)*exp(-Ka*t);
    
    %create equation that will be used to calculate a C(t+.1) value in order
    %to compare C(t+.1) and Ct to determine minimum. 
    Ctnext = Cs - ((L0*Kd)/(Ka - Kr))*((exp(-Kr*(t+0.1)))- exp(-Ka*(t+0.1))) - (Cs - C0)*exp(-Ka*(t+0.1));
    
    
    if (anaerobic == true)
        
        %insure that all three "stop" situations are coded for (max
        %duration, anaerobic condition, recovery)
        if ((t <= 10) && (Ct > 0) && (Ct < C0))
            
            %separate counter running 
            k = k + 0.1;
            
            %create equation that will be used to calculate a C(t+1) value in order
            %to compare C(t+1) and Ct to determine minimum. 
            Ct = Cs - ((L0*Kd)/(Ka - Kr))*((exp(-Kr*t))- exp(-Ka*t)) - (Cs - C0)*exp(-Ka*t);
            Ctnext = Cs - ((L0*Kd)/(Ka - Kr))*((exp(-Kr*(t+0.1)))- exp(-Ka*(t+0.1))) - (Cs - C0)*exp(-Ka*(t+0.1));
            disp(Ct)

            
            if (checker == true)
                %create equation that will be used to calculate a C(t+.1) value in order
                %to compare C(k+.1) and Ck to determine minimum. 
                Ck = Cs - ((L0*Kd)/(Ka - Kr))*((exp(-Kr*k))- exp(-Ka*k)) - (Cs - C0)*exp(-Ka*k);
                Cknext = Cs - ((L0*Kd)/(Ka - Kr))*((exp(-Kr*(k+0.1)))- exp(-Ka*(k+0.1))) - (Cs - C0)*exp(-Ka*(k+0.1));
                k = k + 0.1;
                    
                    %figure out if a minimum exists, and if it does, then
                    %stop the counter and use k (after subtracting .2 for
                    %error) to obtain minimum. However, if minimum doesn't
                    %exist, and Ct < 0, then set drop to false which will
                    %output the title of "continues to drop after 10 days"
                    if ((Cknext > Ck) && (k <= 10))
                        checker = false;
                        check = k - 0.1;
                        drop = false;
                        min = Cs - ((L0*Kd)/(Ka - Kr))*((exp(-Kr*check))- exp(-Ka*check)) - (Cs - C0)*exp(-Ka*check);
                    else
                        drop = true;
                    end
            
            end
            
            %plot points along the entire graph
            plot(t, Ct, 'r*')
            disp(t);
            
            %extract important t value
            a = t;
            
            %stop algorithm once it's hit the end of the domain and has not
            %recovered
            if (t == 10) && (Ct<C0)
                anaerobic = false;
                
                %if algorithm doesn't drop past 10 days, then set drop to
                %false and indicate lowest level of oxygen and that full
                %recovery not reached. However, if algorithm continues to
                %drop, output (oxygen level continues to drop after 10.0
                %days"
                if (drop == false)
                        
                        title({['Lowest Oxygen level of ', num2str(min), ' mg/l occurs at ', num2str(check), ' days']; ['Full Recovery not reached after 10 days']})
                else 
                        
                        title('Oxygen level continues to drop after 10.0 days')
                end
                    
            end   
            
        %if Ct hits 0 or crosses zero, then extract "a" value to indicate
        %the anaerobic condition time
        elseif (Ct <= 0)
        
            title(sprintf('anaerobic condition at %.1f \n', a))
            anaerobic = false;
   
        %if Ct is greater than C0, extract "a" value to indicate that a
        %full recovery was made and output min value.
        elseif (Ct > C0)
           
            %stop counters
            anaerobic = false;
            title({['Lowest Oxygen level of ', num2str(min), ' mg/l occurs at ', num2str(check), ' days']; ['Full Recovery reached after ', num2str(a), ' days']})
        end
    end
    
end


hold off;
