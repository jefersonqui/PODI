a = imread("paint2.png");

%Extraccion de planos
ar = double(a(:,:,1));
s = size(a);
arc = ar*0;
%Convolucion:

kernelx = [-1 0 1;-1 0 1;-1 0 1]/3;       %iluminacion --->
kernely = [-1 -1 -1;0 0 0;1 1 1]/3;       %iluminacion vertical
kernel45 = [-1 -1 0; -1 0 1; 0 1 1]/3;    %iluminacion a 45°
for i = 2:s(1)-1
    for j = 2:s(2)-1
        ventana = ar(i-1:i+1, j-1:j+1);
        prod = ventana .* kernel45;
        pix =sum(sum(prod)); 
        arc(i,j) = (pix + 255)/2; %Corrimiento de escala
    end
end
%despliegue
figure(4); subplot(2,1,1); image(uint8(ar));title("imagen original");colormap(gray(256));
figure(4); subplot(2,1,2); image(uint8(arc));title("Gradiente H");
