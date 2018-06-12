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
## @deftypefn {Function File} {@var{g} =} graficoLNGN (@var{x}, @var{y}, @var{z})
##
## @seealso{}
## @end deftypefn

## Author: Daniel Elias <daniel@danielias-note>
## Created: 2018-05-07

## plotagem do grafico de comparacao da InterpolacaoLagrange, InterpolacaoNewton
## e InterpolacaoGregoryNewton

## x: abscissas, y: ordenadas, z: dominio para plotar

function [g] = graficoLNGN (x, y, z)
    m = size(z, 2);
    for i = 1 : m
        ## ImgL = imagem da InterpolacaoLagrange
        ImgL(i) = InterpolacaoLagrange(x, y, z(i));
        ## ImgN = imagem do PolinomioNewton
        ImgN(i) = PolinomioNewton(x, y, z(i));
        ## ImgGN = imagem do PolinomioGregoryNewton
        ImgGN(i) = PolinomioGregoryNewton(x, y, z(i));
    endfor
    plot(z, ImgL, 'r--'); hold on;
    plot(z, ImgN, 'y'); hold on;
    plot(z, ImgGN, 'g'); hold on;
endfunction
