function [ar,arc] = func_gradientes(a)
    s = size(a);
    ar = double(a(:,:,1));
%     ar = double(a(:,:,2));
%     ar = double(a(:,:,3));
    arc = ar*0;
    %% Gradientes de prewitt normalizados
    kernelXp = [-1 0 1;-1 0 1;-1 0 1]/3;      %iluminacion --->
    kernelYp = [-1 -1 -1;0 0 0;1 1 1]/3;      %iluminacion vertical
    kernel45p = [-1 -1 0; -1 0 1; 0 1 1]/3;   %iluminacion a 45°
    %% Gradientes de sobel normalizados:
    kernelXs = [-1 0 1;-2 0 2; -1 0 1]/4;
    kernelYs = [-1 -2 -1; 0 0 0; 1 2 1]/4;
    kernel45s = [-2 -1 0; -1 0 1; 0 1 2]/4;
    %% Gradientes de Char
    kernelXc = [-3 0 3; -10 0 10; -3 0 3]; %informacion visual para deteecion de autos
    kernelYc = [-3 -10 -3; 0 0 0; 3 10 3];
    kernel45c = [-10 -3 0;-3 0 3;0 3 10];
    %% Gradientes de Roberth
    kernelXr = [1 0; 0 -1];
    kernelYr = [0 -1; 1 0];
    %% Laplaciano normalizado
    lap1 = [0 1 0; 1 -4 1; 0 1 0]/4;
    lap2 = [1 1 1; 1 -8 1; 1 1 1]/8;
    lap3 = [-1 -1 -1; -1 8 -1; -1 -1 -1];
    for i = 2:s(1)-1
        for j = 2:s(2)-1
            ventana = ar(i-1:i+1, j-1:j+1);
            prod = ventana .* kernelXc;
            pix =sum(sum(prod)); 
            arc(i,j) = (pix + 255)/2; %Corrimiento de escala
        end
    end

end