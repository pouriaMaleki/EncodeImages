function lout = zigzag_writing(symbols, num_rows, num_cols)

	tot_elem = length(symbols);

	if tot_elem ~= num_rows*num_cols

		error('Matrix dimensions do not coincide');

	end

	lout = zeros(num_rows,num_cols);

	cur_row=1;

	cur_col=1;

	cur_index=1;


	% First element
	%lout(1,1)=in(1);


	while cur_index <= tot_elem

		if cur_row == 1 & mod(cur_row+cur_col,2) == 0 & cur_col ~= num_cols

			lout(cur_row,cur_col)=symbols(cur_index);

			cur_col=cur_col+1;

			cur_index=cur_index+1;


		elseif cur_row == num_rows & mod(cur_row+cur_col,2) ~= 0 & cur_col ~= num_cols

			lout(cur_row,cur_col)=symbols(cur_index);

			cur_col=cur_col+1;

			cur_index=cur_index+1;


		elseif cur_col == 1 & mod(cur_row+cur_col,2) ~= 0 & cur_row ~= num_rows

			lout(cur_row,cur_col)=symbols(cur_index);

			cur_row=cur_row+1;

			cur_index=cur_index+1;


		elseif cur_col == num_cols & mod(cur_row+cur_col,2) == 0 & cur_row ~= num_rows

			lout(cur_row,cur_col)=symbols(cur_index);

			cur_row=cur_row+1;

			cur_index=cur_index+1;


		elseif cur_col ~= 1 & cur_row ~= num_rows & mod(cur_row+cur_col,2) ~= 0

			lout(cur_row,cur_col)=symbols(cur_index);

			cur_row=cur_row+1;

			cur_col=cur_col-1;

			cur_index=cur_index+1;


		elseif cur_row ~= 1 & cur_col ~= num_cols & mod(cur_row+cur_col,2) == 0

			lout(cur_row,cur_col)=symbols(cur_index);

			cur_row=cur_row-1;

			cur_col=cur_col+1;

			cur_index=cur_index+1;


		elseif cur_index == tot_elem

			lout(end)=symbols(end);

			break

	end


end