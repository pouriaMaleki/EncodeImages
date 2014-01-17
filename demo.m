function m = demo(imageNum, predictive)

	[image, information] = read_image(imageNum);

	disp(strcat('entropy of source image is:', num2str(eventropy(image))));
	disp(strcat('size of source image is:', num2str(information.FileSize * 8), 'bit'));
	disp(strcat('bitrate of source image is:', num2str(information.BitDepth), 'bit'));
	% %%%%%% %
	% Encode %
	% %%%%%% %

	predImage = predictive_encoding(image, predictive);

	disp(strcat('entropy after predictive encode is:', num2str(eventropy(predImage))));

	predImageZigzag = zigzag_scanner(predImage);

	[predImageZigzagCoded, predImageZigzagCodedTable, predImageZigzagCodedBitrate] = lossless_coding(predImageZigzag, 'huffman');

	[row, codedSize] = size(predImageZigzagCoded);

	disp(strcat('size of coded image is:', num2str(codedSize), 'bit'));
	disp(strcat('Bitrate of coded image is:', num2str(predImageZigzagCodedBitrate), 'bit'));

	% %%%%%% %
	% Decode %
	% %%%%%% %

	% imageDecodedZigzag = lossless_decoding(predImageZigzagCoded, 'huffman', predImageZigzagCodedTable);

	% imageDecoded = zigzag_writing(imageDecodedZigzag, information.Height, information.Width);

	% sourceImage = predictive_decoding(imageDecoded, predictive);

	% Idiff=Imabsdiff(image,sourceImage);

	% if Idiff == 0

	% 	disp('Idiff is zero!');

	% subplot(2,1,1), imshow(image);
	% title('Original Image', 'FontSize', 7);

	% subplot(2,1,2), imshow(sourceImage);
	% title('Encoded/Decoded Image', 'FontSize', 7);

end