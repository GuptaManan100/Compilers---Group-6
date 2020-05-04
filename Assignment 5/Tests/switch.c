int main()
{
	int x;
	x = 7;
	int y;
	y = 1;

	switch(x+y)
	{
		case 0:
			y = 2;
		case 1:
			y = 5;
		case 2:
		case 3:
			y = 6;
		default:
			y = 1;
	}

	x = 1;
}