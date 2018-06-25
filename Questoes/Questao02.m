function [ ] = Questao2()
  x = [   0,   6,  10,  13,  17,  20,  28 ];
  y1 = [   6.6700,  17.3300,  42.6700,  37.3300,  30.1000,  29.3100,  28.7400 ];
  y2 = [   6.6700,  16.1100,  18.8900,  15.0000,  10.5600,   9.4400,   8.8900 ];
  a = [0:.01:28];
  
  n = size(a,2);
  for i=1:n
    curva1(i) = InterpolacaoLagrange(x,y1,a(i));
  endfor
  
  plot(a,curva1,'r'); hold on
  min1 = min(curva1)
  max1 = max(curva1)
  
  for i=1:n
    curva2(i) = InterpolacaoLagrange(x,y2,a(i));
  endfor
  
  plot(a,curva2,'b');
  min2 = min(curva2)
  max2 = max(curva2)
  
  
  xlabel('Tempo em dias');
  ylabel('Peso medio em mg');
  title('Grafico de relacao entre folhas de carvalho e peso de larvas');
  legend("Amostra 1","Amostra 2");
  
  
  
endfunction
