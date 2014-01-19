% imageNum = 1, 2, 3, 4, 5, 6
% predictive = 'P1', 'P2', 'P3', 'P4', 'P5', 'P6', 'P7'

function m = demo(imageNum, predictive)

	[image, Information] = read_image(imageNum);

	BitDepth = Information.BitDepth;

	disp(strcat('entropy of source image is:', num2str(eventropy(image))));
	disp(strcat('size of source image is:', num2str(size(image, 1) * size(image, 2) * BitDepth), 'bit'));
	disp(strcat('bitrate of source image is:', num2str(BitDepth), 'bit'));

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

	imageDecodedZigzag = lossless_decoding(predImageZigzagCoded, 'huffman', predImageZigzagCodedTable);

	imageDecoded = zigzag_writing(imageDecodedZigzag, size(image, 1), size(image, 2));

	sourceImage = predictive_decoding(imageDecoded, predictive);

	Idiff = imabsdiff(image,sourceImage);

	if Idiff == 0

		disp('Idiff is zero!');

	subplot(2,1,1), imshow(image);
	title('Original Image', 'FontSize', 7);

	subplot(2,1,2), imshow(predImage);
	title('After Predictive Encoding', 'FontSize', 7);

	%subplot(2,1,2), imshow(Idiff);
	%title('Idiff Value', 'FontSize', 7);

end