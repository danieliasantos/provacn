% Objetivo: resolver o sistema triangular superior Ux = d pelas substituicoes
% retroativas
% entrada: U, d = matriz triangular superior e vetor independente
% n calculado na funcao
function [x] = sr(U, d)
  n = size(U, 1);
  x(n) = d(n) / U(n, n);
  for (i = n - 1 : -1 : 1)
    soma = 0;
    for (j = i + 1 : 1 : n)
      soma = soma + U(i, j) * x(j);
    end
    x(i) = (d(i) - soma) / U(i, i);
  end
 end