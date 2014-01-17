function lrec = predictive_decoding(lout, param)

	[row, col] = size(lout);

	switch param

		case 'P1'

			for i = 1:col

				if i == 1

					lrec(:, i) = lout(:, i);

				else

					lrec(:,i) = lout(:,i) + lrec(:,i - 1);

				end

			end

		case 'P2'

			for i = 1:row

				if i == 1

					lrec(i, :) = lout(i, :);

				else

					lrec(i, :) = lout(i, :) + lrec(i - 1, :);

				end

			end

		case 'P3'

			for i = 1:row

				for j = 1: col

					if i == 1 || j == 1

						lrec(i, j) = lout(i, j);

					else

						lrec(i, j) = lout(i, j) + lrec(i - 1, j - 1);

					end

				end

			end

		case 'P4'

			% What the hell?! :D

		case 'P5'

			% What the hell?! :D

		case 'P6'

			% What the hell?! :D

		case 'P7'

			% What the hell?! :D

		otherwise

			error('Bad input for Predictive Scheme entered, enter P1 to P7');

	end

end