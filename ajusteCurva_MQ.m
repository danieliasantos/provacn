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
## @deftypefn {} {@var{retval} =} MinimosQuadrados (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Daniel Elias <daniel@danielias-note>
## Created: 2018-06-04

## Ajuste de Curva pelo método dde Mínimos Quadrados

function [retval] = ajusteCurva_MQ ()#(vetorX, vetorY)
    ## vetorX = [0.3 2.7 4.5 5.9 7.8];
    ## vetorY = [1.8 1.9 3.1 3.9 3.3];
    ## saidas:
    ## b0 =  1.6559
    ## b1 =  0.26983
    n = size(vetorX, 2);
    b1 = (sum(vetorX) * sum(vetorY) - n .* sum(vetorX .* vetorY)) / (sum(vetorX) ^ 2 - n * sum(vetorX .^ 2));
    b0 = (sum(vetorY) - b1 * sum(vetorX)) / n;
    b0
    b1
    vetorZ = b0 + b1 * vetorX;
    erro = sum((vetorZ - vetorY) .^ 2);
    plot(vetorX, vetorY, 'bo'), hold on;
    plot(vetorX, vetorZ, 'k-');
endfunction
