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
## @deftypefn {} {@var{retval} =} Questao03 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Daniel Elias <daniel@danielias-note>
## Created: 2018-06-24

function [] = Questao03A ()
    #dados
    vetorX = [183 173 168 188 158 163 193 163 178]; # altura dos funcionarios em cm
    vetorY = [79 69 70 81 61 63 79 71 73]; # peso dos funcionarios em kg
    
    #plot do diagrama de dispersao
    plot(vetorX, vetorY, 'bo'), grid on;
    legend ("Peso em funcao da altura");
    xlabel('Altura (em centímetros)')
    ylabel('Peso (em quilos)')
    title('Diagrama de dispersão: peso em função da altura')
endfunction
