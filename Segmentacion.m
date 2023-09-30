%%% OPERACIONES MORFOL�GICAS

clc, clear, close all;

I = imread('insectos\monedas.jpg');
I = rgb2gray(I);

imshow(I)

% SE = strel(forma,par�metro)

% se1 = strel('square',11); % Cuadrado 11x11
% se2 = strel('line',10,45); % L�nea de longitud 10 y �ngulo de 45�
% se3 = strel('disk',15); % Disco de radio 15
% se4 = strel('ball',15,5); % Bola de radio 15 y alto 5
% 
% % Operaciones morfol�gicas
% 
% J1 = imdilate(I,se2); % Dilataci�n
% J2 = imerode(I,se2); %Erosi�n
% J3 = imopen(I,se3); %Apertura
% J4 = imclose(I,se3); %Cierre
% 
% figure,
% subplot(2,2,1), imshow(J1), title('Dilataci�n')
% subplot(2,2,2), imshow(J2), title('Erosi�n')
% subplot(2,2,3), imshow(J3), title('Apertura')
% subplot(2,2,4), imshow(J4), title('Cierre')

BW = imbinarize(I,0.9); % Binariza una imagen
BW = BW==0; %Inviertan
BW = imfill(BW,'holes'); % Rellena los agujeros

figure, imshow(BW)


%%% SEGMENTACI�N

L = bwlabel(BW); % Crea regiones (etiqueta componentes conectados)
numele = max(max(L)); % N�mero de objetos etiquetados
disp('N�mero de monedas: '), disp(numele)
regionprops
% 
% stats = regionprops(L,'all'); % Estad�sticas de las regiones
% 
% % Coloca un c�rculo rojo al rededor de un elemento
% figure(1); hold on
% num = 2; center = stats(num).Centroid;
% diametro = mean([stats(num).MajorAxisLength stats(num).MinorAxisLength],2);
% radio = diametro/2;
% viscircles(center,radio);
% hold off
% % Recortar el elemento
% 
% E = stats(4).BoundingBox; % Toma la frontera de la 1ra regi�n
% M1 = imcrop(I,E); % Devuelve la 1ra regi�n
% 
% figure,
% imshow(M1)
% 
% 
% 
% 
% 
% 
