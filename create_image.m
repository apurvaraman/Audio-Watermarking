function create_image(image_matrix, filename)
processed_image = zeros(size(image_matrix,1),size(image_matrix,2),3);
for i = 1:size(image_matrix,1)
    for j = 1:size(image_matrix,2)
        if image_matrix(i,j) > 0
            processed_image(i,j,:) = 0;
        else
            processed_image(i,j,:) = 255;
        end
    end
end
imwrite(processed_image,filename)
end