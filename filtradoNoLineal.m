a = imread("0010017.png");
%figure(); imshow(a);
ar = double(a(:,:,1));
s = size(a);
arc = ar*0;
armin = ar*0;
arcmediana = ar*0;
armax = ar*0;
arminmax = ar*0;
arout = ar;
kernel = [1 1 1;1 0 1;1 1 1]/8;
kernelgauss = [1 2 1;2 4 2;1 2 1]/16;
h = 5;
for i = 2:s(1)-1
    for j = 2:s(2)-1
        ventana = ar(i-1:i+1,j-1:j+1);
        prod = ventana .* kernel;
        pix =sum(sum(prod));
        arc(i,j) = pix;
        % Mediana
        vector = ventana(:);
        vector = sort(vector);
        arcmediana(i,j) = vector(5);
        armin(i,j) = vector(1);
        armax(i,j) = vector(9);
        % Outlier
        if abs(ar(i,j) - pix) > h
            arout(i,j) = pix;
        end
        % max - Min
        dif_sup = vector(9) - ar(i,j);
        dif_inf = ar(i,j) - vector(1);
        if dif_sup > dif_inf
            arminmax(i,j) = vector(9);
        else
            arminmax(i,j) = vector(1);
        end
    end
end
figure(1),subplot(2,2,1),imshow(uint8(ar)), title("Perfil conv");
figure(1),subplot(2,2,2),imshow(uint8(arcmediana)), title("mediana");
figure(1),subplot(2,2,3), imshow(uint8(armin));title("minimo");
figure(1),subplot(2,2,4), imshow(uint8(armax));title("maximo");

% 
figure(2),subplot(2,1,1),imshow(uint8(ar)), title("Perfil conv");
figure(2); subplot(2,1,2),imshow(uint8(arout)),title("outlier");
%% max min
figure(),subplot(2,1,1),imshow(uint8(ar)), title("orignal");
figure(); subplot(2,1,2),imshow(uint8(arminmax)),title("maxmin");
