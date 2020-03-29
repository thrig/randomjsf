/* Jenkins Small Fast -- "A small noncryptographic PRNG"
 * http://burtleburtle.net/bob/rand/smallprng.html
 * https://www.pcg-random.org/posts/some-prng-implementations.html */

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include <ruby.h>

struct ranctx {
    uint32_t a;
    uint32_t b;
    uint32_t c;
    uint32_t d;
};

#define rot32(x, k) (((x) << (k)) | ((x) >> (32 - (k))))

uint32_t ranval(struct ranctx *ctx) {
    uint32_t e = ctx->a - rot32(ctx->b, 27);
    ctx->a     = ctx->b ^ rot32(ctx->c, 17);
    ctx->b     = ctx->c + ctx->d;
    ctx->c     = ctx->d + e;
    ctx->d     = e + ctx->a;
    return ctx->d;
}

static void randomjsf_free(void *c) {
    struct ranctx *ctx = c;
    free(ctx);
}

static VALUE randomjsf_alloc(VALUE klass) {
    VALUE obj;
    struct ranctx *ctx;
    obj = Data_Make_Struct(klass, struct ranctx, NULL, randomjsf_free, ctx);
    return obj;
}

static VALUE randomjsf_init(VALUE self, VALUE seed) {
    int i;
    struct ranctx *ctx;
    Data_Get_Struct(self, struct ranctx, ctx);
    ctx->a = 0xf1ea5eed, ctx->b = ctx->c = ctx->d = NUM2UINT(seed);
    for (i = 0; i < 20; i++) ranval(ctx);
    return self;
}

static VALUE randomjsf_randval(VALUE self) {
    struct ranctx *ctx;
    VALUE foo;
    Data_Get_Struct(self, struct ranctx, ctx);
    foo = UINT2NUM(ranval(ctx));
    return foo;
}

void Init_randomjsf(void) {
    VALUE jsf;
    jsf = rb_const_get(rb_cObject, rb_intern("RandomJsf"));
    rb_define_alloc_func(jsf, randomjsf_alloc);
    rb_define_method(jsf, "initialize", randomjsf_init, 1);
    rb_define_method(jsf, "irand", randomjsf_randval, 0);
}
