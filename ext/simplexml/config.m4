dnl config.m4 for extension simplexml

PHP_ARG_ENABLE([simplexml],
  [whether to enable SimpleXML support],
  [AS_HELP_STRING([--disable-simplexml],
    [Disable SimpleXML support])],
  [yes])

if test "$PHP_SIMPLEXML" != "no"; then

  if test "$PHP_LIBXML" = "no"; then
    AC_MSG_ERROR([SimpleXML extension requires LIBXML extension, add --with-libxml])
  fi

  PHP_SETUP_LIBXML(SIMPLEXML_SHARED_LIBADD, [
    AC_DEFINE(HAVE_SIMPLEXML,1,[ ])
    PHP_NEW_EXTENSION(simplexml, simplexml.c sxe.c, $ext_shared)
    PHP_INSTALL_HEADERS([ext/simplexml/php_simplexml.h ext/simplexml/php_simplexml_exports.h])
    PHP_SUBST(SIMPLEXML_SHARED_LIBADD)
  ])
  PHP_ADD_EXTENSION_DEP(simplexml, libxml)
  PHP_ADD_EXTENSION_DEP(simplexml, spl, true)
fi
