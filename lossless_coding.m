function [codewords, data] = lossless_coding(symbol, type)

	switch type

		case 'huffman'

			% [g,~,gl] = grp2idx(symbol);

			% count = accumarray(g,1);

			% p = count(g) ./ numel(g);

			uniqueSymbols = unique(symbol);

			p = histc(symbol, uniqueSymbols) / numel(symbol);

			[data, length] = huffmandict(uniqueSymbols,p);

			codewords = huffmanenco(symbol,data);


			% symbols = [1:6];

			% p = [.5 .125 .125 .125 .0625 .0625];

			% [dict,avglen] = huffmandict(symbols,p);

			% actualsig = randsrc(100,1,[symbols; p]);

			% comp = huffmanenco(actualsig,dict);


		otherwise

			codewords = [];
			data = [];
			length = 0;

			disp('Err: bad type of lossless coding selected!');

	end

end