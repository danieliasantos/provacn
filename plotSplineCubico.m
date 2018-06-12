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
## @deftypefn {Function File} {@var{retval} =} plotSpline (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Daniel Elias <daniel@danielias-note>
## Created: 2018-05-21

function [retval] = plotSplineCubico ()
    x = [1 2 4 6 7]; ## -> base de teste de x
    y = [2 4 1 3 3]; ## -> base de teste de y
    z = [1.2 0.1 2.9 5.2 6.7]; ## -> valores a serem interpolados
    [sz, erro, aux] = splineA(x, y, z);
    n = size(x, 2);
    m = size(aux, 2) - 4;
    for (i = 1 : n - 1)
        d(i, :) = linspace(x(i), x(i + 1), 100);
        s(i, :) = (aux(i, 2) * (d(i, :) - x(i)) .^ (3) + aux(i, 3) * (d(i, :) - x(i)) .^ (2) + aux(i, 4) * (d(i, :) - x(i)) + aux(i, 5));
        #for (j = 1 : m)
            ##codigo
            ##s(i, :) = (aux(i, 2) * (d(i, :) - x(i)) .^ (3) + aux(i, 3) * (d(i, :) - x(i)) .^ (2) + aux(i, 4) * (d(i, :) - x(i)) + aux(i, 5));
        #endfor
        plot(d(i, :), s(i, :))
        hold on;
    endfor
    #s
endfunction
