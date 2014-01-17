function lrec = predictive_decoding(lout, param)

	[row, col] = size(lout);

    lrec = zeros(row, col);

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

			for i = 1:row

				for j = 1: col

					if i == 1

						lrec(i, j) = lout(i, j);

                    elseif j == col
                        
                        lrec(i, j) = lout(i, 1) + lrec(i - 1, j) - lrec(i - 1, 1);
                        
                    else

						lrec(i, j) = lout(i, j + 1) + lrec(i - 1, j) - lrec(i - 1, j + 1);

					end

				end

			end

		case 'P5'

			for i = 1:row

				for j = 1: col

					if i == 1

						lrec(i, j) = lout(i, j);

                    elseif j == col

                        lrec(i, j) = lout(i, 1) + (lrec(i - 1, j) - lrec(i - 1, 1)) / 2;

					else

						lrec(i, j) = lout(i, j + 1) + (lrec(i - 1, j) - lrec(i - 1, j + 1)) / 2;

					end

				end

			end

		case 'P6'

			for i = 1:row

				for j = 1: col

					if i == 1

						lrec(i, j) = lout(i, j);

                    elseif j == col

                        lrec(i, j) = 2 * (lout(i, 1) - lrec(i - 1, 1)) + lrec(i - 1, j);

					else

						lrec(i, j) = 2 * (lout(i, j + 1) - lrec(i - 1, j + 1)) + lrec(i - 1, j);

					end

				end

			end

		case 'P7'

			for i = 1:row

				for j = 1: col

					if i == 1

						lrec(i, j) = lout(i, j);

                    elseif j == col

                        lrec(i, j) = 2 * lout(i, 1) - lrec(i - 1, 1);

                    else

						lrec(i, j) = 2 * lout(i, j + 1) - lrec(i - 1, j + 1);

					end

				end

			end

		otherwise

			error('Bad input for Predictive Scheme entered, enter P1 to P7');

	end

end