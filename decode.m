clear; close all; clc;

source = imread("encr_img.png");

% messege hidden in red matrix
R = source(:,:,1);
row=1; col=1;

% messege holds 410 characters, 8 bits each
messege = zeros(409, 8);

% take 410x8 pixels that hold the messege
for i=1:409
    for j=1:8
        messege(i,j) = R(row, col);
        col = col+1;
    end
    col = 1;
    row = row+2;
end

byte = [];
full_mes = [];
for i=1:409
    for j=1:8   
        next_bit = num2str(bitget(messege(i, j), 1));
        byte = [byte next_bit];
    end
    full_mes = [full_mes; byte];
    byte = [];
end

full_message = char(bin2dec(full_mes))'


