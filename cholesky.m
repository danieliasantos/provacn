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
## @deftypefn {Function File} {@var{retval} =} cholesky (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Daniel Elias <daniel@danielias-note>
## Created: 2018-04-06

## Objetivo:    fazer decomposicao LL^T de uma matriz A
##              simetrica e definida positiva
## Entrada:     A{matriz a ser decomposta}
## Saida:       A, Det, CondErro
##{fator L escrito sobre A, determinante e cond. de erro}

function [A, Det, CondErro] = cholesky (A)
    n = size(A);
    CondErro = 0;
    Det = 1;
    for j = 1 : n
        Soma = 0;
        for k = 1 : j - 1
            Soma = Soma + A(j, k) ^ 2;
        endfor
        t = A(j, j) - Soma;
        if t > 0
            A(j, j) = sqrt(t);
            r = 1 / A(j, j);
            Det = Det * t;
        else
            CondErro = 1;
            disp('A matriz nao eh definida positiva');
            break
        endif
        for i = j + 1 : n
            Soma = 0;
            for k = 1 : j - 1
                Soma = Soma + A(i, k) * A(j, k);
            endfor
            A(i, j) = (A(i, j) - Soma) * r;
        endfor
    endfor    
endfunction