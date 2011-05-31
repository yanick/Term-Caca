/* What will I use my programming skill for? */

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "caca.h"

#include <sys/types.h>

/* ref($object) eq 'HASH' && $object->{__address} */
void *
address_of(SV *object)
{
  /* make sure object is a hashref */
  if (SvTYPE(SvRV(object)) != SVt_PVHV) {
    return NULL;
  }
  return (void *)
    SvIV(*hv_fetch((HV *) SvRV(object), "__address", 9, 0));
}

/* lookup value of key in hashref - value must be an integer
 * ref($object) eq 'HASH' && $object->{$key} */
int
hashref_lookup(SV *object, char *key)
{
  /* make sure object is a hashref */
  if (SvTYPE(SvRV(object)) != SVt_PVHV) {
    return 0;
  }
  return SvIV(*hv_fetch((HV *) SvRV(object), key, strlen(key), 0));
}

/* turn a perl array of numbers into a c array of 8 bit integers */
void *
c_array_8(SV *p_array_ref)
{
  int i;
  int len;
  I8 *c_array;
  AV *p_array = (AV *) SvRV(p_array_ref);

  /* len = scalar(p_array) */
  len = av_len(p_array);

  /* malloc */
  c_array = malloc(len * sizeof(I8));

  /* for (;;) { } */
  for (i = 0; i < len; i++) {
    SV **integer;
    integer = av_fetch(p_array, i, 0);
    c_array[i] = SvIV(*integer);
  }

  /* return */
  return c_array;
}

/* turn a perl array of numbers into a c array of 16 bit integers */
void *
c_array_16(SV *p_array_ref)
{
  int i;
  int len;
  I16 *c_array;
  AV *p_array = (AV *) SvRV(p_array_ref);

  /* len = scalar(p_array) */
  len = av_len(p_array);

  /* malloc */
  c_array = malloc(len * sizeof(I16));

  /* for (;;) { } */
  for (i = 0; i < len; i++) {
    SV **integer;
    integer = av_fetch(p_array, i, 0);
    c_array[i] = SvIV(*integer);
  }

  /* return */
  return c_array;
}

/* turn a perl array of numbers into a c array of 32 bit integers */
void *
c_array_32(SV *p_array_ref)
{
  int i;
  int len;
  I32 *c_array;
  AV *p_array = (AV *) SvRV(p_array_ref);

  /* len = scalar(p_array) */
  len = av_len(p_array);

  /* malloc */
  c_array = malloc(len * sizeof(I32));

  /* for (;;) { } */
  for (i = 0; i < len; i++) {
    SV **integer;
    integer = av_fetch(p_array, i, 0);
    c_array[i] = SvIV(*integer);
  }

  /* return */
  return c_array;
}

MODULE = Term::Caca   PACKAGE = Term::Caca

# -==[- Basic functions -]==--------------------------------------------------

void
_init()
  CODE:
    caca_init();

void
_set_delay(display,usec)
    void *display;
    unsigned int usec;
  CODE:
    caca_set_display_time(display,usec);

int
_get_delay(display)
    void *display;
  CODE:
    RETVAL = caca_get_display_time(display);
  OUTPUT:
    RETVAL



void *
_create_display()
    CODE:
        RETVAL = caca_create_display(NULL);
    OUTPUT:
        RETVAL

void *
_get_canvas(display)
    void *display
    CODE:
        RETVAL = caca_get_canvas(display);
    OUTPUT:
        RETVAL
        


int
_get_rendertime()
  CODE:
    RETVAL = caca_get_rendertime();
  OUTPUT:
    RETVAL

unsigned int
_get_width()
  CODE:
    RETVAL = caca_get_width();
  OUTPUT:
    RETVAL

unsigned int
_get_height()
  CODE:
    RETVAL = caca_get_height();
  OUTPUT:
    RETVAL

int
_set_display_title(display,title)
    void *display;
    const char *title;
  CODE:
    RETVAL = caca_set_display_title(display, title);
  OUTPUT:
    RETVAL

unsigned int
_get_window_width()
  CODE:
    RETVAL = caca_get_window_width();
  OUTPUT:
    RETVAL

unsigned int
_get_window_height()
  CODE:
    RETVAL = caca_get_window_height();
  OUTPUT:
    RETVAL

void
_refresh()
  CODE:
    caca_refresh();

void
_end()
  CODE:
    caca_end();

# -==[- Event handling -]==---------------------------------------------------

unsigned int
_get_event(display,event_mask,timeout)
    void *display;
    unsigned int event_mask;
    unsigned int timeout;
  CODE:
    RETVAL = caca_get_event(display,event_mask,NULL,timeout);
  OUTPUT:
    RETVAL

