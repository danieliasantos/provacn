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
## @deftypefn {Function File} {@var{retval} =} InterpolacaoLagrange (@var{input1}, @var{input2}, @var{input3})
##
## @seealso{}
## @end deftypefn

## Author: Daniel Elias <daniel@danielias-note>
## Created: 2018-04-25
## a: valor a ser interpolado
## X: vetor de pontos de x
## Y: vetor de pontos de y
## n: quantidade de pontos fornecidos (ordem do polinomio)
########### entrada de teste ###########
## a = 0.2
## X = [0.1, 0.6, 0.8]
## Y = [1.221, 3.320, 4.953]
## somatorio deve retornar o valor 1.4141

function [somatorio] = InterpolacaoLagrange (X, Y, a)
    n = size(X, 2); #size retorna [linha coluna]. 2 para pegar coluna
    somatorio = 0;
    for i = 1 : n
        produtorio = 1;
        for j = 1 : n
            if( i != j)
                produtorio = produtorio .* (a - X(j)) / (X(i) - X(j));
            endif
        endfor
        somatorio = somatorio + Y(i) * produtorio;
    endfor   
endfunction
