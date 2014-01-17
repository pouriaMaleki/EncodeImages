function symbols = lossless_decoding(codewords, type, data)

	switch type

		case 'huffman'

			symbols = huffman_decode(codewords,data);

		otherwise

			symbols = [];

			disp('Err: bad type of lossless decoding selected!');

	end


end