unsigned int
_get_mouse_x(display)
    void *display;
  CODE:
    RETVAL = caca_get_mouse_x(display);
  OUTPUT:
    RETVAL

unsigned int
_get_mouse_y(display)
    void *display;
  CODE:
    RETVAL = caca_get_mouse_y(display);
  OUTPUT:
    RETVAL

unsigned int
_wait_event(event_mask)
    unsigned int event_mask
  CODE:
    RETVAL = caca_wait_event(event_mask);
  OUTPUT:
    RETVAL

# -==[- Character printing -]==-----------------------------------------------

void
_set_color(fgcolor, bgcolor)
    unsigned int fgcolor;
    unsigned int bgcolor;
  CODE:
    caca_set_color(fgcolor, bgcolor);

unsigned int
_get_fg_color()
  CODE:
    RETVAL = caca_get_fg_color();
  OUTPUT:
    RETVAL

unsigned int
_get_bg_color()
  CODE:
    RETVAL = caca_get_bg_color();
  OUTPUT:
    RETVAL

const char *
_get_color_name(color)
    unsigned int color
  CODE:
    RETVAL = caca_get_color_name(color);
  OUTPUT:
    RETVAL

void
_putchar(x, y, c)
    int  x;
    int  y;
    char c;
  CODE:
    caca_putchar(x, y, c);

void
_putstr(x, y, s)
    int        x;
    int        y;
    const char *s;
  CODE:
    caca_putstr(x, y, s);

# skip caca_printf for now.
# handle va_args on perl side.

void
_clear()
  CODE:
    caca_clear();

# -==[- Primitives drawing -]==-----------------------------------------------

void
_draw_line(canvas,x1, y1, x2, y2, c)
    void * canvas;
    int x1;
    int y1;
    int x2;
    int y2;
    char c;
  CODE:
    caca_draw_line(canvas,x1, y1, x2, y2, c);

void
_draw_polyline(canvas,x, y, n, c)
    void * canvas;
    SV *x;
    SV *y;
    int n;
    char c;
  INIT:
    int *xc;
    int *yc;
    int i;
    /* make sure x and y are perl arrayrefs */
    if ( (SvTYPE(SvRV(x)) != SVt_PVAV)
      || (SvTYPE(SvRV(y)) != SVt_PVAV) )
    {
      XSRETURN_UNDEF;
    }

    /* create a C int array out of x and y */
    xc = (int *) malloc((n+1) * sizeof(int *));
    if (!xc) {
      XSRETURN_UNDEF;
    }
    yc = (int *) malloc((n+1) * sizeof(int *));
    if (!yc) {
      XSRETURN_UNDEF;
    }
    for (i = 0; i <= n; i++) {
      SV **integer;

      integer = av_fetch((AV *) SvRV(x), i, 0);
      if (integer) {
        xc[i] = SvIV(*integer);
      } else {
        xc[i] = 0;
      }

      integer = av_fetch((AV *) SvRV(y), i, 0);
      if (integer) {
        yc[i] = SvIV(*integer);
      } else {
        yc[i] = 0;
      }
    }
  CODE:
    caca_draw_polyline(canvas,xc, yc, n, c);
    free(yc);
    free(xc);

void
_draw_thin_line(canvas,x1, y1, x2, y2)
    void * canvas;
    int x1;
    int y1;
    int x2;
    int y2;
  CODE:
    caca_draw_thin_line(canvas,x1, y1, x2, y2);

void
_draw_thin_polyline(canvas,x, y, n)
    void * canvas;
    SV  *x;
    SV  *y;
    int n;
  INIT:
    int *xc;
    int *yc;
    int i;
    /* make sure x and y are perl arrayrefs */
    if ( (SvTYPE(SvRV(x)) != SVt_PVAV)
      || (SvTYPE(SvRV(y)) != SVt_PVAV) )
    {
      XSRETURN_UNDEF;
    }

    /* create a C int array out of x and y */
    xc = (int *) malloc((n+1) * sizeof(int *));
    if (!xc) {
      XSRETURN_UNDEF;
    }
    yc = (int *) malloc((n+1) * sizeof(int *));
    if (!yc) {
      XSRETURN_UNDEF;
    }
    for (i = 0; i <= n; i++) {
      SV **integer;

      integer = av_fetch((AV *) SvRV(x), i, 0);
      if (integer) {
        xc[i] = SvIV(*integer);
      } else {
        xc[i] = 0;
      }

      integer = av_fetch((AV *) SvRV(y), i, 0);
      if (integer) {
        yc[i] = SvIV(*integer);
      } else {
        yc[i] = 0;
      }
    }
  CODE:
    caca_draw_thin_polyline(canvas,xc, yc, n);
    free(yc);
    free(xc);

