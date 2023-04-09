syms t;
c1 = polyfit([0,10],[0,120],1);
c2 = polyfit([10,20],[120,120],1);
c3 = polyfit([20,30],[120,60],1);
c4 = polyfit([30,40],[60,60],1);
c5 = polyfit([40,50],[60,120],1);
c6 = polyfit([50,60],[120,120],1);
c7 = polyfit([60,70],[120,0],1);

i1 = c1(1) * t + c1(2);
i2 = c2(1) * t + c2(2);
i3 = c3(1) * t + c3(2);
i4 = c4(1) * t + c4(2);
i5 = c5(1) * t + c5(2);
i6 = c6(1) * t + c6(2);
i7 = c7(1) * t + c7(2);

i = piecewise(0 <= t < 10, i1,...
    10 <= t < 20, i2,...
    20 <= t < 30, i3,...
    30 <= t < 40, i4,...
    40 <= t < 50, i5,...
    50 <= t < 60, i6,...
    60 <= t < 70, i7);

figure;
fplot(t,i, [0 70])
title("Inductor current[i] vs time [msec]");
xlabel("time [msec]");
ylabel("current [mA]");
axis([0 70 0 125])

L = .003;
v1 = L * diff(i1);
v2 = L * diff(i2);
v3 = L * diff(i3);
v4 = L * diff(i4);
v5 = L * diff(i5);
v6 = L * diff(i6);
v7 = L * diff(i7);

v = piecewise(0 <= t < 10, v1,...
    10 <= t < 20, v2,...
    20 <= t < 30, v3,...
    30 <= t < 40, v4,...
    40 <= t < 50, v5,...
    50 <= t < 60, v6,...
    60 <= t < 70, v7);

figure;
fplot(t,v,[0 70]);
title("Inductor voltage [V] vs time [msec]");
xlabel("time [msec]");
ylabel("Voltage [V]");