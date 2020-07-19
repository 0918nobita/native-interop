#lang racket/base

(require ffi/unsafe
         ffi/unsafe/define)

(define-ffi-definer define-mylib
  (ffi-lib "./dylib/libmylib.so"))

(define-mylib my_func (_fun -> _int))

(my_func)
