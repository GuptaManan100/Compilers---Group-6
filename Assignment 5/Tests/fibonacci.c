int fibonacci(int x){
	int fir = fibonacci(x-1);
	int sec = fibonacci(x-2);
	return fir+sec;
}

int main()
{
	int a;
	a = fibonacci(5);
}