void simpletest(int x) {
    int y;
    x = 1;
    printf(x);
}
int fibonacci(int x) {
    if (x == 1 || x == 0) {
        return 1;
    }
    int ans;
    ans = fibonacci(x - 1) + fibonacci(x - 2);
    return ans;
}

int main() {
    int a;
    simpletest(a);
    a = fibonacci(5);
}