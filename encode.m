clear; close all; clc;

text = fileread("text.txt");
num_characters = length(text);

photo = imread('temple.jpg');

R = photo(:,:,1);
G = photo(:,:,2);
B = photo(:,:,3);

% start point
row=1; col=1;

current_letter = 1;
for i = 1:num_characters
    for j = 8:-1:1
        % read j-th(from right) bit of current letter
        bit_val = bitget(double(text(1, current_letter)), j);
        if bit_val == 1
            % if j-th bit is 1, set the least sig. bit of byte (bit no.1)
            R(row, col) = bitset(R(row, col), 1);
        else
            % else set the LSB ot byte to 0
            R(row, col) = bitand(R(row, col), 0b11111110);
        end
        col = col + 1;
    end
    % text will be in every 2nd row
    row = row+2;
    col = 1;
    current_letter = current_letter + 1;
end

% create new image with messege in red color matrix
fin_img(:,:,1) = R;
fin_img(:,:,2) = G;
fin_img(:,:,3) = B;

file_out = './encr_img.jpg';
imwrite(fin_img, file_out);

