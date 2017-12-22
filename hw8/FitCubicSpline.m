function FitCubSpline(K)
urlwrite('https://content.sakai.rutgers.edu/access/content/attachment/b21f6468-4f90-4fd2-9ed6-0f4132b8d0cd/Assignments/eb3ff940-d876-490d-a58e-003fde1daa0b/SAheart.data', 'SAheart.data');
data = feval('load', 'SAheart.data');
data
data = data(:,[2:5 7:10]);
s = randsample(8,2);
x = data(:,s(1));
y = data(:,s(2));
names = {'sbp','tobacco','ldl','adiposity','famhist','obesity','alcohol','age'};