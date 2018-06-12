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
## @deftypefn {Function File} {@var{retval} =} InterpolacaoGrauUm (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Daniel Elias <daniel@danielias-note>
## Created: 2018-04-09

## pUm: vetor do primeiro ponto escolhido para interpolacao
## pDois: vetor do segundo ponto escolhido para interpolacao
## x: ponto buscado
function [retVal] = InterpolacaoGrauUm (pUm, pDois, x)
    retVal = pUm(2) + ((pUm(2) - pDois(2)) / (pUm(1) - pDois(1))) * (x - pUm(1));
endfunction
