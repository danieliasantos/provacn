% Algoritmo para a tecnica Eliminacao de Gauss
function [A, b, Ab] = eg(A, b)
  Ab = [A b];
  n = size(A, 1);
  for j = 1 : n - 1
    for i = j : n - 1
      Ab(i + 1, :) = -(Ab(i + 1, j) / Ab(j, j)) * Ab(j, :) + Ab(i + 1, :);
    end
  end
  b = Ab(:, size(Ab, 2));
  A = Ab;
  A(:, size(A, 2)) = [];
end