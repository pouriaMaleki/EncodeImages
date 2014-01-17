function [image, information] = read_image(imageNum)

	imageAdr = '';

	switch imageNum

		case 1

			imageAdr = 'images/concordorthophoto.png';

		case 2

			imageAdr = 'images/liftingbody.png';

		case 3

			imageAdr = 'images/testpat1.png';

		case 4

			imageAdr = 'images/cameraman.tif';

		case 5

			imageAdr = 'images/circbw.tif';

		case 6

			imageAdr = 'images/pout.tif';

		otherwise

			error('Bad imput for image selection, enter numbers from 1 to 6')

	end

	information = imfinfo(imageAdr);

	imageReaded = imread(imageAdr);

	image = im2double(imageReaded);

end