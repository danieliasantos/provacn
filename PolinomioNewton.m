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
## @deftypefn {Function File} {@var{retval} =} PolinomioNewton (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Daniel Elias <daniel@danielias-note>
## Created: 2018-05-07

## Objetivo: Interpolar valor em tabela usando polinomio de Newton

function [r] = PolinomioNewton (x, y, z)
## m: numero de pontos, x: abscissas, y: ordenadas,
## z: valor a interpolar, r: saida - valor interpolado
    m = size(x, 2);
    for i = 1 : m
        Dely(i) = y(i);
    endfor
    ## construcao das diferencas divididas
    for k = 1 : (m - 1)
        for i = m : -1 : (k + 1)
            Dely(i) = (Dely(i) - Dely(i - 1)) / (x(i) - x(i - k));
        endfor
        ## avaliacao do polinomio pelo processo de Horner
        r = Dely(m);
        for i = (m - 1) : -1 : 1
            r = r * (z - x(i)) + Dely(i);
        endfor
    endfor
endfunction
