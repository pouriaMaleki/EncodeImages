function lenc = predictive_encoding(lin, param)

	[row, col] = size(lin);

	lenc = zeros(row, col);

	switch param

		case 'P1'

			for i = 1:col

				if i == 1

					lenc(:, i) = lin(:, i);

				else

					lenc(:,i) = lin(:,i) - lin(:,i - 1);

				end

			end

		case 'P2'

			for i = 1:row

				if i == 1

					lenc(i, :) = lin(i, :);

				else

					lenc(i, :) = lin(i, :) - lin(i - 1, :);

				end

			end

		case 'P3'

			for i = 1:row

				for j = 1: col

					if i == 1 || j == 1

						lenc(i, j) = lin(i, j);

					else

						lenc(i, j) = lin(i, j) - lin(i - 1, j - 1);

					end

				end

			end

		case 'P4'

			for i = 1:row

				for j = 1: col

					if i == 1 || j == 1

						lenc(i, j) = lin(i, j);
                    else

						lenc(i, j) = lin(i, j) - (lin(i, j - 1) + lin(i - 1, j) - lin(i - 1, j - 1));

					end

				end

			end

		case 'P5'

			for i = 1:row

				for j = 1: col

					if i == 1 || j == 1

						lenc(i, j) = lin(i, j);
					else

						lenc(i, j) = lin(i, j) - (lin(i, j - 1) + (lin(i - 1, j) - lin(i - 1, j - 1)) / 2);

					end

				end

			end

		case 'P6'

			for i = 1:row

				for j = 1: col

					if i == 1 || j == 1

						lenc(i, j) = lin(i, j);

					else

						lenc(i, j) = lin(i, j) - (lin(i - 1, j) + (lin(i, j - 1) - lin(i - 1, j - 1)) / 2);

					end

				end

			end

		case 'P7'

			for i = 1:row

				for j = 1: col

					if i == 1 || j == 1

						lenc(i, j) = lin(i, j);
                    else

						lenc(i, j) = lin(i, j) - ((lin(i, j - 1) + lin(i - 1, j)) / 2);

					end

				end

			end

		otherwise

			error('Bad input for Predictive Scheme entered, enter P1 to P7');

	end

end