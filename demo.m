

% NCSR_DnCNN_fusion
% put two denoised images into ./input_folder
% then
clear;clc;
addpath(genpath('functions'));
input_folder = 'input_folder';  
% fusion the two denoised images in './input_folder'
[fusion_result, exutime] = fusion(input_folder);

% load original /denoised image by DnCNN /denoised image by NCSR
ori = imread('Lena.jpg'); 
DnCNN_denoised = imread(fullfile(input_folder, 'DnCNNDenoised(sigma=40).jpg'));
NCSR_denoised = imread(fullfile(input_folder, 'NCSRDenoised(sigma=40).jpg'));

% Compute PSNR SSIM FSIM
[psnr_dncnn, ssim_dncnn, fsim_dncnn] = Cal_PSNRSSIM(ori,DnCNN_denoised,0,0);
[psnr_ncsr, ssim_ncsr, fsim_ncsr] = Cal_PSNRSSIM(ori,NCSR_denoised,0,0);
[psnr_fusion, ssim_fusion, fsim_fusion] = Cal_PSNRSSIM(ori,fusion_result,0,0);

% Show result
subplot(1,3,1);imshow(DnCNN_denoised); title(sprintf('Denoised by DnCNN(PSNR=%.2f)',psnr_dncnn));
subplot(1,3,2);imshow(NCSR_denoised); title(sprintf('Denoised by NCSR(PSNR=%.2f)',psnr_ncsr));
subplot(1,3,3);imshow(fusion_result); title(sprintf('Denoised by Proposed(PSNR=%.2f)',psnr_fusion));

