%http://analisisnumericos.blogspot.com.br/2011/11/trazadores-cubicos-spline-dibujando.html
%Desenhando o Snoopy, 2011
z=[1 2 5 6 7 8 10 13 17 ; 3 3.7 3.9 4.2 5.7 6.6 7.1 6.7 4.5];
[a,b,c,d]=spline3(z); 
hold on; 
z=[17 20 23 24 25 27 27.7 ; 4.5 7 6.1 5.6 5.8 5.2 4.1];
[a,b,c,d]=spline3(z); 
hold on;
z=[27.7 28 29 30 ; 4.1 4.3 4.1 3];
[a,b,c,d]=spline3(z); 
hold on;
z=[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 ; 3 2.5 2.5 2.5 2.5 2.5 2.5 2.5 2.3 2.5 2.5 2.5 2.5 2.5 2.5 2.5 2.8];
[a,b,c,d]=spline3(z); 
hold on;
z=[17 18 19 20 21 22 23 23.5 24 25 26 27 28 ; 2.8 2.5 2.5 2.5 2.5 2.5 2.5 2.3 2.5 2.5 2.5 2.5 2.8];
[a,b,c,d]=spline3(z); 
hold on;z=[28 29 30 ; 2.8 2.5 3];
[a,b,c,d]=spline3(z); 
hold on;
