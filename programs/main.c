#include <stdio.h>

void find(char s[], char word[], int slen, int wordlen) {
    int t = 0;
    int count = 0;
    int last = wordlen - 1;
    while (t < slen - last) {
        int p = 0;
        while(p <= last && s[t + p] == word[p]) {
            p++;
        }
        if (p == wordlen) {
            count++;
        }
        t++;
    }
    printf("%d ", count);
}

int main() {
    char s[10010];
    fgets(s, 10000, stdin);
    int n = 0;
    while (s[n] != '\0') {
        n++;
    }
    n--;
    char w1[] = "while", w2[] = "do", w3[] = "int", w4[] = "char", w5[] = "scanf";
    find(s, w1, n, 5);
    find(s, w2, n, 2);
    find(s, w3, n, 3);
    find(s, w4, n, 4);
    find(s, w5, n, 5);
    return 0;
}
