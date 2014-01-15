function [codewords, data] = lossless_coding(symbol, type)

	switch type

		case 'huffman'

			uniqueSymbols = unique(symbol);

			p = histc(symbol, uniqueSymbols) / numel(symbol);

			[data, length] = huffmandict(uniqueSymbols,p);

			codewords = huffmanenco(symbol,data);

		otherwise

			codewords = [];
			data = [];
			length = 0;

			disp('Err: bad type of lossless coding selected!');

	end

end