void
_draw_circle(canvas,x, y, r, c)
    void * canvas;
    int  x;
    int  y;
    int  r;
    char c;
  CODE:
    caca_draw_circle(canvas,x, y, r, c);

void
_draw_ellipse(canvas,x0, y0, a, b, c)
    void * canvas;
    int  x0;
    int  y0;
    int  a;
    int  b;
    char c;
  CODE:
    caca_draw_ellipse(canvas,x0, y0, a, b, c);

void
_draw_thin_ellipse(canvas,x0, y0, a, b)
    void * canvas;
    int x0;
    int y0;
    int a;
    int b;
  CODE:
    caca_draw_thin_ellipse(canvas,x0, y0, a, b);

void
_fill_ellipse(canvas,x0, y0, a, b, c)
    void * canvas;
    int  x0;
    int  y0;
    int  a;
    int  b;
    char c;
  CODE:
    caca_fill_ellipse(canvas,x0, y0, a, b, c);

void
_draw_box(canvas,x0, y0, x1, y1, c)
    void * canvas;
    int  x0;
    int  y0;
    int  x1;
    int  y1;
    char c;
  CODE:
    caca_draw_box(canvas,x0, y0, x1, y1, c);

void
_draw_thin_box(canvas,x0, y0, x1, y1)
    void * canvas;
    int x0;
    int y0;
    int x1;
    int y1;
  CODE:
    caca_draw_thin_box(canvas,x0, y0, x1, y1);

void
_fill_box(canvas,x0, y0, x1, y1, c)
    void * canvas;
    int  x0;
    int  y0;
    int  x1;
    int  y1;
    char c;
  CODE:
    caca_fill_box(canvas,x0, y0, x1, y1, c);

void
_draw_triangle(canvas, x0, y0, x1, y1, x2, y2, c)
    void * canvas;
    int  x0;
    int  y0;
    int  x1;
    int  y1;
    int  x2;
    int  y2;
    char c;
  CODE:
    caca_draw_triangle(canvas,x0, y0, x1, y1, x2, y2, c);

void
_draw_thin_triangle(canvas,x0, y0, x1, y1, x2, y2)
    void * canvas;
    int x0;
    int y0;
    int x1;
    int y1;
    int x2;
    int y2;
  CODE:
    caca_draw_thin_triangle(canvas,x0, y0, x1, y1, x2, y2);

void
_fill_triangle(canvas, x0, y0, x1, y1, x2, y2, c)
    void * canvas;
    int  x0;
    int  y0;
    int  x1;
    int  y1;
    int  x2;
    int  y2;
    char c;
  CODE:
    caca_fill_triangle(canvas, x0, y0, x1, y1, x2, y2, c);

# -==[- Mathematical functions -]==-------------------------------------------

int
_rand(min, max)
    int min;
    int max;
  CODE:
    RETVAL = caca_rand(min, max);
  OUTPUT:
    RETVAL

unsigned int
_sqrt(n)
    unsigned int n;
  CODE:
    RETVAL = caca_sqrt(n);
  OUTPUT:
    RETVAL

# -==[- Sprite handling -]==--------------------------------------------------

SV *
_load_sprite(file)
    const char *file
  INIT:
    struct caca_sprite  *c_sprite;
    HV                  *sprite;
  CODE:
    if (!file) {
      XSRETURN_UNDEF;
    }
    c_sprite = caca_load_sprite(file);
    if (!c_sprite) {
      XSRETURN_UNDEF;
    } else {
      sprite = (HV *) sv_2mortal((SV *) newHV());
      if (!sprite) {
        XSRETURN_UNDEF;
      }
      hv_store(sprite, "__address", 9, newSViv((size_t) c_sprite), 0);
      RETVAL = newRV((SV *) sprite);
    }
  OUTPUT:
    RETVAL

int
_get_sprite_frames(sprite)
    SV *sprite
  INIT:
    struct caca_sprite *c_sprite;
    c_sprite = address_of(sprite);
    if (!c_sprite) {
      XSRETURN_UNDEF;
    }
  CODE:
    RETVAL = caca_get_sprite_frames(c_sprite);
  OUTPUT:
    RETVAL

int
_get_sprite_width(sprite, f)
    SV  *sprite;
    int f;
  INIT:
    struct caca_sprite *c_sprite;
    c_sprite = address_of(sprite);
    if (!c_sprite) {
      XSRETURN_UNDEF;
    }
  CODE:
    RETVAL = caca_get_sprite_width(c_sprite, f);
  OUTPUT:
    RETVAL

int
_get_sprite_height(sprite, f)
    SV  *sprite;
    int f;
  INIT:
    struct caca_sprite *c_sprite;
    c_sprite = address_of(sprite);
    if (!c_sprite) {
      XSRETURN_UNDEF;
    }
  CODE:
    RETVAL = caca_get_sprite_height(c_sprite, f);
  OUTPUT:
    RETVAL

