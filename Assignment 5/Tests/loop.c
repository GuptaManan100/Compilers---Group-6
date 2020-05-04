int main() {
    int x;
    x = 7;
    float y;
    int i;

    for (i = 1; i <= x; i = i + 1) {
        y = 9 - 1.0;
        for (y = 0; y < 9; y = y + 1) {
            int x;
            x = 0;
            if (x == 4) {
                break;
            }
            x = x + 1;
        }
    }

    int c;
    c = 0;
    for (c = 0; c < 5; c = c + 1) {
        int x;
        x = 0;
        if (x == 4) {
            continue;
        }
        x = x + 1;
    }

    return 0;
}
