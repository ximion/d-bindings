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


module glib.Bytes;

private import gi.glib;
public  import gi.glibtypes;
private import glib.ByteArray;
private import glib.ConstructionException;


/**
 * A simple refcounted data type representing an immutable sequence of zero or
 * more bytes from an unspecified origin.
 * 
 * The purpose of a #GBytes is to keep the memory region that it holds
 * alive for as long as anyone holds a reference to the bytes.  When
 * the last reference count is dropped, the memory is released. Multiple
 * unrelated callers can use byte data in the #GBytes without coordinating
 * their activities, resting assured that the byte data will not change or
 * move while they hold a reference.
 * 
 * A #GBytes can come from many different origins that may have
 * different procedures for freeing the memory region.  Examples are
 * memory from g_malloc(), from memory slices, from a #GMappedFile or
 * memory from other allocators.
 * 
 * #GBytes work well as keys in #GHashTable. Use g_bytes_equal() and
 * g_bytes_hash() as parameters to g_hash_table_new() or g_hash_table_new_full().
 * #GBytes can also be used as keys in a #GTree by passing the g_bytes_compare()
 * function to g_tree_new().
 * 
 * The data pointed to by this bytes must not be modified. For a mutable
 * array of bytes see #GByteArray. Use g_bytes_unref_to_array() to create a
 * mutable array for a #GBytes sequence. To create an immutable #GBytes from
 * a mutable #GByteArray, use the g_byte_array_free_to_bytes() function.
 *
 * Since: 2.32
 */
public class Bytes
{
	/** the main GObject struct */
	protected GBytes* gBytes;

	/** Get the main GObject struct */
	public GBytes* getBytesStruct()
	{
		return gBytes;
	}

	/** the main GObject struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gBytes;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GBytes* gBytes)
	{
		this.gBytes = gBytes;
	}


	/**
	 * Creates a new #GBytes from @data.
	 *
	 * @data is copied. If @size is 0, @data may be %NULL.
	 *
	 * Params:
	 *     data = the data to be used for the bytes
	 *     size = the size of @data
	 *
	 * Return: a new #GBytes
	 *
	 * Since: 2.32
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this(ubyte[] data)
	{
		auto p = g_bytes_new(data.ptr, cast(size_t)data.length);
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GBytes*) p);
	}

	/**
	 * Creates a #GBytes from @data.
	 *
	 * When the last reference is dropped, @free_func will be called with the
	 * @user_data argument.
	 *
	 * @data must not be modified after this call is made until @free_func has
	 * been called to indicate that the bytes is no longer in use.
	 *
	 * @data may be %NULL if @size is 0.
	 *
	 * Params:
	 *     data = the data to be used for the bytes
	 *     size = the size of @data
	 *     freeFunc = the function to call to release the data
	 *     userData = data to pass to @free_func
	 *
	 * Return: a new #GBytes
	 *
	 * Since: 2.32
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this(void[] data, GDestroyNotify freeFunc, void* userData)
	{
		auto p = g_bytes_new_with_free_func(data.ptr, cast(size_t)data.length, freeFunc, userData);
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new_with_free_func");
		}
		
		this(cast(GBytes*) p);
	}

	/**
	 * Compares the two #GBytes values.
	 *
	 * This function can be used to sort GBytes instances in lexographical order.
	 *
	 * Params:
	 *     bytes2 = a pointer to a #GBytes to compare with @bytes1
	 *
	 * Return: a negative value if bytes2 is lesser, a positive value if bytes2 is
	 *     greater, and zero if bytes2 is equal to bytes1
	 *
	 * Since: 2.32
	 */
	public int compare(Bytes bytes2)
	{
		return g_bytes_compare(gBytes, (bytes2 is null) ? null : bytes2.getBytesStruct());
	}

	/**
	 * Compares the two #GBytes values being pointed to and returns
	 * %TRUE if they are equal.
	 *
	 * This function can be passed to g_hash_table_new() as the @key_equal_func
	 * parameter, when using non-%NULL #GBytes pointers as keys in a #GHashTable.
	 *
	 * Params:
	 *     bytes2 = a pointer to a #GBytes to compare with @bytes1
	 *
	 * Return: %TRUE if the two keys match.
	 *
	 * Since: 2.32
	 */
	public bool equal(Bytes bytes2)
	{
		return g_bytes_equal(gBytes, (bytes2 is null) ? null : bytes2.getBytesStruct()) != 0;
	}

