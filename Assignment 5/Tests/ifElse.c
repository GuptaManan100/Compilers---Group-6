int main() {
    int x;
    x = 7;
    int y;
    y = 1;

    if (x < 100 || y > 200 && x > 50) {
        x = 1;
        y = 10;
    }
    while (x < 7) {
        x = x - 1;
    }
    x = 1;
    return 0;
}