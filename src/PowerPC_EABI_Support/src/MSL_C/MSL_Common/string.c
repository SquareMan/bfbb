#include "stddef.h"
#include "PowerPC_EABI_Support/MSL_C/MSL_Common/stdint.h"

//#define K1 0x80808080
//#define K2 0xFEFEFEFF

size_t strlen(const char* str)
{
	size_t len = -1;
	uint8_t* p      = (uint8_t*)str - 1;

	do
		len++;
	while (*++p);
	return (len);
}

char* strcpy(char* dst, const char* src)
{
	register uint8_t *destb, *fromb;
	register uint32_t w, t, align;

	uint32_t K1, K2;

	fromb = (uint8_t*)src;
	destb = (uint8_t*)dst;

	if ((align = ((int)fromb & 3)) != ((int)destb & 3)) {
		goto bytecopy;
	}

	if (align) {
		if ((*destb = *fromb) == 0)
			return (dst);
		for (align = 3 - align; align; align--) {
			if ((*(++destb) = *(++fromb)) == 0)
				return (dst);
		}
		++destb;
		++fromb;
	}

	w = *((int*)(fromb));

	K2 = 0xFEFEFEFF;
	t = w + K2;

	K1 = 0x80808080;

	t &= K1;
	if (t)
		goto bytecopy;
	--((int*)(destb));

	do {
		*(++((int*)(destb))) = w;
		w                    = *(++((int*)(fromb)));

		t = w + K2;
		t &= K1;
		if (t)
			goto adjust;
	} while (1);

adjust:
	++((int*)(destb));
bytecopy:
	if ((*destb = *fromb) == 0)
		return dst;
	do {
		if ((*(++destb) = *(++fromb)) == 0)
			return dst;
	} while (1);

	return dst;
}

char* strncpy(char* dst, const char* src, size_t n)
{
	const unsigned char* p = (const unsigned char*)src - 1;
	unsigned char* q       = (unsigned char*)dst - 1;
	unsigned char zero     = 0;

	n++;

	while (--n)
		if (!(*++q = *++p)) {
			while (--n)
				*++q = 0;
			break;
		}
	return (dst);
}

char* strcat(char* dst, const char* src)
{
	const uint8_t* p = (uint8_t*)src - 1;
	uint8_t* q       = (uint8_t*)dst - 1;

	while (*++q)
		;

	q--;

	while (*++q = *++p)
		;

	return (dst);
}

void strncat(void)
{
	// UNUSED FUNCTION
}

int strcmp(const char* str1, const char* str2)
{
	// bless metrowerks for this implementation

	register uint8_t* left  = (uint8_t*)str1;
	register uint8_t* right = (uint8_t*)str2;
	uint32_t align, l1, r1, x;

	uint32_t K1, K2;

	l1 = *left;
	r1 = *right;
	if (l1 - r1) {
		return (l1 - r1);
	}

	if ((align = ((int)left & 3)) != ((int)right & 3)) {
		goto bytecopy;
	}
	if (align) {
		if (l1 == 0) {
			return 0;
		}
		for (align = 3 - align; align; align--) {
			l1 = *(++left);
			r1 = *(++right);
			if (l1 - r1) {
				return (l1 - r1);
			}
			if (l1 == 0) {
				return 0;
			}
		}
		left++;
		right++;
	}

	l1 = *(int*)left;
	r1 = *(int*)right;

	K1 = 0x80808080;
	K2 = 0xFEFEFEFF;

	x  = l1 + K2;
	if (x & K1) {
		goto adjust;
	}
	while (l1 == r1) {
		l1 = *(++((int*)(left)));
		r1 = *(++((int*)(right)));
		x  = l1 + K2;
		if (x & K1) {
			goto adjust;
		}
	}
	if (l1 > r1)
		return 1;
	return -1;

adjust:
	l1 = *left;
	r1 = *right;
	if (l1 - r1) {
		return (l1 - r1);
	}
bytecopy:
	if (l1 == 0) {
		return 0;
	}
	do {
		l1 = *(++left);
		r1 = *(++right);
		if (l1 - r1) {
			return (l1 - r1);
		}
		if (l1 == 0) {
			return 0;
		}
	} while (1);
}

int strncmp(const char* str1, const char* str2, size_t n)
{
	const uint8_t* p1 = (uint8_t*)str1 - 1;
	const uint8_t* p2 = (uint8_t*)str2 - 1;
	uint32_t c1, c2;

	n++;

	while (--n)
		if ((c1 = *++p1) != (c2 = *++p2))
			return (c1 - c2);
		else if (!c1)
			break;
	return 0;
}

char* strchr(const char* str, int chr)
{
	const uint8_t* p = (uint8_t*)str - 1;
	uint32_t c       = (chr & 0xFF);
	uint32_t ch;

	while (ch = *++p)
		if (ch == c)
			return ((char*)p);

	return (c ? 0 : (char*)p);
}

void strcoll(void)
{
	// UNUSED FUNCTION
}

void strxfrm(void)
{
	// UNUSED FUNCTION
}

char* strrchr(const char* str, int chr)
{
	const uint8_t* p = (uint8_t*)str - 1;
	const uint8_t* q = 0;
	uint32_t c       = (chr & 0xFF);
	uint32_t ch;

	while (ch = *++p)
		if (ch == c)
			q = p;

	if (q)
		return ((char*)q);

	return (c ? 0 : (char*)p);
}

void strpbrk(void)
{
	// UNUSED FUNCTION
}

void strspn(void)
{
	// UNUSED FUNCTION
}

void strcspn(void)
{
	// UNUSED FUNCTION
}

void strtok(void)
{
	// UNUSED FUNCTION
}

char* strstr(const char *str, const char *pat) {
    unsigned char* s1 = (unsigned char*)str - 1;
    unsigned char* p1 = (unsigned char*)pat - 1;
    unsigned long firstc, c1, c2;

    if ((pat == 0) || (!(firstc = *++p1))) {
        return ((char*)str);
    }

    while (c1 = *++s1) {
        if (c1 == firstc) {
            const unsigned char* s2 = s1 - 1;
            const unsigned char* p2 = p1 - 1;

            while ((c1 = *++s2) == (c2 = *++p2) && c1) {

            }

            if (!c2) {
                return ((char*)s1);
            }
        }
    }

    return NULL;
}

void strerror(void)
{
	// UNUSED FUNCTION
}

void __strerror(void)
{
	// UNUSED FUNCTION
}
