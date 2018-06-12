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
## @deftypefn {} {@var{retval} =} regressaoPolinomial (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Daniel Elias <daniel@danielias-note>
## Created: 2018-06-04

function [b, r2, sigma2, condErro] = regressaoLinearNormal ()##(v, p, x, y)
    ##Objetivo: calcular parametros de minimos quadrados de modelo linear
    ##          multiplo via equacoes normais
    ##Entrada:  n, v, p, x, y {nº de ptos, nº de var, nº de param, var expl e var resp}
    ##Saida:    b, r2, sigma2, CondErro {coef. de reg., coef de det, variancia residual e cond erro}
    ## base entrada:
    ## 
    v = 1;
    p = 2;
    x = [1940 1950 1960 1970 1980 1991 1996 2000];
    x = x - 1970;
    y = [12880182 18782891 31303034 52084984 80436409 110990990 123076831 137953959];
    y = y .* 10 ^ -6;
    if((v > 1) && (v + 1 != p))
        CondErro = 1;
        return;
    endif
    n = size(x, 2);
    CondErro = 0;
    vp1 = v + 1;
    pm1 = p - 1;
    x = x';
    #inclusao de uma coluna de 1's relativa a b0
    for i = 1 : n
        for j = vp1 : -1 : 2
            x(i, j) = x(i, j - 1);
        endfor
        x(i, 1) = 1;
    endfor
    if((v == 1) && (p > 2)) ##se reg. pol., entao gera potencias de x
        for j = 2 : pm1
            jp1 = j + 1;
            for i = 1 : n
                x(i, jp1) = x(i, 2) ^ j;
            endfor
        endfor
    endif
    ##equacoes normais
    for i = 1 : p
        for j = 1 : p
            Soma = 0;
            for k = 1 : n
                Soma = Soma + x(k, i) * x(k, j);
            endfor
            Sxx(i, j) = Soma; ##matriz de coeficientes
        endfor
        Soma = 0;
        for k = 1 : n
            Soma = Soma + x(k, i) * y(k);
        endfor
        Sxy(i) = Soma; ##vetor dos termos independentes
    endfor
    ## decomposicao Cholesky
    [L, Det, CondErro] = cholesky(Sxx);
    ##substituicao sucessiva
    t = ss(L, Sxy);
    for i = 1 : p
        for j = 1 : i
            U(j, i) = L(i, j); ##U = transposta de L
        endfor
    endfor
    ##substituicao retroativa
    b = sr(U, t); #coeficientes
    D = 0;
    Sy2 = 0;
    for i = 1 : n
        u = 0;
        for j = 1 : p
            u = u + b(j) * x(i, j);
        endfor
        d = y(i) - u;
        D = D + d ^ 2;
        Sy2 = Sy2 + y(i) ^ 2;
    endfor
    r2 = 1 - D / (Sy2 - Sxy(1) ^ 2 / n); ##coeficiente de determinacao
    sigma2 = D / (n - p); ##variacao residual
    b
    r2
    sigma2
    CondErro
endfunction