int
_get_sprite_dx(sprite, f)
    SV  *sprite;
    int f;
  INIT:
    struct caca_sprite *c_sprite;
    c_sprite = address_of(sprite);
    if (!c_sprite) {
      XSRETURN_UNDEF;
    }
  CODE:
    RETVAL = caca_get_sprite_dx(c_sprite, f);
  OUTPUT:
    RETVAL

int
_get_sprite_dy(sprite, f)
    SV  *sprite;
    int f;
  INIT:
    struct caca_sprite *c_sprite;
    c_sprite = address_of(sprite);
    if (!c_sprite) {
      XSRETURN_UNDEF;
    }
  CODE:
    RETVAL = caca_get_sprite_dy(c_sprite, f);
  OUTPUT:
    RETVAL

void
_draw_sprite(x, y, sprite, f)
    int x;
    int y;
    SV *sprite;
    int f;
  INIT:
    struct caca_sprite *c_sprite;
    c_sprite = address_of(sprite);
    if (!c_sprite) {
      XSRETURN_UNDEF;
    }
  CODE:
    caca_draw_sprite(x, y, c_sprite, f);

void
_free_sprite(sprite)
    SV *sprite;
  INIT:
    struct caca_sprite *c_sprite;
    c_sprite = address_of(sprite);
    if (!c_sprite) {
      XSRETURN_UNDEF;
    }
  CODE:
    caca_free_sprite(c_sprite);

# -==[- Bitmap handling -]==--------------------------------------------------

void
_set_bitmap_palette_tied(bitmap, red, green, blue, alpha)
    SV *bitmap;
    void *red;
    void *green;
    void *blue;
    void *alpha;
  INIT:
    struct caca_bitmap *c_bitmap;

    c_bitmap = address_of(bitmap);
    if (!c_bitmap) {
      XSRETURN_UNDEF;
    }

  CODE:
    caca_set_bitmap_palette(c_bitmap, red, green, blue, alpha);

void
_set_bitmap_palette_copy(bitmap, red, green, blue, alpha)
    SV *bitmap;
    SV *red;
    SV *green;
    SV *blue;
    SV *alpha;
  INIT:
    struct caca_bitmap *c_bitmap;
    unsigned int *c_red;
    unsigned int *c_green;
    unsigned int *c_blue;
    unsigned int *c_alpha;

    c_bitmap = address_of(bitmap);
    if (!c_bitmap) {
      XSRETURN_UNDEF;
    }

    c_red   = (unsigned int *) c_array_32(red);
    c_green = (unsigned int *) c_array_32(green);
    c_blue  = (unsigned int *) c_array_32(blue);
    c_alpha = (unsigned int *) c_array_32(alpha);
  CODE:
    caca_set_bitmap_palette(c_bitmap, c_red, c_green, c_blue, c_alpha);
    free(c_red);
    free(c_green);
    free(c_blue);
    free(c_alpha);

void
_draw_bitmap_tied(x1, y1, x2, y2, bitmap, pixels)
    int x1;
    int y1;
    int x2;
    int y2;
    SV *bitmap;
    void *pixels;
  INIT:
    struct caca_bitmap *c_bitmap;

    c_bitmap = address_of(bitmap);
  CODE:
    caca_draw_bitmap(x1, y1, x2, y2, c_bitmap, pixels);

void
_draw_bitmap_copy(x1, y1, x2, y2, bitmap, pixels)
    int x1;
    int y1;
    int x2;
    int y2;
    SV *bitmap;
    SV *pixels;
  INIT:
    struct caca_bitmap *c_bitmap;
    void *c_pixels;
    int bpp;

    c_bitmap = address_of(bitmap);
    bpp = hashref_lookup(bitmap, "__bpp");
    switch (bpp) {
      case  8:
        c_pixels = c_array_8(pixels);
        break;
      case 16:
        c_pixels = c_array_16(pixels);
        break;
      case 24:
        c_pixels = c_array_8(pixels);
        break;
      case 32:
        c_pixels = c_array_32(pixels);
        break;
      default:
        XSRETURN_UNDEF;
        break;
    }
  CODE:
    caca_draw_bitmap(x1, y1, x2, y2, c_bitmap, c_pixels);
    free(c_pixels);

void
_free_bitmap(bitmap)
    SV *bitmap;
  INIT:
    struct caca_bitmap *c_bitmap;
    c_bitmap = address_of(bitmap);
    if (!c_bitmap) {
      XSRETURN_UNDEF;
    }
  CODE:
    caca_free_bitmap(c_bitmap);

# vim:sw=2 sts=2 expandtab
