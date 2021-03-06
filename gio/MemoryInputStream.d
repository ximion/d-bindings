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


module gio.MemoryInputStream;

private import gi.gio;
public  import gi.giotypes;
private import gio.InputStream;
private import gio.PollableInputStreamIF;
private import gio.PollableInputStreamT;
private import gio.SeekableIF;
private import gio.SeekableT;
private import glib.Bytes;
private import glib.ConstructionException;
private import gobject.ObjectG;


/**
 * #GMemoryInputStream is a class for using arbitrary
 * memory chunks as input for GIO streaming input operations.
 * 
 * As of GLib 2.34, #GMemoryInputStream implements
 * #GPollableInputStream.
 */
public class MemoryInputStream : InputStream, PollableInputStreamIF, SeekableIF
{
	/** the main GObject struct */
	protected GMemoryInputStream* gMemoryInputStream;

	/** Get the main GObject struct */
	public GMemoryInputStream* getMemoryInputStreamStruct()
	{
		return gMemoryInputStream;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gMemoryInputStream;
	}

	protected override void setStruct(GObject* obj)
	{
		gMemoryInputStream = cast(GMemoryInputStream*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GMemoryInputStream* gMemoryInputStream, bool ownedRef = false)
	{
		this.gMemoryInputStream = gMemoryInputStream;
		super(cast(GInputStream*)gMemoryInputStream, ownedRef);
	}

	// add the PollableInputStream capabilities
	mixin PollableInputStreamT!(GMemoryInputStream);

	// add the Seekable capabilities
	mixin SeekableT!(GMemoryInputStream);


	/** */
	public static GType getType()
	{
		return g_memory_input_stream_get_type();
	}

	/**
	 * Creates a new empty #GMemoryInputStream.
	 *
	 * Return: a new #GInputStream
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this()
	{
		auto p = g_memory_input_stream_new();
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GMemoryInputStream*) p, true);
	}

	/**
	 * Creates a new #GMemoryInputStream with data from the given @bytes.
	 *
	 * Params:
	 *     bytes = a #GBytes
	 *
	 * Return: new #GInputStream read from @bytes
	 *
	 * Since: 2.34
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this(Bytes bytes)
	{
		auto p = g_memory_input_stream_new_from_bytes((bytes is null) ? null : bytes.getBytesStruct());
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new_from_bytes");
		}
		
		this(cast(GMemoryInputStream*) p, true);
	}

	/**
	 * Creates a new #GMemoryInputStream with data in memory of a given size.
	 *
	 * Params:
	 *     data = input data
	 *     len = length of the data, may be -1 if @data is a nul-terminated string
	 *     destroy = function that is called to free @data, or %NULL
	 *
	 * Return: new #GInputStream read from @data of @len bytes.
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this(ubyte[] data, GDestroyNotify destroy)
	{
		auto p = g_memory_input_stream_new_from_data(data.ptr, cast(ptrdiff_t)data.length, destroy);
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new_from_data");
		}
		
		this(cast(GMemoryInputStream*) p, true);
	}

	/**
	 * Appends @bytes to data that can be read from the input stream.
	 *
	 * Params:
	 *     bytes = input data
	 *
	 * Since: 2.34
	 */
	public void addBytes(Bytes bytes)
	{
		g_memory_input_stream_add_bytes(gMemoryInputStream, (bytes is null) ? null : bytes.getBytesStruct());
	}

	/**
	 * Appends @data to data that can be read from the input stream
	 *
	 * Params:
	 *     data = input data
	 *     len = length of the data, may be -1 if @data is a nul-terminated string
	 *     destroy = function that is called to free @data, or %NULL
	 */
	public void addData(ubyte[] data, GDestroyNotify destroy)
	{
		g_memory_input_stream_add_data(gMemoryInputStream, data.ptr, cast(ptrdiff_t)data.length, destroy);
	}
}
