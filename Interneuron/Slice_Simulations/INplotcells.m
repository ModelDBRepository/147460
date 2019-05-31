
figure
daspect([1 1 1])
axis([0, 3700, 0, 1735])
hold all

set(gca, 'YTick', [233, 576, 808, 1166, 1463, 1631])
set(gca, 'YTickLabel', {'Layer VI', 'Layer V', 'Layer IV', 'Layer III', 'Layer II', 'Layer I'})

line([1 3700], [465, 465], [0 0], 'Color', [205/255, 205/255, 180/255])
line([1 3700], [685, 685], [0 0], 'Color', [205/255, 205/255, 180/255])
line([1 3700], [930, 930], [0 0], 'Color', [205/255, 205/255, 180/255])
line([1 3700], [1400, 1400], [0 0], 'Color', [205/255, 205/255, 180/255])
line([1 3700], [1525, 1525], [0 0], 'Color', [205/255, 205/255, 180/255])

line([150 250], [150, 150], [0 0], 'Color', [205/255, 205/255, 180/255])
line([150 150], [150, 250], [0 0], 'Color', [205/255, 205/255, 180/255])
x1=400;
y1=1200;
plot3(0+x1, 10+y1, 0, 'k.', 'MarkerSize',15)
line([0+x1 15+x1], [20+y1 40+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([15+x1 17+x1], [40+y1 45+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([17+x1 20+x1], [45+y1 55+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([20+x1 23+x1], [55+y1 65+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([23+x1 25+x1], [65+y1 70+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([25+x1 30+x1], [70+y1 95+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([30+x1 60+x1], [95+y1 125+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([60+x1 75+x1], [125+y1 170+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([60+x1 50+x1], [125+y1 140+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([30+x1 75+x1], [95+y1 90+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([75+x1 80+x1], [90+y1 100+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([75+x1 90+x1], [90+y1 80+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([23+x1 105+x1], [65+y1 55+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([105+x1 140+x1], [55+y1 105+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([105+x1 200+x1], [55+y1 30+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([200+x1 200+x1], [30+y1 40+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([200+x1 250+x1], [30+y1 20+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([20+x1 175+x1], [55+y1 70+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([175+x1 200+x1], [70+y1 85+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([200+x1 210+x1], [85+y1 100+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([200+x1 250+x1], [85+y1 95+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([250+x1 420+x1], [95+y1 80+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([175+x1 360+x1], [70+y1 80+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([17+x1 45+x1], [45+y1 35+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([45+x1 150+x1], [35+y1 35+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([45+x1 85+x1], [35+y1 20+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([15+x1 -5+x1], [40+y1 30+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([-5+x1 -175+x1], [30+y1 25+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([-5+x1 -155+x1], [30+y1 45+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([25+x1 -25+x1], [70+y1 80+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([-25+x1 -205+x1], [80+y1 120+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([-25+x1 -30+x1], [80+y1 50+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([-30+x1 -325+x1], [50+y1 25+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([-30+x1 -15+x1], [50+y1 -55+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([-15+x1 25+x1], [-55+y1 -65+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([25+x1 15+x1], [-65+y1 -100+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([-15+x1 0+x1], [-55+y1 -90+y1], [0 0], 'LineWidth',1, 'Color', 'k')
line([25+x1 175+x1], [-65+y1 -40+y1], [0 0], 'LineWidth', 1, 'Color', 'k')
drawnow

x2=1050;
y2=1166;
% figure
% hold on
plot(0+x2, 6+y2, 'k.', 'MarkerSize', 14)
line([0+x2 0+x2], [0+y2 60+y2], [0 0], 'LineWidth', 1, 'Color', 'k')
line([0+x2 0+x2], [60+y2 90+y2], [0 0], 'LineWidth', 1, 'Color', 'k')
line([0+x2 0+x2], [90+y2 190+y2], [0 0], 'LineWidth', 1, 'Color', 'k')
line([0+x2 -130+x2], [90+y2 90+y2], [0 0], 'LineWidth', 1, 'Color', 'k')
line([0+x2 70+x2], [60+y2 50+y2], [0 0], 'LineWidth', 1, 'Color', 'k')
line([70+x2 70+x2], [50+y2 90+y2], [0 0], 'LineWidth', 1, 'Color', 'k')
line([70+x2 70+x2], [90+y2 130+y2], [0 0], 'LineWidth', 1, 'Color', 'k')
line([70+x2 30+x2], [130+y2 170+y2], [0 0], 'LineWidth', 1, 'Color', 'k')
line([70+x2 100+x2], [130+y2 160+y2], [0 0], 'LineWidth', 1, 'Color', 'k')
line([70+x2 180+x2], [90+y2 110+y2], [0 0], 'LineWidth', 1, 'Color', 'k')
line([70+x2 70+x2], [50+y2 -20+y2], [0 0], 'LineWidth', 1, 'Color', 'k')
line([70+x2 70+x2], [-20+y2 -80+y2], [0 0], 'LineWidth', 1, 'Color', 'k')
line([70+x2 70+x2], [-80+y2 -130+y2], [0 0], 'LineWidth', 1, 'Color', 'k')
line([70+x2 180+x2], [-20+y2 -20+y2], [0 0], 'LineWidth', 1, 'Color', 'k')
line([70+x2 0+x2], [-80+y2 -80+y2], [0 0], 'LineWidth', 1, 'Color', 'k')
drawnow

x3=1400;
y3=1463;

plot3(0+x3, 6+y3, 0, 'k.', 'MarkerSize', 11)
line([0+x3 0+x3], [0+y3 -30+y3], [0 0], 'LineWidth', 1, 'Color', 'k')
line([0+x3 -20+x3], [-30+y3 -50+y3], [0 0], 'LineWidth', 1, 'Color', 'k')
line([0+x3 20+x3], [-30+y3 -60+y3], [0 0], 'LineWidth', 1, 'Color', 'k')
line([20+x3 0+x3], [-60+y3 -100+y3], [0 0], 'LineWidth', 1, 'Color', 'k')
line([20+x3 40+x3], [-60+y3 -90+y3], [0 0], 'LineWidth', 1, 'Color', 'k')
line([-20+x3 -30+x3], [-50+y3 -50+y3], [0 0], 'LineWidth', 1, 'Color', 'k')
line([-30+x3 -50+x3], [-50+y3 -50+y3], [0 0], 'LineWidth', 1, 'Color', 'k')
line([40+x3 50+x3], [-90+y3 -90+y3], [0 0], 'LineWidth', 1, 'Color', 'k')
line([50+x3 60+x3], [-90+y3 -90+y3], [0 0], 'LineWidth', 1, 'Color', 'k')
line([60+x3 70+x3], [-90+y3 -90+y3], [0 0], 'LineWidth', 1, 'Color', 'k')
line([-50+x3 -50+x3], [-50+y3 -650+y3], [0 0], 'LineWidth', 1, 'Color', 'k')
line([-30+x3 -40+x3], [-50+y3 -200+y3], [0 0], 'LineWidth', 1, 'Color', 'k')
line([-20+x3 -10+x3], [-50+y3 -720+y3], [0 0], 'LineWidth', 1, 'Color', 'k')
line([0+x3 -10+x3], [-100+y3 -500+y3], [0 0], 'LineWidth', 1, 'Color', 'k')
line([0+x3 0+x3], [-100+y3 -670+y3], [0 0], 'LineWidth', 1, 'Color', 'k')
line([0+x3 20+x3], [-100+y3 -340+y3], [0 0], 'LineWidth', 1, 'Color', 'k')
line([50+x3 50+x3], [-90+y3 -150+y3], [0 0], 'LineWidth', 1, 'Color', 'k')
line([60+x3 70+x3], [-90+y3 -690+y3], [0 0], 'LineWidth', 1, 'Color', 'k')
line([70+x3 80+x3], [-90+y3 -430+y3], [0 0], 'LineWidth', 1, 'Color', 'k')







x4=1700;
y4=1166;

plot(0+x4, 5+y4,  'k.', 'MarkerSize', 11)

line([0+x4 0+x4], [10+y4 20+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%0
line([0+x4 20+x4], [20+y4 40+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%1
line([20+x4 0+x4], [40+y4 90+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%2
line([0+x4 10+x4], [90+y4 170+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%3
line([10+x4 40+x4], [170+y4 300+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%4
line([20+x4 20+x4], [40+y4 20+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%5
line([20+x4 15+x4], [20+y4 -30+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%6
line([15+x4 10+x4], [-30+y4 -60+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%7
line([10+x4 0+x4], [-60+y4 -90+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%8
line([0+x4 -20+x4], [-110+y4 -170+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%9
line([-20+x4 -20+x4], [-170+y4 -250+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%10
line([-20+x4 -30+x4], [-250+y4 -310+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%11
line([-20+x4 -30+x4], [-250+y4 -255+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%12
line([0+x4 -30+x4], [-90+y4 -90+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%13
line([-30+x4 -50+x4], [-90+y4 -120+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%14
line([-50+x4 -90+x4], [-120+y4 -120+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%15
line([-90+x4 -110+x4], [-120+y4 -180+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%16
line([-50+x4 -70+x4], [-120+y4 -200+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%17
line([15+x4 -40+x4], [-30+y4 -60+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%18
line([-40+x4 -50+x4], [-60+y4 -70+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%19
line([-40+x4 -20+x4], [-60+y4 -80+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%20
line([15+x4 -10+x4], [-30+y4 -20+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%21
line([-10+x4 -30+x4], [-20+y4 0+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%22
line([0+x4 -20+x4], [90+y4 110+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%23
line([-20+x4 -40+x4], [110+y4 170+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%24
line([10+x4 40+x4], [170+y4 170+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%25
line([20+x4 40+x4], [40+y4 110+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%26
line([20+x4 60+x4], [20+y4 20+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%27
line([60+x4 70+x4], [20+y4 50+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%28
line([70+x4 90+x4], [50+y4 80+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%29
line([60+x4 80+x4], [20+y4 20+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%30
line([80+x4 90+x4], [20+y4 0+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%31
line([70+x4 100+x4], [50+y4 50+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%32
line([10+x4 30+x4], [-60+y4 -60+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%33
line([30+x4 50+x4], [-60+y4 -40+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%34
line([50+x4 70+x4], [-40+y4 -30+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%35
line([0+x4 40+x4], [-110+y4 -110+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%36
line([40+x4 60+x4], [-110+y4 -90+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%37
line([0+x4 0+x4], [-90+y4 -110+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%38
line([-20+x4 0+x4], [-170+y4 -175+y4], [0 0], 'LineWidth', 1, 'Color', 'k')%39



x5=2000;
y5=808;

plot3(0+x5, 5+y5, 0, 'k.', 'MarkerSize', 11)

line([0+x5 20+x5], [0+y5 -30+y5], [0 0], 'LineWidth', 1, 'Color', 'k')
line([20+x5 30+x5], [-30+y5 -60+y5], [0 0], 'LineWidth', 1, 'Color', 'k')
line([30+x5 40+x5], [-60+y5 -90+y5], [0 0], 'LineWidth', 1, 'Color', 'k')
line([30+x5 -40+x5], [-60+y5 -130+y5], [0 0], 'LineWidth', 1, 'Color', 'k')
line([30+x5 80+x5], [-60+y5 -40+y5], [0 0], 'LineWidth', 1, 'Color', 'k')
line([80+x5 100+x5], [-40+y5 30+y5], [0 0], 'LineWidth', 1, 'Color', 'k')
line([80+x5 110+x5], [-40+y5 -20+y5], [0 0], 'LineWidth', 1, 'Color', 'k')
line([20+x5 40+x5], [-30+y5 -40+y5], [0 0], 'LineWidth', 1, 'Color', 'k')
line([40+x5 110+x5], [-40+y5 -140+y5], [0 0], 'LineWidth', 1, 'Color', 'k')
line([40+x5 50+x5], [-40+y5 20+y5], [0 0], 'LineWidth', 1, 'Color', 'k')
line([50+x5 0+x5], [20+y5 80+y5], [0 0], 'LineWidth', 1, 'Color', 'k')
line([50+x5 60+x5], [20+y5 40+y5], [0 0], 'LineWidth', 1, 'Color', 'k')
line([60+x5 140+x5], [40+y5 -30+y5], [0 0], 'LineWidth', 1, 'Color', 'k')
line([60+x5 140+x5], [40+y5 60+y5], [0 0], 'LineWidth', 1, 'Color', 'k')
line([60+x5 80+x5], [40+y5 110+y5], [0 0], 'LineWidth', 1, 'Color', 'k')
line([20+x5 -10+x5], [-30+y5 -20+y5], [0 0], 'LineWidth', 1, 'Color', 'k')
line([-10+x5 20+x5], [-20+y5 -100+y5], [0 0], 'LineWidth', 1, 'Color', 'k')
line([-10+x5 -40+x5], [-20+y5 -20+y5], [0 0], 'LineWidth', 1, 'Color', 'k')
line([-40+x5 -10+x5], [-20+y5 30+y5], [0 0], 'LineWidth', 1, 'Color', 'k')
line([-10+x5 -50+x5], [30+y5 80+y5], [0 0], 'LineWidth', 1, 'Color', 'k')
line([-10+x5 40+x5], [30+y5 100+y5], [0 0], 'LineWidth', 1, 'Color', 'k')
line([40+x5 10+x5], [100+y5 160+y5], [0 0], 'LineWidth', 1, 'Color', 'k')
line([-40+x5 -60+x5], [-20+y5 -10+y5], [0 0], 'LineWidth', 1, 'Color', 'k')
line([-60+x5 -110+x5], [-10+y5 -50+y5], [0 0], 'LineWidth', 1, 'Color', 'k')
line([-110+x5 -140+x5], [-50+y5 -80+y5], [0 0], 'LineWidth', 1, 'Color', 'k')
line([-110+x5 -60+x5], [-50+y5 -140+y5], [0 0], 'LineWidth', 1, 'Color', 'k')
line([-40+x5 -70+x5], [-20+y5 20+y5], [0 0], 'LineWidth', 1, 'Color', 'k')
line([-70+x5 -110+x5], [20+y5 50+y5], [0 0], 'LineWidth', 1, 'Color', 'k')
line([-70+x5 -40+x5], [20+y5 130+y5], [0 0], 'LineWidth', 1, 'Color', 'k')
line([-40+x5 -30+x5], [130+y5 150+y5], [0 0], 'LineWidth', 1, 'Color', 'k')
line([-40+x5 40+x5], [130+y5 140+y5], [0 0], 'LineWidth', 1, 'Color', 'k')





x6=2820;
y6=1463;

plot3(0+x6, 0+y6, 0, 'k.', 'MarkerSize', 11)

line([0+x6 30+x6], [0+y6 -30+y6], [0 0], 'LineWidth', 1, 'Color', 'k')%0
line([30+x6 30+x6], [-30+y6 -40+y6], [0 0], 'LineWidth', 1, 'Color', 'k')%1
line([30+x6 20+x6], [-40+y6 -60+y6], [0 0], 'LineWidth', 1, 'Color', 'k')%2
line([20+x6 20+x6], [-60+y6 -70+y6], [0 0], 'LineWidth', 1, 'Color', 'k')%3
line([20+x6 30+x6], [-70+y6 -110+y6], [0 0], 'LineWidth', 1, 'Color', 'k')%4
line([30+x6 40+x6], [-110+y6 -120+y6], [0 0], 'LineWidth', 1, 'Color', 'k')%5
line([30+x6 -10+x6], [-30+y6 60+y6], [0 0], 'LineWidth', 1, 'Color', 'k')%6
line([-10+x6 -70+x6], [60+y6 90+y6], [0 0], 'LineWidth', 1, 'Color', 'k')%7
line([-70+x6 -50+x6], [90+y6 110+y6], [0 0], 'LineWidth', 1, 'Color', 'k')%8
line([-50+x6 -80+x6], [110+y6 120+y6], [0 0], 'LineWidth', 1, 'Color', 'k')%9
line([-80+x6 -400+x6], [120+y6 130+y6], [0 0], 'LineWidth', 1, 'Color', 'k')%10
line([-50+x6 150+x6], [110+y6 70+y6], [0 0], 'LineWidth', 1, 'Color', 'k')%11
line([150+x6 230+x6], [70+y6 110+y6], [0 0], 'LineWidth', 1, 'Color', 'k')%12
line([30+x6 70+x6], [-40+y6 -20+y6], [0 0], 'LineWidth', 1, 'Color', 'k')%13
line([70+x6 60+x6], [-20+y6 10+y6], [0 0], 'LineWidth', 1, 'Color', 'k')%14
line([60+x6 40+x6], [10+y6 40+y6], [0 0], 'LineWidth', 1, 'Color', 'k')%15
line([60+x6 200+x6], [10+y6 20+y6], [0 0], 'LineWidth', 1, 'Color', 'k')%16
line([30+x6 150+x6], [-40+y6 -60+y6], [0 0], 'LineWidth', 1, 'Color', 'k')%17
line([20+x6 310+x6], [-70+y6 -80+y6], [0 0], 'LineWidth', 1, 'Color', 'k')%18
line([30+x6 -40+x6], [-110+y6 -120+y6], [0 0], 'LineWidth', 1, 'Color', 'k')%19
line([-40+x6 -90+x6], [-120+y6 -80+y6], [0 0], 'LineWidth', 1, 'Color', 'k')%20
line([-90+x6 -180+x6], [-80+y6 -100+y6], [0 0], 'LineWidth', 1, 'Color', 'k')%21
line([20+x6 -20+x6], [-60+y6 -40+y6], [0 0], 'LineWidth', 1, 'Color', 'k')%22
line([-20+x6 -470+x6], [-40+y6 -60+y6], [0 0], 'LineWidth', 1, 'Color', 'k')%23
line([-20+x6 -120+x6], [-40+y6 -30+y6], [0 0], 'LineWidth', 1, 'Color', 'k')%24
line([-120+x6 -200+x6], [-30+y6 -40+y6], [0 0], 'LineWidth', 1, 'Color', 'k')%25
line([-390+x6 -570+x6], [-10+y6 10+y6], [0 0], 'LineWidth', 1, 'Color', 'k')%26
line([30+x6 -60+x6], [-40+y6 -30+y6], [0 0], 'LineWidth', 1, 'Color', 'k')%27
line([-60+x6 -390+x6], [-30+y6 -10+y6], [0 0], 'LineWidth', 1, 'Color', 'k')%28
line([-200+x6 -310+x6], [-40+y6 -20+y6], [0 0], 'LineWidth', 1, 'Color', 'k')%29


x7=3280;
y7=808;

plot3(0+x7, 6+y7, 0, 'k.', 'MarkerSize', 11)
line([0+x7 0+x7], [0+y7 -30+y7], [0 0], 'LineWidth', 1, 'Color', 'k')
line([0+x7 20+x7], [-30+y7 -60+y7], [0 0], 'LineWidth', 1, 'Color', 'k')
line([20+x7 30+x7], [-60+y7 -80+y7], [0 0], 'LineWidth', 1, 'Color', 'k')
line([30+x7 70+x7], [-80+y7 -90+y7], [0 0], 'LineWidth', 1, 'Color', 'k')
line([30+x7 10+x7], [-80+y7 -110+y7], [0 0], 'LineWidth', 1, 'Color', 'k')
line([0+x7 -20+x7], [-30+y7 -50+y7], [0 0], 'LineWidth', 1, 'Color', 'k')
line([-20+x7 -50+x7], [-50+y7 -30+y7], [0 0], 'LineWidth', 1, 'Color', 'k')
line([-50+x7 -50+x7], [-30+y7 50+y7], [0 0], 'LineWidth', 1, 'Color', 'k')
line([-50+x7 -20+x7], [50+y7 210+y7], [0 0], 'LineWidth', 1, 'Color', 'k')
line([0+x7 20+x7], [-30+y7 50+y7], [0 0], 'LineWidth', 1, 'Color', 'k')
line([20+x7 10+x7], [50+y7 240+y7], [0 0], 'LineWidth', 1, 'Color', 'k')
line([10+x7 -40+x7], [240+y7 300+y7], [0 0], 'LineWidth', 1, 'Color', 'k')
line([-40+x7 -60+x7], [300+y7 320+y7], [0 0], 'LineWidth', 1, 'Color', 'k')
line([-40+x7 -10+x7], [300+y7 320+y7], [0 0], 'LineWidth', 1, 'Color', 'k')
line([10+x7 0+x7], [240+y7 260+y7], [0 0], 'LineWidth', 1, 'Color', 'k')
line([20+x7 60+x7], [50+y7 280+y7], [0 0], 'LineWidth', 1, 'Color', 'k')
line([60+x7 100+x7], [280+y7 300+y7], [0 0], 'LineWidth', 1, 'Color', 'k')
line([100+x7 140+x7], [300+y7 260+y7], [0 0], 'LineWidth', 1, 'Color', 'k')
line([0+x7 50+x7], [-30+y7 -50+y7], [0 0], 'LineWidth', 1, 'Color', 'k')
line([50+x7 90+x7], [-50+y7 -20+y7], [0 0], 'LineWidth', 1, 'Color', 'k')
line([90+x7 110+x7], [-20+y7 100+y7], [0 0], 'LineWidth', 1, 'Color', 'k')
line([110+x7 80+x7], [100+y7 270+y7], [0 0], 'LineWidth', 1, 'Color', 'k')
line([80+x7 50+x7], [270+y7 300+y7], [0 0], 'LineWidth', 1, 'Color', 'k')
line([80+x7 100+x7], [270+y7 280+y7], [0 0], 'LineWidth', 1, 'Color', 'k')
line([100+x7 120+x7], [280+y7 340+y7], [0 0], 'LineWidth', 1, 'Color', 'k')




x8=3600;
y8=233;

line([-20+x8 20+x8], [0+y8 0+y8], [0 0], 'LineWidth', 2, 'Color', 'k')

line([0+x8 10+x8], [0+y8 -15+y8], [0 0], 'LineWidth', 1, 'Color', 'k')
line([10+x8 0+x8], [-15+y8 -20+y8], [0 0], 'LineWidth', 1, 'Color', 'k')
line([0+x8 -5+x8], [-20+y8 -10+y8], [0 0], 'LineWidth', 1, 'Color', 'k')
line([0+x8 -20+x8], [-20+y8 -40+y8], [0 0], 'LineWidth', 1, 'Color', 'k')
line([-20+x8 -25+x8], [-40+y8 -35+y8], [0 0], 'LineWidth', 1, 'Color', 'k')
line([-25+x8 -40+x8], [-35+y8 -45+y8], [0 0], 'LineWidth', 1, 'Color', 'k')
line([-40+x8 -90+x8], [-45+y8 -35+y8], [0 0], 'LineWidth', 1, 'Color', 'k')
line([-40+x8 -50+x8], [-45+y8 -55+y8], [0 0], 'LineWidth', 1, 'Color', 'k')
line([-50+x8 50+x8], [-55+y8 -75+y8], [0 0], 'LineWidth', 1, 'Color', 'k')
line([-20+x8 -35+x8], [-40+y8 -90+y8], [0 0], 'LineWidth', 1, 'Color', 'k')
line([-35+x8 40+x8], [-90+y8 -100+y8], [0 0], 'LineWidth', 1, 'Color', 'k')
line([-35+x8 -60+x8], [-90+y8 -120+y8], [0 0], 'LineWidth', 1, 'Color', 'k')
line([-60+x8 -100+x8], [-120+y8 -115+y8], [0 0], 'LineWidth', 1, 'Color', 'k')
line([-60+x8 -85+x8], [-120+y8 -145+y8], [0 0], 'LineWidth', 1, 'Color', 'k')



