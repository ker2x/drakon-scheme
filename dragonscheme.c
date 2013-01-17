/* Autogenerated with DRAKON Editor 1.14 */
#include "dragonscheme.h"

object *false;
object *true;
object* alloc_object(
    void
) {
    // item 187
    object *obj;
    /* item 188 */
    obj = malloc(sizeof(object));
    
    // item 189
    if (obj == NULL) {
        /* item 192 */
        fprintf(stderr, "out of memory\n");
        /* item 193 */
        exit(1);
        return;
    } else {
        /* item 194 */
        return obj;
    }
    
}

void eat_whitespace(
    FILE *in
) {
    // item 126
    int c;
    
    item_130 :
    c = getc(in);
    
    // item 127
    if (c == EOF) {
        goto item_145;
    } else {
    }
    
    // item 131
    if (isspace(c)) {
        goto item_130;
    } else {
    }
    
    // item 133
    if (c == ';') {
    } else {
        goto item_145;
    }
    
    item_138 :
    c = getc(in);
    
    // item 136
    if ((c == EOF) || ((c == '\n'))) {
    } else {
        goto item_138;
    }
    
    item_145 :
    ungetc(c, in);
    return;
    
}

object* eval(
    object *exp
) {
    // item 49
    return exp;
    
}

void init(
    void
) {
    // item 218
    false = alloc_object();
    false->type = BOOLEAN;
    false->data.boolean.value = 0;
    /* item 219 */
    true = alloc_object();
    true->type = BOOLEAN;
    true->data.boolean.value = 1;
    return;
    
}

char is_boolean(
    object *obj
) {
    // item 200
    return obj->type == BOOLEAN;
    
}

char is_delimiter(
    int c
) {
    // item 167
    return isspace(c) || c == EOF ||
               c == '('   || c == ')' ||
               c == '"'   || c == ';';
    
}

char is_false(
    object *obj
) {
    // item 206
    return obj == false;
    
}

char is_fixnum(
    object *obj
) {
    // item 173
    return obj->type == FIXNUM;
    
}

char is_true(
    object *obj
) {
    // item 212
    return !is_false(obj);
    
}

void main(
    void
) {
    // item 15
    printf("Welcome to Bootstrap Scheme. " 
    "Use ctrl-c to exit.\n");
    /* item 252 */
    init();
    
    item_19 :
    printf("> ");
    /* item 18 */
    write(eval(read(stdin)));
    /* item 20 */
    printf("\n");
    
    // item 21
    if (1) {
        goto item_19;
    } else {
        return;
    }
    
}

object* make_fixnum(
    long value
) {
    // item 179
    object *obj;
    /* item 180 */
    obj = alloc_object();
    obj->type = FIXNUM;
    obj->data.fixnum.value = value;
    /* item 181 */
    return obj;
    
}

int peek(
    FILE *in
) {
    // item 158
    int c;
    /* item 159 */
    c = getc(in);
    /* item 160 */
    ungetc(c,in);
    /* item 161 */
    return c;
    
}

object* read(
    FILE *in
) {
    // item 78
    int c;
    short sign = 1;
    long num = 0;
    /* item 79 */
    eat_whitespace(in);
    /* item 80 */
    c = getc(in);
    
    // item 227
    if (c == '#') {
        /* item 230 */
        c = getc(in);
    } else {
        goto item_84;
    }
    
    // item 2310001
    if (c == 't') {
        /* item 238 */
        return true;
        goto item_91;
    } else {
    }
    
    // item 2310002
    if (c == 'f') {
        /* item 239 */
        return false;
        goto item_91;
    } else {
        /* item 241 */
        fprintf(stderr, 
        "unknown boolean literal\n");
        goto item_91;
    }
    
    item_84 :
    if (isdigit(c)) {
        /* item 93 */
        ungetc(c, in);
        goto item_100;
    } else {
    }
    
    // item 87
    if ((c == '-' && (isdigit(peek(in))))) {
        /* item 92 */
        sign = -1;
    } else {
        /* item 113 */
        fprintf(stderr, 
        "bad input. Unexpected '%c'\n", c);
        goto item_91;
    }
    
    item_100 :
    if (isdigit(c = getc(in))) {
        /* item 101 */
        num = (num * 10) + (c - '0');
        goto item_100;
    } else {
        /* item 104 */
        num *= sign;
    }
    
    // item 105
    if (is_delimiter(c)) {
        /* item 108 */
        ungetc(c, in);
        /* item 109 */
        return make_fixnum(num);
    } else {
        /* item 111 */
        fprintf(stderr, 
        "number not followed by delimiter\n");
    }
    
    item_91 :
    exit(1);
    return;
    
}

void write(
    object* obj
) {
    int _sw290000_ = 0;
    // item 290000
    _sw290000_ = obj->type;
    
    // item 290001
    if (_sw290000_ == FIXNUM) {
        /* item 35 */
        printf("%ld", obj->data.fixnum.value);
        return;
    } else {
    }
    
    // item 290002
    if (_sw290000_ == BOOLEAN) {
        /* item 223 */
        printf("#%c", is_false(obj) ? 'f' : 't');
        return;
    } else {
        /* item 37 */
        fprintf(stderr, "cannot write unknown type\n");
        /* item 38 */
        exit(1);
        return;
    }
    
}



