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
## @deftypefn {} {@var{retval} =} plotGraficoDispersao (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Daniel Elias <daniel@danielias-note>
## Created: 2018-05-23

## plot do grafico da aula 39-40, slide 10/44
function [retval] = plotGraficoDispersao ()
    x = [0.3 2.7 4.5 5.9 7.8];
    y = [1.8 1.9 3.1 3.9 3.3];
    plot(x, y, 'bo'), hold on;
    xlabel('variavel explicativa x')
    ylabel('variavel proposta y')
    title('Diagrama de dispersao')
endfunction
