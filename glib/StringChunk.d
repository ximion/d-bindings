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


module glib.StringChunk;

private import gi.glib;
public  import gi.glibtypes;
private import glib.ConstructionException;
private import glib.Str;


/**
 * An opaque data structure representing String Chunks.
 * It should only be accessed by using the following functions.
 */
public class StringChunk
{
	/** the main GObject struct */
	protected GStringChunk* gStringChunk;

	/** Get the main GObject struct */
	public GStringChunk* getStringChunkStruct()
	{
		return gStringChunk;
	}

	/** the main GObject struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gStringChunk;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GStringChunk* gStringChunk)
	{
		this.gStringChunk = gStringChunk;
	}


	/**
	 * Frees all strings contained within the #GStringChunk.
	 * After calling g_string_chunk_clear() it is not safe to
	 * access any of the strings which were contained within it.
	 *
	 * Since: 2.14
	 */
	public void clear()
	{
		g_string_chunk_clear(gStringChunk);
	}

	/**
	 * Frees all memory allocated by the #GStringChunk.
	 * After calling g_string_chunk_free() it is not safe to
	 * access any of the strings which were contained within it.
	 */
	public void free()
	{
		g_string_chunk_free(gStringChunk);
	}

	/**
	 * Adds a copy of @string to the #GStringChunk.
	 * It returns a pointer to the new copy of the string
	 * in the #GStringChunk. The characters in the string
	 * can be changed, if necessary, though you should not
	 * change anything after the end of the string.
	 *
	 * Unlike g_string_chunk_insert_const(), this function
	 * does not check for duplicates. Also strings added
	 * with g_string_chunk_insert() will not be searched
	 * by g_string_chunk_insert_const() when looking for
	 * duplicates.
	 *
	 * Params:
	 *     str = the string to add
	 *
	 * Return: a pointer to the copy of @string within
	 *     the #GStringChunk
	 */
	public string insert(string str)
	{
		return Str.toString(g_string_chunk_insert(gStringChunk, Str.toStringz(str)));
	}

	/**
	 * Adds a copy of @string to the #GStringChunk, unless the same
	 * string has already been added to the #GStringChunk with
	 * g_string_chunk_insert_const().
	 *
	 * This function is useful if you need to copy a large number
	 * of strings but do not want to waste space storing duplicates.
	 * But you must remember that there may be several pointers to
	 * the same string, and so any changes made to the strings
	 * should be done very carefully.
	 *
	 * Note that g_string_chunk_insert_const() will not return a
	 * pointer to a string added with g_string_chunk_insert(), even
	 * if they do match.
	 *
	 * Params:
	 *     str = the string to add
	 *
	 * Return: a pointer to the new or existing copy of @string
	 *     within the #GStringChunk
	 */
	public string insertConst(string str)
	{
		return Str.toString(g_string_chunk_insert_const(gStringChunk, Str.toStringz(str)));
	}

	/**
	 * Adds a copy of the first @len bytes of @string to the #GStringChunk.
	 * The copy is nul-terminated.
	 *
	 * Since this function does not stop at nul bytes, it is the caller's
	 * responsibility to ensure that @string has at least @len addressable
	 * bytes.
	 *
	 * The characters in the returned string can be changed, if necessary,
	 * though you should not change anything after the end of the string.
	 *
	 * Params:
	 *     str = bytes to insert
	 *     len = number of bytes of @string to insert, or -1 to insert a
	 *         nul-terminated string
	 *
	 * Return: a pointer to the copy of @string within the #GStringChunk
	 *
	 * Since: 2.4
	 */
	public string insertLen(string str, ptrdiff_t len)
	{
		return Str.toString(g_string_chunk_insert_len(gStringChunk, Str.toStringz(str), len));
	}

	/**
	 * Creates a new #GStringChunk.
	 *
	 * Params:
	 *     size = the default size of the blocks of memory which are
	 *         allocated to store the strings. If a particular string
	 *         is larger than this default size, a larger block of
	 *         memory will be allocated for it.
	 *
	 * Return: a new #GStringChunk
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this(size_t size)
	{
		auto p = g_string_chunk_new(size);
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GStringChunk*) p);
	}
}
