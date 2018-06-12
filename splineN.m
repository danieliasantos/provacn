## Copyright (C) 2018 Daniel Elias
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} algoritmoSpline (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Daniel Elias <daniel@danielias-note>
## Created: 2018-05-14

function [s2, CondErro] = splineN (x, y)
    ## x = [1 2 4 6 7]; -> base de teste de x
    ## y = [2 4 1 3 3]; -> base de teste de y
    ## apos todo o processamento com essa base, a saida deve ser 
    ## s = [0.00000  -4.70000   3.60000  -2.20000   0.00000]
    if (size(x, 2) < 3)
        CondErro = 1;
        return;
    endif;
    CondErro = 0;
    h = x(2: end) - x(1 : end - 1); # calculo do vetor h
    ## calculo da diferenca dividida (delta estranho)
    d = (y(2 : end) - y(1 : end - 1)) ./ h(1 : end);
    ## b do Ax=b
    b = (d(2 : end) - d(1 : end - 1)) .* 6;
    ## calculo da matriz A
    v = 2 .* (h(1 : end - 1) + h(2 : end)); # vetor que representa a diagonal principal da matriz A
    A = diag(v); # matriz A inicialmente diagonal, cuja diagonal eh v
    A1 = diag(h(2 : end - 1), 1); # matriz com diagonal acima da diagonal superior
    A2 = diag(h(2 : end - 1), -1); # matriz com diagonal abaixo da diagonal superior
    A = A + A1 + A2; # matriz resultante
    ## eliminacao de gauss
    Ab = [A b'];
    n = size(A, 1);
    for j = 1 : n - 1
        for i = j : n - 1
            Ab(i + 1, :) = -(Ab(i + 1, j) / Ab(j, j)) * Ab(j, :) + Ab(i + 1, :);
        endfor
    endfor
    b = Ab(:, size(Ab, 2));
    A = Ab;
    A(:, size(A, 2)) = [];
    ## substituicao retroativa
    v(n) = b(n) / A(n, n); ## v = vetor temporario para a saida s2, derivada segunda
    for (i = n - 1 : -1 : 1)
        soma = 0;
        for (j = i + 1 : 1 : n)
            soma = soma + A(i, j) * v(j);
        endfor
        v(i) = (b(i) - soma) / A(i, i);
    endfor
    s2 = zeros(1, size(x, 2));
    s2(2 : end - 1) = v;
endfunction

    ## versao do algoritmo que utiliza estrutura de repeticao
    ## x = [1 2 4 6 7];
    ## y = [2 4 1 3 3];
    ## n = size(x, 2);
    ## for i = 1 : n - 1
        ## h(i) = x(i + 1) - x(i);
        ## d = simbolo estranho da diferenca dividida
        ## d(i) = (y(i + 1) - y(i)) / h(i);
    ## endfor
    ## A = zeros(n - 2);
    ## for j = 1 : n - 2
        ## if(j == 1)
            ## A(j, j) = 2 * (h(j) + h(j + 1));
            ## A(j, (j + 1)) = h(j + 1);
        ## elseif (j == (n - 2))
            ## A(j, (j - 1)) = h(j);
            ## A(j, j) = 2 * (h(j) + h(j + 1));
        ## else
            ## A(j, (j - 1)) = h(j);
            ## A(j, j) = 2 * (h(j) + h(j + 1));
            ## A(j, (j + 1)) = h(j + 1);
        ## endif
    ## endfor