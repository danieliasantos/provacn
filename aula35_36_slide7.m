## Lagrange vs funcao conhecida

xx=[1 : 0.1 : 3.5];
y=[.6942 1.1759 8.0855 11.0925];
z=[1.5 2.5 3.1];
w=[1.8 2.3 2.7 3.1];
x=[1.1 1.9 3.0 3.2];
n=size(xx,2);
m=size(z,2);
plot(xx, e.^xx - xx.^2 - xx)
hold on;
plot(x, y, 'o')
hold on;
for i = 1 : n
    v(i) = InterpolacaoLagrange(x, y, xx(i));
endfor
plot(xx, v, 'r--')