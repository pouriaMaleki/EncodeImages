function lenc = predictive_encoding(lin, param)

	[row, col] = size(lin);

	switch param

		case 'P1'

			lenc = lin([1:2:row],[1:2:col]);

		case 'P2'

			[row, col] = size(lin);

			lenc = lin([2:2:row],[2:2:col]);

		case 'P3'

			[row, col] = size(lin);

			lenc = lin([2:2:row],[1:2:col]);

		case 'P4'

			lenc = predictive_encoding(lin, 'P1') + predictive_encoding(lin, 'P2') - predictive_encoding(lin, 'P3');

		case 'P5'

			lenc = predictive_encoding(lin, 'P1') + (predictive_encoding(lin, 'P2') - predictive_encoding(lin, 'P3')) / 2;

		case 'P6'

			lenc = predictive_encoding(lin, 'P2') + (predictive_encoding(lin, 'P1') - predictive_encoding(lin, 'P3')) / 2;

		case 'P7'

			lenc = (predictive_encoding(lin, 'P1') + predictive_encoding(lin, 'P2')) / 2;

		otherwise

			error('bad param entered!');

	end

end