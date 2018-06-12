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
## @deftypefn {Function File} {@var{retval} =} splineA (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Daniel Elias <daniel@danielias-note>
## Created: 2018-05-16

function [sz, CondErro, aux] = splineA (x, y, z)
    [s2, CondErro] = splineN(x, y);
    if (CondErro != 0)
        return;
    endif
    n = size(x, 2); #quantidade de pontos de x
    m = size(z, 2); #quantidade de pontos a serem interpolados
    CondErro = 0;
    aux = [];
    for j = 1 : m
        if (z(j) >= x(1) && z(j) <= x(n))
            inf = 1;
            sup = n;
            while((sup - inf) > 1)
                ind = round((inf + sup) / 2);
                if (x(ind) > z(j))
                    sup = ind;
                else
                    inf = ind;
                endif
            endwhile
            h = x(sup) - x(inf);
            a = (s2(sup) - s2(inf)) / (6 * h);
            b = s2(inf) * .5;
            c = (y(sup) - y(inf)) / h - (s2(sup) + 2 * s2(inf)) * h / 6;
            d = y(inf);
            h = z(j) - x(inf);
            sz(j) = ((a * h + b) * h + c) * h + d;
            aux = [aux; (inf - 1), a, b, c, d, z(j), sz(j)];
        else
            sz(j) = 0;
            CondErro = CondErro + 1;
        endif
    endfor
endfunction