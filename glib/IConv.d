/*
 * Licensed under the GNU Lesser General Public License Version 3
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the license, or
 * (at your option) any later version.
 *
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <http://www.gnu.org/licenses/>.
 */

// generated automatically - do not change


module glib.IConv;

private import gi.glib;
public  import gi.glibtypes;
private import glib.Str;


/**
 * The GIConv struct wraps an iconv() conversion descriptor. It contains
 * private data and should only be accessed using the following functions.
 */

/**
 * Same as the standard UNIX routine iconv(), but
 * may be implemented via libiconv on UNIX flavors that lack
 * a native implementation.
 *
 * GLib provides g_convert() and g_locale_to_utf8() which are likely
 * more convenient than the raw iconv wrappers.
 *
 * Params:
 *     inbuf = bytes to convert
 *     inbytesLeft = inout parameter, bytes remaining to convert in @inbuf
 *     outbuf = converted output bytes
 *     outbytesLeft = inout parameter, bytes available to fill in @outbuf
 *
 * Return: count of non-reversible conversions, or -1 on error
 */
public size_t iconv(GIConv converter, ref string inbuf, ref string outbuf)
{
	char* outinbuf = Str.toStringz(inbuf);
	size_t inbytesLeft;
	char* outoutbuf = Str.toStringz(outbuf);
	size_t outbytesLeft;
	
	auto p = g_iconv(converter, &outinbuf, &inbytesLeft, &outoutbuf, &outbytesLeft);
	
	inbuf = Str.toString(outinbuf, inbytesLeft);
	outbuf = Str.toString(outoutbuf, outbytesLeft);
	
	return p;
}

/**
 * Same as the standard UNIX routine iconv_close(), but
 * may be implemented via libiconv on UNIX flavors that lack
 * a native implementation. Should be called to clean up
 * the conversion descriptor from g_iconv_open() when
 * you are done converting things.
 *
 * GLib provides g_convert() and g_locale_to_utf8() which are likely
 * more convenient than the raw iconv wrappers.
 *
 * Return: -1 on error, 0 on success
 */
public int close(GIConv converter)
{
	return g_iconv_close(converter);
}

/**
 * Same as the standard UNIX routine iconv_open(), but
 * may be implemented via libiconv on UNIX flavors that lack
 * a native implementation.
 *
 * GLib provides g_convert() and g_locale_to_utf8() which are likely
 * more convenient than the raw iconv wrappers.
 *
 * Params:
 *     toCodeset = destination codeset
 *     fromCodeset = source codeset
 *
 * Return: a "conversion descriptor", or (GIConv)-1 if
 *     opening the converter failed.
 */
public GIConv open(string toCodeset, string fromCodeset)
{
	return g_iconv_open(Str.toStringz(toCodeset), Str.toStringz(fromCodeset));
}
