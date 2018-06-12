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
## @deftypefn {Function File} {@var{retval} =} InterpolacaoQuadratica (@var{input1}, @var{input2})
## 
## @seealso{}
## @end deftypefn

## Author: Daniel Elias <daniel@danielias-note>
## Created: 2018-04-25
## A: ponto desejado
## pUm: x, dado pelo exercicio
## pDois: y, dado pelo exercicio
## P: dominio

function [retval] = InterpolacaoQuadratica (A, pUm, pDois, P)
    A = [1, pUm(1), pUm(1)^2; 1, pUm(2), pUm(2)^2; 1, pUm(3), pUm(3)^2];
    B = [pDois(1); pDois(2); pDois(3)];
    [A, U, L, Det, Pivot, p] = decomposicaoLU(A);
    y = STI(L, p * B);
    retval = STS(U, y);
    polyout(flip(retval), 'x')
    retval = polyval(flip(retval), P)
endfunction
