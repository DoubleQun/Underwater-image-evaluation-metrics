folder_A = 'out_image/'; % 存放输出图像的文件夹路径
folder_B = 'ref_image/'; % 存放参考图像的文件夹路径

file_extension1 = '.jpg'; % 图像文件扩展名，根据需要修改
file_extension2 = '.png'; %  

valid_pairs = 0;

total_psnr = 0;
total_ssim = 0;
total_brisque = 0;
total_niqe = 0;
total_uciqe = 0;
total_entropy = 0;
total_uiqm = 0;
total_uicm = 0;
total_uism = 0;
total_uiconm = 0;

for i = 1:1:3616
    % 构建图像文件名，编号从000001起
    imgA_name = sprintf('%s%06d%s', folder_A, i, file_extension1);
    imgB_name = sprintf('%s%06d%s', folder_B, i, file_extension1);
    
    if ~isfile(imgA_name) || ~isfile(imgB_name)
        fprintf('图像 %s 或 %s 不存在，跳过计算。\n', imgA_name, imgB_name);
        continue;
    end
    

    imgA = imread(imgA_name);
    imgB = imread(imgB_name);
    
    if size(imgA) ~= size(imgB)
        fprintf('图像 %s 和 %s 的尺寸不同，跳过计算。\n', imgA_name, imgB_name);
        continue;
    end

    
    psnr_value = psnr(imgA, imgB);
    ssim_value = ssim(imgA, imgB);
    brisque_value = brisque(imgA);
    niqe_value = niqe(imgA);
    uciqe_value = UICQE(imgA);
    entropy_value = entropy(imgA);
    uiqm_value = UIQM(imgA);
    [~, ~, ~, ~, uicm_value] = UICM(imgA);
    uism_value = UISM(imgA);
    uiconm_value = UIConM(imgA);
        
    fprintf('图像 %s 和 %s 的PSNR值为：%.2f dB\n', imgA_name, imgB_name, psnr_value);
    fprintf('图像 %s 和 %s 的SSIM值为：%.2f \n', imgA_name, imgB_name, ssim_value);
    fprintf('图像 %s 的BRISQUE值为：%.2f \n', imgA_name, brisque_value);
    fprintf('图像 %s 的NIQE值为：%.2f \n', imgA_name, niqe_value);
    fprintf('图像 %s 的UCIQE值为：%.2f \n', imgA_name, uciqe_value);
    fprintf('图像 %s 的Entropy值为：%.2f \n', imgA_name, entropy_value);
    fprintf('图像 %s 的UIQM值为：%.2f \n', imgA_name, uiqm_value);
    fprintf('图像 %s 的UICM值为：%.2f \n', imgA_name, uicm_value);
    fprintf('图像 %s 的UISM值为：%.2f \n', imgA_name, uism_value);
    fprintf('图像 %s 的UIConM值为：%.2f \n', imgA_name, uiconm_value);


        % 累加PSNR值并增加有效对数
    total_ssim = total_ssim + ssim_value;   
    total_psnr = total_psnr + psnr_value;
    total_brisque = total_brisque + brisque_value;
    total_niqe = total_niqe + niqe_value;
    total_uciqe = total_uciqe + UICQE_value;
    total_entropy = total_entropy + entropy_value;
    total_uiqm = total_uiqm + uiqm_value;
    total_uicm = total_uicm + uicm_value;
    total_uism = total_uism + uism_value;
    total_uiconm = total_uiconm + uiconm_value;

    valid_pairs = valid_pairs + 1;
    
    end

if valid_pairs > 0
    avg_psnr = total_psnr / valid_pairs;
    avg_ssim = total_ssim / valid_pairs;
    avg_brisque = total_brisque / valid_pairs;
    avg_niqe = total_niqe / valid_pairs;
    avg_uciqe = total_uciqe / valid_pairs;
    avg_entropy = total_entropy / valid_pairs;
    avg_uiqm = total_uiqm / valid_pairs;
    avg_uicm = total_uicm / valid_pairs;
    avg_uism = total_uism / valid_pairs;
    avg_uiconm = total_uiconm / valid_pairs;

    fprintf('\n所有图像对的平均PSNR值为：%.2f dB\n', avg_psnr);
    fprintf('\n所有图像对的平均SSIM值为：%.2f \n', avg_ssim);
    fprintf('\n所有图像的平均BRISQUE值为：%.2f \n', avg_brisque);
    fprintf('\n所有图像的平均NIQE值为：%.2f \n', avg_niqe);
    fprintf('\n所有图像的平均UCIQE值为：%.2f \n', avg_uciqe);
    fprintf('\n所有图像的平均Entropy值为：%.2f \n', avg_entropy);
    fprintf('\n所有图像平均UIQM值为：%.2f \n', avg_uiqm);
    fprintf('\n所有图像平均UICM值为：%.2f \n', avg_uicm);
    fprintf('\n所有图像平均UISM值为：%.2f \n', avg_uism);
    fprintf('\n所有图像平均UIconM值为：%.2f \n', avg_uiconm);
    
else
    fprintf('没有有效的图像对，无法计算平均值。\n');
end






