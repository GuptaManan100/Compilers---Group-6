int main()
{
	int x;
	x = 7;
	int y;
	y = 1;

	if ( x<100 || y>200 && x+y<250 ) {
        x = 1;
        y = 10;
    }

    x = y*10;

	printf(y);

	return 0;
}