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


module glib.Base64;

private import gi.glib;
public  import gi.glibtypes;
private import glib.Str;


/** */
public struct Base64
{
	/**
	 * Incrementally decode a sequence of binary data from its Base-64 stringified
	 * representation. By calling this function multiple times you can convert
	 * data in chunks to avoid having to have the full encoded data in memory.
	 *
	 * The output buffer must be large enough to fit all the data that will
	 * be written to it. Since base64 encodes 3 bytes in 4 chars you need
	 * at least: (@len / 4) * 3 + 3 bytes (+ 3 may be needed in case of non-zero
	 * state).
	 *
	 * Params:
	 *     inn = binary input data
	 *     len = max length of @in data to decode
	 *     output = output buffer
	 *     state = Saved state between steps, initialize to 0
	 *     save = Saved state between steps, initialize to 0
	 *
	 * Return: The number of bytes of output that was written
	 *
	 * Since: 2.12
	 */
	public static size_t decodeStep(string inn, ref ubyte[] output, ref int state, ref uint save)
	{
		auto p = g_base64_decode_step(Str.toStringz(inn), cast(int)inn.length, cast(char*)output.ptr, &state, &save);
		
		return p;
	}

	/**
	 */

	/**
	 * Decode a sequence of Base-64 encoded text into binary data
	 * by overwriting the input data.
	 *
	 * Params:
	 *     text = zero-terminated
	 *         string with base64 text to decode
	 *
	 * Return: The binary data that @text responds. This pointer
	 *     is the same as the input @text.
	 *
	 * Since: 2.20
	 */
	public static char[] decodeInplace(ref char[] text)
	{
		size_t outLen = cast(size_t)text.length;
		
		auto p = g_base64_decode_inplace(text.ptr, &outLen);
		
		text = text[0..outLen];
		
		return p[0 .. outLen];
	}

	/**
	 * Decode a sequence of Base-64 encoded text into binary data.  Note
	 * that the returned binary data is not necessarily zero-terminated,
	 * so it should not be used as a character string.
	 *
	 * Params:
	 *     text = zero-terminated string with base64 text to decode
	 *
	 * Return: newly allocated buffer containing the binary data
	 *     that @text represents. The returned buffer must
	 *     be freed with g_free().
	 *
	 * Since: 2.12
	 */
	public static char[] decode(string text)
	{
		size_t outLen;
		
		auto p = g_base64_decode(Str.toStringz(text), &outLen);
		
		return p[0 .. outLen];
	}

	/**
	 * Encode a sequence of binary data into its Base-64 stringified
	 * representation.
	 *
	 * Params:
	 *     data = the binary data to encode
	 *     len = the length of @data
	 *
	 * Return: a newly allocated, zero-terminated Base-64
	 *     encoded string representing @data. The returned string must
	 *     be freed with g_free().
	 *
	 * Since: 2.12
	 */
	public static string encode(char[] data)
	{
		return Str.toString(g_base64_encode(data.ptr, cast(size_t)data.length));
	}

	/**
	 * Flush the status from a sequence of calls to g_base64_encode_step().
	 *
	 * The output buffer must be large enough to fit all the data that will
	 * be written to it. It will need up to 4 bytes, or up to 5 bytes if
	 * line-breaking is enabled.
	 *
	 * Params:
	 *     breakLines = whether to break long lines
	 *     output = pointer to destination buffer
	 *     state = Saved state from g_base64_encode_step()
	 *     save = Saved state from g_base64_encode_step()
	 *
	 * Return: The number of bytes of output that was written
	 *
	 * Since: 2.12
	 */
	public static size_t encodeClose(bool breakLines, out char[] output, ref int state, ref int save)
	{
		return g_base64_encode_close(breakLines, output.ptr, &state, &save);
	}

	/**
	 * Incrementally encode a sequence of binary data into its Base-64 stringified
	 * representation. By calling this function multiple times you can convert
	 * data in chunks to avoid having to have the full encoded data in memory.
	 *
	 * When all of the data has been converted you must call
	 * g_base64_encode_close() to flush the saved state.
	 *
	 * The output buffer must be large enough to fit all the data that will
	 * be written to it. Due to the way base64 encodes you will need
	 * at least: (@len / 3 + 1) * 4 + 4 bytes (+ 4 may be needed in case of
	 * non-zero state). If you enable line-breaking you will need at least:
	 * ((@len / 3 + 1) * 4 + 4) / 72 + 1 bytes of extra space.
	 *
	 * @break_lines is typically used when putting base64-encoded data in emails.
	 * It breaks the lines at 72 columns instead of putting all of the text on
	 * the same line. This avoids problems with long lines in the email system.
	 * Note however that it breaks the lines with `LF` characters, not
	 * `CR LF` sequences, so the result cannot be passed directly to SMTP
	 * or certain other protocols.
	 *
	 * Params:
	 *     inn = the binary data to encode
	 *     len = the length of @in
	 *     breakLines = whether to break long lines
	 *     output = pointer to destination buffer
	 *     state = Saved state between steps, initialize to 0
	 *     save = Saved state between steps, initialize to 0
	 *
	 * Return: The number of bytes of output that was written
	 *
	 * Since: 2.12
	 */
	public static size_t encodeStep(char[] inn, bool breakLines, out char[] output, ref int state, ref int save)
	{
		return g_base64_encode_step(inn.ptr, cast(size_t)inn.length, breakLines, output.ptr, &state, &save);
	}
}
