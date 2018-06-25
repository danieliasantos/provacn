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
## @deftypefn {} {@var{retval} =} ajusteCurva (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Daniel Elias <daniel@danielias-note>
## Created: 2018-05-23

function [retval] = ajusteCurvaModelo ()
    ## base de dados
    x = [0.3 2.7 4.5 5.9 7.8];
    y = [1.8 1.9 3.1 3.9 3.3];
    ## blue
    b = 1.74 + 0.2 * x;
    db = sum((y - b) .^ 2)
    ## red
    r = 1.5 + 0.25 * x;
    dr = sum((y - r) .^ 2)
    ## green
    g = 1.6 + 0.3 * x;
    dg = sum((y - g) .^ 2)
    ## black (k)
    k = 1.6559 + 0.2689 * x;
    dk = sum((y - k) .^ 2)
    plot(x, b, 'b-'), hold on;
    plot(x, r, 'r-'), hold on;
    plot(x, g, 'g-'), hold on;
    plot(x, k, 'k-'), hold on;
endfunction