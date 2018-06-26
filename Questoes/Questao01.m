#{
Copyright (C) 2018 Daniel Elias

This program is free software; you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

-*- texinfo -*- 
@deftypefn {} {@var{p1 p2 p3} =} Questao01 (@var{x}, @var{y}, @var{p})
x -> vetor de pontos de x
y -> vetor de pontos de f(x)
pX -> ponto buscado

@seealso{}
@end deftypefn

Author: Daniel Elias <daniel@danielias-note>
Created: 2018-06-13
#}

function [] = Questao01 ()
    # pontos dados e funcao dada
    x = [1.5 1.6 1.9];
    y = (x .- 1) .^ (1 / 3);
    pX = 1.7
    pY = (pX - 1) ^ (1 / 3)
    
    #p1 -> interpolacao linear (grau um)
    p1 = y(2) + ((y(3) - y(2)) / (x(3) - x(2))) * (pX - x(2))    
    erroP1 = p1 - pY
    
    #p2 -> interpolacao quadratica (grau dois)
    p2 = (y(1) * (((pX - x(2)) * (pX - x(3))) / ((x(1) - x(2)) * (x(1) - x(3)))) + (y(2) * ((pX - x(1)) * (pX - x(3)) / ((x(2) - x(1)) * (x(2) - x(3))))) + (y(3) * (((pX - x(1)) * (1.7 - x(2))) / ((x(3) - x(1)) * (x(3) - x(2))))))
    erroP2 = p2 - pY
    
    #p3 -> interpolacao cubica (grau tres)
    p3 = interp1(x, y, pX, 'cubic')
    erroP3 = p3 - pY
    
    #plot das funcoes
    eixoX = [1.1 : 0.01 : 2.3];
    fX = (eixoX .- 1) .^ (1 / 3);
    n = size(eixoX, 2);
    for i = 1 : n
        fP1(i) = interp1(x, y, eixoX(i), 'linear');
        fP2(i) = InterpolacaoLagrange(x, y, eixoX(i));
        fP3(i) = p3 = interp1(x, y, eixoX(i), 'cubic');
    endfor
    plot (x, log(y), "r*", eixoX, log(fX), "k", eixoX, log(fP1), "r", eixoX, log(fP2), "b", eixoX, log(fP3), "g"), grid on;
    legend ("Pontos dados", "f(x)=(x-1)^1^/^3", "P1 (Linear)", "P2 (Quadratica)", "P3 (Cubica)");
    xlabel('Eixo X: domínio da função')
    ylabel('Eixo Y: imagem da função')
    title('Interpolação Polinomial')
endfunction
