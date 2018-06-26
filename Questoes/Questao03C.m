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

function [] = Questao03C ()
    #dados
    vetorX = [173 178 183]; # altura dos funcionarios em cm
    vetorY = [69 73 79]; # peso dos funcionarios em kg
    
    # estimativa de peso para altura de 175cm, usando interpolacao cubica
    a = 175
    fA = interp1(vetorX, vetorY, a, 'cubic')
    
    #dados
    vetorX = [73 79 81]; # altura dos funcionarios em cm
    vetorY = [178 193 188]; # peso dos funcionarios em kg
    
    # estimativa de altura para peso de 80kg, usando interpolacao cubica
    p = 80
    fP = interp1(vetorX, vetorY, p, 'cubic')
    
endfunction
