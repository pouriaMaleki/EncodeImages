function decoded = huffman_decode(codewords, dictionary)

    [m,n] = size(codewords);

    decoded = {};

    i = 1;

    while(i <= length(codewords))

        tempcode = codewords(i);

        found_code = isValidCode(tempcode, dictionary);

        while(isempty(found_code) && i < length(codewords))

            i = i+1;
            tempcode = [tempcode, codewords(i)];
            found_code = isValidCode(tempcode, dictionary);

        end

    	decoded{end+1} = found_code;

        i=i+1;

    end


    if( n == 1 ) % input was a column vector

        decoded = decoded';

    end

function found_code = isValidCode(code, dictionary)

    found_code = [];

    m = size(dictionary);

    for i=1:m(1)

        if ( isequal(code, dictionary{i,2}) )

            found_code = dictionary{i,1};
            return;

        end
    end
