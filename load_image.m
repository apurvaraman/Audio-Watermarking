function matrix = load_image(filename)
rgb = imread(filename);
matrix = rgb(:,:,1);
end