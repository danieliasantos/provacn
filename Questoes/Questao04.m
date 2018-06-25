function [ ] = Questao04()
  
  [ Spline ] = Questao04A();   
  [ Lagrange ] = Questao04B();
  dom = [0.9:.1:13.3];
  plot(dom,Lagrange,'k'); 
  title("Questao 4");
  h = legend ("Spline", "Lagrange");
  legend (h, "location", "northeastoutside");
  set(h, "fontsize", 20);
  hold on;
  
  
  endfunction