	/**
	 * Get the byte data in the #GBytes. This data should not be modified.
	 *
	 * This function will always return the same pointer for a given #GBytes.
	 *
	 * %NULL may be returned if @size is 0. This is not guaranteed, as the #GBytes
	 * may represent an empty string with @data non-%NULL and @size as 0. %NULL will
	 * not be returned if @size is non-zero.
	 *
	 * Return: a pointer to the
	 *     byte data, or %NULL
	 *
	 * Since: 2.32
	 */
	public void[] getData()
	{
		size_t size;
		
		auto p = g_bytes_get_data(gBytes, &size);
		
		return p[0 .. size];
	}

	/**
	 * Get the size of the byte data in the #GBytes.
	 *
	 * This function will always return the same value for a given #GBytes.
	 *
	 * Return: the size
	 *
	 * Since: 2.32
	 */
	public size_t getSize()
	{
		return g_bytes_get_size(gBytes);
	}

	/**
	 * Creates an integer hash code for the byte data in the #GBytes.
	 *
	 * This function can be passed to g_hash_table_new() as the @key_hash_func
	 * parameter, when using non-%NULL #GBytes pointers as keys in a #GHashTable.
	 *
	 * Return: a hash value corresponding to the key.
	 *
	 * Since: 2.32
	 */
	public uint hash()
	{
		return g_bytes_hash(gBytes);
	}

	/**
	 * Creates a #GBytes which is a subsection of another #GBytes. The @offset +
	 * @length may not be longer than the size of @bytes.
	 *
	 * A reference to @bytes will be held by the newly created #GBytes until
	 * the byte data is no longer needed.
	 *
	 * Params:
	 *     offset = offset which subsection starts at
	 *     length = length of subsection
	 *
	 * Return: a new #GBytes
	 *
	 * Since: 2.32
	 */
	public Bytes newFromBytes(size_t offset, size_t length)
	{
		auto p = g_bytes_new_from_bytes(gBytes, offset, length);
		
		if(p is null)
		{
			return null;
		}
		
		return new Bytes(cast(GBytes*) p);
	}

	/**
	 * Increase the reference count on @bytes.
	 *
	 * Return: the #GBytes
	 *
	 * Since: 2.32
	 */
	public Bytes doref()
	{
		auto p = g_bytes_ref(gBytes);
		
		if(p is null)
		{
			return null;
		}
		
		return new Bytes(cast(GBytes*) p);
	}

	/**
	 * Releases a reference on @bytes.  This may result in the bytes being
	 * freed.
	 *
	 * Since: 2.32
	 */
	public void unref()
	{
		g_bytes_unref(gBytes);
	}

	/**
	 * Unreferences the bytes, and returns a new mutable #GByteArray containing
	 * the same byte data.
	 *
	 * As an optimization, the byte data is transferred to the array without copying
	 * if this was the last reference to bytes and bytes was created with
	 * g_bytes_new(), g_bytes_new_take() or g_byte_array_free_to_bytes(). In all
	 * other cases the data is copied.
	 *
	 * Return: a new mutable #GByteArray containing the same byte data
	 *
	 * Since: 2.32
	 */
	public ByteArray unrefToArray()
	{
		auto p = g_bytes_unref_to_array(gBytes);
		
		if(p is null)
		{
			return null;
		}
		
		return new ByteArray(cast(GByteArray*) p);
	}

	/**
	 * Unreferences the bytes, and returns a pointer the same byte data
	 * contents.
	 *
	 * As an optimization, the byte data is returned without copying if this was
	 * the last reference to bytes and bytes was created with g_bytes_new(),
	 * g_bytes_new_take() or g_byte_array_free_to_bytes(). In all other cases the
	 * data is copied.
	 *
	 * Params:
	 *     size = location to place the length of the returned data
	 *
	 * Return: a pointer to the same byte data, which should
	 *     be freed with g_free()
	 *
	 * Since: 2.32
	 */
	public void* unrefToData(size_t* size)
	{
		return g_bytes_unref_to_data(gBytes, size);
	}
}
