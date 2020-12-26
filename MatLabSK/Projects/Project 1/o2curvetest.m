L0 = 30;
Cs = 8;
C0 = 7;
Kr = 0.35;
Kd = 0.35;
Ka = 0.8;
t = 0.2;

figure;
axis([0 10 0 15]);
hold on; 
xlabel('Time (Days)', 'FontSize',12)
ylabel('Dissolved Oxygen (mg/L)', 'FontSize',12)
plot (0, C0, 'r*');


for t = 0:0.2:50
    Ct = Cs - ((L0*Kd)/(Ka - Kr))*((exp(-Kr*t))- exp(-Ka*t)) - (Cs - C0)*exp(-Ka*t);

    if (t <= 10) 
        if (Ct > 0) 
            if (Ct <= 0)
        plot(t, Ct, 'r*')
        disp(Ct)
            else
                title(sprintf('Full Recovery %.1d days after pollution', t))
            end
        else
            title(sprintf('anaerobic condition at %.1d', t))
        end
    else
        title(sprintf('Full Recovery not reached after 10 days \n'))
    end
end


hold off;
