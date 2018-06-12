%Algoritmo de substituicoes sucessivas: "ss"
%n = ordem da matriz -> calculado dentro da funcao
%L = matriz
%c = vetor independente
%Objetivo: resolver o sistema linear triangular inferior Lx = c pelas 
%substituicoes sucessivas
function [x] = ss(L, c)
n = size(L, 1);
x(1) = c(1) / L(1, 1);
for(i = 2 : 1 : n)
  soma = 0;
  for(j = 1 : 1 : i - 1)
    soma = soma + L(i, j) * x(j);
  end
  x(i) = (c(i) - soma) / L(i, i);
end