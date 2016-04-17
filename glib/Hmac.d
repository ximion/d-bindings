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


module glib.Hmac;

private import gi.glib;
public  import gi.glibtypes;
private import glib.ConstructionException;
private import glib.Str;


/**
 * An opaque structure representing a HMAC operation.
 * To create a new GHmac, use g_hmac_new(). To free
 * a GHmac, use g_hmac_unref().
 *
 * Since: 2.30
 */
public class Hmac
{
	/** the main GObject struct */
	protected GHmac* gHmac;

	/** Get the main GObject struct */
	public GHmac* getHmacStruct()
	{
		return gHmac;
	}

	/** the main GObject struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gHmac;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GHmac* gHmac)
	{
		this.gHmac = gHmac;
	}

	/**
	 * Gets the digest from checksum as a raw binary array and places it
	 * into buffer. The size of the digest depends on the type of checksum.
	 *
	 * Once this function has been called, the Hmac is closed and can
	 * no longer be updated with update().
	 *
	 * Params:
	 *     buffer = output buffer
	 *
	 * Since: 2.30
	 */
	public void getDigest(ref ubyte[] buffer)
	{
		size_t digestLen = buffer.length;
		
		g_hmac_get_digest(gHmac, buffer.ptr, &digestLen);
		
		buffer = buffer[0 .. digestLen];
	}

	/**
	 */

	/**
	 * Copies a #GHmac. If @hmac has been closed, by calling
	 * g_hmac_get_string() or g_hmac_get_digest(), the copied
	 * HMAC will be closed as well.
	 *
	 * Return: the copy of the passed #GHmac. Use g_hmac_unref()
	 *     when finished using it.
	 *
	 * Since: 2.30
	 */
	public Hmac copy()
	{
		auto p = g_hmac_copy(gHmac);
		
		if(p is null)
		{
			return null;
		}
		
		return new Hmac(cast(GHmac*) p);
	}

	/**
	 * Gets the HMAC as an hexadecimal string.
	 *
	 * Once this function has been called the #GHmac can no longer be
	 * updated with g_hmac_update().
	 *
	 * The hexadecimal characters will be lower case.
	 *
	 * Return: the hexadecimal representation of the HMAC. The
	 *     returned string is owned by the HMAC and should not be modified
	 *     or freed.
	 *
	 * Since: 2.30
	 */
	public string getString()
	{
		return Str.toString(g_hmac_get_string(gHmac));
	}

	/**
	 * Atomically increments the reference count of @hmac by one.
	 *
	 * This function is MT-safe and may be called from any thread.
	 *
	 * Return: the passed in #GHmac.
	 *
	 * Since: 2.30
	 */
	public Hmac doref()
	{
		auto p = g_hmac_ref(gHmac);
		
		if(p is null)
		{
			return null;
		}
		
		return new Hmac(cast(GHmac*) p);
	}

	/**
	 * Atomically decrements the reference count of @hmac by one.
	 *
	 * If the reference count drops to 0, all keys and values will be
	 * destroyed, and all memory allocated by the hash table is released.
	 * This function is MT-safe and may be called from any thread.
	 * Frees the memory allocated for @hmac.
	 *
	 * Since: 2.30
	 */
	public void unref()
	{
		g_hmac_unref(gHmac);
	}

	/**
	 * Feeds @data into an existing #GHmac.
	 *
	 * The HMAC must still be open, that is g_hmac_get_string() or
	 * g_hmac_get_digest() must not have been called on @hmac.
	 *
	 * Params:
	 *     data = buffer used to compute the checksum
	 *     length = size of the buffer, or -1 if it is a nul-terminated string
	 *
	 * Since: 2.30
	 */
	public void update(char[] data)
	{
		g_hmac_update(gHmac, data.ptr, cast(ptrdiff_t)data.length);
	}

	/**
	 * Creates a new #GHmac, using the digest algorithm @digest_type.
	 * If the @digest_type is not known, %NULL is returned.
	 * A #GHmac can be used to compute the HMAC of a key and an
	 * arbitrary binary blob, using different hashing algorithms.
	 *
	 * A #GHmac works by feeding a binary blob through g_hmac_update()
	 * until the data is complete; the digest can then be extracted
	 * using g_hmac_get_string(), which will return the checksum as a
	 * hexadecimal string; or g_hmac_get_digest(), which will return a
	 * array of raw bytes. Once either g_hmac_get_string() or
	 * g_hmac_get_digest() have been called on a #GHmac, the HMAC
	 * will be closed and it won't be possible to call g_hmac_update()
	 * on it anymore.
	 *
	 * Support for digests of type %G_CHECKSUM_SHA512 has been added in GLib 2.42.
	 *
	 * Params:
	 *     digestType = the desired type of digest
	 *     key = the key for the HMAC
	 *     keyLen = the length of the keys
	 *
	 * Return: the newly created #GHmac, or %NULL.
	 *     Use g_hmac_unref() to free the memory allocated by it.
	 *
	 * Since: 2.30
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this(GChecksumType digestType, char[] key)
	{
		auto p = g_hmac_new(digestType, key.ptr, cast(size_t)key.length);
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GHmac*) p);
	}

	/**
	 * Computes the HMAC for a binary @data of @length. This is a
	 * convenience wrapper for g_hmac_new(), g_hmac_get_string()
	 * and g_hmac_unref().
	 *
	 * The hexadecimal string returned will be in lower case.
	 *
	 * Params:
	 *     digestType = a #GChecksumType to use for the HMAC
	 *     key = the key to use in the HMAC
	 *     keyLen = the length of the key
	 *     data = binary blob to compute the HMAC of
	 *     length = length of @data
	 *
	 * Return: the HMAC of the binary data as a string in hexadecimal.
	 *     The returned string should be freed with g_free() when done using it.
	 *
	 * Since: 2.30
	 */
	public static string computeHmacForData(GChecksumType digestType, char[] key, char[] data)
	{
		return Str.toString(g_compute_hmac_for_data(digestType, key.ptr, cast(size_t)key.length, data.ptr, cast(size_t)data.length));
	}

	/**
	 * Computes the HMAC for a string.
	 *
	 * The hexadecimal string returned will be in lower case.
	 *
	 * Params:
	 *     digestType = a #GChecksumType to use for the HMAC
	 *     key = the key to use in the HMAC
	 *     keyLen = the length of the key
	 *     str = the string to compute the HMAC for
	 *     length = the length of the string, or -1 if the string is nul-terminated
	 *
	 * Return: the HMAC as a hexadecimal string.
	 *     The returned string should be freed with g_free()
	 *     when done using it.
	 *
	 * Since: 2.30
	 */
	public static string computeHmacForString(GChecksumType digestType, char[] key, string str)
	{
		return Str.toString(g_compute_hmac_for_string(digestType, key.ptr, cast(size_t)key.length, Str.toStringz(str), cast(ptrdiff_t)str.length));
	}
}
