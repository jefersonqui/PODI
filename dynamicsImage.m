a = imread("images\1.png");

ar = double(a(:,:,1));
ag = a(:,:,2);
ab = a(:,:,3);

%% Mascara PasaBajas
s = size(ar);
s1 = s(1);
s2 = s(2);
fact = 1/2;  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%factor


s = size(a);
arc = ar*0;
arcmediana = ar*0;
kernel = [1 1 1;1 1 1;1 1 1]/9;
kernelgauss = [1 2 1;2 4 2;1 2 1]/16;
kernel0 = [0 1 0 ;0 1 0;0 1 0]/3;
for i = 2:5%s(1)-1
    for j = 2:5%s(2)-1
        ventana = ar(i-1:i+1,j-1:j+1);
        prod = ventana .* kernel0;
        pix =sum(sum(prod));
        arc(i,j) = pix;
        
%         % Mediana
%         vector = ventana(:);
%         vector = sort(vector);
%         arcmediana(i,j) = vector(5);
    end
end
imshow(arc);
%m_pb = zeros(s(1),s(2));
% m_pb = a1;
% m_pb(s1-fact:s1+fact,s2-fact:s2+fact) = 195;
%subplot(2,1,2); image1 = imshow(m_pb); title("PasaBajas");


% %% Mascara PasaAltas
% m_pa = ones(s(1),s(2));
% m_pa(s1-fact:s1+fact,s2-fact:s2+fact) = 0;
% subplot(3,2,4); image2 = imshow(m_pa); title("PasaAltas");
% 
% %% Mascara PasaBandas
% m_pbd = zeros(s(1),s(2));
% m_pbd(s1-fact:s1+fact,s2-fact:s2+fact) = 1;
% m_pbd(s1-fact+10:s1+fact-10,s2-fact+10:s2+fact-10) = 0;
% subplot(3,2,5); image3 = imshow(m_pbd); title("PasaBandas");
% 
% %% Mascara Rechazabandas
% m_rbd = ones(s(1),s(2));
% m_rbd(s1-fact:s1+fact,s2-fact:s2+fact) = 0;
% m_rbd(s1-fact+10:s1+fact-10,s2-fact+10:s2+fact-10) = 1;
% subplot(3,2,6); image4 = imshow(m_rbd); title("RechazaBandas");
% %% Reconstruccion de imagenes
% tf_pa = tfa1.*m_pa;
% img_pa = ifft2(ifftshift(tf_pa));
% figure(2);
% subplot(3,2,1); imshow(real(img_pa),[]);
% title({['Restaurada - filtro pasa alta'] ...
%     [num2str(fact),'X',num2str(fact)]});
% 
% tf_pb = tfa1.*m_pb;
% img_pb = ifft2(ifftshift(tf_pb));
% 
% subplot(3,2,2); imshow(real(img_pb),[]);
% title({['Restaurada - filtro pasa baja'] ...
%     [num2str(fact),'X',num2str(fact)]});
% 
% tf_pbd = tfa1.*m_pbd;
% img_pbd = ifft2(ifftshift(tf_pbd));
% 
% subplot(3,2,3); imshow(real(img_pbd),[]);
% title({['Restaurada - filtro pasabanda'] ...
%     [num2str(fact),'X',num2str(fact)]});
% 
% tf_rbd = tfa1.*m_rbd;
% img_rbd = ifft2(ifftshift(tf_rbd));
% 
% subplot(3,2,4); imshow(real(img_rbd),[]);
% title({['Restaurada - filtro rechazabanda'] ...
%     [num2str(fact),'X',num2str(fact)]});
% 
% figure(3);
% %% Teorema de la convolucion para imagen distorsionadas
% %tiagdegra = trideal*factordedegradacion
% 
% %% filtrado inversoo - imagen difuminada buscar -  deteccion laser restauracion proyectos avanzados de optica -  topicos especiales 
% 
% mih = fspecial('gaussian',6);
% mih1 = fspecial('motion',40,5);
% tfa1_ = fft2(a1);
% A = fft2(a1);
% s = size(A)
% MIH1 = fft2(mih1,s(1),s(2));
% %d = 0.001+0.002i;
% %Frest = A./(MIH1 + d);
% %frest = ifft2(Frest);
% 
% c = 0.01 + 0.000001i;
% 
% G = conj(MIH1)./((abs(MIH1).^2) + c);
% imgrest = tfa1_.*G;
% frest = ifft2(imgrest);
% 
% figure(3); 
% % subplot(3,2,1); im1 = imshow(mih,[]);
% % subplot(3,2,2); im2 = surf(mih);
% 
% %imshow(abs(frest),[]);
% imshow(abs(frest),[]);
% 
% %% Filtrado de winer
% % y = h*x + n  x:imagen real(no se puede obtener-solo aproximaciones), n:
% % ruido, y = imagen obtenida (x' objetivo - estimacion)
% % x' = g*y (convolucion)
