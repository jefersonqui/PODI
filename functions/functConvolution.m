function [altfre] = functConvolution(a)
    
    ar = double(a(:,:,:));
    s = size(a);
    arc = ar*0;
    arcmediana = ar*0;
    kernel = [1 1 1;1 1 1;1 1 1]/9;
    kernelgauss = [1 2 1;2 4 2;1 2 1]/16;
    for i = 2:s(1)-1
        for j = 2:s(2)-1
            ventana = ar(i-1:i+1,j-1:j+1);
            prod = ventana .* kernel;
            pix =sum(sum(prod));
            arc(i,j) = pix;
        end
    end
    altfre = ar - arc;    
end