function processed_image = image_load(filename)
raw = imread(filename);
raw_red = raw(:,:,1);
for i = 1:size(raw_red,1)
    for j = 1:size(raw_red,2)
        if raw_red(i,j) > 0
            processed_image(i,j) = 1;
        else
            processed_image(i,j) = 0;
        end
    end
end
end