function [codewords, data, bitrate] = huffman(symbol)

    % create unique symbols

    uniqueSymbols = unique(symbol);

    % find probabilities for huffman

    p = histc(symbol, uniqueSymbols) / numel(symbol);

    % create dictionary

    [data, length] = huffman_dictionary(uniqueSymbols, p);

    % we found lenght befor, just pass it to lossless file

    bitrate = length;

    % codewords are being generated

    codewords = huffman_encode(symbol, data);

function encoded = huffman_encode(input_signal, input_dictionary)

    if (~iscell(input_signal) )

        [m,n] = size(input_signal);
        input_signal = mat2cell(input_signal, ones(1,m), ones(1,n) );

    end

    % preallocation -> find the size of the largest element in the dictionary

    maxSize = 0;

    dictLength = size(input_dictionary,1);

    for i = 1 : dictLength

        tempSize = size(input_dictionary{i,2},2);

        if (tempSize > maxSize)

            maxSize = tempSize;

        end

    end

    % reserve array

    encoded = zeros(1, length(input_signal)*maxSize);

    idxCode = 1;

    for i = 1 : length(input_signal)

        % find code for each signal

        tempcode = [];

        for j = 1 : dictLength

            if( input_signal{i} == input_dictionary{j,1} )

                tempcode = input_dictionary{j,2};
                break;

            end

        end

        lenCode = length(tempcode);

        encoded(idxCode : idxCode+lenCode-1) = tempcode;
        idxCode = idxCode + lenCode;

    end

    % Strip off the unused vector elements

    encoded = encoded(1:idxCode-1);


    if( n == 1 ) % if input was a column vector, convert result to col vector

        encoded = encoded';

    end

function [final_dictionary, avrage_lenght] = huffman_dictionary(sig, input_probability)

    n_ary = [];
    variance = '';

    if nargin > 2

        n_ary = varargin{1};

    end

    if nargin == 4

        variance = varargin{2};

    end

    if isempty(n_ary)

        n_ary = 2; % default value is binary encryption

    end

    if ( variance )

        % if variance contains a non-null string do nothing

    else

        variance = 'max'; % default is maximum variance Huffman code

    end

    if ( ~( (strcmpi(variance, 'max') == 0 || strcmpi(variance, 'min') == 0  )...
            && length(variance) == 3 ) )

    end

    m = size(sig);

    if( m(1) == 1 )

        sig = sig';

    end

    if ~iscell(sig)

        [m,n] = size(sig);

        sig = mat2cell(sig, ones(1,m), ones(1,n)) ;

    end

    % create nodes by they probabilities

    huffman_tree = struct('signal', [], 'probability', [],...
        'child', [], 'code', [], 'origOrder', -1);

    for i=1:length( sig )

        huffman_tree(i).signal = sig{i};
        huffman_tree(i).probability = input_probability(i);
    	huffman_tree(i).origOrder = i;

    end

    % sort by probabilities

    [s, i] = sort(input_probability);
    huffman_tree = huffman_tree(i);

    % create huffman tree and codewords

    huffman_tree = create_huffman_tree(huffman_tree, n_ary, variance);
    [huffman_tree,final_dictionary, avrage_lenght] = create_huffman_dictionary(huffman_tree,{},0, n_ary);

    % sort dictionary

    [dictsort,dictsortorder] = sort([final_dictionary{:,4}]);
    lenDict = length(dictsortorder);
    finaldict = cell(lenDict, 2);

    for i=1:length(dictsortorder)

        finaldict{i,1} = final_dictionary{dictsortorder(i), 1};
        finaldict{i,2} = final_dictionary{dictsortorder(i), 2};

    end

    final_dictionary = finaldict;

% recursive create huffman codes

function huffman_tree = create_huffman_tree(huffman_tree, n_ary, variance)

    % end of recursive

    if( length(huffman_tree) <= 1)

        return;

    end

    % Create parent node with lowest probabilities

    temp = struct('signal', [], 'probability', 0, ...
        'child', [], 'code', []);

    for i=1:n_ary

        % making sure is not empty!

        if isempty(huffman_tree), break; end

        temp.probability = temp.probability + huffman_tree(1).probability; % for ascending order
        temp.child{i} = huffman_tree(1);
    	temp.origOrder = -1;
        huffman_tree(1) = [];

    end

    if( strcmpi(variance, 'min') == 1 )

        huffman_tree = insert_min_var(huffman_tree, temp);

    else

        huffman_tree = insert_max_var(huffman_tree, temp);

    end

    % create tree from removed nodes

    huffman_tree = create_huffman_tree(huffman_tree, n_ary, variance);

    return;


% insert node in sorted list

function huffman_tree = insert_max_var(huffman_tree, newNode)

    i = 1;

    while i <= length(huffman_tree) && ...
            newNode.probability > huffman_tree(i).probability
        i = i+1;
    end

    huffman_tree = [huffman_tree(1:i-1) newNode huffman_tree(i:end)];


% insert node in sorted list

function huffman_tree = insert_min_var(huffman_tree, newNode)

    i = 1;

    while i <= length(huffman_tree) && ...
            newNode.probability >= huffman_tree(i).probability
        i = i+1;
    end

    huffman_tree = [huffman_tree(1:i-1) newNode huffman_tree(i:end)];


% recursive pre-order traversal the tree to create the codes

function [huffman_tree,dict,total_wted_len] = create_huffman_dictionary(huffman_tree,dict,total_wted_len, n_ary)

    if isempty(huffman_tree.child)

        dict{end+1,1} = huffman_tree.signal;
        dict{end, 2} = huffman_tree.code;
        dict{end, 3} = length(huffman_tree.code);
    	dict{end, 4} = huffman_tree.origOrder;

        total_wted_len = total_wted_len + length(huffman_tree.code)*huffman_tree.probability;
        return;

    end

    num_childrens = length(huffman_tree.child);

    for i = 1:num_childrens

        huffman_tree.child{i}.code = [huffman_tree(end).code, (num_childrens-i)];

        [huffman_tree.child{i}, dict, total_wted_len] = ...
            create_huffman_dictionary(huffman_tree.child{i}, dict, total_wted_len, n_ary);

    end
