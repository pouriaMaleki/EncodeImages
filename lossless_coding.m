function [codewords, data, bitrate] = lossless_coding(symbol, type)

	switch type

		case 'huffman'

			[codewords, data, bitrate] = huffman(symbol);

		otherwise

			error('bad type of lossless coding selected! select: huffman');

	end

end