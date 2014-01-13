function symbols = lossless_decoding(codewords, type, data)

	switch type

		case 'huffman'

			symbols = huffmandeco(codewords,data);

		otherwise

			symbols = [];

			disp('other');

	end


end