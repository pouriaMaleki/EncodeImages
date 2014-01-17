function [codewords, data, bitrate] = lossless_coding(symbol, type)

	switch type

		case 'huffman'

			uniqueSymbols = unique(symbol);

			p = histc(symbol, uniqueSymbols) / numel(symbol);

			[data, length] = huffmandict(uniqueSymbols,p);

			bitrate = length;

			codewords = huffmanenco(symbol,data);

		otherwise

			error('bad type of lossless coding selected! select: huffman');

	end

end