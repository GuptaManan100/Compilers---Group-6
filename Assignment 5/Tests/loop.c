int main() {
    int x;
    x = 7;
    float y;
    int i;

    for (i = 1; i <= x; i = i + 1) {
        y = 9 - 1.0;
        while (y >= 0) {
            y = y - 1.0;
        }
    }
    int a, b;
    float c;
    c = 1.0;
    a = 5;
    b = 4;
    a = 1 + 1;
    a = a * (b + 8 - 5) + b * (a + b) / (c + a);

    return 0;
}
